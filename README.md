# cpp-project-template
This is a template for a C++ project.

## Requirements
- `g++`
- `make`

## Building
```sh
make
```

This compiles every `.cpp` file under `src/` into a single executable named `testing` in the repository root, with `-Wall -Wextra` enabled.

## Cleaning
```sh
make clean
```

This removes the `testing` executable.

## Running
```sh
./testing
```

Expected output:
```
[LOG] Hello World!
[DEBUG] debugFlag is true, so this message is shown.
```

## Compile and run
`cr.sh` chains all three steps — removing the old executable, building, and running:

```sh
./cr.sh
```

## Repository layout
| Path | Purpose |
|------|---------|
| `src/` | C++ sources. `src/testing.cpp` is the sample program. Any `.cpp` file added here is compiled. |
| `Makefile` | Build rules. The `testing` target globs `src/*.cpp`, and the `clean` target removes the executable. |
| `cr.sh` | Compile-and-run helper. |
| `.devcontainer/` | VS Code dev container definition. |
| `.vscode/` | Editor settings. |
