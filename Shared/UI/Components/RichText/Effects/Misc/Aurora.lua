-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Aurora
-- Decompile time: 1.21 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Aurora",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(106, 0, 255)),
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(238, 0, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 157)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(238, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(106, 0, 255))),
        })
    end,
    onCreate = function(self) -- Line: 17
        local adornee = self.adornee
        if not adornee then
            return
        end
        local Root = adornee:FindFirstChild("Root")
        if not Root then
            return
        end
        self.rootAttachment = Root
        Root["1"].Beam.Attachment0 = Root["1"]
        Root["1"].Beam.Attachment1 = Root["2"]
        Root["3"].Beam.Attachment0 = Root["3"]
        Root["3"].Beam.Attachment1 = Root["4"]
        Root["5"].Beam.Attachment0 = Root["5"]
        Root["5"].Beam.Attachment1 = Root["6"]
    end,
    render = function(a1) -- Line: 40 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, v in ipairs(a1.labels:Get()) do
                v.TextColor3 = Color3.new(1, 1, 1)
            end
            Create("UIGradient", {Color = a1:getColor(), Parent = v1})
            Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(81, 35, 147), Parent = v1})
            task.defer(function() -- Line: 63 -- upvalues: a1 (val)
                a1:onCreate()
            end)
        end
        if a1.rootAttachment then
            a1.rootAttachment.WorldCFrame = (CFrame.new(a1.rootAttachment.Parent.Position)) * CFrame.Angles(0, 3.141592653589793, 0)
        end
        a1.created = true
    end,
}