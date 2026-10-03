-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Showstopper
-- Decompile time: 0.75 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Showstopper",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(204, 72, 72))),
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
        Create("UIStroke", {Name = "UIStroke", Thickness = 4, Color = Color3.fromRGB(255, 167, 60), Parent = v1})
        return true
    end,
    cleanUp = function(a1) -- Line: 42
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