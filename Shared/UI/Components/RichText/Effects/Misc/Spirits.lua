-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Spirits
-- Decompile time: 0.69 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Spirits",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 84, 77)),
            ColorSequenceKeypoint.new(0.0725, Color3.fromRGB(0, 229, 210)),
            ColorSequenceKeypoint.new(0.15, Color3.fromRGB(156, 216, 233)),
            ColorSequenceKeypoint.new(0.532, Color3.fromRGB(0, 255, 217)),
            ColorSequenceKeypoint.new(0.87, Color3.fromRGB(0, 47, 98)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 1, 34))),
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
        Create("UIGradient", {
            Name = "UIGradient",
            Rotation = 8,
            Color = a1:getColor(),
            Offset = Vector2.new(0, -0.2),
            Parent = v1,
        })
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 4,
            Transparency = 0.5,
            Color = Color3.fromRGB(0, 81, 65),
            Parent = v1,
        })
        return true
    end,
}