DEPS="src/*.o"

redo-ifchange $DEPS

cc -o $3 -shared $DEPS