-- Script path: ReplicatedStorage.Packages.Fusion.Instances.Hydrate
-- Decompile time: 0.40 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local semiWeakRef = require(Parent.Instances.semiWeakRef)
local applyInstanceProps = require(Parent.Instances.applyInstanceProps)
return function(a1) -- Line: 13 -- upvalues: applyInstanceProps (val), semiWeakRef (val) -- types: a1: userdata
    return function(a1_2) -- Line: 14 -- upvalues: applyInstanceProps (upval), semiWeakRef (upval), a1 (val)
        applyInstanceProps(a1_2, semiWeakRef(a1))
        return a1
    end
end