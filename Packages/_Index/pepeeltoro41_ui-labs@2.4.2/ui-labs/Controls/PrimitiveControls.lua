-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.PrimitiveControls
-- Decompile time: 0.45 ms

local CreateBaseControl = require(script.Parent.Utils).CreateBaseControl
local v1 = {
    String = function(a1, a2) -- Line: 7 -- upvalues: CreateBaseControl (val) -- types: a1: string, a2: table?
        local v1 = CreateBaseControl("String", a1)
        v1.Filters = a2
        return v1
    end,
    Number = function(a1, a2, a3, a4, a5, a6) -- Line: 14
        -- upvalues: CreateBaseControl (val)
        local v1 = CreateBaseControl("Number", a1)
        v1.Min = a2
        v1.Max = a3
        v1.Step = a4
        v1.Dragger = if a5 ~= nil then a5 else true
        v1.Sensibility = a6 or a1 * 10
        return v1
    end,
    Boolean = function(a1) -- Line: 33 -- upvalues: CreateBaseControl (val) -- types: a1: boolean
        return CreateBaseControl("Boolean", a1)
    end,
}
v1.Primitive = {string = v1.String, number = v1.Number, boolean = v1.Boolean}
return v1