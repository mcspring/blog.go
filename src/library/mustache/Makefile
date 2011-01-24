include $(GOROOT)/src/Make.inc

TARG=mustache
GOFMT=gofmt -s -space=true -tabindent=false -tabwidth=4

GOFILES=\
	mustache.go\

include $(GOROOT)/src/Make.pkg

format:
	${GOFMT} -w mustache.go
