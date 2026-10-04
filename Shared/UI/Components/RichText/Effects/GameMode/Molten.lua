-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.GameMode.Molten
-- Decompile time: 0.52 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Molten",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 234, 0)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(242, 156, 2)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 19, 19))),
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
        Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(85, 31, 9), Parent = v1})
        return true
    end,
}