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

FFTW_VERS=3.3.10
FFTW_NAME="fftw-${FFTW_VERS}"
FFTW_FILE="${FFTW_NAME}.tar.gz"
FFTW_SRC="http://www.fftw.org/${FFTW_FILE}"

GSL_VERS=2.7.1
GSL_NAME="gsl-${GSL_VERS}"
GSL_FILE="${GSL_NAME}.tar.gz"
GSL_SRC="ftp://ftp.gnu.org/gnu/gsl/${GSL_FILE}"

READLINE_VERS=8.1.2
READLINE_NAME="readline-${READLINE_VERS}"
READLINE_FILE="${READLINE_NAME}.tar.gz"
READLINE_SRC="https://ftp.gnu.org/gnu/readline/${READLINE_FILE}"
# http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html

GLM_VERS=0.9.9.8
GLM_NAME="glm-${GLM_VERS}"
GLM_FILE="${GLM_VERS}.tar.gz"
GLM_SRC="https://github.com/g-truc/glm/archive/${GLM_FILE}"

