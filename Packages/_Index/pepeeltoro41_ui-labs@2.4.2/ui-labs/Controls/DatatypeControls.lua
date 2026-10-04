-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Controls.DatatypeControls
-- Decompile time: 0.31 ms

local CreateBaseControl = require(script.Parent.Utils).CreateBaseControl
return {
    Color3 = function(a1) -- Line: 5 -- upvalues: CreateBaseControl (val) -- types: a1: userdata
        return CreateBaseControl("Color3", (Color3.new(math.clamp(a1.R, 0, 1), math.clamp(a1.G, 0, 1), (math.clamp(a1.B, 0, 1)))))
    end,
}