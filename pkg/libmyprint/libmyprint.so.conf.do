# directory

dir=$(dirname $(realpath --relative-to="$ROOT" "$PWD/$2"))
[ -d "$OUT/$dir" ] || mkdir -p "$OUT/$dir"

#

cat <<-EOF
cppflags='-I\$prefix/$dir/inc'
EOF