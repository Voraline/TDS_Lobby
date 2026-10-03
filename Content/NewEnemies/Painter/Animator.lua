-- Script path: ReplicatedStorage.Content.NewEnemies.Painter.Animator
-- Decompile time: 3.77 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local CurrentCamera = workspace.CurrentCamera
local v1 = {}
v1.__index = v1

local function createPaintBullet(a1, a2) -- Line: 14
    -- upvalues: ReplicatedStorage (val)
    local v1 = ReplicatedStorage.Assets.Effects.Projectile.PaintBullet:Clone()
    v1.Size = a1
    v1.Color = a2
    local v2 = Vector3.new(0, 1, 0) * (a1.Y / 2 + 0.15)
    v1.Attachment.Top.Position = v2
    v1.Attachment.Bottom.Position = -v2
    for i, j in v1:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Trail") then
            j.Color = ColorSequence.new(a2)
        end
    end
    return v1
end

local function adjustAnimationToLength(a1, a2, a3) -- Line: 29 -- types: a2: number, a3: number?
    local v1 = tick() + (a3 or 1)
    local Controller = a1.Controller
    while Controller.Length == 0 do
        if v1 < tick() then
            return
        end
        task.wait()
    end
    a1:AdjustSpeed(Controller.Length / a2)
end

function v1.Initialize(a1) -- Line: 41
    -- upvalues: Animation (val), adjustAnimationToLength (val), TimescaleUtilities (val), createPaintBullet (val)
    -- upvalues: CurrentCamera (val), TweenService (val), EmitterManager (val), Debris (val)
    local v1
    local Value = a1.Model:WaitForChild("Start").Value
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local u17 = {}
    for i, j in Animations:GetChildren() do
        if j:IsA("Animation") then
            v1 = Animation.new({Preload = true, Target = AnimationController, Track = j, Entity = a1})
            u17[j.Name] = v1
        end
    end
    local Face = a1.Model:WaitForChild("Face")

    local function changeFace(a1) -- Line: 61 -- upvalues: Face (val) -- types: a1: number
        for i, j in Face:GetChildren() do
            if j:IsA("Decal") then
                if j.Name == ("Face%*"):format(a1) then
                    j.Transparency = 0
                else
                    j.Transparency = 1
                end
            end
        end
    end

    ;(a1.Replicator:GetStateChangedSignal("Face")):Connect(changeFace)
    changeFace(a1.Replicator:Get("Face"))
    a1.Executables = {
        Death = function() -- Line: 77 -- upvalues: u17 (val)
            u17.Death:Play()
        end,
        Projectile = function(a1_2, a2) -- Line: 80
            -- upvalues: a1 (val), u17 (val), adjustAnimationToLength (upval), TimescaleUtilities (upval)
            -- upvalues: createPaintBullet (upval), CurrentCamera (upval), Value (val), TweenService (upval)
            -- upvalues: EmitterManager (upval), Debris (upval)
            local v1, v2
            local PaintSplatter = a1.Stats.Abilities.PaintSplatter
            local AttackTime = PaintSplatter.AttackTime
            local v3 = AttackTime * 0.6
            local HitscanRadius = PaintSplatter.HitscanRadius
            a1:Face(a1_2, (TweenInfo.new(v3 * 0.75)))
            local Attack = u17.Attack
            if Attack then
                Attack:Play()
                adjustAnimationToLength(Attack, AttackTime)
            end
            TimescaleUtilities.Wait(v3)
            local v4 = Vector3.new(HitscanRadius / 4, HitscanRadius / 4, HitscanRadius)
            local u44 = createPaintBullet(v4, Color3.new(0, 0, 1))
            u44.Parent = CurrentCamera
            u44.CFrame = CFrame.lookAt(Value.WorldPosition, a1_2.Position)
            local v5 = TweenService:Create(u44, TweenInfo.new(a2, Enum.EasingStyle.Linear), {CFrame = a1_2})
            v5:Play()
            v5.Completed:Once(function() -- Line: 109 -- upvalues: u44 (val), EmitterManager (upval), Debris (upval)
                u44.Transparency = 1
                EmitterManager.toggle(u44, false, "ParticleEmitter")
                Debris:AddItem(u44, 2)
            end)
            TimescaleUtilities.Wait(a2)
            local v6 = PaintSplatter.SpreadRadius / PaintSplatter.SpreadPower
            local v7 = 0
            local v8 = {
                Color3.fromRGB(255, 0, 0),
                Color3.fromRGB(0, 255, 0),
                Color3.fromRGB(0, 255, 255),
                (Color3.fromRGB(255, 255, 0)),
            }
            local SpreadCount = PaintSplatter.SpreadCount
            for i = 1, SpreadCount do
                v7 = v7 + 360 / PaintSplatter.SpreadCount
                v1 = a1_2 * CFrame.Angles(0, math.rad(v7), 0) * CFrame.new(0, 0, -PaintSplatter.SpreadRadius)
                local u136 = createPaintBullet(v4, v8[i % #v8 + 1])
                u136.CFrame = CFrame.lookAt(a1_2.Position, v1.Position)
                v2 = TweenService:Create(u136, TweenInfo.new(v6, Enum.EasingStyle.Linear), {CFrame = v1})
                v2:Play()
                v2.Completed:Once(function() -- Line: 142 -- upvalues: u136 (val), EmitterManager (upval), Debris (upval)
                    u136.Transparency = 1
                    EmitterManager.toggle(u136, false, "ParticleEmitter")
                    Debris:AddItem(u136, 2)
                end)
                u136.Parent = CurrentCamera
            end
        end,
        Summon = function() -- Line: 150 -- upvalues: u17 (val), adjustAnimationToLength (upval), a1 (val)
            local Summon = u17.Summon
            if Summon then
                Summon:Play()
                adjustAnimationToLength(Summon, a1.Stats.Abilities.Summon.SummonTime)
            end
        end,
    }
end

return v1