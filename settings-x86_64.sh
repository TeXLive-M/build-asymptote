arch=x86_64
targ=10.6
sdk=10.6

export CC="/opt/local/bin/clang-mp-11"
export CXX="/opt/local/bin/clang++-mp-11 -stdlib=libc++"
export OBJC="$CC"
export OBJCXX="$CXX"

LIBDIR="-L/Developer/SDKs/MacOSX${sdk}.sdk/usr/lib"

SYSROOT="-isysroot /Developer/SDKs/MacOSX${sdk}.sdk -mmacosx-version-min=${targ}"
C_FLAGS="-O3 $SYSROOT"
L_FLAGS="-O3 $SYSROOT $LIBDIR"

export CFLAGS="$C_FLAGS"
export OBJCFLAGS="$C_FLAGS"
export CXXFLAGS="$C_FLAGS -std=c++11"
export OBJCXXFLAGS="$C_FLAGS -std=c++11"
export LDFLAGS="$L_FLAGS"

export STRIP="strip -u -r"

