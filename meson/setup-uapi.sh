#! /bin/sh

echo $UAPI
realUAPI=`realpath $UAPI`

if test \! -d $realUAPI/include/uapi/evl; then
    echo "meson: path given to -Duapi does not look right ($UAPI/include/uapi/evl is missing)"
    exit 1
fi

mkdir -p $O_UAPI
rm -f $O_UAPI/asm $O_UAPI/asm-generic $O_UAPI/evl

if test -r $realUAPI/Kbuild; then
    ln -s $realUAPI/arch/$ARCH/include/uapi/asm $O_UAPI/asm
    ln -s $realUAPI/include/uapi/asm-generic $O_UAPI/asm-generic
    ln -s $realUAPI/include/uapi/evl $O_UAPI/evl
elif test \! -L	$O_UAPI/asm; then
    ln -s $realUAPI/asm $O_UAPI/asm
    ln -s $realUAPI/asm-generic $O_UAPI/asm-generic
    ln -s $realUAPI/evl $O_UAPI/evl
fi
