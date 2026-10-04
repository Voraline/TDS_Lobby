-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.MeltingIceCream
-- Decompile time: 0.68 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "MeltingIceCream",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 196)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(107, 255, 119))),
        })
    end,
    onCreate = function(self) -- Line: 14
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].Beam.Attachment0 = adornee["1"]
        adornee["1"].Beam.Attachment1 = adornee["2"]
    end,
    render = function(a1) -- Line: 24 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 4,
            Transparency = 0.5,
            Color = Color3.fromRGB(109, 59, 42),
            Parent = v1,
        })
        task.defer(function() -- Line: 49 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}