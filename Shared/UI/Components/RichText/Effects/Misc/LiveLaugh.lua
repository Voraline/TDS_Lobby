-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.LiveLaugh
-- Decompile time: 0.91 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "LiveLaugh",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, v in ipairs(a1.labels:Get()) do
                v.TextColor3 = Color3.new(1, 1, 1)
                v.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Regular, Enum.FontStyle.Italic)
            end
            Create("UIGradient", {Name = "UIGradient", Parent = v1})
            Create("UIStroke", {Name = "UIStroke", Thickness = 3, Transparency = 0.4, Parent = v1})
            a1.created = true
        end
        local adornee = a1.adornee
        if not adornee then
            return
        end
        for i2, j in adornee["1"]:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = adornee["1"]
                j.Attachment1 = adornee["2"]
            end
        end
        return true
    end,
    cleanUp = function(a1) -- Line: 60
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