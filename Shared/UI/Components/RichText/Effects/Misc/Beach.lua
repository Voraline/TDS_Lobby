-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Beach
-- Decompile time: 1.36 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Beach",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 220, 255)),
            ColorSequenceKeypoint.new(0.0692, Color3.fromRGB(194, 212, 255)),
            ColorSequenceKeypoint.new(0.187, Color3.fromRGB(38, 166, 252)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 255, 255))),
        })
    end,
    onCreate = function(self) -- Line: 16
        local adornee = self.adornee
        if not adornee then
            return
        end
        for i, j in adornee.WavesSlow0:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = adornee.WavesSlow0
                j.Attachment1 = adornee.WavesSlow1
            end
        end
        for k, n in adornee.WavesFast0:GetChildren() do
            if n:IsA("Beam") then
                n.Attachment0 = adornee.WavesFast0
                n.Attachment1 = adornee.WavesFast1
            end
        end
        for m, i5 in adornee.Sand0:GetChildren() do
            if i5:IsA("Beam") then
                i5.Attachment0 = adornee.Sand0
                i5.Attachment1 = adornee.Sand1
            end
        end
        for i6, i7 in adornee.Dark0:GetChildren() do
            if i7:IsA("Beam") then
                i7.Attachment0 = adornee.Dark0
                i7.Attachment1 = adornee.Dark1
            end
        end
    end,
    render = function(a1) -- Line: 55 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
            v.Font = Enum.Font.PatrickHand
        end
        Create("UIGradient", {
            Rotation = -90,
            Color = a1:getColor(),
            Offset = Vector2.new(0.2, 0),
            Parent = v1,
        })
        Create("UIStroke", {Thickness = 2, Transparency = 0.28, Color = Color3.fromRGB(112, 119, 239)})
        task.defer(function() -- Line: 80 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    cleanUp = function(a1) -- Line: 87
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