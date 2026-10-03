-- Script path: ReplicatedStorage.Packages.Fusion.State.unwrap
-- Decompile time: 0.28 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local xtypeof = require(Parent.Utility.xtypeof)
return function(a1, a2) -- Line: 11 -- upvalues: xtypeof (val) -- types: a2: boolean?
    if xtypeof(a1) == "State" then
        return (a1:get(a2))
    end
    return a1
end