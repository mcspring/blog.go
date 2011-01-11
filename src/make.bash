export BLOG_ROOT=${BLOG_ROOT:-$(cd ..; pwd)}
if ! test -f "$BLOG_ROOT"/src/Makefile
then
	echo '$BLOG_ROOT is not set currectly or not exported: '$BLOG_ROOT 1>&2
	exit 1
fi

for i in controller model view i18n library
do
	dir="$BLOG_ROOT"/src/$i

	cd $dir || exit 1

	if test -f Makefile
	then
		echo; echo; echo %%%% make $i %%%%; echo

		gomake
	fi
done
