exec >&2

#export ROOT=$PWD
#export config=$PWD/config.sh

#redo pkg/hello-world/hello-world

pkgs=
for pkg in pkg/*; do
    pkgname="${pkg#pkg/}"
    pkgs="$pkgs $OUT/$pkg/$pkgname"
done

pkgs=pkg/exam*
echo $pkgs | xargs redo-ifchange