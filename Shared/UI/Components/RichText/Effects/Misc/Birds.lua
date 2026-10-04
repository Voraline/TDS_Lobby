-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Birds
-- Decompile time: 0.87 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Birds",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(178, 195, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(78, 134, 255))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, v in ipairs(a1.labels:Get()) do
                v.TextColor3 = Color3.new(1, 1, 1)
            end
            Create("UIGradient", {Name = "UIGradient", Rotation = -88, Color = a1:getColor(), Parent = v1})
            Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(112, 145, 143), Parent = v1})
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