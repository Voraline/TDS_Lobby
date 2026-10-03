-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Conserver
-- Decompile time: 1.48 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Conserver",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 0, 24)),
            ColorSequenceKeypoint.new(0.0623, Color3.fromRGB(114, 0, 48)),
            ColorSequenceKeypoint.new(0.135, Color3.fromRGB(233, 0, 85)),
            ColorSequenceKeypoint.new(0.23, Color3.fromRGB(81, 0, 40)),
            ColorSequenceKeypoint.new(0.356, Color3.fromRGB(255, 0, 81)),
            ColorSequenceKeypoint.new(0.426, Color3.fromRGB(97, 0, 44)),
            ColorSequenceKeypoint.new(0.498, Color3.fromRGB(174, 0, 96)),
            ColorSequenceKeypoint.new(0.555, Color3.fromRGB(65, 0, 30)),
            ColorSequenceKeypoint.new(0.652, Color3.fromRGB(176, 0, 97)),
            ColorSequenceKeypoint.new(0.713, Color3.fromRGB(214, 0, 70)),
            ColorSequenceKeypoint.new(0.761, Color3.fromRGB(82, 0, 41)),
            ColorSequenceKeypoint.new(0.851, Color3.fromRGB(181, 0, 63)),
            ColorSequenceKeypoint.new(0.92, Color3.fromRGB(99, 0, 44)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 0, 135))),
        })
    end,
    onCreate = function(self) -- Line: 26
        local adornee = self.adornee
        if adornee then
            local v1 = adornee.Size / 2
            local BeamStart = adornee.BeamStart
            local BeamEnd = adornee.BeamEnd
            for i, v in ipairs(adornee:GetChildren()) do
                if v:IsA("Beam") then
                    v.Attachment0 = BeamStart
                    v.Attachment1 = BeamEnd
                end
            end
            BeamStart.CFrame = CFrame.new(-v1.X - 1, 0.15, 0)
            BeamEnd.CFrame = CFrame.new(v1.X + 1, 0.15, 0)
        end
    end,
    render = function(a1) -- Line: 47 -- upvalues: Create (val)
        local props = a1.props
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {
                    Rotation = 90,
                    Color = a1:getColor(),
                    Offset = Vector2.new(0, -0.2),
                    Parent = v,
                })
                Create("UIStroke", {Thickness = 4, Transparency = 0.5, Parent = v})
            end
        end
        a1.stroke = true
        if not a1.created then
            task.defer(function() -- Line: 74 -- upvalues: a1 (val)
                a1:onCreate()
            end)
            a1.created = true
        end
        return true
    end,
}