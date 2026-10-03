-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Northstar
-- Decompile time: 1.08 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Northstar",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(2, 0, 49)),
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 39, 89)),
            ColorSequenceKeypoint.new(0.412, Color3.fromRGB(0, 225, 148)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(178, 222, 255)),
            ColorSequenceKeypoint.new(0.587, Color3.fromRGB(0, 233, 150)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 39, 89)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 0, 49))),
        })
    end,
    onCreate = function(self) -- Line: 19
        local v1
        local adornee = self.adornee
        if not adornee then
            return
        end
        for i, j in {"BeamDarkSwirls", "CoreSwirl1", "CoreSwirl2"} do
            v1 = adornee.Attachment1[j]
            v1.Attachment0 = adornee.Attachment1
            v1 = adornee.Attachment1[j]
            v1.Attachment1 = adornee.Attachment2
        end
        adornee["1"].Beam.Attachment0 = adornee["1"]
        adornee["1"].Beam.Attachment1 = adornee["2"]
    end,
    render = function(a1) -- Line: 34 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(81, 35, 147), Parent = v1})
        task.defer(function() -- Line: 56 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}