# cpp-project-template
This is a template for a C++ project.

## Requirements
- `g++`
- `make`

## Building
```sh
make
```

This compiles `src/testing.cpp` into an executable named `testing` in the repository root.

## Running
```sh
./testing
```

Expected output:
```
[LOG] Hello World!
```

## Compile and run
`cr.sh` chains all three steps — removing the old executable, building, and running:

```sh
./cr.sh
```

## Repository layout
| Path | Purpose |
|------|---------|
| `src/` | C++ sources. `src/testing.cpp` is the sample program. |
| `Makefile` | Build rules. The `testing` target names `src/testing.cpp` explicitly, so a new source file needs a corresponding change here to be compiled. |
| `cr.sh` | Compile-and-run helper. |
| `.devcontainer/` | VS Code dev container definition. |
| `.vscode/` | Editor settings. |
