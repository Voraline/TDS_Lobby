-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Coal
-- Decompile time: 0.56 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Coal",
    render = function(a1) -- Line: 7 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
            Create("UIGradient", {
                Name = "UIGradient",
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(186, 186, 186)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
                }),
                Parent = v,
            })
            Create("UIStroke", {Name = "UIStroke", Thickness = 4, Transparency = 0.5, Parent = v})
        end
        return true
    end,
}