-- Script path: ReplicatedStorage.Content.NewEnemies.Nuclear Monster.Animator
-- Decompile time: 8.46 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Spitball = ReplicatedStorage.Assets.Effects.Mob.Spitball

function v1.Initialize(a1) -- Line: 18
    -- upvalues: Animation (val), Shaker (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val)
    -- upvalues: Spitball (val), RunService (val), GameState (val), EffectsController (val)
    a1.Shooting = false
    a1.BeamPos = Vector3.new(0, 0, 0)
    local u11 = Animation.new({
        Track = a1.Model.Animations.CoreIntro,
        Target = a1.Model.AnimationController,
    })
    local u20 = Animation.new({
        Track = a1.Model.Animations.CoreLoop,
        Target = a1.Model.AnimationController,
    })
    local u29 = Animation.new({
        Track = a1.Model.Animations.CoreOutro,
        Target = a1.Model.AnimationController,
    })
    local u31 = Random.new()
    local BeamEnd = a1.Model.HumanoidRootPart:WaitForChild("BeamEnd")

    function a1.Face(a1_2) -- Line: 39 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.EnabledRageEffect(a1_2) -- Line: 48 -- upvalues: a1 (val)
        for k, v in pairs(a1.Model:GetDescendants()) do
            if v.Name == "Rage" and v:IsA("ParticleEmitter") then
                v.Enabled = a1_2
            end
        end
    end

    function a1.EnableBeam(a1_2) -- Line: 56 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        local Head = a1.Model.Head
        local v1 = a1_2
        for k, v in pairs(HumanoidRootPart.BeamEnd:GetChildren()) do
            if v:IsA("Beam") or v:IsA("ParticleEmitter") then
                v.Enabled = v1
            end
        end
        if v1 then
            Head.Laser:Play()
            return
        end
        Head.Laser:Stop()
    end

    a1.Executables = {
        Barrage = function(a1_2, a2, a3) -- Line: 75 -- upvalues: a1 (val), u11 (val), u20 (val), u29 (val)
            a1.Shooting = a1_2
            if not a1_2 then
                u20:Stop()
                u29:Play()
                a1.EnableBeam(false)
                return
            end
            u11:Play()
            u11.Controller.Stopped:Wait()
            u20:Play()
            a1.Face(a3)
            a1.EnableBeam(true)
        end,
        Rage = function(a1_2, a2) -- Line: 93 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            local v1 = a1.Model.AnimationController:LoadAnimation(a1.Model.Animations.WalkRage)
            a1.EnabledRageEffect(true)
            a1.Model.Torso.DeathParticle.Smoke.Enabled = true
            a1.WalkTrack:Stop()
            a1.WalkTrack = v1
            while a1.WalkTrack.Length == 0 do
                a1:Delay(0.001)
            end
            a1:AdjustWalkSpeed()
        end,
        ScreamEffect = function(a1_2) -- Line: 114 -- upvalues: a1 (val), Shaker (upval)
            a1.Model.Head.Scream:Play()
            a1.Model.Head.ScreamEffect.Shockwave.Enabled = true
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
            a1:Delay(a1_2)
            a1.Model.Head.ScreamEffect.Shockwave.Enabled = false
        end,
        Scream = function() -- Line: 122 -- upvalues: Animation (upval), a1 (val), Shaker (upval)
            Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.5)
            a1.Model.Head.Scream:Play()
            a1.Model.Head.ScreamEffect.Shockwave.Enabled = true
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
            a1:Delay(2)
            a1.Model.Head.ScreamEffect.Shockwave.Enabled = false
        end,
        Stomp = function(a1_2, a2) -- Line: 136
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), Shaker (upval)
            local Attribute
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()

            local function v1(a1_2) -- Line: 139 -- upvalues: a1 (upval)
                for k, v in pairs(a1.Model["Left Hand"].Effect:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = a1_2
                    end
                end
            end

            v1(true)
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            Animation.new({
                Track = a1.Model.Animations.Punch,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(1)
            a1.Model.Head.Stomp:Play()
            u9.Parent = workspace.CurrentCamera
            local v2 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(
                u9,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v2}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 173 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
            v1(false)
            for k, v in pairs(a1.Model.HumanoidRootPart.DebrisEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
        end,
        StompEffect = function(a1_2, a2) -- Line: 191
            -- upvalues: ReplicatedStorage (upval), a1 (val), TimescaleUtilities (upval), TweenService (upval)
            -- upvalues: Shaker (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            local u24 = a1.Model.Head.Stomp:Clone()
            u24.Name = "Sound"
            u24.Parent = a1.Model.Head
            u24.PlaybackSpeed = Random.new():NextNumber(0.9, 1.1)
            u24:Play()
            TimescaleUtilities.Delay(u24.TimeLength, function() -- Line: 202 -- upvalues: u24 (val)
                u24:Destroy()
            end)
            u9.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(
                u9,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v1}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 221 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
        end,
        PukeStart = function(a1_2) -- Line: 228 -- upvalues: Animation (upval), a1 (val)
            local v1 = Animation.new({
                Track = a1.Model.Animations.PukeIntro,
                Target = a1.Model.AnimationController,
            })
            local v2 = Animation.new({
                Track = a1.Model.Animations.PukeLoop,
                Target = a1.Model.AnimationController,
            })
            local v3 = Animation.new({
                Track = a1.Model.Animations.PukeOutro,
                Target = a1.Model.AnimationController,
            })
            a1.Model.Head.Puke:Play()
            v1:Play()
            v1.Controller.Stopped:Wait()
            v2:Play()
            a1:Delay(a1_2)
            v2:Stop()
            v3:Play()
        end,
        AcidBall = function(a1_2, a2) -- Line: 252
            -- upvalues: a1 (val), Spitball (upval), u31 (val), TimescaleUtilities (upval), RunService (upval)
            -- upvalues: GameState (upval)
            local u12 = Vector3.new(a1_2.X, a1.Model.HumanoidRootPart.Node.WorldPosition.Y, a1_2.Z)
            local u16 = Spitball:Clone()
            local WorldPosition = a1.Model.Head.ScreamEffect.WorldPosition
            local u36 = (WorldPosition:Lerp(u12, 0.5)) + Vector3.new(0, (u31:NextNumber(9, 14)))
            local u37 = 0
            u16:PivotTo((CFrame.new(WorldPosition)))
            u16.Transparency = 0
            u16.Parent = workspace.Trash
            u16.Bits.Enabled = true
            u16.Trail.Enabled = true
            TimescaleUtilities.Delay(a2 + 2, function() -- Line: 266 -- upvalues: u16 (val)
                u16:Destroy()
            end)
            local u56 = nil
            local v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 271
                -- upvalues: u37 (ref), GameState (upval), a2 (val), u16 (val), u56 (ref), WorldPosition (val)
                -- upvalues: u36 (val), u12 (ref)
                local Attribute
                u37 = u37 + a1 * GameState.TimeScale
                local v1 = u37
                if not (a2 <= v1) then
                    v1 = math.clamp(u37 / a2, 0, 1)
                    u16:PivotTo((CFrame.new(((WorldPosition:Lerp(u36, v1)):Lerp(u36:Lerp(u12, v1), v1)))))
                    return
                end
                u16.Bits.Enabled = false
                u16.Trail.Enabled = false
                for i, v in ipairs(u16.Effect:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        Attribute = v:GetAttribute("EmitCount")
                        v:Emit(Attribute or 1)
                    end
                end
                u16.Transparency = 1
                u16.Impact.PlayOnRemove = true
                u16.Impact:Destroy()
                u56:Disconnect()
            end)
        end,
        BeamPosition = function(a1_2) -- Line: 301 -- upvalues: a1 (val)
            a1.BeamPos = a1_2
        end,
        Death = function() -- Line: 305
            -- upvalues: Animation (upval), a1 (val), TweenService (upval), Shaker (upval), GameState (upval)
            -- upvalues: EffectsController (upval)
            local v1, v2, v3, v4, v5
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            a1.Model.Head.Scream:Play()
            task.defer(function() -- Line: 315 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.001)
                end
                a1:Delay(u10.Controller.Length * 0.98)
                u10.Controller:AdjustSpeed(0)
            end)
            local v6 = tick()
            a1.Model.Folder.Backpack.Effect.Bolts.Enabled = false
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("BasePart") and v.Material == Enum.Material.Neon then
                    v5 = TweenService
                    v1 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v2 = {Color = Color3.new(0.0823529, 0.0823529, 0.0823529)}
                    v5:Create(v, v1, v2):Play()
                end
            end
            a1.EnabledRageEffect(false)
            for k2, i in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if i:IsA("ParticleEmitter") then
                    i.Enabled = true
                end
            end
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
            while true do
                if not ((tick() - v6) * GameState.TimeScale < 6) then
                    break
                end
                v3 = CFrame.new(Random.new():NextNumber(-4, 4), Random.new():NextNumber(-3, 3), Random.new():NextNumber(-3, 3))
                v4 = a1.Model.HumanoidRootPart.CFrame * v3
                EffectsController.Explosion({
                    Position = v4.Position,
                    Radius = Random.new():NextNumber(1.5, 3.5),
                    Color = BrickColor.new(Color3.new(1, 0.666667, 0)),
                    Sound = 5264403010,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
                a1:Delay((Random.new():NextNumber(0.2, 0.4)))
            end
            for k3, j in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if j:IsA("ParticleEmitter") and j.Name ~= "Smoke" then
                    j.Enabled = false
                end
            end
        end,
    }

    function a1.OnStepFunction(a1_2) -- Line: 385 -- upvalues: a1 (val), BeamEnd (val)
        if a1.Shooting then
            local HumanoidRootPart = a1.Model.HumanoidRootPart
            BeamEnd.WorldCFrame = BeamEnd.WorldCFrame:Lerp(CFrame.new(a1.BeamPos), a1_2 * 6)
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(a1.Face(a1.BeamPos), a1_2 * 8)
        end
    end
end

return v1