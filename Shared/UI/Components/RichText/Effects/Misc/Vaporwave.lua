-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Vaporwave
-- Decompile time: 1.05 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Vaporwave",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 0, 189)),
            ColorSequenceKeypoint.new(0.166, Color3.fromRGB(65, 0, 255)),
            ColorSequenceKeypoint.new(0.377, Color3.fromRGB(251, 0, 242)),
            ColorSequenceKeypoint.new(0.59, Color3.fromRGB(255, 0, 115)),
            ColorSequenceKeypoint.new(0.716, Color3.fromRGB(255, 116, 11)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 238, 0))),
        })
    end,
    onCreate = function(self) -- Line: 18
        local adornee = self.adornee
        if not adornee then
            return
        end
        for i, j in adornee.SunBottom:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = adornee.SunBottom
                j.Attachment1 = adornee.SunTop
            end
        end
        for k, n in adornee.GridBottom:GetChildren() do
            if n:IsA("Beam") then
                n.Attachment0 = adornee.SunBottom
                n.Attachment1 = adornee.SunTop
            end
        end
    end,
    render = function(a1) -- Line: 41 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {
            Rotation = -90,
            Color = a1:getColor(),
            Offset = Vector2.new(0.2, 0),
            Parent = v1,
        })
        Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 81, 65)})
        task.defer(function() -- Line: 65 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}