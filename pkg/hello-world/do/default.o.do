src="$2.c"

redo-ifchange "$src"

cc -o "$3" -c "$src" \
    $cppflags \
    -MMD -MF "$3.d"

read DEPS <"$3.d"
redo-ifchange ${DEPS#*:}

rm -f "$3.d"