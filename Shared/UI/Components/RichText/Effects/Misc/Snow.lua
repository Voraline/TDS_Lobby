-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Snow
-- Decompile time: 0.89 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "SnowDay",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 148, 255))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Name = "UIGradient", Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 4,
            Color = Color3.fromRGB(112, 147, 200),
            Parent = v1,
        })
        task.defer(function() -- Line: 39 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    onCreate = function(self) -- Line: 46
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
        adornee.WindStart.Wind.Attachment0 = adornee.WindStart
        adornee.WindStart.Wind.Attachment1 = adornee.WindEnd
    end,
    cleanUp = function(a1) -- Line: 66
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