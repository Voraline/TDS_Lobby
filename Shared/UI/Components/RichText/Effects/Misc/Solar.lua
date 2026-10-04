-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Solar
-- Decompile time: 1.31 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "SolarEclipse",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 0, 17)),
            ColorSequenceKeypoint.new(0.149, Color3.fromRGB(30, 0, 15)),
            ColorSequenceKeypoint.new(0.256, Color3.fromRGB(57, 0, 13)),
            ColorSequenceKeypoint.new(0.315, Color3.fromRGB(112, 0, 9)),
            ColorSequenceKeypoint.new(0.346, Color3.fromRGB(165, 0, 5)),
            ColorSequenceKeypoint.new(0.384, Color3.fromRGB(238, 0, 0)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(238, 84, 6)),
            ColorSequenceKeypoint.new(0.42, Color3.fromRGB(238, 210, 0)),
            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.55, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.58, Color3.fromRGB(238, 207, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(238, 50, 8)),
            ColorSequenceKeypoint.new(0.62, Color3.fromRGB(238, 0, 0)),
            ColorSequenceKeypoint.new(0.647, Color3.fromRGB(164, 0, 5)),
            ColorSequenceKeypoint.new(0.678, Color3.fromRGB(111, 0, 9)),
            ColorSequenceKeypoint.new(0.761, Color3.fromRGB(55, 0, 13)),
            ColorSequenceKeypoint.new(0.853, Color3.fromRGB(26, 0, 15)),
            ColorSequenceKeypoint.new(0.946, Color3.fromRGB(8, 0, 17)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 0, 17))),
        })
    end,
    render = function(a1) -- Line: 31 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Name = "UIGradient", Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 4,
            Transparency = 0.5,
            Color = Color3.fromRGB(0, 81, 65),
            Parent = v1,
        })
        return true
    end,
    cleanUp = function(a1) -- Line: 59
        local adornee = a1.adornee
        if not adornee then
            return
        end
        for i, j in adornee:GetChildren() do
            if j:IsA("Attachment") then
                j:Destroy()
            end
        end
    end,
}