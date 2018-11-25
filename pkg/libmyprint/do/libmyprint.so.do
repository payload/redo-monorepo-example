redo-ifchange $BUILD_DIR/libmyprint.so.target

objs=$BUILD_DIR/src/myprint.o

redo-ifchange $objs

cc -o $3 --shared $objs