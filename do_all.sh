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

./do_fetch_requirements.sh

for arch in x86_64 i386 ppc; do
	./do_build_requirements.sh --arch=${arch}
	./do_build_asy.sh --arch=${arch}
done
