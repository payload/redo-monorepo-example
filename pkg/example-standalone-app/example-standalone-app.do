exec >&2

# directory

dir=$(dirname $(realpath --relative-to="$ROOT" "$PWD/$2"))
[ -d "$OUT/$dir" ] || mkdir -p "$OUT/$dir"

#

objs=$OUT/$dir/src/main.o

redo-ifchange $objs

cc -o $3 $objs