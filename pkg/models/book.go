package models

import "time"

type terraform_module struct {
	ID        uint      `json:"id" gorm:"primary_key"`
	Title     string    `json:"title"`
	Author    string    `json:"author"`
	CreatedAt time.Time `json:"created_at" gorm:"autoCreateTime"`
	UpdatedAt time.Time `json:"updated_at" gorm:"autoUpdateTime"`
}

type Createterraform_module struct {
	Title  string `json:"title" binding:"required"`
	Author string `json:"author" binding:"required"`
}

type Updateterraform_module struct {
	Title  string `json:"title"`
	Author string `json:"author"`
}
