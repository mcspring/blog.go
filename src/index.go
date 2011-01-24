// Copyright 2011 Mc.Spring. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
package main

import (
    web "./library/web/_obj/web"
    controller "./controller/_obj/controller"
)

func main() {
    web.Get("/", controller.IndexHandler)

    web.Run("0.0.0.0:9999")
}
