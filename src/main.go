package main

import (
	"log"
	"flag"
	"strconv"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/middleware/logger"
)

var (
	Port int
)

func main() {
	flag.IntVar(&Port,
		"port", 
		3000, 
		"Application port which will run's in there, default is: '3000'.",
	)

	flag.Parse()

	app := fiber.New()
	app.Use(logger.New())

	listenner := "0.0.0.0:" + strconv.Itoa(Port) // All interfaces + port.
    log.Fatal(app.Listen(listenner))
}
