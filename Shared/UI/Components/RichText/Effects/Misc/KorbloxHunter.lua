-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.KorbloxHunter
-- Decompile time: 1.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local CurrentCamera = workspace.CurrentCamera
return {
    DesiredType = "Word",
    Particle = "KorbloxHunter",
    getColor = function(a1) -- Line: 11
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 3, 27)),
            ColorSequenceKeypoint.new(0.168, Color3.fromRGB(14, 10, 36)),
            ColorSequenceKeypoint.new(0.405, Color3.fromRGB(29, 63, 105)),
            ColorSequenceKeypoint.new(0.664, Color3.fromRGB(41, 136, 201)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(193, 245, 255))),
        })
    end,
    onCreate = function(self) -- Line: 21 -- upvalues: Create (val)
        local v1 = self.labels:Get()
        local stroke = self.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {
                    Rotation = -83,
                    Color = self:getColor(),
                    Offset = Vector2.new(0.3, 0),
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
        self.stroke = true
        local adornee = self.adornee
        if not adornee then
            return
        end
        local Root = adornee:WaitForChild("Root")
        self.rootAttachment = Root
        local Core = Root:WaitForChild("Core")
        for i2, i3 in ipairs(Core:GetChildren()) do
            if i3:IsA("Beam") then
                i3.Attachment0 = Core
            end
        end
        Core.Beam2.Attachment1 = Root:FindFirstChild("Top3")
        Core.BigCoreBeam.Attachment1 = Root:FindFirstChild("Top2")
        Core.FarkMainBeam.Attachment1 = Root:FindFirstChild("Top1")
        Core.PitchBlack1.Attachment1 = Root:FindFirstChild("BlackTop1")
        Core.Sidebeam2.Attachment1 = Root:FindFirstChild("Up")
    end,
    render = function(a1) -- Line: 67 -- upvalues: CurrentCamera (val)
        if not a1.created then
            a1.created = true
            task.defer(function() -- Line: 71 -- upvalues: a1 (val)
                a1:onCreate()
            end)
        end
        if a1.rootAttachment then
            local Position = a1.rootAttachment.Parent.Position
            local Position_2 = CurrentCamera.CFrame.Position
            a1.rootAttachment.WorldCFrame = CFrame.lookAt(Position, (Vector3.new(Position_2.X, Position.Y, Position_2.Z)))
        end
    end,
}