-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.GreenSlime
-- Decompile time: 0.70 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "GreenSlime",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 84, 0)),
            ColorSequenceKeypoint.new(0.147, Color3.fromRGB(106, 144, 0)),
            ColorSequenceKeypoint.new(0.383, Color3.fromRGB(130, 229, 0)),
            ColorSequenceKeypoint.new(0.679, Color3.fromRGB(242, 255, 0)),
            ColorSequenceKeypoint.new(0.832, Color3.fromRGB(124, 217, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 84, 0))),
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
            Rotation = 90,
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