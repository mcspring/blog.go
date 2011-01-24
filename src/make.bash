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

# first, compile dependence libs
BLOG_LIBRARY="$BLOG_ROOT"/src/library
cd $BLOG_LIBRARY || exit 1
for lib in *
do
	if ! test -d $lib
	then
		continue
	fi

	cd "$BLOG_LIBRARY"/"$lib" || exit 1

	if test -f Makefile
	then
		echo; echo; echo %%%% make library: $lib %%%%; echo

		gomake
	fi

	cd $BLOG_LIBRARY
done

for i in controller model view i18n
do
	DIR="$BLOG_ROOT"/src/$i

	cd $DIR || exit 1

	if test -f Makefile
	then
		echo; echo; echo %%%% make $i %%%%; echo

		gomake
	fi
done

echo; echo; echo %%%% make index %%%%; echo
cd "$BLOG_ROOT"/src
gomake
