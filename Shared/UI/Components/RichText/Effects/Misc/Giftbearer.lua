-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Giftbearer
-- Decompile time: 1.02 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Giftbearer",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 235, 175)),
            ColorSequenceKeypoint.new(0.396, Color3.fromRGB(255, 126, 94)),
            ColorSequenceKeypoint.new(0.42, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.637, Color3.fromRGB(255, 255, 175)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 169, 111))),
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
        Create("UIGradient", {Name = "UIGradient", Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Name = "UIStroke", Thickness = 3, Color = Color3.fromRGB(255, 167, 60), Parent = v1})
        task.defer(function() -- Line: 42 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    onCreate = function(self) -- Line: 49
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].Ribbons.Attachment0 = adornee["1"]
        adornee["1"].Ribbons.Attachment1 = adornee["2"]
        adornee["3"].Ribbons.Attachment0 = adornee["3"]
        adornee["3"].Ribbons.Attachment1 = adornee["4"]
    end,
    cleanUp = function(a1) -- Line: 63
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