-- Script path: ReplicatedStorage.Content.Enemies.Molten Boss.Animator
-- Decompile time: 2.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 17
    -- upvalues: Animation (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val), Shaker (val)
    -- upvalues: Projectile (val), EffectsController (val)
    function a1.Face(a1_2) -- Line: 18 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    local u2 = {
        a1.Model.HumanoidRootPart.MobSpawn1,
        a1.Model.HumanoidRootPart.MobSpawn2,
        a1.Model.HumanoidRootPart.MobSpawn3,
        a1.Model.HumanoidRootPart.MobSpawn4,
        a1.Model.HumanoidRootPart.MobSpawn5,
        a1.Model.HumanoidRootPart.MobSpawn6,
    }
    a1.Executables = {
        SpawnTroops = function(a1_2, a2) -- Line: 37 -- upvalues: Animation (upval), a1 (val), u2 (val)
            Animation.new({
                Track = a1.Model.Animations.Smash,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(1.55)
            for k, v in pairs(u2) do
                v.Lava:Emit(10)
            end
        end,
        Death = function() -- Line: 48 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
        Stomp = function(a1_2, a2) -- Line: 56
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), Shaker (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            a1.Model.Head.Scream:Play()
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.8)
            a1.Model.Head.Stomp:Play()
            u9.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(
                u9,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v1}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 82 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
        end,
        Fireball = function(a1_2, a2) -- Line: 88
            -- upvalues: a1 (val), Animation (upval), ReplicatedStorage (upval), TweenService (upval)
            -- upvalues: Projectile (upval), TimescaleUtilities (upval), EffectsController (upval)
            a1.Face(a1_2)
            Animation.new({
                Track = a1.Model.Animations.Fireball,
                Target = a1.Model.AnimationController,
            }):Play()
            local Fireball = a1.Model.Fireball
            Fireball.Transparency = 0
            Fireball.Size = Vector3.new(0, 0, 0)
            Fireball.Fire.Enabled = true
            local Fireball_2 = ReplicatedStorage.Assets.Effects.Projectile.Fireball
            TweenService:Create(
                Fireball,
                TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Size = Vector3.new(2, 2, 2)}
            ):Play()
            a1:Delay(0.7)
            local v1 = {
                Part = Fireball_2,
                Speed = 30,
                Gravity = 0,
                Type = "Linear",
                Start = Fireball.CFrame,
                End = a1_2,
                Turn = 0,
            }
            local v2 = Projectile:CalcDuration(v1)
            Projectile:Throw(v1)
            Fireball.Size = Vector3.new(0, 0, 0)
            Fireball.Transparency = 1
            Fireball.Fire.Enabled = false
            a1.Model.Head.Fireball:Play()
            TimescaleUtilities.Delay(v2, function() -- Line: 123 -- upvalues: EffectsController (upval), a1_2 (val), a2 (val)
                EffectsController.Explosion({
                    Position = a1_2,
                    Radius = a2,
                    Color = BrickColor.new("Br. yellowish orange"),
                    Sound = 440145223,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
            end)
        end,
    }
end

return v1