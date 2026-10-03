-- Script path: ReplicatedStorage.Content.Enemies.Mechanical Rot.Animator
-- Decompile time: 1.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val), TimescaleUtilities (val)
    function a1.Face(a1_2) -- Line: 11 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    local u10 = Animation.new({
        Track = a1.Model.Animations.Shoot,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        Barrage = function(a1_2, a2) -- Line: 25 -- upvalues: u10 (val), a1 (val)
            if not a1_2 then
                u10:Stop()
                a1.Model.Minigun.Fire:Stop()
                return
            end
            u10:Play()
            a1.Face(a2)
            a1.Model.Minigun.Fire:Play()
        end,
        Bullet = function(a1_2) -- Line: 36 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local Part = Instance.new("Part")
            Part.BrickColor = BrickColor.new("Bright yellow")
            Part.FormFactor = "Custom"
            Part.Material = "Neon"
            Part.Transparency = 0.25
            Part.Anchored = true
            Part.CanCollide = false
            Part.Parent = workspace.Trash
            local magnitude = (a1.Model.Minigun.Start.WorldPosition - a1_2).magnitude
            Part.Size = Vector3.new(0.2, 0.2, magnitude)
            Part.CFrame = (CFrame.new(a1.Model.Minigun.Start.WorldPosition, a1_2)) * CFrame.new(0, 0, -magnitude / 2)
            TimescaleUtilities.Delay(0.1, function() -- Line: 51 -- upvalues: Part (val)
                Part:Destroy()
            end)
        end,
        Shield = function(a1_2, a2) -- Line: 56 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local Size = a1.Model.HumanoidRootPart.Size
            local u12 = game.ReplicatedStorage.Effects.Shield:Clone()
            u12:SetPrimaryPartCFrame(a1.Model.HumanoidRootPart.CFrame)
            u12.Effect.Size = Vector3.new(Size.X * 2.5, Size.Y * 1.5, Size.X * 2.5)
            u12.Effect.Damage1.Display.Text = a2
            u12.Effect.Damage2.Display.Text = a2
            u12.Effect.Damage3.Display.Text = a2
            u12.Effect.Damage4.Display.Text = a2
            u12.Parent = a1.Model
            u12.PrimaryPart.Weld.Part1 = a1.Model.HumanoidRootPart
            TimescaleUtilities.Delay(a1_2, function() -- Line: 70 -- upvalues: u12 (val)
                u12:Destroy()
            end)
        end,
        Death = function() -- Line: 75 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Death:Play()
        end,
    }
end

return v1