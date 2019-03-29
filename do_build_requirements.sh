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

echo "#-------------------------#"
echo "# Copying GLM for ${ARCH} #"
echo "#-------------------------#"

rsync -avc "${OWNPATH}/${GLM_NAME}/glm" "${INST_PATH}/include"

echo "#---------------------------#"
echo "# Building GLEW for ${ARCH} #"
echo "#---------------------------#"

BUILDDIR="${BUILD_PATH}/glew"
mkdir -p "${BUILDDIR}" && cd "${BUILDDIR}"
# TODO
# configure, make, make install

echo "#---------------------------#"
echo "# Building FFTW for ${ARCH} #"
echo "#---------------------------#"

BUILDDIR="${BUILD_PATH}/fftw"
mkdir -p "${BUILDDIR}" && cd "${BUILDDIR}"
"${OWNPATH}/${FFTW_NAME}/configure" --enable-static --disable-shared --disable-fortran --prefix="${INST_PATH}"
make && make install

echo "#--------------------------#"
echo "# Building GSL for ${ARCH} #"
echo "#--------------------------#"

BUILDDIR="${BUILD_PATH}/gsl"
mkdir -p "${BUILDDIR}" && cd "${BUILDDIR}"
"${OWNPATH}/${GSL_NAME}/configure" --enable-static --disable-shared --prefix="${INST_PATH}"
make && make install

echo "#-------------------------------#"
echo "# Building READLINE for ${ARCH} #"
echo "#-------------------------------#"

BUILDDIR="${BUILD_PATH}/readline"
mkdir -p "${BUILDDIR}" && cd "${BUILDDIR}"
"${OWNPATH}/${READLINE_NAME}/configure" --enable-static --disable-shared --prefix="${INST_PATH}"
make && make install

