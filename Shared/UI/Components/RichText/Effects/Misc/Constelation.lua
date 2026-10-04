-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Constelation
-- Decompile time: 0.93 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Constelation",
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
    onCreate = function(self) -- Line: 19
        local adornee = self.adornee
        if not adornee then
            return
        end
        for i, j in adornee:GetDescendants() do
            if j:IsA("Beam") then
                j.Attachment0 = j.Parent
                j.Attachment1 = adornee:FindFirstChild(j.Name)
            end
        end
    end,
    render = function(a1) -- Line: 33 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(81, 35, 147), Parent = v1})
        task.defer(function() -- Line: 55 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
}