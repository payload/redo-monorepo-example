exec >&2
. $prelude

objs=$BUILD_DIR/src/main.o

redo-ifchange $objs

cc -o $3 $objs