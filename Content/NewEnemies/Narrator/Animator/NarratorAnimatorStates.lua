-- Script path: ReplicatedStorage.Content.NewEnemies.Narrator.Animator.NarratorAnimatorStates
-- Decompile time: 16.21 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Narrator = ReplicatedStorage.Assets.Effects.Mob.Narrator
local LocalPlayer = Players.LocalPlayer
local v1 = {
    name = "Death",
    onEnter = function(a1) -- Line: 26
        -- upvalues: LocalPlayer (val), EasySound (val), TweenService (val), RunService (val), Narrator (val)
        -- upvalues: EmitterManager (val), TimescaleUtilities (val)
        a1:animate("Death")
        local u9 = a1.legacySounds.Death:Clone()
        u9.Parent = LocalPlayer:WaitForChild("PlayerGui")
        u9:Play()
        u9.Ended:Connect(function() -- Line: 33 -- upvalues: u9 (val)
            u9:Destroy()
        end)
        EasySound.bindTimeScale(u9)
        local left = a1._hands.left
        local right = a1._hands.right
        left:PlayAnimation("Death")
        right:PlayAnimation("Death")
        local v1 = a1.Model.PrimaryPart.Node.WorldPosition + Vector3.new(0, 0.20000000298023224, 0)
        TweenService:Create(left.handModel.Mesh, TweenInfo.new(3), {Color = Color3.fromRGB(49, 39, 43)}):Play()
        TweenService:Create(right.handModel.Mesh, TweenInfo.new(3), {Color = Color3.fromRGB(49, 39, 43)}):Play()
        a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 54 -- upvalues: left (val), right (val)
            local handModel = left.handModel
            local handModel_2 = right.handModel
            handModel.PrimaryPart.CFrame = handModel.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(10 * a1), 0) * CFrame.new(0, -a1 * 2, 0)
            handModel_2.PrimaryPart.CFrame = handModel_2.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-10 * a1), 0) * CFrame.new(0, -a1 * 2, 0)
        end)))
        a1:Delay(a1.Stats.DeathTime)
        a1.Model.Parent = nil
        local v2 = Narrator.BaseExplosion:Clone()
        v2.Position = v1
        v2.Parent = workspace
        EmitterManager.manualEmit(v2)
        TimescaleUtilities.CleanUp(v2, 5)
    end,
}
local v2 = {
    name = "HandSlam",
    onEnter = function(a1, a2) -- Line: 80
        -- upvalues: Bezier (val), TweenService (val), TimescaleUtilities (val), Narrator (val), EmitterManager (val)
        -- upvalues: RunService (val)
        local Left = a2.Left
        local Right = a2.Right
        a1.legacySounds.HandSlam:Play()

        local function createBezierCurveSlam(a1_2, a2) -- Line: 86
            -- upvalues: Bezier (upval), TweenService (upval), TimescaleUtilities (upval), Narrator (upval)
            -- upvalues: EmitterManager (upval), a1 (val), RunService (upval)
            local Position = a1_2.handModel:GetPivot().Position
            local v1 = Position + Vector3.new(0, 10, 0)
            local v2 = (Position + a2) / 2 + Vector3.new(0, 8, 0)
            local v3 = a2 + Vector3.new(0, 4, 0)
            local u21 = Bezier.new(Position, v1, v2, v3)
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 0
            local Rotation = a1_2.handModel.PrimaryPart.CFrame.Rotation
            local u35 = math.rad((math.random(-380, 380)))
            TweenService:Create(NumberValue, TweenInfo.new(1.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Value = 1}):Play()
            local u50 = nil
            TimescaleUtilities.Delay(0.3, function() -- Line: 107
                -- upvalues: a1_2 (val), TimescaleUtilities (upval), Narrator (upval), a2 (val), EmitterManager (upval)
                -- upvalues: a1 (upval)
                a1_2:PlayAnimation("Slam")
                TimescaleUtilities.Delay(0.5, function() -- Line: 109
                    -- upvalues: Narrator (upval), a2 (upval), EmitterManager (upval), TimescaleUtilities (upval)
                    -- upvalues: a1 (upval)
                    local v1 = Narrator.HandSlam:Clone()
                    v1.Position = a2 + Vector3.new(0, 0.029999999329447746, 0)
                    v1.Parent = workspace.Trash
                    EmitterManager.manualEmit(v1)
                    TimescaleUtilities.CleanUp(v1, 5)
                    a1:Shake(2, 0.3)
                end)
            end)
            local v4 = RunService.PreRender:Connect(function(a1) -- Line: 119 -- upvalues: u21 (val), NumberValue (val), Rotation (ref), u35 (val), a1_2 (val), u50 (ref)
                local v1 = u21:Get(NumberValue.Value)
                Rotation = Rotation:Lerp(CFrame.Angles(0, u35, 0), a1 * 2)
                a1_2.handModel.PrimaryPart.CFrame = (CFrame.new(v1)) * Rotation
                if 1 <= NumberValue.Value then
                    u50:Disconnect()
                    NumberValue:Destroy()
                end
            end)
        end

        if Left then
            createBezierCurveSlam(a1._hands.left, Left)
        end
        TimescaleUtilities.Delay(0.1, function() -- Line: 134 -- upvalues: Right (val), createBezierCurveSlam (val), a1 (val)
            if Right then
                createBezierCurveSlam(a1._hands.right, Right)
            end
        end)
    end,
}
local v3 = {
    name = "HandLaser",
    onEnter = function(a1, a2) -- Line: 144
        -- upvalues: Maid (val), Narrator (val), TweenService (val), RunService (val), GameState (val)
        -- upvalues: TimescaleUtilities (val)
        local HandLaser = a1.Stats.Moveset.HandLaser
        local u97 = Maid.new()

        local function createBeam(a1, a2, a3) -- Line: 149
            -- upvalues: Narrator (upval), TweenService (upval), RunService (upval), GameState (upval), u97 (val)
            -- upvalues: TimescaleUtilities (upval)
            local u7 = Narrator.HandBeam:Clone()
            u7.Parent = workspace.Trash
            local WorldPosition = a2.WorldPosition
            local u11 = 0
            TweenService:Create(u7.End.Light.PointLight, TweenInfo.new(1), {Brightness = 0.6}):Play()
            local u26 = false
            local u27 = 0
            local u35 = RunService.PreRender:Connect(function(a1) -- Line: 164
                -- upvalues: u11 (ref), GameState (upval), u7 (val), a2 (val), u26 (ref), u27 (ref), WorldPosition (ref)
                -- upvalues: a3 (val)
                u11 = u11 + a1 * GameState.TimeScale
                u7.Start.Position = a2.WorldPosition
                if u26 then
                    u27 = math.lerp(u27, 0, a1 * 5)
                    WorldPosition = WorldPosition:Lerp(a2.WorldPosition, a1 * 30)
                else
                    u27 = math.lerp(u27, 1, a1 * 5)
                    WorldPosition = WorldPosition:Lerp(a3, a1 * 10)
                end
                local v1 = math.noise(u11 * 3, 0) * 0.5
                local v2 = math.cos(u11 * 5 + v1) * 0.06 * u27
                local v3 = math.sin(u11 * 5 + v1) * 0.06 * u27
                WorldPosition = WorldPosition + Vector3.new(v2, 0, v3)
                u7.End.Position = WorldPosition
            end)
            u97:Mark(function() -- Line: 187 -- upvalues: u26 (ref), TweenService (upval), u7 (val), TimescaleUtilities (upval), u35 (ref)
                u26 = true
                TweenService:Create(
                    u7.End.Light.PointLight,
                    TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
                for i, j in u7:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.Delay(1, function() -- Line: 204 -- upvalues: u7 (upval), u35 (upval)
                    u7:Destroy()
                    u35:Disconnect()
                end)
            end)
        end

        local function faceAtPosition(a1, a2) -- Line: 211 -- upvalues: u97 (val), RunService (upval)
            a1:PlayAnimation("Stun")
            local u22 = CFrame.new(math.random(-5, 5) * 0.3, math.random(-5, 5) * 0.3, math.random(-5, 5) * 0.3)
            u97:Mark((RunService.PreRender:Connect(function(a1_2) -- Line: 220 -- upvalues: a1 (val), a2 (val), u22 (val)
                local CFrame_2 = a1.handModel.PrimaryPart.CFrame
                local v1 = (CFrame.new(CFrame_2.Position, a2)) * u22
                a1.handModel.PrimaryPart.CFrame = CFrame_2:Lerp(v1, a1_2 * 2)
            end)))
            u97:Mark(function() -- Line: 226 -- upvalues: a1 (val)
                a1:StopAnimation("Stun")
                a1:PlayAnimation("StunEnd")
            end)
        end

        local v1 = {left = Vector3.new(0, 0, 0), right = Vector3.new(0, 0, 0)}
        local v2 = nil
        local v3 = nil
        local v4 = a1
        for i, j in a2, v2, v3 do
            for k, n in v4._hands[i].handModel.BeamRefs:GetChildren() do
                v1[i] = v1[i] + j[k]
                createBeam(v4._hands.left, n.Value, j[k])
            end
        end
        for m, i5 in v1 do
            v1[m] = i5 / #v5[m]
        end
        for i6, i7 in v1 do
            faceAtPosition(v4._hands[i6], i7)
        end
        v4.legacySounds.HandLaser:Play()
        v4:Delay(HandLaser.Duration)
        u97:Sweep()
    end,
}
local v4 = {
    name = "BossBaseAttack",
    onEnter = function(a1, a2) -- Line: 270
        -- upvalues: Maid (val), Shaker (val), Narrator (val), spr (val), TweenService (val), RunService (val)
        -- upvalues: GameState (val), SpringClass (val), TimescaleUtilities (val)
        warn("BossBaseAttack initiated")
        local u9 = a2 - workspace:GetServerTimeNow()
        local BaseAttackIntro = a1.animations.BaseAttackIntro
        BaseAttackIntro:ScaleAnimationToTime(u9 + 0.5)
        BaseAttackIntro:Play()
        local u21 = Maid.new()
        a1._baseMaid = u21
        a1:_flash()
        u21:Mark(function() -- Line: 285 -- upvalues: BaseAttackIntro (val)
            BaseAttackIntro:Stop()
        end)
        Shaker:Shake({0.5, 25, 0, 7, 4}, 1.25, 2)
        local v1 = Narrator.Shrinking:Clone()
        v1.Parent = workspace.Trash
        v1.Position = a1.Model.PrimaryPart.Node.WorldPosition
        u21:Mark(v1)
        task.spawn(function() -- Line: 298
            -- upvalues: a1 (val), u21 (val), Narrator (upval), spr (upval), TweenService (upval), u9 (val)
            -- upvalues: RunService (upval), GameState (upval)
            local u0 = {value = 0}
            local CFrame = a1.Model.PrimaryPart.CFrame
            local NumberValue = Instance.new("NumberValue")
            local NumberValue_2 = Instance.new("NumberValue")
            local NumberValue_3 = Instance.new("NumberValue")
            u21:Mark(NumberValue)
            u21:Mark(NumberValue_2)
            u21:Mark(NumberValue_3)
            NumberValue.Value = 5400
            NumberValue_2.Value = 20
            NumberValue_3.Value = 30
            local u36 = Narrator.FlingBall:Clone()
            local Part = u36.Part
            u36.Parent = workspace
            local u44 = a1.legacySounds.BaseAttackFlameBall:Clone()
            u44.Looped = true
            u44.Playing = true
            u44.Volume = 2
            u44.Parent = u36
            a1._flingBall = u36
            spr.target(u0, 0.1, 0.6, {value = 1.2})
            TweenService:Create(NumberValue, TweenInfo.new(u9, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Value = 0}):Play()
            TweenService:Create(NumberValue_3, TweenInfo.new(u9, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Value = 0}):Play()
            TweenService:Create(NumberValue_2, TweenInfo.new(u9, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {Value = 0}):Play()
            local u98 = Vector3.new(0, 0, 0)
            local u99 = 0
            u21:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 361
                -- upvalues: GameState (upval), NumberValue_3 (val), CFrame (val), NumberValue (val)
                -- upvalues: NumberValue_2 (val), Part (val), u98 (ref), u44 (val), u99 (ref), u36 (val), u0 (val)
                local v1 = a1 * GameState.TimeScale
                local v2 = (math.sin(NumberValue_3.Value * 4)) * 9
                local v3 = CFrame * CFrame.Angles(0, math.rad(NumberValue.Value), 0) * CFrame.new(0, 5, NumberValue_2.Value) * CFrame.new(0, v2, 0)
                local v4 = (Part.Position - Vector3.new(0, 0, 0)) / v1
                u98 = u98:Lerp(v4, (math.clamp(v1 * 5, 0, 1)))
                u44.PlaybackSpeed = math.lerp((math.clamp(u98.Magnitude / 20, 0.5, 1.6)) + math.sin(u99 * 2) / 2.5, u44.PlaybackSpeed, v1 * 4) * 0.7 * GameState.TimeScale
                u36:PivotTo(v3)
                u36:ScaleTo((math.max(u0.value, 0.01)))
                u99 = u99 + v1
            end)))
            u21:Mark(u36)
        end)

        local function faceAtPosition(a1_2, a2) -- Line: 392
            -- upvalues: u9 (val), SpringClass (upval), a1 (val), u21 (val), TweenService (upval), RunService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local ShootStart = a1_2._animations.ShootStart
            ShootStart:ScaleAnimationToTime(u9)
            ShootStart:Play()
            local u16 = SpringClass.new(0, 0.7, 9)
            a1[a1_2.handName .. "spring"] = u16
            local v1 = Random.new()
            local u42 = CFrame.new(v1:NextNumber(-5, 5) * 0.7, v1:NextNumber(1, 12) * 1.1, v1:NextNumber(-5, 5) * 0.7)
            local NumberValue = Instance.new("NumberValue")
            u21:Mark(NumberValue)
            local u62 = TweenService:Create(NumberValue, TweenInfo.new(u9 - 2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Value = 1})
            local u79 = TweenService:Create(
                a1_2.handModel.Mesh,
                TweenInfo.new(u9, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Color = Color3.fromRGB(49, 39, 43)}
            )
            u62:Play()
            u79:Play()
            u21:Mark(function() -- Line: 430 -- upvalues: u62 (val), u79 (val)
                u62:Cancel()
                u79:Cancel()
            end)
            local Position = a1_2.handModel.PrimaryPart.CFrame.Position
            u21:Mark((RunService.PreRender:Connect(function(a1) -- Line: 438 -- upvalues: a1_2 (val), Position (val), a2 (val), u42 (val), NumberValue (val), u16 (val)
                local CFrame_2 = a1_2.handModel.PrimaryPart.CFrame
                local v1 = (CFrame.new(Position, a2)) * u42
                local v2 = Vector3.new(
                    math.noise(os.clock() * 50, 0) * 0.2 * NumberValue.Value,
                    math.noise(0, os.clock() * 50) * 1 * NumberValue.Value,
                    math.noise(os.clock() * 50, os.clock() * 20) * 0.2 * NumberValue.Value
                )
                a1_2.handModel.PrimaryPart.CFrame = (CFrame_2:Lerp(v1, a1 * 2)) * CFrame.new(v2) * CFrame.new(0, 0, u16.p)
            end)))
            TimescaleUtilities.Delay(u9, function() -- Line: 454 -- upvalues: TweenService (upval), NumberValue (val)
                TweenService:Create(NumberValue, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0}):Play()
            end)
            u21:Mark(function() -- Line: 464 -- upvalues: TweenService (upval), NumberValue (val), ShootStart (val)
                TweenService:Create(NumberValue, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0}):Play()
                ShootStart:Stop()
            end)
        end

        local right = a1._hands.right
        local left = a1._hands.left
        local v2 = (a1.Path:GetScalar(a1.Path.PathDistance)) + Vector3.new(0, 1, 0)
        faceAtPosition(right, v2)
        faceAtPosition(left, v2)
        a1:Delay(u9 - 10, function() -- Line: 484 -- upvalues: a1 (val)
            a1.legacySounds.BaseAttackCharge:Play()
        end)
        a1:Delay(u9 + 4)
        u21:Sweep()
    end,
}
local v5 = {
    name = "RageMode",
    onEnter = function(a1) -- Line: 496 -- upvalues: Maid (val), TweenService (val), Narrator (val), spr (val), RunService (val)
        a1:Shake(1.25, 3)
        a1.legacySounds.RageMode:Play()
        a1:animate("Rage")
        a1:_flash()
        a1:_animateVignette({
            transparency = 0.3,
            tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            color = Color3.new(1, 0, 0.54902),
        })
        a1:Delay(1, function() -- Line: 511 -- upvalues: a1 (val)
            a1:_animateVignette({
                transparency = 1,
                tweenInfo = TweenInfo.new(7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                color = Color3.new(1, 0.384314, 0.72549),
            })
        end)
        local u39 = Maid.new()
        task.spawn(function() -- Line: 524
            -- upvalues: u39 (val), TweenService (upval), a1 (val), Narrator (upval), spr (upval), RunService (upval)
            local NumberValue_4, v1
            for i = 1, 5 do
                local NumberValue = Instance.new("NumberValue")
                local NumberValue_2 = Instance.new("NumberValue")
                NumberValue_4 = Instance.new("NumberValue")
                local NumberValue_3 = Instance.new("NumberValue")
                NumberValue_3.Value = 0
                u39:Mark(NumberValue)
                u39:Mark(NumberValue_2)
                u39:Mark(NumberValue_4)
                NumberValue.Value = 360 * (6 * (if math.random(1, 2) ~= 2 then 1 else -1))
                NumberValue_2.Value = 0
                NumberValue_4.Value = 30 * Random.new():NextNumber(0.5, 1.6)
                TweenService:Create(NumberValue, TweenInfo.new(8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Value = 0}):Play()
                TweenService:Create(
                    NumberValue_2,
                    TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Value = 60 * Random.new():NextNumber(0.5, 1.6)}
                ):Play()
                TweenService:Create(NumberValue_3, TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 1}):Play()
                task.delay(6, function() -- Line: 572 -- upvalues: TweenService (upval), NumberValue_2 (val), NumberValue_3 (val)
                    TweenService:Create(NumberValue_2, TweenInfo.new(8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Value = 0}):Play()
                    TweenService:Create(NumberValue_3, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Value = 0}):Play()
                end)
                local CFrame_2 = a1.Model.PrimaryPart.CFrame
                local u250 = (Narrator.Beams:GetChildren())[math.random(1, #Narrator.Beams:GetChildren())]:Clone()
                u250.Parent = workspace
                v1 = math.random(1, 15)
                u250.Start.CFrame = CFrame_2 * CFrame.new(math.random(-5, 5), v1, math.random(-5, 5))
                local u251 = math.random(0, 300)
                local u252 = CFrame.new(math.random(-5, 5), v1, math.random(-5, 5))
                spr.target({value = 0}, 1, 0.1, {value = 1})
                for j, k in u250:GetDescendants() do
                    if k:IsA("Beam") or k:IsA("ParticleEmitter") or k:IsA("Trail") then
                        k.Enabled = false
                    end
                end
                task.delay(0.01, function() -- Line: 621 -- upvalues: u250 (val)
                    for i, j in u250:GetDescendants() do
                        if j:IsA("Beam") or j:IsA("ParticleEmitter") or j:IsA("Trail") then
                            j.Enabled = true
                        end
                    end
                end)
                u39:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 629
                    -- upvalues: u250 (val), CFrame_2 (val), u252 (val), NumberValue_3 (val), u251 (val)
                    -- upvalues: NumberValue (val), NumberValue_2 (val)
                    u250.Start.CFrame = CFrame_2 * u252 * CFrame.new(
                        math.sin((os.clock()) * 1) * 4 * NumberValue_3.Value,
                        math.sin((os.clock()) * 3) * 6 * NumberValue_3.Value,
                        math.cos((os.clock()) * 4) * 12 * NumberValue_3.Value
                    )
                    local v1 = CFrame_2 * CFrame.new(
                        math.sin((os.clock()) + u251 * 1) * 20 * NumberValue_3.Value,
                        math.sin((os.clock()) + u251 * 2) * 30 * NumberValue_3.Value,
                        math.cos((os.clock()) + u251 * 1) * 20 * NumberValue_3.Value
                    ) * CFrame.Angles(0, math.rad(NumberValue.Value), 0) * CFrame.new(0, 0, NumberValue_2.Value)
                    u250.End.CFrame = v1
                end)))
                task.delay(4, function() -- Line: 649 -- upvalues: TweenService (upval), NumberValue_2 (val), NumberValue_3 (val), u250 (val)
                    TweenService:Create(
                        NumberValue_2,
                        TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Value = 0}
                    ):Play()
                    TweenService:Create(
                        NumberValue_3,
                        TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Value = 0}
                    ):Play()
                    for i, j in u250:GetDescendants() do
                        if j:IsA("Beam") or j:IsA("ParticleEmitter") or j:IsA("Trail") then
                            j.Enabled = false
                        end
                    end
                end)
                u39:Mark(u250)
            end
        end)
        a1:Delay(4)
        u39:Sweep()
    end,
}
return {
    {
        name = "Walk",
        onEnter = function(a1) end,
    },
    v1,
    v2,
    v3,
    {
        name = "HandSummon",
        onEnter = function(a1) -- Line: 263
            a1:_animateLoop(1.4)
        end,
    },
    v4,
    v5,
}