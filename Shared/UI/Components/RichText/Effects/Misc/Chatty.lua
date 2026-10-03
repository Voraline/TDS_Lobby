-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Chatty
-- Decompile time: 0.56 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Chatty",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(114, 137, 218)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(106, 90, 205))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: Create (val)
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