-- Script path: ReplicatedStorage.Content.NewEnemies.Korblox Deathwalker.Animator.KorbloxDeathwalkerAnimatorStates
-- Decompile time: 8.48 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u57 = RaycastParams.new()
u57.FilterType = Enum.RaycastFilterType.Include
local v1 = {}
local Map = workspace:FindFirstChild("Map")
if Map then
    table.insert(v1, Map)
end
local Ground = workspace:FindFirstChild("Ground")
if Ground then
    table.insert(v1, Ground)
end
u57.FilterDescendantsInstances = v1
local Deathwalker = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Mob")):WaitForChild("Deathwalker")

local function tweenBeam(a1, a2, a3) -- Line: 35
    -- upvalues: TweenService (val)
    return TweenService:Create(a1, a2, {Width0 = a3, Width1 = a3})
end

local function setBeamWidth(a1, a2) -- Line: 42 -- types: a1: userdata, a2: number
    a1.Width0 = a2
    a1.Width1 = a2
end

local function enableParticles(a1, a2) -- Line: 47 -- types: a1: userdata, a2: boolean
    for k, v in pairs(a1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v.Enabled = a2
        end
    end
end

local function createBeam(a1) -- Line: 55
    -- upvalues: ReplicatedStorage (val), enableParticles (val), TweenService (val), TimescaleUtilities (val)
    -- upvalues: Shaker (val)
    local v1 = ReplicatedStorage.Assets.Effects.Particles.KorbloxDeathBeam:Clone()
    v1:PivotTo((CFrame.new(a1)))
    v1.Parent = workspace
    local Position = v1.BeamStart.Position
    local Beam1End = v1.Beam1End
    local Beam2End = v1.Beam2End
    local Position_2 = Beam1End.Position
    local CenterBeam = Beam1End.Attachment.CenterBeam
    for k, v in pairs(v1:GetDescendants()) do
        if v:IsA("Attachment") then
            enableParticles(v, false)
        end
    end
    Beam1End.Position = Position
    Beam2End.Position = Position
    CenterBeam.Width0 = 2
    CenterBeam.Width1 = 2
    local v2 = 0.2
    TweenService:Create(Beam1End, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2), Enum.EasingStyle.Linear), {Position = Position_2}):Play()
    local WhiteBeam = Beam2End.BeamAttachment.WhiteBeam
    WhiteBeam.Width0 = 12
    WhiteBeam.Width1 = 12
    local BlackBeam = Beam2End.BeamAttachment.BlackBeam
    BlackBeam.Width0 = 10
    BlackBeam.Width1 = 10
    local ColorBeam = Beam2End.BeamAttachment.ColorBeam
    ColorBeam.Width0 = 20
    ColorBeam.Width1 = 20
    Shaker:Shake({15, 15, 0, 1.5}, 0, 4)
    TimescaleUtilities.Wait(v2)
    v2 = 0.1
    TweenService:Create(CenterBeam, TweenInfo.new(v2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Width0 = 0.5, Width1 = 0.5}):Play()
    TweenService:Create(CenterBeam, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Width0 = 0.5, Width1 = 0.5}):Play()
    TimescaleUtilities.Wait(v2)
    v2 = 0.1
    TweenService:Create(CenterBeam, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Width0 = 2, Width1 = 2}):Play()
    TimescaleUtilities.Wait(v2)
    v2 = 0.1
    TweenService:Create(CenterBeam, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Width0 = 12, Width1 = 12}):Play()
    TimescaleUtilities.Wait(v2)
    v2 = 0.15
    Beam2End.PointLight.Brightness = 12
    Beam2End.PointLight.Range = 9
    Beam2End.Aura1.ParticleEmitter.Enabled = true
    Beam2End.Aura1.ParticleEmitter.Enabled = true
    TweenService:Create(Beam2End, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Position = Position_2}):Play()
    TimescaleUtilities.Wait(v2)
    for k2, i in pairs(v1:GetDescendants()) do
        if i:IsA("Attachment") then
            enableParticles(i, true)
        end
    end
    TimescaleUtilities.Wait(3)
    v2 = 2.5
    TweenService:Create(CenterBeam, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Width0 = 0, Width1 = 0}):Play()
    TweenService:Create(Beam2End.BeamAttachment.WhiteBeam, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Width0 = 0, Width1 = 0}):Play()
    TweenService:Create(Beam2End.BeamAttachment.ColorBeam, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Width0 = 0, Width1 = 0}):Play()
    TweenService:Create(Beam2End.BeamAttachment.BlackBeam, TweenInfo.new(TimescaleUtilities.GetScaledTime(v2)), {Width0 = 0, Width1 = 0}):Play()
    TweenService:Create(
        Beam2End.PointLight,
        TweenInfo.new(v2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        {Brightness = 0, Range = 9}
    ):Play()
    for k3, j in pairs(v1:GetDescendants()) do
        if j:IsA("Attachment") then
            enableParticles(j, false)
        end
    end
    TimescaleUtilities.Wait(5)
    return v1
end

local v2 = {}
local v3 = {
    name = "Death",
    onEnter = function(a1) -- Line: 181 -- upvalues: EasySound (val), TimescaleUtilities (val), TweenService (val), createBeam (val)
        a1:animate("Death")
        local HumanoidRootPart = a1.Model:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            local v1, v2
            local v3 = HumanoidRootPart.Position - Vector3.new(0, 3.5, 0)
            if HumanoidRootPart:FindFirstChild("DeathSound") and HumanoidRootPart.DeathSound:IsA("Sound") then
                EasySound.Play({
                    destroyOnEnd = true,
                    soundGroupName = "Enemies",
                    id = HumanoidRootPart.DeathSound.SoundId,
                    volume = HumanoidRootPart.DeathSound.Volume,
                    playbackSpeed = HumanoidRootPart.DeathSound.PlaybackSpeed,
                    parent = HumanoidRootPart,
                })
            end
            TimescaleUtilities.Wait(2)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if not v:IsA("BasePart") then
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = false
                    end
                elseif v.Transparency ~= 1 then
                    v2 = TweenService
                    v1 = TweenInfo.new(TimescaleUtilities.GetScaledTime(5), Enum.EasingStyle.Linear)
                    v2:Create(v, v1, {Transparency = 1}):Play()
                elseif v:IsA("ParticleEmitter") then
                    v.Enabled = false
                end
            end
            createBeam(v3):Destroy()
        end
    end,
}
local v4 = {
    name = "Swing",
    onEnter = function(a1, a2) -- Line: 224
        -- upvalues: EasySound (val), TimescaleUtilities (val), Deathwalker (val), EmitterManager (val)
        local v1 = a1:face(a2)
        a1:animate("Swing")
        EasySound.Play({
            id = 113103568722739,
            volume = 1.5,
            soundGroupName = "Enemies",
            parent = a1.Model.HumanoidRootPart,
        })
        TimescaleUtilities.Delay(1, function() -- Line: 235 -- upvalues: Deathwalker (upval), a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            local v1 = Deathwalker.SlashEffect:Clone()
            v1:PivotTo((a1.Model:GetPivot()) * CFrame.Angles(0, 1.5707963267948966, 0) - Vector3.new(0, -1, 0))
            EmitterManager.manualEmit(v1)
            local Trash = workspace:FindFirstChild("Trash")
            if not Trash then
                v1.Parent = workspace
            else
                v1.Parent = Trash
            end
            TimescaleUtilities.CleanUp(v1, 3)
        end)
        TimescaleUtilities.Wait(2.1)
        a1.Rotation = CFrame.new() * v1.Rotation
    end,
}
local v5 = {
    name = "Meteor",
    onEnter = function(a1, a2, a3) -- Line: 259
        -- upvalues: EasySound (val), TimescaleUtilities (val), Deathwalker (val), EmitterManager (val), Debris (val)
        local v1 = a1:face(a2)
        a1:animate("MeteorSummon")
        EasySound.Play({
            id = 135131971045465,
            volume = 1.5,
            soundGroupName = "Enemies",
            parent = a1.Model.HumanoidRootPart,
        })
        for i, v in ipairs(a3) do
            TimescaleUtilities.Delay(v.openTime - 0.5, function() -- Line: 271
                -- upvalues: Deathwalker (upval), v (val), EmitterManager (upval), Debris (upval), EasySound (upval)
                local v1 = Deathwalker.RuneExplosion:Clone()
                v1.Parent = workspace.CurrentCamera
                v1.Position = v.cframe.Position
                EmitterManager.manualEmit(v1)
                Debris:AddItem(v1, 3)
                EasySound.Play({id = 122944221169670, volume = 0.5, soundGroupName = "Enemies", parent = v1})
            end)
        end
        TimescaleUtilities.Wait(2.6)
        a1.Rotation = CFrame.new() * v1.Rotation
    end,
}
local v6 = {
    name = "LaserBeam",
    onEnter = function(a1, a2) -- Line: 295
        -- upvalues: EasySound (val), TimescaleUtilities (val), Deathwalker (val), spr (val), Shaker (val), Create (val)
        -- upvalues: TweenService (val), RunService (val), GameState (val), u57 (val)
        a1:animate("LaserSweep")
        EasySound.Play({
            id = 70476105459425,
            volume = 1.5,
            soundGroupName = "Enemies",
            parent = a1.Model.HumanoidRootPart,
        })
        TimescaleUtilities.Wait(0.55)
        local u20 = Deathwalker.Beam:Clone()
        u20.Parent = workspace
        u20.Start:ScaleTo(0.001)
        local u27 = {progress = 0.001}
        spr.target(u27, 0.6, 8, {progress = 1})
        u20:PivotTo(a1.Model.HumanoidRootPart.CFrame)
        Shaker:Shake({1, 20, 0, 1.5}, 0.1, 7)
        local u60 = a1.Model.HumanoidRootPart.CFrame * CFrame.new(0, 0.25, 0)
        local u61 = 0
        local u62 = nil
        local u63 = false
        local u65 = CFrame.new()
        local NumberValue = Create("NumberValue")
        local NumberValue_2 = Create("NumberValue")
        NumberValue_2.Value = 1
        TweenService:Create(NumberValue, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 1}):Play()
        TweenService:Create(u20.EndPart.Light.PointLight, TweenInfo.new(0.1), {Brightness = 11}):Play()
        u62 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 346
            -- upvalues: GameState (upval), u61 (ref), a2 (val), NumberValue_2 (val), u63 (ref), TweenService (upval)
            -- upvalues: NumberValue (val), TimescaleUtilities (upval), u20 (val), u62 (ref), spr (upval), u27 (val)
            -- upvalues: a1 (val), u60 (val), u57 (upval), u65 (ref)
            local v1 = a1_2 * GameState.TimeScale
            u61 = u61 + v1 * a2.AnglePerSecond * NumberValue_2.Value
            if a2.Angle <= u61 and not u63 then
                u63 = true
                TweenService:Create(NumberValue, TweenInfo.new(1.06, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0}):Play()
                TimescaleUtilities.Delay(1, function() -- Line: 368 -- upvalues: u20 (upval), u62 (upval)
                    u20:Destroy()
                    u62:Disconnect()
                    u62 = nil
                end)
                for i, j in u20.EndPart:GetDescendants() do
                    if j:IsA("Beam") or j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                end
                TweenService:Create(
                    u20.EndPart.Light.PointLight,
                    TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
                TweenService:Create(NumberValue_2, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0}):Play()
                spr.target(u27, 1, 1, {progress = 0.001})
            end
            u20.Start:PivotTo(a1.Model.Torso.CFrame)
            u20.Start:ScaleTo(u27.progress)
            local v2 = u60 * CFrame.Angles(0, math.rad(-u61), 0) * CFrame.Angles(-math.rad(a2.spreadAngleStart - 0), 0, 0)
            local v3 = workspace:Raycast(v2.Position, v2.LookVector * a2.BeamRange, u57)
            local Value = NumberValue.Value
            u65 = v2:Lerp(if not v3 then v2 * CFrame.new(0, 0, -a2.BeamRange) else CFrame.new(v3.Position), Value)
            u20.EndPart.CFrame = u65
        end)
        a1.Maid:Mark(u62)
    end,
}
v2[1] = {
    name = "Walk",
    onEnter = function(a1) end,
}
v2[2] = v3
v2[3] = v4
v2[4] = v5
v2[5] = v6
return v2