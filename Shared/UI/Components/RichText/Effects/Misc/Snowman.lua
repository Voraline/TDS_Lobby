-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Snowman
-- Decompile time: 0.85 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Snowman",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 148, 255))),
        })
    end,
    onCreate = function(self) -- Line: 14
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].Snow.Attachment0 = adornee["1"]
        adornee["1"].Snow.Attachment1 = adornee["2"]
        adornee["3"].Water.Attachment0 = adornee["3"]
        adornee["3"].Water.Attachment1 = adornee["4"]
        adornee["5"].Snowman.Attachment0 = adornee["5"]
        adornee["5"].Snowman.Attachment1 = adornee["6"]
    end,
    render = function(a1) -- Line: 30 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(112, 147, 200), Parent = v1})
        task.defer(function() -- Line: 53 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}