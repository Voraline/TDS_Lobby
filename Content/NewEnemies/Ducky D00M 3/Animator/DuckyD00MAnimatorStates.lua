-- Script path: ReplicatedStorage.Content.NewEnemies.Ducky D00M 3.Animator.DuckyD00MAnimatorStates
-- Decompile time: 8.63 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local CurrentCamera = workspace.CurrentCamera
local DuckyD00M3 = ReplicatedStorage.Assets.Effects.Mob.DuckyD00M3

local function stepProjectile(a1) -- Line: 34
    local timeToDest = a1.timeToDest
    local alpha = a1.alpha
    local Position = a1.lastCFrame.Position
    local start = a1.start
    local goal = a1.goal
    local v1 = CFrame.lookAt(start, goal)
    local v2 = v1:Lerp(CFrame.lookAlong(goal, v1.LookVector), alpha)
    local v3 = (goal - start).Magnitude / 4
    local v4 = math.sin(alpha * 3.141592653589793)
    local v5 = math.min(math.sin(alpha * 3.141592653589793) * 2, 1)
    local v6 = a1.elapsedTime * 10
    local v7 = math.pow(-1, a1.fireCount % 2)
    local v8 = v2 * CFrame.new(v7 * 1.5 * math.cos(v6) * v5, v3 * v4 + math.sin(v6) * 1.5 * v5, 0)
    return (CFrame.new(v8.Position, v8.Position + (v8.Position - Position).Unit)) * CFrame.Angles(0, 0, v7 * -12.566370614359172 * timeToDest * alpha)
end

local function projectileFinished(a1) -- Line: 60
    -- upvalues: DuckyD00M3 (val), CurrentCamera (val), Debris (val), EmitterManager (val), EasySound (val)
    local part = a1.part
    local v1 = DuckyD00M3.RocketExplosion:Clone()
    v1.Position = a1.goal
    v1.Parent = CurrentCamera
    Debris:AddItem(v1, 2)
    EmitterManager.manualEmit(v1.Attachment)
    EasySound.Play({volume = 0.5, destroyOnEnd = true, id = v1.Sound.SoundId, parent = v1})
    part.Transparency = 1
    EmitterManager.toggle(part.Flame, false)
    Debris:AddItem(part, 1)
end

local function clearParticles(a1) -- Line: 81 -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j:Clear()
        end
    end
end

return {
    {
        name = "Walk",
        onEnter = function(a1) -- Line: 92 -- upvalues: EmitterManager (val)
            EmitterManager.toggle(a1.Model.TrackVFX, true, "ParticleEmitter")
            a1.sounds.Drive:Play()
            return {a1}
        end,
        onLeave = function(a1) -- Line: 99 -- upvalues: EmitterManager (val)
            EmitterManager.toggle(a1.Model.TrackVFX, false, "ParticleEmitter")
            a1.sounds.Drive:Stop()
        end,
    },
    {
        name = "RocketBarrage",
        onEnter = function(a1, a2, a3, a4) -- Line: 108
            -- upvalues: DuckyD00M3 (val), CurrentCamera (val), EmitterManager (val), CustomProjectile (val)
            -- upvalues: stepProjectile (val), projectileFinished (val), EasySound (val), TimescaleUtilities (val)
            -- upvalues: Debris (val)
            local DEF_BODY = a1.Model.PrimaryPart.ROOT_MASTER.DEF_BODY
            local u8 = 0
            local v1 = DuckyD00M3.RocketExplosion:Clone()
            v1.Parent = CurrentCamera

            local function fireRocket(a1) -- Line: 119
                -- upvalues: DuckyD00M3 (upval), CurrentCamera (upval), u8 (ref), DEF_BODY (val), EmitterManager (upval)
                -- upvalues: CustomProjectile (upval), stepProjectile (upval), projectileFinished (upval)
                local v1 = DuckyD00M3.Missile:Clone()
                v1.Parent = CurrentCamera
                local Start = if u8 % 2 ~= 0 then DEF_BODY["DEF_WING.R"]["DEF_CANNON.R"].Start else DEF_BODY["DEF_WING.L"]["DEF_CANNON.L"].Start
                local WorldPosition = Start.WorldPosition
                v1.Position = WorldPosition
                EmitterManager.manualEmit(Start)
                u8 = u8 + 1
                CustomProjectile:ThrowProjectile(
                    WorldPosition,
                    a1.position,
                    a1.timeToDest,
                    v1,
                    stepProjectile,
                    projectileFinished,
                    {fireCount = u8}
                )
            end

            a1:Face(a2, (TweenInfo.new(0.8)))
            local Windup = a1.Stats.Moveset.RocketBarrage.Windup
            local MissileIntro = a1.animations.MissileIntro
            local v2 = 1 / (Windup / MissileIntro.Controller.Length)
            MissileIntro:Play()
            MissileIntro:AdjustSpeed(v2)
            local v3 = DuckyD00M3.Warning:Clone()
            v3.Parent = CurrentCamera
            v3.Position = a2 + Vector3.new(0, 0.30000001192092896, 0)
            EmitterManager.manualEmit(v3.Windup)
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.DEF_EXHAUST.AttackSmoke, true)
            EasySound.Play({id = 82225998249777, soundGroupName = "Enemies", parent = a1.Model.PrimaryPart})
            TimescaleUtilities.Wait(Windup)
            if not a1:IsAlive() then
                return
            end
            EmitterManager.toggle(v3.Active, true)
            local MissileLoop = a1.animations.MissileLoop
            local v4 = 1 / (a3 * 2 / MissileLoop.Controller.Length)
            MissileLoop:Play()
            MissileLoop:AdjustSpeed(v4)
            a1.sounds.MissileLoop:SetAttribute("PlaybackSpeed", v4)
            a1.sounds.MissileLoop:Play()
            for i, j in a4 do
                a1:Face(j.position, (TweenInfo.new(0.25)))
                TimescaleUtilities.Wait(a3)
                fireRocket(j)
            end
            local Rest = a1.Stats.Moveset.RocketBarrage.Rest
            local MissileOutro = a1.animations.MissileOutro
            local v5 = 1 / (Rest / MissileOutro.Controller.Length)
            MissileOutro:Play()
            MissileOutro:AdjustSpeed(v5)
            MissileLoop:Stop()
            a1.sounds.MissileLoop:Stop()
            EasySound.Play({id = 81513641587574, soundGroupName = "Enemies", parent = a1.Model.PrimaryPart})
            EmitterManager.toggle(v3.Active, false)
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.DEF_EXHAUST.AttackSmoke, false)
            Debris:AddItem(v3, 5)
            Debris:AddItem(v1, 3)
        end,
    },
    {
        name = "ChainsawSlash",
        onEnter = function(a1, a2, a3, a4, a5) -- Line: 216
            -- upvalues: TweenService (val), EmitterManager (val), EasySound (val), TimescaleUtilities (val)
            -- upvalues: clearParticles (val)
            local v1 = a1:Face(a2, nil, false)
            local Windup = a1.Stats.Moveset.ChainsawSlash.Windup
            local DEF_BODY = a1.Model.PrimaryPart.ROOT_MASTER.DEF_BODY
            local v2 = DEF_BODY["DEF_RAIL_02.L"]["DEF_CHAINSAW.L"]
            local v3 = DEF_BODY["DEF_RAIL_02.R"]["DEF_CHAINSAW.R"]
            a1:CreateAreaIndicator({
                angle = a4,
                radius = a5,
                openTime = Windup + a3,
                cframe = v1 * CFrame.new(0, a1.Model.PrimaryPart.Node.Position.Y, 0),
            })
            local ChainsawIntro = a1.animations.ChainsawIntro
            local v4 = 1 / (Windup / ChainsawIntro.Controller.Length)
            ChainsawIntro:Play()
            ChainsawIntro:AdjustSpeed(v4)
            a1.Model.Chainsaw.Transparency = a1.Model.Ducky.Transparency
            local u64 = v1 * CFrame.Angles(0, math.rad(-a4 / 2), 0)
            TweenService:Create(a1.Model.PrimaryPart, TweenInfo.new(Windup), {CFrame = u64}):Play()
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.DEF_EXHAUST.AttackSmoke, true)
            EmitterManager.toggle(v2.ChainsawSmoke, true)
            EmitterManager.toggle(v3.ChainsawSmoke, true)
            EasySound.Play({
                id = 118299768927070,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            TimescaleUtilities.Wait(Windup)
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.FireBreath, true)
            EmitterManager.toggle(v2.ChainsawVFX, true)
            EmitterManager.toggle(v3.ChainsawVFX, true)
            local v5 = v1 * CFrame.Angles(0, math.rad(a4 / 2), 0)
            local v6 = TweenService:Create(
                a1.Model.PrimaryPart,
                TweenInfo.new(a3 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {CFrame = v5}
            )
            v6:Play()
            v6.Completed:Once(function() -- Line: 268 -- upvalues: TweenService (upval), a1 (val), a3 (val), u64 (val)
                TweenService:Create(
                    a1.Model.PrimaryPart,
                    TweenInfo.new(a3 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    {CFrame = u64}
                ):Play()
            end)
            a1.Rotation = CFrame.new() * u64.Rotation
            local ChainsawLoop = a1.animations.ChainsawLoop
            ChainsawLoop:Play()
            ChainsawIntro:Stop()
            a1.sounds.ChainsawLoop:Play()
            TimescaleUtilities.Wait(a3)
            local Rest = a1.Stats.Moveset.ChainsawSlash.Rest
            local ChainsawOutro = a1.animations.ChainsawOutro
            local v7 = 1 / (Rest / ChainsawOutro.Controller.Length)
            ChainsawOutro:Play()
            ChainsawOutro:AdjustSpeed(v7)
            ChainsawLoop:Stop()
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.FireBreath, false)
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.DEF_EXHAUST.AttackSmoke, false)
            EmitterManager.toggle(v2.ChainsawSmoke, false)
            EmitterManager.toggle(v2.ChainsawVFX, false)
            EmitterManager.toggle(v3.ChainsawSmoke, false)
            EmitterManager.toggle(v3.ChainsawVFX, false)
            clearParticles(v2.ChainsawVFX)
            clearParticles(v3.ChainsawVFX)
            a1.sounds.ChainsawLoop:Stop()
            EasySound.Play({
                id = 108391628339605,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            TimescaleUtilities.Wait(Rest)
            a1.Model.Chainsaw.Transparency = 1
        end,
    },
    {
        name = "MinigunSpray",
        onEnter = function(a1, a2) -- Line: 322
            -- upvalues: EmitterManager (val), EasySound (val), TimescaleUtilities (val), ReplicatedStorage (val)
            -- upvalues: CurrentCamera (val), RunService (val), GameState (val), NewTween (val)
            local DEF_BODY = a1.Model.PrimaryPart.ROOT_MASTER.DEF_BODY
            local MinigunSpray = a1.Stats.Moveset.MinigunSpray
            local Windup = MinigunSpray.Windup
            local HitboxSize = MinigunSpray.HitboxSize
            local GrowTime = MinigunSpray.GrowTime
            a1:Face(a2, (TweenInfo.new(0.3)))
            local MinigunIntro = a1.animations.MinigunIntro
            local v1 = 1 / (Windup / MinigunIntro.Controller.Length)
            MinigunIntro:Play()
            MinigunIntro:AdjustSpeed(v1)
            a1.Model.Minigun.Transparency = a1.Model.Ducky.Transparency
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.DEF_EXHAUST.AttackSmoke, true)
            EasySound.Play({
                id = 137081029360001,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            TimescaleUtilities.Wait(Windup)
            local MinigunLoop = a1.animations.MinigunLoop
            MinigunLoop:Play()
            a1.sounds.MinigunLoop:Play()
            EmitterManager.toggle(a1.Model.MinigunVFX, true)
            local u78 = ReplicatedStorage.Assets.Effects.Mob.DuckyD00M3.MinigunGround:Clone()
            u78:PivotTo(a1.Model.PrimaryPart.CFrame * (CFrame.new(0, -2.1, 0)))
            u78.Size = Vector3.new(HitboxSize.X, 0.1, 0)
            u78.Parent = CurrentCamera
            local u97 = nil
            local u98 = 0
            local v2 = RunService.RenderStepped:Connect(function(a1) -- Line: 364
                -- upvalues: u98 (ref), GameState (upval), GrowTime (val), HitboxSize (val), u78 (val), u97 (ref)
                u98 = u98 + a1 * GameState.TimeScale
                local v1 = u98 / GrowTime
                local v2 = math.lerp(0, HitboxSize.Z, v1)
                local LEnd = u78.LEnd
                local REnd = u78.REnd
                local MidEnd = u78.MidEnd
                u78.Size = Vector3.new(HitboxSize.X, 0.1, v2)
                LEnd.Position = Vector3.new(LEnd.Position.X, 0.1, -v2 / 2)
                REnd.Position = Vector3.new(REnd.Position.X, 0.1, -v2 / 2)
                MidEnd.Position = Vector3.new(MidEnd.Position.X, 0.1, -v2 / 2)
                if v1 >= 1 then
                    u97:Disconnect()
                end
            end)
            NewTween(u78, TweenInfo.new(2), function(a1) -- Line: 383 -- upvalues: u78 (val)
                local v1 = 1 - a1
                local v2 = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, (math.lerp(0.25, 1, v1))),
                    (NumberSequenceKeypoint.new(1, 1)),
                })
                local v3 = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, (math.lerp(0.5, 1, v1))),
                    NumberSequenceKeypoint.new(0.8, (math.lerp(0.5, 1, v1))),
                    (NumberSequenceKeypoint.new(1, 1)),
                })
                u78.LEnd.Beam.Transparency = v2
                u78.REnd.Beam.Transparency = v2
                u78.MidStart.Beam.Transparency = v3
            end)
            TimescaleUtilities.Wait(MinigunSpray.AttackTime)
            EmitterManager.toggle(a1.Model.MinigunVFX, false)
            EmitterManager.toggle(u78, false, "ParticleEmitter")
            local Rest = MinigunSpray.Rest
            local MinigunOutro = a1.animations.MinigunOutro
            local v3 = 1 / (Rest / MinigunOutro.Controller.Length)
            MinigunOutro:Play()
            MinigunOutro:AdjustSpeed(v3)
            MinigunLoop:Stop()
            NewTween(u78, TweenInfo.new(3), function(a1) -- Line: 414 -- upvalues: u78 (val)
                local v1 = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, (math.lerp(0.25, 1, a1))),
                    (NumberSequenceKeypoint.new(1, 1)),
                })
                local v2 = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, (math.lerp(0.5, 1, a1))),
                    NumberSequenceKeypoint.new(0.8, (math.lerp(0.5, 1, a1))),
                    (NumberSequenceKeypoint.new(1, 1)),
                })
                u78.LEnd.Beam.Transparency = v1
                u78.REnd.Beam.Transparency = v1
                u78.MidStart.Beam.Transparency = v2
            end, function() -- Line: 429 -- upvalues: u78 (val)
                u78:Destroy()
            end)
            EmitterManager.toggle(DEF_BODY.DEF_HEAD.DEF_EXHAUST.AttackSmoke, false)
            a1.sounds.MinigunLoop:Stop()
            EasySound.Play({
                id = 134787782657711,
                soundGroupName = "Enemies",
                parent = a1.Model.PrimaryPart,
            })
            TimescaleUtilities.Wait(Rest)
            a1.Model.Minigun.Transparency = 1
        end,
    },
    {
        name = "Death",
        onEnter = function(a1) -- Line: 451
            for i, j in a1.animations do
                j:Stop()
            end
            a1.animations.Death:Play()
        end,
    },
}