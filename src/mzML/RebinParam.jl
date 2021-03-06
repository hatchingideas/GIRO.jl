struct RebinParam <: MZInterpParam

    StartVal :: Float32

    EndVal :: Float32

    Res :: Float32

end

function getinterploc(IP :: RebinParam)

    collect(IP.StartVal : IP.Res : (IP.EndVal+IP.Res))

end

function getmidloc(IP :: RebinParam)

    collect(IP.StartVal : IP.Res : (IP.EndVal+IP.Res))[1:end-1] .+ (diff(collect(IP.StartVal : IP.Res : (IP.EndVal+IP.Res))) ./2)

end
