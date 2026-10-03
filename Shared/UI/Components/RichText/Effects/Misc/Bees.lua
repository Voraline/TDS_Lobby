-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Bees
-- Decompile time: 0.92 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Bees",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 147, 0)),
            ColorSequenceKeypoint.new(0.252159, Color3.fromRGB(238, 198, 36)),
            ColorSequenceKeypoint.new(0.454231, Color3.fromRGB(232, 238, 169)),
            ColorSequenceKeypoint.new(0.711572, Color3.fromRGB(238, 191, 35)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 96, 24))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, v in ipairs(a1.labels:Get()) do
                v.TextColor3 = Color3.new(1, 1, 1)
                v.FontFace = Font.new("rbxasset://fonts/families/Creepster.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            end
            Create("UIGradient", {Name = "UIGradient", Color = a1:getColor(), Parent = v1})
            Create("UIStroke", {
                Thickness = 5,
                Transparency = 0.1,
                Color = Color3.fromRGB(179, 105, 82),
                Parent = v1,
            })
            a1.created = true
        end
        local adornee = a1.adornee
        if not adornee then
            return
        end
        for i2, j in adornee["1"]:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = adornee["1"]
                j.Attachment1 = adornee["2"]
            end
        end
        return true
    end,
}