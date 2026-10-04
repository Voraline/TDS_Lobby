-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.ControlUtils
-- Decompile time: 0.21 ms

local ControlConversion = require(script.Parent.ControlConversion)
return {
    ControlGroup = function(a1) -- Line: 4 -- types: a1: table
        return {EntryType = "ControlGroup", Controls = a1}
    end,
    Ordered = function(a1, a2) -- Line: 12 -- upvalues: ControlConversion (val) -- types: a2: number
        local v1 = ControlConversion.ConvertControl(a1)
        v1.Order = a2
        return v1
    end,
}