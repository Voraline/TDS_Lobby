-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Gingerbread
-- Decompile time: 0.68 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Gingerbread",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 32, 7)),
            ColorSequenceKeypoint.new(0.194, Color3.fromRGB(131, 97, 70)),
            ColorSequenceKeypoint.new(0.209, Color3.fromRGB(200, 238, 201)),
            ColorSequenceKeypoint.new(0.284, Color3.fromRGB(111, 238, 130)),
            ColorSequenceKeypoint.new(0.476, Color3.fromRGB(112, 231, 127)),
            ColorSequenceKeypoint.new(0.493, Color3.fromRGB(89, 170, 91)),
            ColorSequenceKeypoint.new(0.529, Color3.fromRGB(132, 99, 72)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 32, 7))),
        })
    end,
    render = function(a1) -- Line: 20 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {
            Rotation = 90,
            Color = a1:getColor(),
            Offset = Vector2.new(0.5, 0.15),
            Parent = v1,
        })
        Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(107, 71, 0), Parent = v1})
        return true
    end,
}