-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Blood
-- Decompile time: 0.98 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "BloodMoon",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(185, 83, 84)),
            ColorSequenceKeypoint.new(0.0796, Color3.fromRGB(171, 55, 61)),
            ColorSequenceKeypoint.new(0.199, Color3.fromRGB(144, 1, 17)),
            ColorSequenceKeypoint.new(0.896, Color3.fromRGB(9, 5, 68)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 3, 33))),
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
        Create("UIGradient", {Name = "UIGradient", Rotation = 82, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Name = "UIStroke", Thickness = 3, Color = Color3.fromRGB(0, 125, 77), Parent = v1})
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