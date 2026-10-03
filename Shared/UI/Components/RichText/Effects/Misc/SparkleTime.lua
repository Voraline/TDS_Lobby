-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.SparkleTime
-- Decompile time: 0.65 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Sparkletime",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.35, Color3.fromRGB(76, 255, 228)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(211, 255, 255)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(67, 133, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 176, 255))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: Create (val)
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