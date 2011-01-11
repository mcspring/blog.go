package controller

import (
	"os"
	"path"
	library "../library/_obj/library"
)

func IndexHandler() string {
	root := os.Getenv("cd ..; pwd")
	view := path.Join(root, "view")
	file := path.Join(path.Join(view, "index"), "index.mustache")

	data := map[string] string {
		"title": "Hello, blog.go",
		"name": "Welcome to blog.go!",
	}

    return library.RenderFile(file, data)
}
