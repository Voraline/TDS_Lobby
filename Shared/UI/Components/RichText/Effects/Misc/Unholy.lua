-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Unholy
-- Decompile time: 0.85 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "UnholyFire",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 185, 111)),
            ColorSequenceKeypoint.new(0.107, Color3.fromRGB(211, 230, 0)),
            ColorSequenceKeypoint.new(0.366, Color3.fromRGB(195, 255, 0)),
            ColorSequenceKeypoint.new(0.81, Color3.fromRGB(0, 255, 38)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 88, 108))),
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
        Create("UIGradient", {
            Name = "UIGradient",
            Rotation = 88,
            Color = a1:getColor(),
            Offset = Vector2.new(0, -0.12),
            Parent = v1,
        })
        Create("UIStroke", {Name = "UIStroke", Thickness = 3, Color = Color3.fromRGB(0, 75, 107), Parent = v1})
        return true
    end,
    cleanUp = function(a1) -- Line: 46
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