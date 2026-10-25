-- SPDX-License-Identifier: MIT
-- Copyright (c) 2026-present K. S. Ernest (iFire) Lee
--
-- The "align two vector sets → rotation" recipe (rodrigues, ns30 with the kabsch fallback,
-- finishAlign, align) now lives in contract-rotation-star as `RotationStar.Align`, unchanged.
-- This module keeps the `Sinew.Align` names for AlignTest and any other caller.
import RotationStar.Align
import Sinew.Math

namespace Sinew.Align

export RotationStar.Align (det9 mul9 transpose9 rodrigues ns30 regularize valid9 jacobi9 kabsch
  finishAlign align apply9)

end Sinew.Align
