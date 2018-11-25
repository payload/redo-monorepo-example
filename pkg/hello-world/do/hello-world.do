load-target() {
    target=$BUILD_DIR/$1.target
    redo-ifchange $target
    . $target
}

link() {
    redo-ifchange $target_objs
    cc -o $3 $target_objs $target_ldflags
}

load-target hello-world
link "$@"