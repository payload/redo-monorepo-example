pkgs=
for pkg in `echo pkg/*`; do
    pkgs="$pkgs $OUT/$pkg/build"
done

echo $pkgs | xargs redo-ifchange