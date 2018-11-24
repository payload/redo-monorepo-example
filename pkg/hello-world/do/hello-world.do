objs=$BUILD_DIR/src/hello-world.o

redo-ifchange $OUT/pkg/libmyprint/libmyprint.so.conf

. $OUT/pkg/libmyprint/libmyprint.so.conf
cppflags="-iprefix $PATH_TO_ROOT/ $cppflags"
export cppflags

redo-ifchange $objs $OUT/pkg/libmyprint/libmyprint.so

cc -o $3 $objs $cppflags \
    -Wl,-rpath,'$ORIGIN/../libmyprint' \
    -L$OUT/pkg/libmyprint -l:libmyprint.so