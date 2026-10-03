-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Guiding
-- Decompile time: 1.20 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "GuidingStar",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(106, 0, 255)),
            ColorSequenceKeypoint.new(0.152, Color3.fromRGB(238, 0, 255)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(253, 159, 29)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 214, 144)),
            ColorSequenceKeypoint.new(0.606, Color3.fromRGB(254, 164, 21)),
            ColorSequenceKeypoint.new(0.901, Color3.fromRGB(238, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(106, 0, 255))),
        })
    end,
    render = function(a1) -- Line: 19 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Name = "UIGradient", Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Name = "UIStroke", Thickness = 4, Color = Color3.fromRGB(81, 35, 147), Parent = v1})
        task.defer(function() -- Line: 44 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    onCreate = function(self) -- Line: 51
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].aurora.Attachment0 = adornee["1"]
        adornee["1"].aurora.Attachment1 = adornee["2"]
        adornee["3"].aurora.Attachment0 = adornee["3"]
        adornee["3"].aurora.Attachment1 = adornee["4"]
        adornee["5"].aurora.Attachment0 = adornee["5"]
        adornee["5"].aurora.Attachment1 = adornee.Star6
        adornee.Attachment.Beam1.Attachment0 = adornee.Attachment
        adornee.Attachment.Beam1.Attachment1 = adornee.Star1
        adornee.Attachment.Beam2.Attachment0 = adornee.Attachment
        adornee.Attachment.Beam2.Attachment1 = adornee.Star3
        adornee.Star2.Beam.Attachment0 = adornee.Star2
        adornee.Star2.Beam.Attachment1 = adornee.Attachment
        adornee.Star3.Beam1.Attachment0 = adornee.Star3
        adornee.Star3.Beam1.Attachment1 = adornee.Star6
        adornee.Star3.Beam2.Attachment0 = adornee.Star3
        adornee.Star3.Beam2.Attachment1 = adornee.Star4
        adornee.Star4.Beam.Attachment0 = adornee.Star4
        adornee.Star4.Beam.Attachment1 = adornee.Star5
    end,
    cleanUp = function(a1) -- Line: 85
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