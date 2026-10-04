-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Autumn
-- Decompile time: 1.29 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Autumn",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 166, 41)),
            ColorSequenceKeypoint.new(0.083, Color3.fromRGB(243, 139, 11)),
            ColorSequenceKeypoint.new(0.175, Color3.fromRGB(244, 87, 28)),
            ColorSequenceKeypoint.new(0.388, Color3.fromRGB(255, 201, 165)),
            ColorSequenceKeypoint.new(0.663, Color3.fromRGB(255, 109, 12)),
            ColorSequenceKeypoint.new(0.856, Color3.fromRGB(245, 135, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 166, 41))),
        })
    end,
    onCreate = function(self) -- Line: 19
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
    render = function(a1) -- Line: 40 -- upvalues: Create (val)
        local props = a1.props
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {Rotation = -33, Color = a1:getColor(), Parent = v})
                Create("UIStroke", {Thickness = 4, Transparency = 0.5, Parent = v})
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