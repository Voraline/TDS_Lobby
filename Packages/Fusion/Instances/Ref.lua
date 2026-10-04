-- Script path: ReplicatedStorage.Packages.Fusion.Instances.Ref
-- Decompile time: 0.33 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local logError = require(Parent.Logging.logError)
local xtypeof = require(Parent.Utility.xtypeof)
return {
    type = "SpecialKey",
    kind = "Ref",
    stage = "observer",
    apply = function(a1, a2, a3, a4) -- Line: 18 -- upvalues: xtypeof (val), logError (val) -- types: a1: table, a4: table
        if xtypeof(a2) == "State" and a2.kind == "Value" then
            a2:set(a3.instance)
            table.insert(a4, function() -- Line: 23 -- upvalues: a2 (val)
                a2:set(nil)
            end)
            return
        end
        logError("invalidRefType")
    end,
}