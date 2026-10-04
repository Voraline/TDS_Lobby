-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Spirit.Animator.FrostSpiritAnimatorStates
-- Decompile time: 7.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local CurrentCamera = workspace.CurrentCamera
return {
    Spawn = {
        name = "Spawn",
        onEnter = function(a1) -- Line: 19 -- upvalues: EffectsController (val), EasySound (val)
            local PrimaryPart = a1.Model.PrimaryPart
            a1:playAnimation("Spawn")
            a1:Wait(0.53)
            EffectsController.GroundSmash(PrimaryPart.Node.WorldCFrame, 30)
            EasySound.Play({
                name = "GroundImpact",
                id = 82764043213693,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = PrimaryPart,
            })
        end,
    },
    Walk = {
        name = "Walk",
        onEnter = function(a1) -- Line: 36
            local v1 = if not a1.Replicator:Get("RageWalk") then a1:playAnimation("Walk") else a1:playAnimation("RageWalk")
            a1.Stopped = false
            return {v1}
        end,
        onLeave = function(a1) -- Line: 47 -- types: a1: userdata
            a1:Stop()
        end,
    },
    IceStorm = {
        name = "IceStorm",
        onEnter = function(a1) -- Line: 54 -- upvalues: EasySound (val)
            a1:playAnimation("IceStorm")
            EasySound.Play({
                id = 75818865677869,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
        end,
    },
    Summon = {
        name = "Summon",
        onEnter = function(a1) -- Line: 67
            -- upvalues: EasySound (val), ReplicatedStorage (val), CurrentCamera (val), RunService (val)
            -- upvalues: GameState (val)
            a1:playAnimation("Summon")
            EasySound.Play({
                id = 75818865677869,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            local u19 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Summoning:Clone()
            u19.Position = a1.Model.PrimaryPart.Position
            u19.Parent = CurrentCamera
            local u27 = EasySound.Play({
                id = 129001330597344,
                looped = true,
                volume = 0,
                soundGroupName = "Enemies",
                parent = u19,
            })
            local u28 = 0
            local u29 = 1
            local v1 = RunService.RenderStepped:Connect(function(a1) -- Line: 92 -- upvalues: u28 (ref), u29 (ref), GameState (upval), u27 (val), u19 (val) -- types: a1: number
                u28 = math.lerp(u28, u29, a1 * 1.5 * GameState.TimeScale)
                u27.Volume = u28
                local v1 = u19
                v1.CFrame = v1.CFrame * CFrame.Angles(0, math.rad(u28 * 180) * a1 * GameState.TimeScale, 0)
            end)
            a1:Wait(6)
            for i, v in ipairs(u19:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = false
                end
            end
            a1:Wait(3)
            v1:Disconnect()
            u19:Destroy()
        end,
    },
    FrostSpikes = {
        name = "FrostSpikes",
        onEnter = function(a1, a2) -- Line: 120
            -- upvalues: EasySound (val), TimescaleUtilities (val), ReplicatedStorage (val), CurrentCamera (val)
            -- upvalues: EmitterManager (val), TweenService (val)
            a1:playAnimation("FrostSpikes")
            local u10 = a1:face(a2, 0.5)
            a1.Rotation = CFrame.new() * u10.Rotation
            EasySound.Play({
                id = 103021026949087,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            TimescaleUtilities.Delay(0.9, function() -- Line: 131
                -- upvalues: ReplicatedStorage (upval), u10 (val), CurrentCamera (upval), EmitterManager (upval)
                -- upvalues: TimescaleUtilities (upval)
                local v1 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Slash:Clone()
                v1.CFrame = u10
                v1.Parent = CurrentCamera
                EmitterManager.manualEmit(v1)
                TimescaleUtilities.CleanUp(v1, 2)
            end)
            TimescaleUtilities.Delay(1, function() -- Line: 139
                -- upvalues: ReplicatedStorage (upval), a1 (val), a2 (val), CurrentCamera (upval), EasySound (upval)
                -- upvalues: TimescaleUtilities (upval), TweenService (upval)
                local CFrame_3, new_2, v1
                local v2 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.IceSpikes:Clone()
                local Position = a1.Model.PrimaryPart.Node.WorldCFrame.Position
                v2:PivotTo((CFrame.lookAt(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))))
                v2.Parent = CurrentCamera
                EasySound.Play({
                    id = 140082119813309,
                    destroyOnEnd = true,
                    soundGroupName = "Enemies",
                    parent = v2.PrimaryPart,
                })
                EasySound.Play({
                    id = 126908890778057,
                    destroyOnEnd = true,
                    soundGroupName = "Enemies",
                    parent = v2.PrimaryPart,
                }, 2)
                local v3 = #v2:GetChildren()
                for i = 1, v3 do
                    for i2, v in ipairs(v2[i]:GetChildren()) do
                        local CFrame_2 = v.CFrame
                        local Size = v.Size
                        v.Transparency = 0.35
                        v.Size = v.Size * 0.5
                        CFrame_3 = v.CFrame
                        new_2 = CFrame.new
                        v1 = -Size.Y
                        v.CFrame = CFrame_3 * new_2(0, v1, Size.Z / 2)
                        TimescaleUtilities.Delay(i * 0.1, function() -- Line: 171 -- upvalues: TweenService (upval), v (val), i (val), CFrame_2 (val), Size (val), a1 (upval)
                            TweenService:Create(v, TweenInfo.new(i * 0.05 + 0.35, Enum.EasingStyle.Quint), {CFrame = CFrame_2, Size = Size}):Play()
                            a1:Wait(2)
                            TweenService:Create(v, TweenInfo.new(i * 0.5 + 4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                                Size = v.Size * 0,
                                CFrame = v.CFrame * CFrame.new(0, 0, Size.Z * 100 / 100 / 2) - Vector3.new(0, Size.Y * 100 / 100, 0),
                            }):Play()
                        end)
                    end
                end
            end)
        end,
    },
    RageMode = {
        name = "RageMode",
        onEnter = function(a1) -- Line: 208 -- upvalues: EasySound (val), TimescaleUtilities (val), Shaker (val), EffectsController (val)
            a1:_cleanupBeam()
            a1:_stopLaserSweepLoopSound()
            local PrimaryPart = a1.Model.PrimaryPart
            local Halo1 = a1.Model.Halo1
            local Halo2 = a1.Model.Halo2
            local Chain_Wings = a1.Model.Chain_Wings
            local Chain_Neck = a1.Model.Chain_Neck
            a1:playAnimation("RageMode")
            EasySound.Play({
                id = 97840919081408,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = PrimaryPart,
            }):Play()
            TimescaleUtilities.Delay(1.5, function() -- Line: 226
                -- upvalues: Shaker (upval), PrimaryPart (val), Halo1 (val), Halo2 (val), Chain_Neck (val)
                -- upvalues: Chain_Wings (val)
                Shaker:Shake({0.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = PrimaryPart.Position})
                Halo1.Transparency = 1
                Halo2.Transparency = 0
                Chain_Neck.Transparency = 1
                Chain_Wings.Transparency = 1
            end)
            TimescaleUtilities.Delay(6.2, function() -- Line: 239 -- upvalues: Shaker (upval), PrimaryPart (val), EffectsController (upval), EasySound (upval)
                Shaker:Shake({1.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = PrimaryPart.Position})
                EffectsController.GroundSmash(PrimaryPart.Node.WorldCFrame, 30)
                EasySound.Play({
                    name = "GroundImpact",
                    id = 82764043213693,
                    destroyOnEnd = true,
                    parent = PrimaryPart,
                })
            end)
        end,
    },
    SwitchPath = {
        name = "SwitchPath",
        onEnter = function(a1, a2, a3, a4, a5) -- Line: 257
            -- upvalues: TimescaleUtilities (val), ItemDrop (val), Shaker (val), EffectsController (val)
            local PrimaryPart = a1.Model.PrimaryPart
            a4.startPosition = PrimaryPart.Position
            a4.endPosition = a4.endPosition
            a1:playAnimation("Leap")
            local u16 = a1:playAnimation("LeapLoop")
            local v1 = a1:face(a4.endPosition, 0.6)
            a1.Rotation = CFrame.new() * v1.Rotation
            TimescaleUtilities.Delay(math.max(a5 - workspace:GetServerTimeNow() - 0.3, 0), function() -- Line: 269 -- upvalues: a1 (val)
                a1:playAnimation("Land")
            end)
            TimescaleUtilities.Delay(0.6, function() -- Line: 273
                -- upvalues: a4 (val), ItemDrop (upval), PrimaryPart (val), u16 (val), Shaker (upval)
                -- upvalues: EffectsController (upval)
                local Rotation = (CFrame.new(a4.startPosition, a4.endPosition)).Rotation
                ;(ItemDrop.Drop(a4.startPosition, a4.endPosition, PrimaryPart, a4.dtMultiplier, a4.gravity, a4.velocity, function() -- Line: 282 -- upvalues: Rotation (val)
                    return Rotation
                end)):andThen(function() -- Line: 285
                    -- upvalues: u16 (upval), Shaker (upval), a4 (upval), EffectsController (upval), PrimaryPart (upval)
                    u16:Stop()
                    Shaker:Shake({1.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a4.endPosition})
                    EffectsController.GroundSmash(PrimaryPart.Node.WorldCFrame, 30)
                end)
            end)
        end,
    },
    IceBeaconIntro = {
        name = "IceBeaconIntro",
        onEnter = function(a1) -- Line: 299 -- upvalues: ReplicatedStorage (val)
            a1:playAnimation("IceBeaconIntro")
            local v1 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Heal:Clone()
            v1.Motor6D.Part1 = a1.Model.PrimaryPart
            v1.Parent = a1.Model
            a1:Wait(1.1)
            if a1:getCurrentStateName() == "IceBeaconIntro" then
                a1:playAnimation("IceBeaconLoop", 0.1)
            end
        end,
    },
    IceBeaconOutro = {
        name = "IceBeaconOutro",
        onEnter = function(a1) -- Line: 316 -- upvalues: TimescaleUtilities (val)
            a1:playAnimation("IceBeaconOutro", 0)
            local Heal = a1.Model:FindFirstChild("Heal")
            if Heal then
                Heal.Name = "HealREMOVING"
                for i, v in ipairs(Heal:GetDescendants()) do
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(Heal, 2)
            end
        end,
    },
    LaserSweepIntro = {
        name = "LaserSweepIntro",
        onEnter = function(a1, a2) -- Line: 333 -- upvalues: EasySound (val) -- types: a2: vector
            a1:_beginBeam()
            a1:playAnimation("LaserSweepIntro")
            EasySound.Play({
                name = "LaserSweepIntro",
                id = 73534800715296,
                destroyOnEnd = true,
                parent = a1.Model.PrimaryPart,
            })
            local v1 = a1:face(a2, 1)
            a1.Rotation = CFrame.new() * v1.Rotation
            a1:Wait(1)
            if a1:getCurrentStateName() ~= "LaserSweepIntro" then
                return
            end
            a1:playAnimation("LaserSweepLoop")
            a1._laserSweepLoopSound = EasySound.Play({
                name = "LaserSweepLoop",
                id = 108286306228021,
                volume = 3,
                looped = true,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
        end,
    },
    LaserSweepOutro = {
        name = "LaserSweepOutro",
        onEnter = function(a1) -- Line: 367 -- upvalues: EasySound (val)
            a1:_cleanupBeam()
            a1:_stopLaserSweepLoopSound()
            a1:playAnimation("LaserSweepOutro")
            EasySound.Play({
                name = "LaserSweepOutro",
                id = 137078432726531,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
        end,
    },
    Death = {
        name = "Death",
        onEnter = function(a1) -- Line: 384
            -- upvalues: EasySound (val), ReplicatedStorage (val), CurrentCamera (val), TimescaleUtilities (val)
            -- upvalues: EmitterManager (val)
            local PrimaryPart = a1.Model.PrimaryPart
            a1:playAnimation("Death")
            EasySound.Play({
                id = 85803699873223,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                position = PrimaryPart.Position,
            })
            local u20 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.PortalVFX:Clone()
            u20.Position = PrimaryPart.Node.WorldCFrame.Position + Vector3.new(0, 1, 0)
            u20.Parent = CurrentCamera
            local u35 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.WingsVFX:Clone()
            u35.RootPart.HumanoidRootPart.Part1 = PrimaryPart
            u35.Parent = CurrentCamera
            TimescaleUtilities.Delay(1.2, function() -- Line: 404 -- upvalues: EmitterManager (upval), u35 (val)
                EmitterManager.manualEmit(u35.RightVFX)
            end)
            TimescaleUtilities.Delay(1.6, function() -- Line: 408 -- upvalues: EmitterManager (upval), u35 (val)
                EmitterManager.manualEmit(u35.LeftVFX)
            end)
            TimescaleUtilities.Delay(1, function() -- Line: 412 -- upvalues: u20 (val), a1 (val), u35 (val)
                for i, v in ipairs(u20:GetDescendants()) do
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = true
                    end
                end
                a1:Wait(3)
                for i2, i3 in ipairs(u20:GetDescendants()) do
                    if i3:IsA("ParticleEmitter") then
                        i3.Enabled = false
                    end
                end
                a1:Wait(3)
                u35:Destroy()
                u20:Destroy()
            end)
        end,
    },
}