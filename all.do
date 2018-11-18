exec >&2

#export ROOT=$PWD
#export config=$PWD/config.sh

#redo pkg/hello-world/hello-world

pkgs=
for pkg in pkg/exam* pkg/lib*; do
    pkgs="$pkgs $OUT/$pkg/build"
done

echo $pkgs | xargs redo-ifchange