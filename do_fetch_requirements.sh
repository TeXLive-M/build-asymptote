#!/bin/bash

. settings.sh

mkdir -p "${ZIPS_PATH}" && cd "${ZIPS_PATH}" || exit 1

echo "#------------------------------------#"
echo "# Fetching dependencies of asymptote #"
echo "#------------------------------------#"

wget -N -c "${FFTW_SRC}"
wget -N -c "${GSL_SRC}"
wget -N -c "${READLINE_SRC}"

cd "${OWNPATH}"

tar xvzf "${ZIPS_PATH}/${FFTW_FILE}"
tar xvzf "${ZIPS_PATH}/${GSL_FILE}"
tar xvzf "${ZIPS_PATH}/${READLINE_FILE}"
