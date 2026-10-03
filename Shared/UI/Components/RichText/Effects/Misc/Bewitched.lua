-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Bewitched
-- Decompile time: 0.83 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Bewitched",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 202, 0)),
            ColorSequenceKeypoint.new(0.154, Color3.fromRGB(222, 128, 30)),
            ColorSequenceKeypoint.new(0.381, Color3.fromRGB(184, 84, 102)),
            ColorSequenceKeypoint.new(0.792, Color3.fromRGB(115, 5, 230)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(58, 0, 106))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: Create (val)
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