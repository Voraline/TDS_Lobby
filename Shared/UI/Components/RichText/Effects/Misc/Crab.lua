-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Crab
-- Decompile time: 0.49 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Crab",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 166, 106)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 60, 34))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Thickness = 2,
            Transparency = 0.28,
            Color = Color3.fromRGB(112, 119, 239),
            Parent = v1,
        })
        return true
    end,
}