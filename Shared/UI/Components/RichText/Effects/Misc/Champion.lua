-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Champion
-- Decompile time: 1.94 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Letter",
    Particle = "Champion",
    Ignore2DParticles = true,
    getColor = function(a1) -- Line: 8
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 201, 86)),
            ColorSequenceKeypoint.new(0.35, Color3.fromRGB(255, 172, 56)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 201, 165)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(244, 87, 28)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(242, 92, 42))),
        })
    end,
    onCreate = function(self) -- Line: 18
        local adornee = self.adornee
        if adornee then
            local v1 = adornee.Size / 2
            local BeamStart = adornee.BeamStart
            local BeamEnd = adornee.BeamEnd
            local LeftCrown = adornee.LeftCrown
            local RightCrown = adornee.RightCrown
            for i, v in ipairs(adornee:GetChildren()) do
                if v:IsA("Beam") then
                    v.Attachment0 = BeamStart
                    v.Attachment1 = BeamEnd
                end
            end
            LeftCrown.CFrame = CFrame.new(-v1.X - 0.5, 0, 0)
            RightCrown.CFrame = CFrame.new(v1.X + 0.5, 0, 0)
            BeamStart.CFrame = CFrame.new(-v1.X - 1, 0.15, 0)
            BeamEnd.CFrame = CFrame.new(v1.X + 1, 0.15, 0)
        end
    end,
    render = function(a1) -- Line: 45 -- upvalues: Create (val)
        local Attribute, v1, v2
        local props = a1.props
        local v3 = a1.labels:Get()
        local stroke = a1.stroke
        local v4 = a1.container:Get().AbsoluteSize.Y / 4
        local v5 = props.speed or 1
        for i, v in ipairs(v3) do
            Attribute = v:GetAttribute("BasePosition")
            v1 = (math.sin((tick()) * v5 * 4 + i)) * v4
            v.Position = Attribute + UDim2.fromOffset(0, v1)
            v2 = (tick()) * v5 * 4 + i
            v.Rotation = math.cos(v2) * 10 - 5
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Parent = v})
                Create("UIStroke", {
                    Thickness = 4,
                    Transparency = 0,
                    Color = Color3.fromRGB(130, 128, 64),
                    Parent = v,
                })
            end
        end
        a1.stroke = true
        if not a1.created then
            task.defer(function() -- Line: 82 -- upvalues: a1 (val)
                a1:onCreate()
            end)
            a1.created = true
        end
    end,
}