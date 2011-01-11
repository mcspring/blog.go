package main

import (
    "web"
    controller "./controller/_obj/controller"
)

func main() {
    web.Get("/", controller.IndexHandler)

    web.Run("0.0.0.0:9999")
}
