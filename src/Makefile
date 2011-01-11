include $(GOROOT)/src/Make.inc

TARG=blog
GOFMT=gofmt -s -space=true -tabindent=false -tabwidth=4

GOFILES=\
	index.go

include $(GOROOT)/src/Make.pkg

format:
	${GOFMT} -w index.go
