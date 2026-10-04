-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.AdvancedControls
-- Decompile time: 0.78 ms

local CreateBaseControl = require(script.Parent.Utils).CreateBaseControl
return {
    Choose = function(a1, a2) -- Line: 7 -- upvalues: CreateBaseControl (val) -- types: a1: table, a2: number?
        if #a1 <= 0 then
            error("UI-Labs: Array given in a Choose control is empty")
        end
        if a2 and #a1 < a2 then
            error((("UI-Labs: Def index (%*) given for the array is outside of the array size (%*)"):format(a2, #a1)))
        end
        local v1 = CreateBaseControl("Choose", a1[a2 or 1])
        v1.List = a1
        v1.DefIndex = a2 or 1
        return v1
    end,
    EnumList = function(a1, a2) -- Line: 22 -- upvalues: CreateBaseControl (val) -- types: a1: table, a2: string
        if a1[a2] == nil then
            error((("UI-Labs: Key given for the EnumList list (%*) does not exist in the list"):format(a2)))
        end
        local v1 = CreateBaseControl("EnumList", a1[a2])
        v1.List = a1
        v1.DefIndex = a2
        return v1
    end,
    RGBA = function(a1, a2) -- Line: 34 -- upvalues: CreateBaseControl (val) -- types: a1: userdata, a2: number?
        return CreateBaseControl("RGBA", {Color = a1, Transparency = a2 or 0})
    end,
    Slider = function(a1, a2, a3, a4) -- Line: 41
        -- upvalues: CreateBaseControl (val)
        if a3 <= a2 then
            error((("UI-Labs: Max slider value (%*) must be greater than the Min value (%*)"):format(a3, a2)))
        end
        local v1 = CreateBaseControl("Slider", a1)
        v1.Min = a2
        v1.Max = a3
        v1.Step = a4
        return v1
    end,
    Object = function(a1, a2, a3) -- Line: 56
        -- upvalues: CreateBaseControl (val)
        local v1 = CreateBaseControl("Object", a2)
        v1.ClassName = a1 or "Instance"
        v1.Predicator = a3
        return v1
    end,
}