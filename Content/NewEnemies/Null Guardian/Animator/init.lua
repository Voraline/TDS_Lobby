-- Script path: ReplicatedStorage.Content.NewEnemies.Null Guardian.Animator
-- Decompile time: 4.32 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NullGuardianSounds = require(script:WaitForChild("NullGuardianSounds"))
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local NullGuardian = ReplicatedStorage.Assets.Effects.Mob.NullGuardian
local CorruptedPyromancer = ReplicatedStorage.Assets.Effects.Mob.CorruptedPyromancer
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 18
    -- upvalues: StateManager (val), Animation (val), RunService (val), TweenService (val), EmitterManager (val)
    -- upvalues: Debris (val), NullGuardian (val), EasySound (val), NullGuardianSounds (val)
    local v1
    local Animations = a1.Model.Animations
    a1.stateManager = StateManager.new()
    a1.stateManager:addStates((require(script:WaitForChild("NullGuardianAnimatorStates"))))
    a1.animations = {}
    a1.sounds = {}
    a1._nullAuraTowers = {}
    a1._nullBubbleTowers = {}
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = j,
            Target = a1.Model.AnimationController.Animator,
            Speed = j:GetAttribute("Speed") or nil,
        })
        a1.animations[j.Name] = v1
    end
    a1:animate("WalkAnimation")
    a1.Maid:Mark(function() -- Line: 43 -- upvalues: a1 (val)
        if a1._nullBubbleEffect then
            a1._nullBubbleEffect:Destroy()
        end
    end)
    a1.Maid:Mark(function() -- Line: 49 -- upvalues: a1 (val)
        a1:clearTowerEffects()
        a1:clearTowerEffects(true)
    end)
    local Animator = a1.Model.AnimationController.Animator
    a1.Maid:Mark((RunService.PreAnimation:Connect(function() -- Line: 55 -- upvalues: Animator (val), a1 (val)
        if #Animator:GetPlayingAnimationTracks() == 0 then
            a1:animate("WalkAnimation")
        end
    end)))
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 64 -- upvalues: a1 (val) -- types: a1_2: string
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
        PathChange = function(a1_2, a2) -- Line: 68 -- upvalues: a1 (val)
            a1.PathName = a1_2
            a1.PathDistance = a2
            a1:RefreshPath(nil, nil, true)
        end,
        CastNullBubble = function(a1_2) -- Line: 74
            -- upvalues: a1 (val), TweenService (upval), EmitterManager (upval), Debris (upval), NullGuardian (upval)
            -- upvalues: EasySound (upval), NullGuardianSounds (upval)
            local v1
            if a1._nullBubbleEffect then
                local _nullBubbleEffect = a1._nullBubbleEffect
                TweenService:Create(_nullBubbleEffect, TweenInfo.new(2), {Transparency = 1}):Play()
                EmitterManager.toggle(_nullBubbleEffect, false)
                Debris:AddItem(_nullBubbleEffect, 3)
                a1._nullBubbleEffect = nil
            end
            local v2 = NullGuardian.NullBubble:Clone()
            local v3 = RaycastParams.new()
            v3.FilterType = Enum.RaycastFilterType.Exclude
            v3.FilterDescendantsInstances = {a1.Model, workspace:WaitForChild("Towers")}
            local v4 = workspace:Raycast(a1_2, Vector3.new(0, -20, 0), v3)
            if not v4 then
                v2.CFrame = CFrame.new(a1_2 - Vector3.new(0, 1, 0))
            else
                v2.CFrame = CFrame.new(v4.Position + Vector3.new(0, 1.100000023841858, 0))
            end
            v2.Parent = workspace.CurrentCamera
            a1._nullBubbleEffect = v2
            EmitterManager.toggle(v2, true)
            EasySound.Play({
                volume = 1,
                destroyOnEnd = true,
                id = NullGuardianSounds.CastNullBubble,
                parent = a1.Model.PrimaryPart,
            })
            a1:Wait(0.5)
            EasySound.Play({volume = 0.5, looped = true, id = NullGuardianSounds.NullBubbleLoop, parent = v2})
            local Size = v2.Size
            v2.Size = Vector3.new(0, 0, 0)
            TweenService:Create(v2, TweenInfo.new(1.5), {Size = Size}):Play()
            a1:Wait(1.5)
            EmitterManager.toggle(v2, false)
            for i, j in {"PixelBorder", "BorderGlow"} do
                v1 = v2:FindFirstChild(j, true)
                if v1 and v1:IsA("ParticleEmitter") then
                    v1.Enabled = true
                end
            end
        end,
        CastNullBubbleModels = function(a1_2) -- Line: 124 -- upvalues: a1 (val)
            a1:clearTowerEffects()
            a1:addTowerEffects(a1_2)
        end,
        NullAura = function(a1_2) -- Line: 128
            -- upvalues: a1 (val), NullGuardian (upval), EmitterManager (upval), EasySound (upval)
            -- upvalues: NullGuardianSounds (upval)
            if not a1.Model:FindFirstChild("NullAura") then
                local v1 = NullGuardian.NullAura:Clone()
                v1:PivotTo(a1.Model.PrimaryPart.CFrame)
                local Motor6D = Instance.new("Motor6D")
                Motor6D.Part0 = a1.Model.PrimaryPart
                Motor6D.Part1 = v1.PrimaryPart
                Motor6D.C0 = (CFrame.new(0, -a1.Height + 1, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
                Motor6D.Parent = v1.PrimaryPart
                v1.Parent = a1.Model
                EmitterManager.toggle(v1, true)
                EasySound.Play({
                    volume = 0.5,
                    looped = true,
                    id = NullGuardianSounds.NullAura,
                    parent = v1.PrimaryPart,
                })
            end
            if a1_2 then
                a1:clearTowerEffects(true)
                a1:addTowerEffects(a1_2, true)
            end
        end,
    }
end

function v1:clearTowerEffects(a2) -- Line: 154 -- types: self: table, a2: boolean?
    local v1
    local v2 = pairs
    local _nullAuraTowers = if not a2 then self._nullBubbleTowers else self._nullAuraTowers
    local v3, v4 = a2, self
    for k, v in v2(_nullAuraTowers) do
        v1 = v:FindFirstChild(if not v3 then "NullBubbleEffect" else "NullAuraEffect")
        if v1 then
            v1:Destroy()
        end
    end
    if v3 then
        v4._nullAuraTowers = {}
        return
    end
    v4._nullBubbleTowers = {}
end

function v1:addTowerEffects(a2, a3) -- Line: 169
    -- upvalues: CorruptedPyromancer (val)
    local WeldConstraint, v1
    local v2, v3, v4 = a3, a2, self
    for k, v in pairs(a2) do
        v1 = CorruptedPyromancer.Burn:Clone()
        v1.Name = if not v2 then "NullBubbleEffect" else "NullAuraEffect"
        v1.Parent = v
        v1:PivotTo(v.PrimaryPart.CFrame)
        v1.Size = v:GetExtentsSize()
        WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = v1
        WeldConstraint.Part1 = v.PrimaryPart
        WeldConstraint.Parent = v1
    end
    if v2 then
        v4._nullAuraTowers = v3
        return
    end
    v4._nullBubbleTowers = v3
end

function v1:animate(a2, a3, a4) -- Line: 189 -- types: self: table, a2: string, a3: number?, a4: boolean?
    if not a4 then
        for i, j in self.animations do
            if j.Controller.IsPlaying then
                j:Stop()
            end
        end
    end
    local v1 = self.animations[a2]
    if v1 then
        v1:Play(a3 or 0.2, 1, 1)
    end
    return v1.Controller
end

return v1