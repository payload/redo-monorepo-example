cat <<-EOF
target_cppflags='-iwithprefix $PATH_FROM_ROOT/inc'
target_ldflags='-L$OUT/pkg/libmyprint -l:libmyprint.so'
EOF