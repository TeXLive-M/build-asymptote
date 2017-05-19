export MACOSX_DEPLOYMENT_TARGET=10.5
export MYLDFLAGS="-L/Developer/SDKs/MacOSX${MACOSX_DEPLOYMENT_TARGET}.sdk/usr/lib"
export MYSYSROOT="-isysroot /Developer/SDKs/MacOSX${MACOSX_DEPLOYMENT_TARGET}.sdk -mmacosx-version-min=${MACOSX_DEPLOYMENT_TARGET}"

export CC="/usr/bin/gcc-4.2 -arch $ARCH"
export CXX="/usr/bin/g++-4.2 -arch $ARCH"
export OBJC="$CC"
export OBJCXX="$CXX"

export CFLAGS="$MYSYSROOT"
export CXXFLAGS="$MYSYSROOT"
export OBJCFLAGS="$MYSYSROOT"
export OBJCXXFLAGS="$MYSYSROOT"
export LDFLAGS="$MYLDFLAGS $MYSYSROOT"
