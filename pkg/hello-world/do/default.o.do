load-target() {
    target=$BUILD_DIR/../$1.target
    redo-ifchange $target
    . $target
}

compile() {
    cc -o "$3" -c "$2.c" \
        $target_cppflags \
        -MMD -MF "$3.d"

    read DEPS <"$3.d"
    redo-ifchange ${DEPS#*:}
    rm -f "$3.d"
}

load-target hello-world
compile $@