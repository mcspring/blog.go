#!/usr/bin/env bash
# Copyright 2011 Mc.Spring. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -e
export BLOG_ROOT=${BLOG_ROOT:-$(cd ..; pwd)}
if ! test -f "$BLOG_ROOT"/src/Makefile
then
	echo '$BLOG_ROOT is not set currectly or not exported: '$BLOG_ROOT 1>&2
	exit 1
fi

if ! test -f "$GOROOT"/src/Make.inc
then
	echo '$GOROOT is not set currently or not exported: '$GOROOT 1>&2
	exit 1
fi

export BLOG_BIN=${BLOB_BIN:-"$BLOG_ROOT/bin"}
if [ ! -d "$BLOG_BIN" ]; then
	mkdir -p "$BLOG_BIN"
fi

MAKE=make
if ! make --version 2>/dev/null | grep 'GNU Make' >/dev/null
then
	MAKE=gomake
fi

eval $($MAKE --no-print-directory -f "$GOROOT"/src/Make.inc go-env | egrep 'GOARCH|GOOS|GO_ENV')

CMD=0
if [ "$GOARCH" = "386" ]; then
	CMD=8
fi

if [ "$GOARCH" = "amd64" ]; then
	CMD=6
fi

if [ "$GOARCH" = "arm" ]; then
	CMD=5
fi

if [ "$CMD" = "0" ]
then
	echo '$GOARCH is not set currectly or nor supported now!'$GOARCH 1>&2
	exit 1
fi

if ! test -f "$BLOG_ROOT"/src/_go_.$CMD
then
	cd "$BLOG_ROOT"/src || exit 1

	$MAKE
fi

echo; echo %%%% make compile %%%%; echo

"$CMD"l -o "$BLOG_ROOT"/bin/server "$BLOG_ROOT"/src/_go_.$CMD

chmod +x "$BLOG_ROOT"/bin/server

# Print post-install message.
installed() {
	echo The compiler is "$CMD"l
	echo ----
	echo Installed blog.go for $GOOS/$GOARCH in "$BLOG_ROOT".
	echo Installed server in "$BLOG_BIN".
	echo
	echo '  ****  ' "You should run your server as: $BLOG_BIN/server" '  ****  '
	echo
}
(installed)
