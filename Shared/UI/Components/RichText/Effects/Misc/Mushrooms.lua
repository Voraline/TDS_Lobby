-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Mushrooms
-- Decompile time: 0.73 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Mushrooms",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(231, 159, 159)),
            ColorSequenceKeypoint.new(0.226252, Color3.fromRGB(231, 125, 125)),
            ColorSequenceKeypoint.new(0.255613, Color3.fromRGB(231, 192, 192)),
            ColorSequenceKeypoint.new(0.390328, Color3.fromRGB(231, 100, 100)),
            ColorSequenceKeypoint.new(0.597582, Color3.fromRGB(231, 68, 68)),
            ColorSequenceKeypoint.new(0.61658, Color3.fromRGB(231, 147, 147)),
            ColorSequenceKeypoint.new(0.780656, Color3.fromRGB(231, 40, 40)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(231, 7, 7))),
        })
    end,
    render = function(a1) -- Line: 20 -- upvalues: Create (val)
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
            Create("UIStroke", {Thickness = 5, Color = Color3.fromRGB(152, 13, 13), Parent = v1})
            a1.created = true
        end
        if not a1.adornee then
            return
        end
        return true
    end,
}