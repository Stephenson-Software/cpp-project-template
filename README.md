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
| `testing` | The compiled executable, tracked in git. `make` rewrites it and `make clean` removes it. |
| `cr.sh` | Compile-and-run helper. |
| `.devcontainer/` | VS Code dev container definition. |
| `.vscode/` | Editor settings. |
| `.gitignore` | Currently empty, so nothing is excluded from version control. |
| `LICENSE` | The terms this template and anything generated from it are distributed under. |

## License
This template is distributed under the **Stephenson Software Non-Commercial License (Stephenson-NC)**. Use, copying, modification, and distribution are permitted for non-commercial purposes only; commercial use by anyone other than the copyright holder requires explicit written permission. See [`LICENSE`](LICENSE) for the full terms.

A project generated from this template inherits `LICENSE` along with everything else, so replace that file if different terms are wanted.
