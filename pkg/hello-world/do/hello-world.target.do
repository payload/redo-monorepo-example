srcs-to-objs() {
    for src in $@; do echo "$BUILD_DIR/${src%.c}.o"; done
}

process-deps() {
    # TODO process in parallel
    for dep in $@; do process-dep $dep; done
}

process-dep() {
    dep=$1
    path=$OUT/$dep
    conf=$path.target
    
    redo-ifchange $conf
    . $conf
    cppflags+=" -iprefix $PATH_TO_ROOT/ $target_cppflags "
    ldflags+=" $target_ldflags "
}

name="$2"
srcs="src/hello-world.c"
deps="pkg/libmyprint/libmyprint.so"
cppflags=
ldflags="-Wl,-rpath,\$ORIGIN/../libmyprint"

process-deps $deps
redo-ifchange $OUT/pkg/libmyprint/libmyprint.so

cat <<EOF
target_srcs="$srcs"
target_objs="`srcs-to-objs $srcs`"
target_cppflags="$cppflags"
target_ldflags='$ldflags'
EOF