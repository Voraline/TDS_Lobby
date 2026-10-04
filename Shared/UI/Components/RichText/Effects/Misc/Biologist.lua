-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Biologist
-- Decompile time: 1.15 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Biologist",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 45, 35)),
            ColorSequenceKeypoint.new(0.157, Color3.fromRGB(41, 141, 19)),
            ColorSequenceKeypoint.new(0.441, Color3.fromRGB(89, 255, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(208, 255, 0))),
        })
    end,
    render = function(a1) -- Line: 16 -- upvalues: Create (val)
        local v1
        local v2 = a1.container:Get()
        if v2 == a1.root then
            v2 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, j in a1.labels:Get() do
                j.TextColor3 = Color3.new(1, 1, 1)
            end
            Create("UIGradient", {Name = "UIGradient", Rotation = -27, Color = a1:getColor(), Parent = v2})
            Create("UIStroke", {
                Name = "UIStroke",
                Thickness = 4,
                Color = Color3.fromRGB(0, 106, 127),
                Parent = v2,
            })
            a1.created = true
        end
        local adornee = a1.adornee
        if not adornee then
            return
        end
        for k = 1, 10 do
            for n, m in adornee[tostring(k)]:GetChildren() do
                if m:IsA("Beam") then
                    m.Attachment0 = adornee[tostring(k)]
                    v1 = k + 1
                    m.Attachment1 = adornee[tostring(v1)]
                end
            end
        end
        for i5, i6 in adornee.Beam1:GetChildren() do
            if i6:IsA("Beam") then
                i6.Attachment0 = adornee.Beam1
                i6.Attachment1 = adornee.Beam2
            end
        end
        return true
    end,
}