# contract-sinew-align

The rotation fitter: its Lean specification and its C port, linked by the drape and headfit guests.

## Use

The Lean library specifies the body-solve math, including vector alignment. The C port implements that alignment fit, and the `interactor-drape` and `interactor-headfit` guests link it.

## Build and run

```sh
bash vendor/sinew-align/build.sh
```

The script builds the C port and runs its unit test against the oracle in `AlignTest.lean`. In `lean/Sinew`, `lake build` builds the specification.

## Licence

MIT, per the SPDX headers in the sources. There is no `LICENSE` file.
