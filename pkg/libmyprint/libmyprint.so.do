exec >&2

echo $OUT
exit 4

#DEPS=$OUT/myprint.o

#redo-ifchange $DEPS

#cc -o $3 -shared $DEPS