exec >&2

src="src/${2#lib/}.c"

redo-ifchange lib "$src"

cc -o "$3" -c "$src" \
    -Iinc \
    -MMD -MF "$3.d"

read DEPS <"$3.d"
redo-ifchange ${DEPS#*:}

rm -f "$3.d"