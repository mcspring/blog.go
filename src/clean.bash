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

echo; echo %%%% Clean up %%%%; echo

rm -Rf "$BLOG_ROOT"/src/_*
for i in library controller model view i18n
do
	rm -Rf "$BLOG_ROOT"/src/$i/_*
done
rm -f "$BLOG_ROOT"/bin/server

echo '    Down!    '
