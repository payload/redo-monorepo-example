exec >&2

die() {
    echo "oh no $name $(redo-whichdo $name)"
    exit 5
}

die