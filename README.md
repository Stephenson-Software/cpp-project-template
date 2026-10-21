# cpp-project-template
This is a template for a C++ project.

## Requirements
- `g++`
- `make`

## Building
```sh
make
```

This compiles every `.cpp` file directly in `src/` into a single executable named `testing` in the repository root, with `-Wall -Wextra` enabled. Every `.h` and `.hpp` file directly in `src/` is a prerequisite of the executable, so editing a header triggers a rebuild on the next `make`. Subdirectories of `src/` are not searched, so a source file placed in one is not compiled and a header placed in one does not trigger a rebuild.

The compiler is make's `CXX` variable, which is `g++` unless a `CXX` environment variable names another. A different compiler can also be chosen on the command line without editing the `Makefile`:

```sh
make CXX=clang++
```

make's conventional `CPPFLAGS` (preprocessor flags such as `-Iinclude`), `LDFLAGS` (linker flags such as `-L/opt/lib`), and `LDLIBS` (libraries such as `-lpthread`) are passed to the compiler too, so an include directory or a library can be added the same way:

```sh
make LDLIBS=-lpthread
```

Compiler flags such as `-g` or `-O2` go in `CXXFLAGS`. The `Makefile` assigns it `-Wall -Wextra`, so a value given on the command line replaces those warning flags rather than adding to them; repeat them to keep the warnings:

```sh
make CXXFLAGS="-Wall -Wextra -g"
```

Unlike `CXX`, a `CXXFLAGS` environment variable is not read, because the `Makefile`'s own assignment takes precedence over the environment.

Editing the `Makefile` itself, for example its `CXXFLAGS` assignment, makes the executable out of date, so the next `make` rebuilds it with the new settings. A variable given on the command line or in the environment does not, so if `testing` has already been built, run `make clean` first (or `make -B`) for the new compiler or flags to take effect.

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

It stops at the first step that fails and exits with that step's non-zero status, so a broken build is never followed by a run. Because the old executable is removed first, a failed build leaves no `testing` executable behind.

## Repository layout
| Path | Purpose |
|------|---------|
| `src/` | C++ sources. `src/testing.cpp` is the sample program. Any `.cpp` file added here is compiled, and any `.h` or `.hpp` file added here triggers a rebuild when it changes. Subdirectories are not searched. |
| `Makefile` | Build rules. The `testing` target globs `src/*.cpp` and depends on `src/*.h`, `src/*.hpp`, and the `Makefile` itself, the `run` target runs the executable, and the `clean` target removes it. |
| `testing` | The compiled executable, tracked in git. `make` rewrites it and `make clean` removes it. |
| `cr.sh` | Compile-and-run helper: `make clean`, `make`, `make run`, stopping at the first one that fails. |
| `.devcontainer/` | VS Code dev container definition. |
| `.vscode/` | Editor settings. |
| `.gitignore` | Currently empty, so nothing is excluded from version control. |
| `LICENSE` | The terms this template and anything generated from it are distributed under. |

## License
This template is distributed under the **Stephenson Software Non-Commercial License (Stephenson-NC)**. Use, copying, modification, and distribution are permitted for non-commercial purposes only; commercial use by anyone other than the copyright holder requires explicit written permission. See [`LICENSE`](LICENSE) for the full terms.

A project generated from this template inherits `LICENSE` along with everything else, so replace that file if different terms are wanted.
