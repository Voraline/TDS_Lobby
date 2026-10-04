-- Script path: ReplicatedStorage.Packages.Fusion.Instances.Cleanup
-- Decompile time: 0.19 ms

local Parent_2 = script.Parent.Parent
require(Parent_2.PubTypes)
return {
    type = "SpecialKey",
    kind = "Cleanup",
    stage = "observer",
    apply = function(a1, a2, a3, a4) -- Line: 16 -- types: a1: table, a4: table
        table.insert(a4, a2)
    end,
}