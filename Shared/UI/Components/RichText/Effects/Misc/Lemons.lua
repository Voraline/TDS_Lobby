-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Lemons
-- Decompile time: 0.69 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Lemons",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 213, 136)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(238, 198, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 213, 136))),
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
                v.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            end
            Create("UIGradient", {Name = "UIGradient", Rotation = 33, Color = a1:getColor(), Parent = v1})
            Create("UIStroke", {
                Thickness = 5,
                Transparency = 0.1,
                Color = Color3.fromRGB(179, 128, 10),
                Parent = v1,
            })
            a1.created = true
        end
        if not a1.adornee then
            return
        end
        return true
    end,
}