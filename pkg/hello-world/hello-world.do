exec >&2

# directory

dir=$(dirname $(realpath --relative-to="$ROOT" "$PWD/$2"))
[ -d "$OUT/$dir" ] || mkdir -p "$OUT/$dir"

#

objs=$OUT/$dir/src/hello-world.o

redo-ifchange $OUT/pkg/libmyprint/libmyprint.so.conf

. $OUT/pkg/libmyprint/libmyprint.so.conf
export cppflags

redo-ifchange $objs $OUT/pkg/libmyprint/libmyprint.so

cc -o $3 $objs $cppflags -L$OUT/pkg/libmyprint -lmyprint