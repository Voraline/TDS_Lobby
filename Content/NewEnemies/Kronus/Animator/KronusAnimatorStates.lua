-- Script path: ReplicatedStorage.Content.NewEnemies.Kronus.Animator.KronusAnimatorStates
-- Decompile time: 13.84 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local TweenService_2 = game:GetService("TweenService")
local u50 = {}
u50[1] = (Vector3.new(1, 25, 1))
u50[2] = (Vector3.new(25, 1, 1))
u50[3] = (Vector3.new(1, 1, 25))
local CurrentCamera = workspace.CurrentCamera
local v1 = {}
local TimeSphere = ReplicatedStorage.Assets.Effects.Misc.TimeSphere
local u62 = Random.new()

local function tweenScale(a1, a2, a3) -- Line: 26
    -- upvalues: TweenService_2 (val)
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = a1:GetScale()
    NumberValue.Changed:Connect(function(a1_2) -- Line: 29 -- upvalues: a1 (val)
        a1:ScaleTo(a1_2)
    end)
    local v1 = TweenService_2:Create(NumberValue, a3, {Value = a2})
    v1.Completed:Once(function() -- Line: 37 -- upvalues: NumberValue (val)
        NumberValue:Destroy()
    end)
    v1:Play()
    return v1
end

local function timeSphereEffect(a1) -- Line: 45
    -- upvalues: Lighting (val), RunService (val), u62 (val), TweenService_2 (val), u50 (val), TimeSphere (val)
    -- upvalues: tweenScale (val)
    local CurrentCamera = workspace.CurrentCamera
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect.Saturation = 0
    ColorCorrectionEffect.Parent = Lighting
    ;(function() -- Line: 51
        -- upvalues: RunService (upval), CurrentCamera (val), u62 (upval), TweenService_2 (upval)
        -- upvalues: ColorCorrectionEffect (val), u50 (upval), TimeSphere (upval), a1 (val), tweenScale (upval)
        local Mesh
        task.delay(0.05, function() -- Line: 52
            -- upvalues: RunService (upval), CurrentCamera (upval), u62 (upval), TweenService_2 (upval)
            -- upvalues: ColorCorrectionEffect (upval)
            local u0 = 0
            local u1 = 1
            local u9 = RunService.RenderStepped:Connect(function(a1) -- Line: 57 -- upvalues: u0 (ref), u1 (ref), CurrentCamera (upval), u62 (upval)
                u0 = math.lerp(u0, u1, a1 * 4)
                CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.new((u62:NextNumber(-50, 50)) * u0 * a1, (u62:NextNumber(-50, 50)) * u0 * a1, (u62:NextNumber(-50, 50)) * u0 * a1)
            end)
            task.delay(0.5, function() -- Line: 68 -- upvalues: u1 (ref), u9 (ref)
                u1 = 0
                task.wait(2)
                u9:Disconnect()
            end)
            TweenService_2:Create(
                ColorCorrectionEffect,
                TweenInfo.new(0.08, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Contrast = 2, Saturation = -1}
            ):Play()
            task.wait(0.08)
            TweenService_2:Create(
                ColorCorrectionEffect,
                TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Contrast = 0, Saturation = -1, TintColor = Color3.fromRGB(209, 255, 208)}
            ):Play()
        end)
        for i, j in u50 do
            local u17 = TimeSphere:Clone()
            local Ball = u17.Ball
            Mesh = Ball.Mesh
            Ball.CFrame = a1.CFrame * CFrame.Angles(u62:NextNumber() * 6.283185307179586, u62:NextNumber() * 6.283185307179586, u62:NextNumber() * 6.283185307179586)
            Ball.Transparency = -99999
            Mesh.VertexColor = j
            u17.Parent = workspace.Terrain
            tweenScale(u17, 100 - 1 * (i - 1) * 1, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In))
            TweenService_2:Create(Ball, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {Transparency = -1}):Play()
            TweenService_2:Create(Ball, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Orientation = Ball.Orientation + Vector3.new(0, 300 + u62:NextInteger(100, 150), 0),
            }):Play()
            task.delay(0.8, function() -- Line: 132 -- upvalues: TweenService_2 (upval), Ball (val), u17 (val)
                TweenService_2:Create(Ball, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
                task.wait(1)
                u17:Destroy()
            end)
            task.wait(0.05)
        end
    end)()
    return function() -- Line: 146
        -- upvalues: RunService (upval), CurrentCamera (val), u62 (upval), TweenService_2 (upval)
        -- upvalues: ColorCorrectionEffect (val), u50 (upval), TimeSphere (upval), a1 (val), tweenScale (upval)
        local Mesh
        task.delay(0.5, function() -- Line: 147
            -- upvalues: RunService (upval), CurrentCamera (upval), u62 (upval), TweenService_2 (upval)
            -- upvalues: ColorCorrectionEffect (upval)
            local u0 = 0
            local u1 = 1
            local u9 = RunService.RenderStepped:Connect(function(a1) -- Line: 152 -- upvalues: u0 (ref), u1 (ref), CurrentCamera (upval), u62 (upval)
                u0 = math.lerp(u0, u1, a1 * 4)
                CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.new((u62:NextNumber(-50, 50)) * u0 * a1, (u62:NextNumber(-50, 50)) * u0 * a1, (u62:NextNumber(-50, 50)) * u0 * a1)
            end)
            task.delay(0.5, function() -- Line: 163 -- upvalues: u1 (ref), u9 (ref)
                u1 = 0
                task.wait(2)
                u9:Disconnect()
            end)
            task.wait(0.15)
            TweenService_2:Create(
                ColorCorrectionEffect,
                TweenInfo.new(0.08, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {Contrast = 2, Saturation = -1, TintColor = Color3.fromRGB(255, 255, 255)}
            ):Play()
            task.wait(0.2)
            TweenService_2:Create(ColorCorrectionEffect, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Saturation = 0, Contrast = 0}):Play()
            task.delay(1, function() -- Line: 188 -- upvalues: ColorCorrectionEffect (upval)
                ColorCorrectionEffect:Destroy()
            end)
        end)
        for i, j in u50 do
            local u17 = TimeSphere:Clone()
            local Ball = u17.Ball
            Mesh = Ball.Mesh
            u17:ScaleTo(100 - 1 * (i - 1) * 1)
            Ball.CFrame = a1.CFrame * CFrame.Angles(u62:NextNumber() * 6.283185307179586, u62:NextNumber() * 6.283185307179586, u62:NextNumber() * 6.283185307179586)
            Mesh.VertexColor = j
            Ball.Transparency = 1
            u17.Parent = workspace.Terrain
            task.delay(0.4, function() -- Line: 210 -- upvalues: tweenScale (upval), u17 (val)
                tweenScale(u17, 0.01, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out))
            end)
            TweenService_2:Create(Ball, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Transparency = -9999}):Play()
            task.delay(0.02, function() -- Line: 222 -- upvalues: TweenService_2 (upval), Ball (val), u62 (upval)
                TweenService_2:Create(Ball, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    Orientation = Ball.Orientation + Vector3.new(0, 400 + u62:NextInteger(100, 150), 0),
                }):Play()
            end)
            task.delay(0.4, function() -- Line: 233 -- upvalues: TweenService_2 (upval), Ball (val), u17 (val)
                TweenService_2:Create(Ball, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {Transparency = 1}):Play()
                task.wait(0.6)
                u17:Destroy()
            end)
            task.wait(0.05)
        end
    end
end

v1.Walk = {
    name = "Walk",
    onEnter = function(a1) end,
    onLeave = function(a1) end,
}
v1.SweepingIce = {
    name = "SweepingIce",
    onEnter = function(a1, a2) -- Line: 262
        -- upvalues: EasySound (val), TimescaleUtilities (val), ReplicatedStorage (val), CurrentCamera (val)
        -- upvalues: EmitterManager (val), TweenService (val)
        local u6 = a1:face(a2, 0.5)
        a1.Rotation = CFrame.new() * u6.Rotation
        a1:playAnimation("SweepingIce")
        EasySound.Play({
            id = 75818865677869,
            destroyOnEnd = true,
            soundGroupName = "Enemies",
            parent = a1.Model.PrimaryPart,
        })
        TimescaleUtilities.Delay(0.9, function() -- Line: 275
            -- upvalues: ReplicatedStorage (upval), u6 (val), CurrentCamera (upval), EmitterManager (upval)
            -- upvalues: TimescaleUtilities (upval)
            local v1 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Slash:Clone()
            v1.CFrame = u6
            v1.Parent = CurrentCamera
            EmitterManager.manualEmit(v1)
            TimescaleUtilities.CleanUp(v1, 2)
        end)
        TimescaleUtilities.Delay(1, function() -- Line: 283
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
                    TimescaleUtilities.Delay(i * 0.1, function() -- Line: 315 -- upvalues: TweenService (upval), v (val), i (val), CFrame_2 (val), Size (val), a1 (upval)
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
}
v1.TimeScale = {
    name = "TimeScale",
    onEnter = function(a1) -- Line: 352 -- upvalues: EasySound (val), timeSphereEffect (val), TweenService_2 (val)
        a1.TimeScaled = false
        a1:playAnimation("TimeScale")
        local u9 = EasySound.Create({
            id = 129796947416917,
            destroyOnEnd = true,
            looped = true,
            timeScaled = false,
            volume = 0.4,
            soundGroupName = "Enemies",
        })
        local u15 = EasySound.Create({
            id = 107297843118561,
            destroyOnEnd = true,
            timeScaled = false,
            soundGroupName = "Enemies",
            parent = a1.Model.PrimaryPart,
        })
        EasySound.Play({
            id = 123804808949838,
            destroyOnEnd = true,
            timeScaled = false,
            soundGroupName = "Enemies",
            parent = a1.Model.PrimaryPart,
        })
        a1:Delay(1, function() -- Line: 381 -- upvalues: timeSphereEffect (upval), a1 (val), u9 (val), u15 (val), TweenService_2 (upval)
            local v1
            local v2 = timeSphereEffect(a1.Model.HourGlass)
            u9:Play()
            while true do
                task.wait()
                v1 = a1.Replicator:Get("TimeScaleEndsAt")
                if not v1 then
                    if not a1.Model.Parent then
                        break
                    end
                elseif v1 <= workspace:GetServerTimeNow() or not a1.Model.Parent then
                    break
                end
            end
            a1.TimeScaled = true
            v2()
            u15:Play()
            TweenService_2:Create(u9, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Volume = 0}):Play()
            task.delay(1, function() -- Line: 403 -- upvalues: u9 (upval)
                u9:Destroy()
            end)
        end)
    end,
    onLeave = function(a1) end,
}
v1.IceStorm = {
    name = "IceStorm",
    onEnter = function(a1) -- Line: 413 -- upvalues: EasySound (val)
        a1:playAnimation("IceStorm")
        EasySound.Play({
            id = 103021026949087,
            destroyOnEnd = true,
            soundGroupName = "Enemies",
            parent = a1.Model.PrimaryPart,
        })
    end,
}
v1.Summon = {
    name = "Summon",
    onEnter = function(a1) -- Line: 427
        -- upvalues: EasySound (val), ReplicatedStorage (val), CurrentCamera (val), RunService (val), GameState (val)
        local SummonTime = a1.Stats.Moveset.Summon.SummonTime
        local u8 = a1:playAnimation("SummonIntro")
        ;(u8:GetMarkerReachedSignal("Pause")):Connect(function() -- Line: 431 -- upvalues: u8 (val)
            u8:AdjustSpeed(0)
        end)
        EasySound.Play({
            id = 75818865677869,
            destroyOnEnd = true,
            soundGroupName = "Enemies",
            parent = a1.Model.PrimaryPart,
        })
        local u30 = ReplicatedStorage.Assets.Effects.Particles.VoidStorm:Clone()
        u30.Position = a1.Model.PrimaryPart.Position
        u30.Parent = CurrentCamera
        local u38 = EasySound.Play({id = 129001330597344, looped = true, volume = 0, parent = u30})
        local u39 = 0
        local u40 = 0
        local CFrame = a1.Model.PrimaryPart.CFrame
        local u44 = true
        local u45 = nil
        u45 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 459
            -- upvalues: u44 (ref), a1 (val), u45 (ref), CFrame (ref), u40 (ref), GameState (upval), u39 (ref)
            -- upvalues: u38 (val), u30 (val)
            local v1 = if not u44 then 0 else 1
            if a1.Model and a1.Model.Parent then
                local v2
                local CFrame_2 = a1.Model.PrimaryPart.CFrame
                if not u44 then
                    v2 = CFrame
                else
                    CFrame = CFrame_2 * CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)
                end
                u40 = math.lerp(u40, v1, a1_2 * GameState.TimeScale * 5)
                u39 = u39 + math.rad(u40 * 180) * a1_2 * GameState.TimeScale
                u38.Volume = u40
                u30.CFrame = v2 * CFrame.Angles(u39, 0, 0)
                return
            end
            u45:Disconnect()
        end)
        a1:Wait(SummonTime)
        u8:Stop()
        a1:playAnimation("SummonOutro")
        for i, v in ipairs(u30:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = false
            end
        end
        task.delay(2, function() -- Line: 495 -- upvalues: u45 (ref), u30 (val)
            u45:Disconnect()
            u30:Destroy()
        end)
    end,
}
return v1