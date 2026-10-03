-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.DarkMist
-- Decompile time: 0.73 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "DarkMist",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(222, 0, 238)),
            ColorSequenceKeypoint.new(0.256, Color3.fromRGB(99, 0, 220)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(1, 11, 0))),
        })
    end,
    render = function(a1) -- Line: 15 -- upvalues: Create (val)
        local props = a1.props
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {Color = a1:getColor(), Offset = Vector2.new(0.1, 0), Parent = v})
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