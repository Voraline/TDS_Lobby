-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.CandyCorn
-- Decompile time: 1.29 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "CandyCorn",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 60, 0)),
            ColorSequenceKeypoint.new(0.301, Color3.fromRGB(238, 95, 0)),
            ColorSequenceKeypoint.new(0.31, Color3.fromRGB(239, 214, 27)),
            ColorSequenceKeypoint.new(0.588, Color3.fromRGB(239, 197, 31)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 201, 165))),
        })
    end,
    onCreate = function(self) -- Line: 18
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
    render = function(a1) -- Line: 39 -- upvalues: Create (val)
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {
                    Rotation = -90,
                    Color = a1:getColor(),
                    Offset = Vector2.new(0, 0.025),
                    Parent = v,
                })
                Create("UIStroke", {
                    Thickness = 4,
                    Transparency = 0.5,
                    Color = Color3.fromRGB(107, 71, 0),
                    Parent = v,
                })
            end
        end
        a1.stroke = true
        if not a1.created then
            task.defer(function() -- Line: 66 -- upvalues: a1 (val)
                a1:onCreate()
            end)
            a1.created = true
        end
        return true
    end,
}