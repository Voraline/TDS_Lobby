-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.PlsDonate
-- Decompile time: 0.91 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "PlsDonate",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 209, 92)),
            ColorSequenceKeypoint.new(0.204, Color3.fromRGB(255, 149, 0)),
            ColorSequenceKeypoint.new(0.216, Color3.fromRGB(255, 238, 142)),
            ColorSequenceKeypoint.new(0.453, Color3.fromRGB(255, 174, 39)),
            ColorSequenceKeypoint.new(0.614, Color3.fromRGB(255, 163, 22)),
            ColorSequenceKeypoint.new(0.619, Color3.fromRGB(255, 221, 153)),
            ColorSequenceKeypoint.new(0.761, Color3.fromRGB(255, 153, 6)),
            ColorSequenceKeypoint.new(0.939, Color3.fromRGB(255, 151, 3)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 157, 0))),
        })
    end,
    render = function(a1) -- Line: 21 -- upvalues: Create (val)
        local props = a1.props
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {
                    Rotation = -83,
                    Color = a1:getColor(),
                    Offset = Vector2.new(0.3, 0),
                    Parent = v,
                })
                Create("UIStroke", {
                    Thickness = 4,
                    Transparency = 0.5,
                    Color = Color3.fromRGB(212, 209, 201),
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