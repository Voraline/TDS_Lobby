-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.NullAndVoid
-- Decompile time: 1.02 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "NullAndVoid",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(191, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        })
    end,
    onCreate = function(self) -- Line: 15
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].Frame.Attachment0 = adornee["1"]
        adornee["1"].Frame.Attachment1 = adornee["2"]
        for i, j in adornee["3"]:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = adornee["3"]
                j.Attachment1 = adornee["4"]
            end
        end
    end,
    render = function(a1) -- Line: 32 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Name = "UIGradient", Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 3,
            Transparency = 0.2,
            Color = Color3.fromRGB(11, 0, 57),
            Parent = v1,
        })
        task.defer(function() -- Line: 57 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    cleanUp = function(a1) -- Line: 64
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