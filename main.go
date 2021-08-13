package main

import (
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()

	e.GET("/hello", hello)

	if err := e.Start(":8080"); err != nil {
		log.Panic(err)
	}
}

func hello(c echo.Context) error {
	log.Println("hello")
	return c.String(http.StatusOK, "Hello Stranger!")
}
