#!/bin/bash

# read platform from parameters

. "settings.sh"

if [ z"${BUILD_PATH}" == z ]; then
	echo "No BUILD_PATH defined. Something went wrong."
	exit 1
fi

echo "#-------------------------#"
echo "# Copying GLM for ${ARCH} #"
echo "#-------------------------#"

mkdir -p "${INST_PATH}/include"
rsync -avc "${OWNPATH}/${GLM_NAME}/glm" "${INST_PATH}/include/"

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

