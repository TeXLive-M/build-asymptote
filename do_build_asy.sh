#!/bin/bash

# read platform from parameters
if [ -z "$ARCH" ]; then
	ARCH=x86_64
fi

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

./configure --enable-texlive-build --enable-gsl --enable-fftw --enable-gl=no \
	CPPFLAGS="-I${INST_PATH}/include" \
	LDFLAGS="-L${INST_PATH}/lib ${INST_PATH}/lib/libreadline.a ${LDFLAGS}"
gmake
gmake check

strip asy || exit 1
#otool -L asy || exit 1
/usr/bin/file asy || exit 1

