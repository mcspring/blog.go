#!/usr/bin/env bash
# Copyright 2011 Mc.Spring. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -e
if [ ! -f make.bash ]
then
	echo 'all.bash must be run from $BLOG_ROOT/src' 1>&2
	exit 1
fi

if [ -f clean.bash ]
then
	. ./clean.bash
fi

. ./make.bash

if [ -f run.bash ]
then
	. ./run.bash
fi
