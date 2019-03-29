#!/bin/bash

# read platform from parameters
until [ -z "$1" ]; do
	case "$1" in
		--arch=* ) ARCH=${1#--arch=} ;;
		--help ) echo "$0 --arch=ARCH (ppc|i386|x86_64)"; exit 0 ;;
		* ) echo "ERROR: invalid parameter: $1"; exit 1 ;;
	esac
	shift
done
if [ -z "$ARCH" ]; then
	ARCH=x86_64
fi
case "$ARCH" in
	ppc|i386|x86_64) ;;
	*) echo "ERROR: invalid platform '$ARCH'. Use: ppc|i386|x86_64."; exit 1 ;;
esac

. "settings.sh"

if [ z"${BUILD_PATH}" == z ]; then
	echo "No BUILD_PATH defined. Something went wrong."
	exit 1
fi

echo "#--------------------------------#"
echo "# Building asymptote for ${ARCH} #"
echo "#--------------------------------#"

mkdir -p "${BUILD_PATH}"
cd "${BUILD_PATH}"
svn co svn://tug.org/texlive/trunk/Build/source/utils/asymptote
cd asymptote

./configure --enable-texlive-build --enable-gsl --enable-fftw \
	CXXFLAGS="-ansi ${CXXFLAGS}" \
	CPPFLAGS="-I${INST_PATH}/include" \
	LDFLAGS="-L${INST_PATH}/lib ${INST_PATH}/lib/libreadline.a ${LDFLAGS}"
make

strip asy
otool -L asy
/usr/bin/file asy

make check
