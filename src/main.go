package main

import (
	"log"
	"flag"
	"strconv"
	"github.com/joho/godotenv"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/middleware/logger"
)

var (
	Port int
)

func main() {
	// Load dot environment.
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Flags.
	flag.IntVar(&Port,
		"port", 
		3000, 
		"Application port which will run's in there, default is: '3000'.",
	)

	flag.Parse()

	// init Fiber.
	app := fiber.New()
	app.Use(logger.New())

	listenner := "0.0.0.0:" + strconv.Itoa(Port) // All interfaces + port.
    log.Fatal(app.Listen(listenner))
}
