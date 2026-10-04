-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.SpringRain
-- Decompile time: 0.64 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "SpringRain",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(178, 195, 255)),
            ColorSequenceKeypoint.new(0.815199, Color3.fromRGB(241, 184, 70)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 251, 142))),
        })
    end,
    render = function(a1) -- Line: 15 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, v in ipairs(a1.labels:Get()) do
                v.TextColor3 = Color3.new(1, 1, 1)
            end
            Create("UIGradient", {Name = "UIGradient", Rotation = -55, Color = a1:getColor(), Parent = v1})
            Create("UIStroke", {Thickness = 3, Color = Color3.fromRGB(112, 145, 143), Parent = v1})
            a1.created = true
        end
        if not a1.adornee then
            return
        end
        return true
    end,
}