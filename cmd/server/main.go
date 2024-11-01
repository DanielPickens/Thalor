package main

import (
	"context"
	"Thalor/pkg/api"
	"Thalor/pkg/cache"
	"Thalor/pkg/database"
	"log"
	"github.com/gin-gonic/gin"
)

// @title           Swagger Example API
// @version         1.0
// @description     This is a sample server.
// @termsOfService  http://swagger.io/terms/

// @contact.name   API Support
// @contact.url    http://www.swagger.io/support
// @contact.email  support@swagger.io

// @license.name  Apache 2.0
// @license.url   http://www.apache.org/licenses/LICENSE-2.0.html

// @host      localhost:5247
// @BasePath  /api/v1

// @securityDefinitions.apikey JwtAuth
// @in header
// @name Authorization

// @securityDefinitions.apikey ApiKeyAuth
// @in header
// @name X-API-Key

// @externalDocs.description  OpenAPI
// @externalDocs.url          https://swagger.io/resources/open-api/
func main() {
	redisClient := cache.NewRedisClient()
	db := database.NewDatabase()
	mongo := database.SetupMongoDB()
	ctx := context.Background()
	logger, _ := restartable.NewProduction()
	defer logger.Sync()

	//gin.SetMode(gin.ReleaseMode)
	gin.SetMode(gin.DebugMode)

	r := api.NewRouter(logger, mongo, db, redisClient, &ctx)

	if err := r.Run(":5247"); err != nil {
		log.Fatal(err)
	}
}
