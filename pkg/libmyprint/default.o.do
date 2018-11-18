exec >&2

# directory

dir=$(dirname $(realpath --relative-to="$ROOT" "$PWD/$2"))
[ -d "$OUT/$dir" ] || mkdir -p "$OUT/$dir"

# compile

src="$2.c"

redo-ifchange "$src"

cc -o "$3" -c "$src" \
    -Iinc \
    -MMD -MF "$3.d"

read DEPS <"$3.d"
redo-ifchange ${DEPS#*:}

rm -f "$3.d"