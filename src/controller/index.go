// Copyright 2011 Mc.Spring. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Module: index
package controller

import (
	"os"
	"path"
	mustache "../library/mustache/_obj/mustache"
)

// Handler: index
// Handle all request of /, this will display the home page.
func IndexHandler() string {
	root := os.Getenv("cd ..; pwd")
	view := path.Join(root, "view")
	file := path.Join(path.Join(view, "index"), "index.mustache")

	data := map[string] string {
		"title": "Hello, blog.go",
		"name": "Welcome to blog.go!",
	}

    return mustache.RenderFile(file, data)
}
