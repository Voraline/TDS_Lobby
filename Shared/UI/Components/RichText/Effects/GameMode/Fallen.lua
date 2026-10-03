-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.GameMode.Fallen
-- Decompile time: 0.60 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Fallen",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(243, 211, 255)),
            ColorSequenceKeypoint.new(0.35, Color3.fromRGB(143, 153, 215)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(33, 30, 113)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 7, 62))),
        })
    end,
    render = function(a1) -- Line: 16 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v1})
        return true
    end,
}