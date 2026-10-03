-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Carols
-- Decompile time: 1.01 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Carols",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 96, 24)),
            ColorSequenceKeypoint.new(0.501, Color3.fromRGB(238, 185, 94)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 96, 24))),
        })
    end,
    render = function(a1) -- Line: 15 -- upvalues: Create (val)
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
            Thickness = 3,
            Transparency = 0.1,
            Color = Color3.fromRGB(162, 134, 202),
            Parent = v1,
        })
        task.defer(function() -- Line: 41 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    onCreate = function(self) -- Line: 48
        local adornee = self.adornee
        if not adornee then
            return
        end
        for i, j in adornee["1"]:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = adornee["1"]
                j.Attachment1 = adornee["2"]
            end
        end
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