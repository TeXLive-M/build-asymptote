if [ z"$BASH_SOURCE" != z ]; then
	SCRIPTPATH="$BASH_SOURCE"
elif [ z"$KSH_VERSION" != z ]; then
	SCRIPTPATH="${.sh.file}"
else
	SCRIPTPATH="$0"
fi
OWNPATH=$(cd -P -- "$(dirname -- "$SCRIPTPATH")" && pwd -P)

if [ -z "${ARCH}" ]; then
	ARCH="x86_64"
fi
source "settings-${ARCH}.sh"

BUILD_PATH="${OWNPATH}/build-${ARCH}"
INST_PATH="${BUILD_PATH}/inst"

ZIPS_PATH="${OWNPATH}/zips"

FFTW_VERS=3.3.6-pl2
FFTW_NAME="fftw-${FFTW_VERS}"
FFTW_FILE="${FFTW_NAME}.tar.gz"
FFTW_SRC="http://www.fftw.org/${FFTW_FILE}"

GSL_VERS=2.3
GSL_NAME="gsl-${GSL_VERS}"
GSL_FILE="${GSL_NAME}.tar.gz"
GSL_SRC="http://gnu.mirror.si/gsl/${GSL_FILE}"

READLINE_VERS=7.0
READLINE_NAME="readline-${READLINE_VERS}"
READLINE_FILE="${READLINE_NAME}.tar.gz"
READLINE_SRC="https://ftp.gnu.org/gnu/readline/${READLINE_FILE}"
# http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
