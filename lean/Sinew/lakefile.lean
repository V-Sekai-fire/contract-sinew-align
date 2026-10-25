-- SPDX-License-Identifier: MIT
-- SinewSolve — the body-solve spec: the SO(3)/least-squares math (Math, folded
-- in as solve is its only consumer), vector alignment (Align), bone-length
-- discovery (Anthropometry), rig rest pose (RigRest), and the Slang codegen for
-- the LBS + phenotype kernels (SlangCodegen.{Lbs,Pheno}).  Self-contained.
--   lake exe align_test     — sanity-check align_vectors against a known rotation
--   lake exe emit_shaders   — dump the SlangCodegen kernels to .slang
import Lake
open Lake DSL

-- Property-based testing: Plausible (QuickCheck for Lean4), v4.34.0 of the V-Sekai-fire fork,
-- the commit contract-rotation-star pins.
require plausible from git
  "https://github.com/V-Sekai-fire/plausible.git" @ "118aa17ee84656b8bd727fef7c458ee8c833385c"

-- The rotation fitter's spec now lives in contract-rotation-star (RotationStar.Align, with the
-- V3/M3 shapes of RotationStar.Vec); Sinew.Align and Sinew.Math re-export it.
require RotationStar from git
  "https://github.com/V-Sekai-fire/contract-rotation-star.git" @ "b70e19a627b3e6de19c4b52359406f771fae51c0" / "lean"

package "SinewSolve" where
  version := v!"0.1.0"

lean_lib SinewSolve where
  srcDir := "."
  globs  := #[Glob.one `Sinew.Math, Glob.one `Sinew.Align, Glob.one `Sinew.Anthropometry,
              Glob.one `Sinew.RigRest, Glob.submodules `Sinew.SlangCodegen]

lean_exe align_test where
  root := `AlignTest

lean_exe emit_shaders where
  root := `EmitShaders

-- Property tests over the body-solve spec (build fails on a counterexample).
lean_exe proptest where
  root := `Tests
