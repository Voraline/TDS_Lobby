-- Script path: ReplicatedStorage.Content.Enemies.Fire Spirit.Animator
-- Decompile time: 1.74 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage_2.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage_2.Client.Modules.TweenService)

function v1.Initialize(a1) -- Line: 14 -- upvalues: TweenService (val), TimescaleUtilities (val)
    a1.Executables = {
        Explode = function(a1_2) -- Line: 16 -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            local v1, v2, v3
            local Part = Instance.new("Part")
            Part.Shape = "Cylinder"
            Part.Size = Vector3.new(0.30000001192092896, 0, 0)
            Part.Anchored = true
            Part.CanCollide = false
            Part.Material = "Neon"
            Part.Color = a1.Model.Torso.Color
            Part.Transparency = 0.4
            Part.CFrame = (CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)) * CFrame.Angles(0, 0, 1.5707963267948966)
            Part.Parent = workspace.CurrentCamera
            a1.Model.Head.Boom:Play()
            TweenService:Create(Part, TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
                TweenService:Create(
                    Part,
                    TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0),
                    {Size = Vector3.new(0.3, a1_2 * 2, a1_2 * 2)}
                ):Play(),
            }):Play()
            TweenService:Create(Part, TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
                (TweenService:Create(
                    Part,
                    TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0),
                    {Transparency = 1}
                ):Play()),
            }):Play()
            a1.Model.Torso.Fire.Enabled = false
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Anchored = true
                    v3 = TweenService
                    v1 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v2 = {
                        (TweenService:Create(
                            v,
                            TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0),
                            {Transparency = 1, Size = Vector3.new(0, 0, 0)}
                        ):Play()),
                    }
                    v3:Create(v, v1, v2):Play()
                end
            end
            TimescaleUtilities.Delay(1.25, function() -- Line: 108 -- upvalues: Part (val)
                Part:Destroy()
            end)
        end,
    }
end

return v1