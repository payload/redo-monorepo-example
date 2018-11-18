exec >&2
. $prelude

src="$2.c"

redo-ifchange "$src"

cc -o "$3" -c "$src" \
    -Iinc \
    -MMD -MF "$3.d"

read DEPS <"$3.d"
redo-ifchange ${DEPS#*:}

rm -f "$3.d"