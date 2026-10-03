-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Reindeer
-- Decompile time: 0.73 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Reindeer",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 19, 6)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(202, 98, 13)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 19, 6))),
        })
    end,
    onCreate = function(self) -- Line: 15
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].Beam.Attachment0 = adornee["1"]
        adornee["1"].Beam.Attachment1 = adornee["2"]
    end,
    render = function(a1) -- Line: 25 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Transparency = 0.5, Parent = v1})
        task.defer(function() -- Line: 47 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}