arch=x86_64
targ=10.6
sdk=10.7

export CC="/opt/local/bin/clang-mp-7.0"
export CXX="/opt/local/bin/clang++-mp-7.0 -stdlib=libc++"
export OBJC="$CC"
export OBJCXX="$CXX"

LIBDIR="-L/Developer/SDKs/MacOSX${sdk}.sdk/usr/lib"
LIBDIR=""

SYSROOT="-isysroot /Developer/SDKs/MacOSX${sdk}.sdk -mmacosx-version-min=${targ}"
C_FLAGS="-Os $SYSROOT"
L_FLAGS="-Os $SYSROOT $LIBDIR"

export CFLAGS="$C_FLAGS"
export OBJCFLAGS="$C_FLAGS"
export CXXFLAGS="$C_FLAGS"
export OBJCXXFLAGS="$C_FLAGS"
export LDFLAGS="$L_FLAGS"

export STRIP="strip -u -r"

