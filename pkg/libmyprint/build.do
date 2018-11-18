# directory

dir=$(dirname $(realpath --relative-to="$ROOT" "$PWD/$2"))
[ -d "$OUT/$dir" ] || mkdir -p "$OUT/$dir"

#

for target in libmyprint.so libmyprint.so.conf; do
    echo "$OUT/$dir/$target"
done \
| xargs redo-ifchange