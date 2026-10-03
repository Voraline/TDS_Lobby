-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.ControlConversion
-- Decompile time: 0.66 ms

local Primitive = require(script.Parent.PrimitiveControls).Primitive
local DatatypeControls = require(script.Parent.DatatypeControls)
local v1 = {}

local function ConvertPrimitive(a1, a2) -- Line: 6 -- upvalues: Primitive (val) -- types: a2: string
    local v1 = Primitive[a2]
    assert(v1, (("UI-Labs: Primitive (%*) can't be converted to a control"):format(a2)))
    return v1(a1)
end

local function ConvertDatatype(a1, a2) -- Line: 13 -- upvalues: DatatypeControls (val) -- types: a2: string
    local v1 = DatatypeControls[a2]
    assert(v1, (("UI-Labs: Datatype (%*) can't be converted to a control"):format(a2)))
    return v1(a1)
end

function v1.ConvertControl(a1) -- Line: 20
    -- upvalues: Primitive (val), ConvertPrimitive (val), DatatypeControls (val), ConvertDatatype (val)
    local v1 = typeof(a1)
    if v1 == "table" then
        return a1
    end
    if Primitive[v1] then
        return ConvertPrimitive(a1, v1)
    end
    if DatatypeControls[v1] then
        return ConvertDatatype(a1, v1)
    end
    error((("UI-Labs: Control (%*) is not a valid control"):format(a1)))
end

return v1