package main

import "github.com/gin-gonic/gin"

func main() {
    r := gin.Default()

    // Load HTML files from templates folder
    r.LoadHTMLGlob("template/*")

    r.GET("/", func(c *gin.Context) {
        c.HTML(200, "page1.html", nil)
    })

    r.GET("/json", func(c *gin.Context) {
        c.JSON(200, gin.H{
            "message": "Hello from Gin!",
        })
    })

    r.GET("/page1", func(c *gin.Context) {
        c.HTML(200, "page1.html", nil)
    })

    r.GET("/page2", func(c *gin.Context) {
        c.HTML(200, "page2.html", nil)
    })

    r.Run(":8080") // Start server on port 8080
}
