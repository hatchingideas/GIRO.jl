module BSplineInterp

import GIRO.InterpParam

Bu3 = u -> u^3/6
Bu2 = u -> (-3u^3 + 3u^2 + 3u + 1)/6
Bu1 = u -> ( 3u^3 - 6u^2 + 4)/6
Bu0 = u-> (1-u)^3/6

dBu3 = u -> u^2/2
dBu2 = u -> -1.5u^2 + u + .5
dBu1 = u -> 1.5u^2 - 2u
dBu0 = u -> -.5*(u-1)^2

const RESLEVEL = 16

const BSPL_IDX = 0 : 1/(2^RESLEVEL) : (1 - 1/(2^RESLEVEL))

const B3 = Bu3.(BSPL_IDX)
const B2 = Bu2.(BSPL_IDX)
const B1 = Bu1.(BSPL_IDX)
const B0 = Bu0.(BSPL_IDX)

const DB3 = dBu3.(BSPL_IDX)
const DB2 = dBu2.(BSPL_IDX)
const DB1 = dBu1.(BSPL_IDX)
const DB0 = dBu0.(BSPL_IDX)

const BSPL_TAB = Dict([BSPL_IDX[i] => [B3[i], B2[i], B1[i], B0[i]] for i in 1:length(BSPL_IDX)])

const DBSPL_TAB = Dict([BSPL_IDX[i] => [DB3[i], DB2[i], DB1[i], DB0[i]] for i in 1:length(BSPL_IDX)])






include("InterpParam.jl")

end