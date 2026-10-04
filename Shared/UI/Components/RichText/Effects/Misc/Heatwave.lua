-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Heatwave
-- Decompile time: 0.86 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Heatwave",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 0, 0)),
            ColorSequenceKeypoint.new(0.0898, Color3.fromRGB(62, 15, 0)),
            ColorSequenceKeypoint.new(0.283, Color3.fromRGB(235, 55, 0)),
            ColorSequenceKeypoint.new(0.62, Color3.fromRGB(216, 133, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 212, 0))),
        })
    end,
    onCreate = function(self) -- Line: 17
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].Beam.Attachment0 = adornee["1"]
        adornee["1"].Beam.Attachment1 = adornee["2"]
    end,
    render = function(a1) -- Line: 27 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {
            Rotation = -79,
            Color = a1:getColor(),
            Offset = Vector2.new(0.2, 0),
            Parent = v1,
        })
        Create("UIStroke", {Thickness = 3, Color = Color3.fromRGB(21, 0, 0), Parent = v1})
        task.defer(function() -- Line: 51 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}