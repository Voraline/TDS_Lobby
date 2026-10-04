-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Mermaid
-- Decompile time: 0.93 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Mermaid",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 3, 27)),
            ColorSequenceKeypoint.new(0.161, Color3.fromRGB(9, 82, 218)),
            ColorSequenceKeypoint.new(0.439, Color3.fromRGB(57, 234, 222)),
            ColorSequenceKeypoint.new(0.753, Color3.fromRGB(210, 72, 220)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 205, 248))),
        })
    end,
    onCreate = function(self) -- Line: 17
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee.Bubbles1.Beam.Attachment0 = adornee.Bubbles1
        adornee.Bubbles1.Beam.Attachment1 = adornee.Bubbles2
    end,
    render = function(a1) -- Line: 27 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
            v.Font = Enum.Font.IndieFlower
        end
        Create("UIGradient", {Name = "UIGradient", Rotation = -90, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 3,
            Color = Color3.fromRGB(112, 145, 143),
            Parent = v1,
        })
        if not a1.created then
            task.defer(function() -- Line: 54 -- upvalues: a1 (val)
                a1:onCreate()
            end)
            a1.created = true
        end
        return true
    end,
    cleanUp = function(a1) -- Line: 64
        local adornee = a1.adornee
        if not adornee then
            return
        end
        local Bubbles1 = adornee:FindFirstChild("Bubbles1")
        local Bubbles2 = adornee:FindFirstChild("Bubbles2")
        if Bubbles1 then
            Bubbles1:Destroy()
        end
        if Bubbles2 then
            Bubbles2:Destroy()
        end
    end,
}