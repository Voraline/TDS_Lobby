-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Null
-- Decompile time: 0.89 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "NullDimension",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(1, 0, 26)),
            ColorSequenceKeypoint.new(0.393, Color3.fromRGB(99, 0, 220)),
            ColorSequenceKeypoint.new(0.572, Color3.fromRGB(213, 144, 218)),
            ColorSequenceKeypoint.new(0.853, Color3.fromRGB(94, 0, 211)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 0, 50))),
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
        Create("UIGradient", {Name = "UIGradient", Rotation = 11, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 4,
            Transparency = 0.5,
            Color = Color3.fromRGB(0, 81, 65),
            Parent = v1,
        })
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