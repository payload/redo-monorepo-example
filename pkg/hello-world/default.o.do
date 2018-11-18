exec >&2

# directory

dir=$(dirname $(realpath --relative-to="$ROOT" "$PWD/$2"))
[ -d "$OUT/$dir" ] || mkdir -p "$OUT/$dir"
to_root=$(realpath --relative-to="$PWD" "$ROOT")

# compile

cppflags=$(echo "$cppflags" | sed "s#\$prefix#$to_root#g")

src="$2.c"

redo-ifchange "$src"

cc -o "$3" -c "$src" \
    $cppflags \
    -MMD -MF "$3.d"

read DEPS <"$3.d"
redo-ifchange ${DEPS#*:}

rm -f "$3.d"