# directory

dir=$(dirname $(realpath --relative-to="$ROOT" "$PWD/$2"))
[ -d "$OUT/$dir" ] || mkdir -p "$OUT/$dir"

#

redo-ifchange $OUT/$dir/hello-world