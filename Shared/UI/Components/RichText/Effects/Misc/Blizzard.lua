-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Blizzard
-- Decompile time: 0.59 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Blizzard",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(197, 222, 255)),
            ColorSequenceKeypoint.new(0.472, Color3.fromRGB(189, 240, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(197, 222, 255))),
        })
    end,
    render = function(a1) -- Line: 15 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {Rotation = 45, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(112, 147, 200), Parent = v1})
        return true
    end,
}