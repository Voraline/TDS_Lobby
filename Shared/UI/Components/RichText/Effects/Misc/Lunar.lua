-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Lunar
-- Decompile time: 1.19 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
return {
    DesiredType = "Word",
    Particle = "Lunar",
    getColor = function(a1) -- Line: 10
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 190, 78)),
            ColorSequenceKeypoint.new(0.246, Color3.fromRGB(255, 197, 52)),
            ColorSequenceKeypoint.new(0.464, Color3.fromRGB(255, 210, 0)),
            ColorSequenceKeypoint.new(0.941, Color3.fromRGB(255, 10, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 0, 0))),
        })
    end,
    onCreate = function(self) -- Line: 20
        local adornee = self.adornee
        if not adornee then
            return
        end
        local v1 = adornee.Size / 2
        local v2 = adornee:FindFirstChild("1")
        local v3 = adornee:FindFirstChild("2")
        for i, j in v2:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = v2
                j.Attachment1 = v3
            end
        end
        v2.CFrame = CFrame.new(v1.X + 0.5, 0, 0)
        v3.CFrame = CFrame.new(-v1.X - 0.5, 0, 0)
    end,
    render = function(a1) -- Line: 41 -- upvalues: Create (val)
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {Rotation = 90, Color = a1:getColor(), Parent = v})
                Create("UIStroke", {
                    Name = "UIStroke",
                    Thickness = 3,
                    Color = Color3.fromRGB(102, 0, 0),
                    Parent = v,
                })
            end
        end
        if not a1.created then
            task.defer(function() -- Line: 65 -- upvalues: a1 (val)
                a1:onCreate()
            end)
        end
        a1.frame = true
        a1.stroke = true
        a1.created = true
    end,
}