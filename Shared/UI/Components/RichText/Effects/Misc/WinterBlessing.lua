-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.WinterBlessing
-- Decompile time: 0.67 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "WinterBlessing",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.266, Color3.fromRGB(96, 181, 255)),
            ColorSequenceKeypoint.new(0.498, Color3.fromRGB(194, 246, 255)),
            ColorSequenceKeypoint.new(0.701, Color3.fromRGB(37, 254, 127)),
            ColorSequenceKeypoint.new(0.789, Color3.fromRGB(121, 193, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 81, 9))),
        })
    end,
    render = function(a1) -- Line: 18 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(112, 147, 200), Parent = v1})
        return true
    end,
}