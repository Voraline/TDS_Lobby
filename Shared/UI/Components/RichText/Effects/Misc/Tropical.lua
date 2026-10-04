-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Tropical
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Tropical",
    getColor = function(a1) -- Line: 8
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 29, 38)),
            ColorSequenceKeypoint.new(0.272, Color3.fromRGB(7, 119, 1)),
            ColorSequenceKeypoint.new(0.882, Color3.fromRGB(160, 246, 13)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 255, 120))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: Create (val)
        local v1 = a1.labels:Get()[1]
        if not a1.created then
            v1.TextColor3 = Color3.fromRGB(255, 255, 255)
            Create("UIGradient", {Rotation = 180, Color = a1:getColor(), Parent = v1})
            Create("UIStroke", {Thickness = 3, Color = Color3.fromRGB(130, 130, 0), Parent = v1})
            a1.created = true
        end
    end,
}