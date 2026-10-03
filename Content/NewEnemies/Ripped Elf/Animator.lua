-- Script path: ReplicatedStorage.Content.NewEnemies.Ripped Elf.Animator
-- Decompile time: 2.59 ms

game:GetService("Lighting")
game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
require(ReplicatedStorage.Client.Modules.Laser)
require(ReplicatedStorage.Shared.Modules.Projectile)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Client.Modules.Replicators.ClientGameMiddleware)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
require(ReplicatedStorage.Shared.Modules.Enum)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
require(ReplicatedStorage.Shared.Modules.Network)
require(ReplicatedStorage.Shared.Modules.spr)
Random.new()
local Elf = ReplicatedStorage.Assets.Effects.Mob:WaitForChild("Elf")

function v1.Initialize(a1) -- Line: 33
    -- upvalues: Animation (val), TweenService (val), Elf (val), ItemDrop (val), EmitterManager (val), Shaker (val)
    a1.Shooting = false
    Random.new()

    function a1.Face(a1_2) -- Line: 39 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.IgnoreList() -- Line: 48 -- upvalues: a1 (val)
        local v1 = {
            a1.Model,
            workspace.Map.Boundaries,
            workspace.Towers,
            workspace.ClientUnits,
            workspace.CurrentCamera,
            workspace.Replicate,
        }
        for k, v in pairs(game.Players:GetChildren()) do
            table.insert(v1, v.Character)
        end
        return v1
    end

    a1.Model:WaitForChild("Head")
    local Size = a1.Model.Snowball.Size
    a1.Executables = {
        Death = function() -- Line: 68 -- upvalues: a1 (val), Animation (upval)
            a1.Model.Snowball.Transparency = 1
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        Roll = function(a1_2) -- Line: 77 -- upvalues: a1 (val), Animation (upval), TweenService (upval), Size (val)
            local Snowball = a1.Model.Snowball
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v1}
            ):Play()
            Snowball.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
            Snowball.Transparency = 0
            TweenService:Create(
                Snowball,
                TweenInfo.new(0.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Size = Size}
            ):Play()
        end,
        Shoot = function(a1_2, a2) -- Line: 112
            -- upvalues: a1 (val), Elf (upval), ItemDrop (upval), EmitterManager (upval), Shaker (upval)
            local Snowball = a1.Model.Snowball
            Snowball.Transparency = 1
            local u10 = Elf.Snowball:Clone()
            u10.Parent = workspace.Trash
            local Position = Snowball.Position
            ;((ItemDrop.Drop(Position, a1_2, u10, 5, -0.9, 3, function(a1, a2, a3) -- Line: 122
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(1.5707963267948966, a1, 0)
                return v1 - v1.Position
            end)):andThen(function(a1) -- Line: 126 -- upvalues: u10 (val), EmitterManager (upval), a2 (val), Shaker (upval)
                u10:Destroy()
                EmitterManager.Emit("IceExplosion", CFrame.new(a1), a2)
                Shaker:Shake({6.3, 20.5, 0.1, 1}, 0.3, 0.2)
            end)):finally(function() -- Line: 131 -- upvalues: u10 (val)
                u10:Destroy()
            end)
            task.delay(0, function() -- Line: 135 -- upvalues: u10 (val)
                u10.Trail.Enabled = true
            end)
        end,
    }
end

return v1