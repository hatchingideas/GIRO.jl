struct LS_NormalParam

    NBases :: SparseMatrixCSC

end

function LS_NormalParam(RTLen :: Int, BSplQuarterSupportLen :: Int)

    DyadicResLevel = dyadic_res_level(RTLen)

    DyadicSizeRT = Int64(2^DyadicResLevel)

    u = collect(0:BSplQuarterSupportLen-1)/BSplQuarterSupportLen
    B = [BU[1].(u), BU[2].(u), BU[3].(u), BU[4].(u)]
    NormBU = norm(B,2)
    NormalizedB = [BU[1].(u)..., BU[2].(u)..., BU[3].(u)..., BU[4].(u)...] / NormBU

    NumBases = Int64(DyadicSizeRT/BSplQuarterSupportLen-3)
    NBases = zeros(Float64, DyadicSizeRT, NumBases)

    for j in 0:(NumBases - 1)

        NBases[Int(j*BSplQuarterSupportLen+1) : Int(j*BSplQuarterSupportLen + BSplQuarterSupportLen*4), Int(j+1)] = NormalizedB

    end

    this = LS_NormalParam(sparse(NBases))

end
