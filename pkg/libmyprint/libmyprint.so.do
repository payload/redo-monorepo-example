exec >&2
. $prelude

objs=$BUILD_DIR/src/myprint.o

redo-ifchange $objs

cc -o $3 --shared $objs