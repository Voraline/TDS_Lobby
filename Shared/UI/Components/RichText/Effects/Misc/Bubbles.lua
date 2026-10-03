-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Bubbles
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Bubbles",
    getColor = function(a1) -- Line: 10
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 220, 255)),
            ColorSequenceKeypoint.new(0.0692, Color3.fromRGB(194, 212, 255)),
            ColorSequenceKeypoint.new(0.254, Color3.fromRGB(38, 166, 252)),
            ColorSequenceKeypoint.new(0.839, Color3.fromRGB(133, 93, 244)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 234))),
        })
    end,
    render = function(a1) -- Line: 20 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
            v.Font = Enum.Font.FredokaOne
        end
        Create("UIGradient", {Name = "UIGradient", Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 2,
            Transparency = 0.28,
            Color = Color3.fromRGB(112, 119, 239),
            Parent = v1,
        })
        return true
    end,
    cleanUp = function(a1) -- Line: 50
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