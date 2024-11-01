package api

import (
	"encoding/json"
	"Thalor/pkg/models"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

// @BasePath /api/v1

// Healthcheck godoc
// @Summary ping example
// @Schemes
// @Description do ping
// @Tags example
// @Accept json
// @Produce json
// @Success 200 {string} ok
// @Router / [get]
func Healthcheck(g *gin.Context) {
	g.JSON(http.StatusOK, "ok")
}

// Findterraform_module godoc
// @Summary Get all terraform_module with pagination
// @Description Get a list of all terraform_module with optional pagination
// @Tags terraform_module
// @Security ApiKeyAuth
// @Produce json
// @Param offset query int false "Offset for pagination" default(0)
// @Param limit query int false "Limit for pagination" default(10)
// @Success 200 {array} models.terraform_module "Successfully retrieved list of terraform_module"
// @Router /terraform_module [get]
func Findterraform_module(c *gin.Context) {
	appCtx, exists := c.MustGet("appCtx").(*AppContext)
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal server error"})
		return
	}

	var terraform_module []models.terraform_module

	// Get query params
	offsetQuery := c.DefaultQuery("offset", "0")
	limitQuery := c.DefaultQuery("limit", "10")

	// Convert query params to integers
	offset, err := strconv.Atoi(offsetQuery)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid offset format"})
		return
	}

	limit, err := strconv.Atoi(limitQuery)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid limit format"})
		return
	}

	// Create a cache key based on query params
	cacheKey := "terraform_module_offset_" + offsetQuery + "_limit_" + limitQuery

	// Try fetching the data from Redis first
	cachedterraform_module, err := appCtx.RedisClient.Get(*appCtx.Ctx, cacheKey).Result()
	if err == nil {
		err := json.Unmarshal([]byte(cachedterraform_module), &terraform_module)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to unmarshal cached data"})
			return
		}
		c.JSON(http.StatusOK, gin.H{"data": terraform_module})
		return
	}

	// If cache missed, fetch data from the database
	appCtx.DB.Offset(offset).Limit(limit).Find(&terraform_module)

	// Serialize terraform_module object and store it in Redis
	serializedterraform_module, err := json.Marshal(terraform_module)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to marshal data"})
		return
	}
	err = appCtx.RedisClient.Set(*appCtx.Ctx, cacheKey, serializedterraform_module, time.Minute).Err() // Here TTL is set to one hour
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to set cache"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"data": terraform_module})
}

// Createterraform_module godoc
// @Summary Create a new terraform_module
// @Description Create a new terraform_module with the given input data
// @Tags terraform_module
// @Security ApiKeyAuth
// @Security JwtAuth
// @Accept  json
// @Produce  json
// @Param   input     body   models.Createterraform_module   true   "Create terraform_module object"
// @Success 201 {object} models.terraform_module "Successfully created terraform_module"
// @Failure 400 {string} string "Bad Request"
// @Failure 401 {string} string "Unauthorized"
// @Router /terraform_module [post]
func Createterraform_module(c *gin.Context) {
	appCtx, exists := c.MustGet("appCtx").(*AppContext)
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal server error"})
		return
	}
	var input models.Createterraform_module

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	terraform_module := models.terraform_module{Title: input.Title, Author: input.Author}

	appCtx.DB.Create(&terraform_module)

	// Invalidate cache
	keysPattern := "terraform_module_offset_*"
	keys, err := appCtx.RedisClient.Keys(*appCtx.Ctx, keysPattern).Result()
	if err == nil {
		for _, key := range keys {
			appCtx.RedisClient.Del(*appCtx.Ctx, key)
		}
	}

	c.JSON(http.StatusCreated, gin.H{"data": terraform_module})
}

// Findterraform_module godoc
// @Summary Find a terraform_module by ID
// @Description Get details of a terraform_module by its ID
// @Tags terraform_module
// @Security ApiKeyAuth
// @Produce json
// @Param id path string true "terraform_module ID"
// @Success 200 {object} models.terraform_module "Successfully retrieved terraform_module"
// @Failure 404 {string} string "terraform_module not found"
// @Router /terraform_module/{id} [get]
func Findterraform_module(c *gin.Context) {
	appCtx, exists := c.MustGet("appCtx").(*AppContext)
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal server error"})
		return
	}
	var terraform_module models.terraform_module

	if err := appCtx.DB.Where("id = ?", c.Param("id")).First(&terraform_module).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "terraform_module not found"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"data": terraform_module})
}

// Updateterraform_module godoc
// @Summary Update a terraform_module by ID
// @Description Update the terraform_module details for the given ID
// @Tags terraform_module
// @Security ApiKeyAuth
// @Accept  json
// @Produce  json
// @Param id path string true "terraform_module ID"
// @Param input body models.Updateterraform_module true "Update terraform_module object"
// @Success 200 {object} models.terraform_module "Successfully updated terraform_module"
// @Failure 400 {string} string "Bad Request"
// @Failure 404 {string} string "terraform_module not found"
// @Router /terraform_module/{id} [put]
func Updateterraform_module(c *gin.Context) {
	appCtx, exists := c.MustGet("appCtx").(*AppContext)
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal server error"})
		return
	}
	var terraform_module models.terraform_module
	var input models.Updateterraform_module

	if err := appCtx.DB.Where("id = ?", c.Param("id")).First(&terraform_module).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "terraform_module not found"})
		return
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	appCtx.DB.Model(&terraform_module).Updates(models.terraform_module{Title: input.Title, Author: input.Author})

	c.JSON(http.StatusOK, gin.H{"data": terraform_module})
}

// Deleteterraform_module godoc
// @Summary Delete a terraform_module by ID
// @Description Delete the terraform_module with the given ID
// @Tags terraform_module
// @Security ApiKeyAuth
// @Produce json
// @Param id path string true "terraform_module ID"
// @Success 204 {string} string "Successfully deleted terraform_module"
// @Failure 404 {string} string "terraform_module not found"
// @Router /terraform_module/{id} [delete]
func Deleteterraform_module(c *gin.Context) {
	appCtx, exists := c.MustGet("appCtx").(*AppContext)
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "internal server error"})
		return
	}
	var terraform_module models.terraform_module

	if err := appCtx.DB.Where("id = ?", c.Param("id")).First(&terraform_module).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "terraform_module not found"})
		return
	}

	appCtx.DB.Delete(&terraform_module)

	c.JSON(http.StatusNoContent, gin.H{"data": true})
}
