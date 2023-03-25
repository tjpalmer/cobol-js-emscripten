# COBOL -> WebAssembly proof of concept

This a proof of concept for building COBOL to WebAssembly

## How it works
1. Builds and installs the GNU Multiprecision Library [GMP](https://gmplib.org/) (dependency of GNUCOBOL)
1. Builds and installs [GnuCOBOL](https://www.gnu.org/software/gnucobol/)

1. Builds an LLVM bitcode version of GMP
1. Builds an LLVM bitcode version of libcob

1. Transpile COBOL source to C using GnuCOBOL
1. Build WebAssembly (and helper JS) using [emscripten](https://emscripten.org/), linking in the GMP and libcob bitcode

## Testing it out
The whole development environment is contained in the `.devContainer` directory.

Use Docker and the [containers remote extension](https://code.visualstudio.com/docs/remote/containers) for VSCode to reliably reproduce this environment

Or manually use the commands below:

```
# Or use docker instead of podman
podman build -f .devcontainer/Dockerfile -t cobol-js-emscripten
podman run -it --rm -v $PWD:/src cobol-js-emscripten bash
```

## Live Demo
[moxon6.github.io/cobol-js-emscripten](https://moxon6.github.io/cobol-js-emscripten)
