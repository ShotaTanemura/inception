package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	router := gin.Default()

	router.LoadHTMLGlob("web/templates/*")
	router.Static("/static", "./web/static")

	router.GET("/", ShowIndexPage)
	router.Run(":8080")
}

func ShowIndexPage(c *gin.Context) {
	c.HTML(http.StatusOK, "index.html", nil)
}
