# redo-monorepo-example

This is a playground to use [`redo`](https://github.com/apenwarr/redo) as a build tool for managing a [monorepo](https://danluu.com/monorepo/).

Currently it is a small example with simple `C` executables and shared libraries.

## Getting started

Install and use `redo` to build all targets. Use it from the `out` directory.

```
cd out
redo -j8
```

## How does it work?

### The `out` directory

There is a `out/default.do` which catches redo commands, delegates them to the `do/delegate.od` script.
The `$3` output parameter points into the `out` directory.
`delegate.od` is looking for the right `.do` file based on `$1 $2` in the repo from the directory root and calls it.
The parameters `$1 $2` are kept relative to the `.do` file. `$3` points still to the `out/...` file.

As a downside the `.do` files in the source directories need to refer to generated dependencies by prefixing their path with `$OUT`.
Now you need to treat source files and generated files differently.

The original implementation is taken from
[apenwarr/wvstreams](https://github.com/apenwarr/wvstreams/blob/master/delegate.od).

### The putting `.do` files into `do` directories

The `do/delegate.od` script generates a list of search paths based on `$1`.
It differs from `redo-whichdo` in the way that it also looks into subdirectories named `do`.
The `.do` files in the subdirectory have lower priority than `.do` files in the current directory.
