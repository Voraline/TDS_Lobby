-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.d3bugf
-- Decompile time: 0.95 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "d3bugf",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(247, 0, 255)),
            ColorSequenceKeypoint.new(0.0933, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.107, Color3.fromRGB(170, 0, 255)),
            ColorSequenceKeypoint.new(0.169, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.223, Color3.fromRGB(150, 0, 225)),
            ColorSequenceKeypoint.new(0.238, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.292, Color3.fromRGB(164, 0, 246)),
            ColorSequenceKeypoint.new(0.363, Color3.fromRGB(101, 0, 154)),
            ColorSequenceKeypoint.new(0.411, Color3.fromRGB(40, 0, 159)),
            ColorSequenceKeypoint.new(0.451, Color3.fromRGB(109, 0, 164)),
            ColorSequenceKeypoint.new(0.487, Color3.fromRGB(166, 0, 255)),
            ColorSequenceKeypoint.new(0.541, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.599, Color3.fromRGB(158, 0, 142)),
            ColorSequenceKeypoint.new(0.663, Color3.fromRGB(70, 0, 107)),
            ColorSequenceKeypoint.new(0.774, Color3.fromRGB(162, 0, 244)),
            ColorSequenceKeypoint.new(0.898, Color3.fromRGB(46, 0, 72)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
        })
    end,
    render = function(a1) -- Line: 29 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {
            Name = "UIGradient",
            Rotation = 123,
            Color = a1:getColor(),
            Offset = Vector2.new(0, 0.5),
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