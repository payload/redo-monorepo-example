. $prelude

for target in libmyprint.so libmyprint.so.conf; do
    echo "$BUILD_DIR/$target"
done \
| xargs redo-ifchange