-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.PastelWaves
-- Decompile time: 0.77 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "PastelWaves",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 224, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 162, 195))),
        })
    end,
    onCreate = function(self) -- Line: 14
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee.Waves0.Beam.Attachment0 = adornee.Waves0
        adornee.Waves2.Beam.Attachment0 = adornee.Waves2
        adornee.Waves4.Beam.Attachment0 = adornee.Waves4
        adornee.Waves6.Beam.Attachment0 = adornee.Waves6
        adornee.Waves0.Beam.Attachment1 = adornee.Waves1
        adornee.Waves2.Beam.Attachment1 = adornee.Waves3
        adornee.Waves4.Beam.Attachment1 = adornee.Waves5
        adornee.Waves6.Beam.Attachment1 = adornee.Waves7
    end,
    render = function(a1) -- Line: 31 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Rotation = -27, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 3, Color = Color3.fromRGB(145, 98, 135), Parent = v1})
        task.defer(function() -- Line: 54 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}