exec >&2

#export ROOT=$PWD
#export config=$PWD/config.sh

#redo pkg/hello-world/hello-world

pkgs=
for pkg in pkg/exam*; do
    pkgname="${pkg#pkg/}"
    pkgs="$pkgs $OUT/$pkg/$pkgname"
done

echo $pkgs | xargs redo-ifchange