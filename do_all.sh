#!/bin/bash

# read platform from parameters

. "settings.sh"

./do_fetch_requirements.sh

#for arch in x86_64 i386 ppc; do
for arch in x86_64; do
	./do_build_requirements.sh --arch=${arch}
	./do_build_asy.sh --arch=${arch}
done
