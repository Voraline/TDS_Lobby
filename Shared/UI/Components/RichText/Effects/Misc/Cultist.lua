-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Cultist
-- Decompile time: 0.75 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "CultistRunes",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 3, 27)),
            ColorSequenceKeypoint.new(0.168, Color3.fromRGB(14, 10, 36)),
            ColorSequenceKeypoint.new(0.366, Color3.fromRGB(43, 22, 105)),
            ColorSequenceKeypoint.new(0.664, Color3.fromRGB(173, 27, 236)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 192, 255))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Name = "UIGradient", Rotation = 90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 3,
            Color = Color3.fromRGB(112, 145, 143),
            Parent = v1,
        })
        return true
    end,
    cleanUp = function(a1) -- Line: 45
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