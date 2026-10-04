-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Curse
-- Decompile time: 1.07 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Curse",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(1, 0, 26)),
            ColorSequenceKeypoint.new(0.09, Color3.fromRGB(216, 0, 86)),
            ColorSequenceKeypoint.new(0.436, Color3.fromRGB(80, 0, 68)),
            ColorSequenceKeypoint.new(0.595, Color3.fromRGB(42, 0, 62)),
            ColorSequenceKeypoint.new(0.76, Color3.fromRGB(10, 0, 58)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(1, 11, 0))),
        })
    end,
    render = function(a1) -- Line: 18 -- upvalues: Create (val)
        local props = a1.props
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Parent = v})
                Create("UIStroke", {
                    Thickness = 4,
                    Transparency = 0.5,
                    Color = Color3.fromRGB(0, 81, 65),
                    Parent = v,
                })
            end
        end
        a1.stroke = true
        if not a1.created then
            a1.created = true
        end
        return true
    end,
}