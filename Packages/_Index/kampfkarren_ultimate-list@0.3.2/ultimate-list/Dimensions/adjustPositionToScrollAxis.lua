-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Dimensions.adjustPositionToScrollAxis
-- Decompile time: 0.37 ms

local v1 = script:FindFirstAncestor("ultimate-list")
local exhaustiveMatch = require(v1.Util.exhaustiveMatch)
return function(a1, a2, a3) -- Line: 5 -- upvalues: exhaustiveMatch (val) -- types: a1: userdata, a2: number, a3: string
    if a3 == "x" then
        return UDim2.new(0, a1.X.Offset - a2, a1.Y.Scale, a1.Y.Offset)
    end
    if a3 == "y" then
        return UDim2.new(a1.X.Scale, a1.X.Offset, 0, a1.Y.Offset - a2)
    end
    return exhaustiveMatch(a3)
end