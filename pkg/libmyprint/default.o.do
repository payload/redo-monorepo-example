redo-ifchange $2.c

cc -o $3 -c $2.c \
    -Iinc \
    -MMD -MF $3.d

read DEPS <$3.d
redo-ifchange ${DEPS#*:}

rm -f $3.d