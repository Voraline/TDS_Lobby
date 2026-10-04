-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Pursuit.Animator
-- Decompile time: 3.72 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local CorruptedPursuit = ReplicatedStorage.Assets.Effects.Mob.CorruptedPursuit

local function stepProjectile(a1) -- Line: 15
    local alpha = a1.alpha
    local start = a1.start
    local goal = a1.goal
    local v1 = CFrame.lookAt(start, goal)
    return (v1:Lerp(CFrame.lookAlong(goal, v1.LookVector), alpha))
end

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 28
    -- upvalues: Animation (val), CorruptedPursuit (val), EmitterManager (val), CustomProjectile (val)
    -- upvalues: stepProjectile (val), EffectsController (val), TimescaleUtilities (val), Debris (val)
    -- upvalues: TweenService (val)
    local Animator = a1.Model.AnimationController.Animator
    a1._animations = {}
    a1._targetModels = {}
    local Start = a1.Model.MissleL.Start
    local Start_2 = a1.Model.MissleR.Start
    a1.Maid:Mark(function() -- Line: 37 -- upvalues: a1 (val)
        a1:_clearTargetModels()
    end)
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    local Local_Root = a1.Model.PrimaryPart.Local_Root
    Local_Root.Position = Local_Root.Position + Vector3.new(0, 3, 0)
    a1.Executables = {
        HighlightPoints = function(a1_2) -- Line: 54 -- upvalues: CorruptedPursuit (upval), a1 (val), EmitterManager (upval) -- types: a1_2: table
            local v1
            for i, j in a1_2 do
                v1 = CorruptedPursuit.CorruptedPursuit_Crosshair:Clone()
                v1.Position = j
                v1.Parent = workspace.CurrentCamera
                table.insert(a1._targetModels, v1)
                EmitterManager.manualEmit(v1)
            end
            a1:Delay(a1.Stats.HighlightTargetDuration)
            a1:_clearTargetModels()
        end,
        Attack = function(a1_2, a2) -- Line: 65
            -- upvalues: a1 (val), CorruptedPursuit (upval), Start (val), Start_2 (val), EmitterManager (upval)
            -- upvalues: CustomProjectile (upval), stepProjectile (upval), EffectsController (upval)
            -- upvalues: TimescaleUtilities (upval), Debris (upval)
            if not a1.Model then
                return
            end
            local TimeBetweenFire = a1.Stats.TimeBetweenFire
            local TimeToFire = a1.Stats.TimeToFire
            local u10 = 0
            local v1 = CorruptedPursuit.RocketExplosion:Clone()
            v1.Parent = workspace.CurrentCamera

            local function fireRocket(a1) -- Line: 77
                -- upvalues: CorruptedPursuit (upval), u10 (ref), Start (upval), Start_2 (upval), EmitterManager (upval)
                -- upvalues: CustomProjectile (upval), stepProjectile (upval), EffectsController (upval)
                local v1
                local u5 = CorruptedPursuit.Missile:Clone()
                u5.Parent = workspace.CurrentCamera
                local WorldPosition = (if u10 % 2 ~= 0 then Start_2 else Start).WorldPosition
                u5.Position = WorldPosition
                EmitterManager.manualEmit(v1)
                u10 = u10 + 1
                CustomProjectile:ThrowProjectile(WorldPosition, a1.position, a1.timeToDest, u5, stepProjectile, function() -- Line: 95 -- upvalues: u5 (val), EffectsController (upval), a1 (val)
                    for i, j in u5:GetDescendants() do
                        if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                            j.Enabled = false
                        end
                    end
                    EffectsController.Explosion({
                        Position = a1.position,
                        Radius = a1.explosionSize,
                        Sound = 4725504496,
                    })
                    u5:Destroy()
                end)
            end

            local v2 = 1 / (TimeBetweenFire * 2 / a1._animations.Shoot.Controller.Length)
            a1._animations.Shoot:Play()
            a1._animations.Shoot:AdjustSpeed(v2)
            for i, j in a2 do
                a1:Face(j.position, (TweenInfo.new((TimescaleUtilities.GetScaledTime(TimeToFire + TimeBetweenFire)))))
                TimescaleUtilities.Wait(TimeToFire)
                if not a1.Model.Parent then
                    return
                end
                fireRocket(j)
                TimescaleUtilities.Wait(TimeBetweenFire)
                if not a1.Model.Parent then
                    return
                end
            end
            a1._animations.Shoot:Stop()
            Debris:AddItem(v1, 3)
        end,
        Death = function() -- Line: 140
            -- upvalues: a1 (val), TimescaleUtilities (upval), TweenService (upval), EffectsController (upval)
            local u5 = a1.Model.PrimaryPart:Clone()
            ;(u5:GetPropertyChangedSignal("CFrame")):Connect(function() -- Line: 142 -- upvalues: a1 (upval), u5 (val)
                a1.Model:PivotTo(u5.CFrame)
            end)
            local v1 = TimescaleUtilities.GetScaledTime(1)
            local v2 = a1.Model.PrimaryPart.Local_Root.WorldPosition - Vector3.new(0, 10, 0)
            local v3 = TweenService:Create(u5, TweenInfo.new(v1), {Position = v2})
            local v4 = TweenService:Create(
                u5,
                TweenInfo.new(v1 / 4, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut, 4),
                {CFrame = u5.CFrame * CFrame.Angles(0, 3.141592653589793, 0)}
            )
            v3:Play()
            v4:Play()
            a1:Wait(0.45)
            EffectsController.Explosion({Position = v2, Radius = 6, Sound = 4725504496})
            u5:Destroy()
        end,
    }
end

function v1:_clearTargetModels() -- Line: 174
    for i, j in self._targetModels do
        j:Destroy()
    end
    self._targetModels = {}
end

return v1