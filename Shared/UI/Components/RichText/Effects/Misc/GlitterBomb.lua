-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.GlitterBomb
-- Decompile time: 0.66 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "GlitterBomb",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 32, 244)),
            ColorSequenceKeypoint.new(0.128, Color3.fromRGB(252, 102, 246)),
            ColorSequenceKeypoint.new(0.315, Color3.fromRGB(237, 16, 253)),
            ColorSequenceKeypoint.new(0.488, Color3.fromRGB(255, 120, 244)),
            ColorSequenceKeypoint.new(0.618, Color3.fromRGB(235, 4, 255)),
            ColorSequenceKeypoint.new(0.68, Color3.fromRGB(255, 108, 244)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 0, 255))),
        })
    end,
    render = function(a1) -- Line: 19 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, v in ipairs((a1.labels:Get())) do
                v.TextColor3 = Color3.new(1, 1, 1)
            end
            Create("UIGradient", {
                Rotation = 0,
                Color = a1:getColor(),
                Offset = Vector2.new(0.3, 0),
                Parent = v1,
            })
            Create("UIStroke", {
                Thickness = 4,
                Transparency = 0.5,
                Color = Color3.fromRGB(89, 0, 153),
                Parent = v1,
            })
        end
        a1.created = true
    end,
}