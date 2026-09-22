# cpp-project-template
This is a template for a C++ project.

## Requirements
- `g++`
- `make`

## Building
```sh
make
```

This compiles every `.cpp` file under `src/` into a single executable named `testing` in the repository root, with `-Wall -Wextra` enabled. Every `.h` and `.hpp` file under `src/` is a prerequisite of the executable, so editing a header triggers a rebuild on the next `make`.

## Cleaning
```sh
make clean
```

This removes the `testing` executable.

## Running
```sh
make run
```

This builds the executable if it is missing or out of date, then runs it. The executable name comes from the `TARGET` variable in the `Makefile`, so renaming it there is enough to rename it everywhere `make` and `cr.sh` touch it. The built program can also be started directly:

```sh
./testing
```

Expected program output (with `make run`, the `Makefile` prints its own progress lines around it):
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
| `src/` | C++ sources. `src/testing.cpp` is the sample program. Any `.cpp` file added here is compiled, and any `.h` or `.hpp` file added here triggers a rebuild when it changes. |
| `Makefile` | Build rules. The `testing` target globs `src/*.cpp` and depends on `src/*.h` and `src/*.hpp`, the `run` target runs the executable, and the `clean` target removes it. |
| `testing` | The compiled executable, tracked in git. `make` rewrites it and `make clean` removes it. |
| `cr.sh` | Compile-and-run helper: `make clean`, `make`, `make run`. |
| `.devcontainer/` | VS Code dev container definition. |
| `.vscode/` | Editor settings. |
| `.gitignore` | Currently empty, so nothing is excluded from version control. |
| `LICENSE` | The terms this template and anything generated from it are distributed under. |

## License
This template is distributed under the **Stephenson Software Non-Commercial License (Stephenson-NC)**. Use, copying, modification, and distribution are permitted for non-commercial purposes only; commercial use by anyone other than the copyright holder requires explicit written permission. See [`LICENSE`](LICENSE) for the full terms.

A project generated from this template inherits `LICENSE` along with everything else, so replace that file if different terms are wanted.
