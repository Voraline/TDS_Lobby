-- Script path: ReplicatedStorage.Content.Unit.Sentry3.CustomLogicAnimator.Springtime
-- Decompile time: 3.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u30 = {}
u30.__index = u30

function u30:_bulletEffect(a2, a3) -- Line: 12
    -- upvalues: EasySound (val), TimescaleUtilities (val), TweenService (val), EmitterManager (val)
    local u89 = self.Model.PrimaryPart.Bullet:Clone()
    u89.Parent = workspace.Trash
    u89.CFrame = CFrame.new(a2, a3)
    local u90 = (a2 - a3).Magnitude * 0.01
    local v1 = EasySound.Create({
        id = 79078868818529,
        volume = 0.5,
        soundGroupName = "Towers",
        parent = self.Model.PrimaryPart,
    })
    v1:Play()
    TimescaleUtilities.CleanUp(v1, 2)
    TweenService:Create(u89.Front, TweenInfo.new(u90, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {WorldPosition = a3}):Play()
    for i, j in u89:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
            j.Enabled = true
        end
    end
    self.NPC.Maid:Mark(u89)
    TimescaleUtilities.Delay(u90 * 0.5, function() -- Line: 43
        -- upvalues: self (val), a3 (val), EmitterManager (upval), TimescaleUtilities (upval), TweenService (upval)
        -- upvalues: u89 (val), u90 (val)
        local v1 = self.Model.PrimaryPart.Hit:Clone()
        v1.Parent = workspace.Trash
        v1.CFrame = CFrame.new(a3)
        EmitterManager.manualEmit(v1)
        TimescaleUtilities.CleanUp(v1, 2)
        TweenService:Create(u89.Back, TweenInfo.new(u90, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {WorldPosition = a3}):Play()
        TimescaleUtilities.CleanUp(u89, u90)
    end)
end

function u30.Initialize(a1, a2) -- Line: 60
    -- upvalues: u30 (val), Animation (val), EmitterManager (val), EasySound (val), TweenService (val)
    local u2 = {}
    setmetatable(u2, u30)
    u2.NPC = a2
    u2.Model = a2.Model
    u2.Model.PrimaryPart.Build:Play()
    local u14 = false
    task.spawn(function() -- Line: 69 -- upvalues: Animation (upval), u2 (val), u14 (ref)
        local v1 = Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = u2.Model.Animations.Idle,
            Target = (u2.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
        })
        Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Track = u2.Model.Animations.Build,
            Target = (u2.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
        }):Play(0)
        u2.NPC:Delay(1.1)
        v1:Play(0)
        u14 = true
    end)
    u2.NPC:Thread(function() -- Line: 88 -- upvalues: u2 (val), u14 (ref), EmitterManager (upval)
        local v1 = u2.NPC:FindTarget()
        if v1 and u14 then
            local Value = u2.Model.Start.Value
            EmitterManager.manualEmit(Value)
            u2:_bulletEffect(Value.WorldPosition, v1.PrimaryPart.Position)
            u2.NPC:Face(v1.PrimaryPart.Position)
            u2.NPC:Delay(u2.NPC.Cooldown)
        end
    end)
    local Scale = (u2.Model:WaitForChild("Shield")):WaitForChild("Mesh").Scale
    local Mesh = (u2.Model:WaitForChild("Shield")):WaitForChild("Mesh")
    Mesh.Scale = Vector3.new(0, 0, 0)
    local Decal = (u2.Model:WaitForChild("Shield")):WaitForChild("Decal")
    Decal.Transparency = 1
    u2.NPC.Executables = {
        Shield = function(a1) -- Line: 108
            -- upvalues: u2 (val), Scale (val), EasySound (upval), EmitterManager (upval), TweenService (upval)
            local Shield = u2.Model:WaitForChild("Shield")
            local Mesh = Shield:WaitForChild("Mesh")
            local Decal = Shield:WaitForChild("Decal")
            local Effect = Shield:FindFirstChild("Effect")
            local VFX = Shield:FindFirstChild("VFX")
            local v1 = a1 and Scale or Vector3.new(0, 0, 0)
            if not a1 then
                local Pop = Shield:FindFirstChild("Pop")
                if Pop and Pop:IsA("Sound") then
                    EasySound.Play({
                        destroyOnEnd = true,
                        audioGroup = "Towers",
                        id = Pop.SoundId,
                        parent = Shield,
                        volume = Pop.Volume,
                    })
                end
                if Effect then
                    local Attribute
                    for k, v in pairs(Effect:GetChildren()) do
                        if v:IsA("ParticleEmitter") then
                            Attribute = v:GetAttribute("EmitCount")
                            if Attribute then
                                v:Emit(Attribute)
                            end
                        end
                    end
                end
                if VFX then
                    EmitterManager.toggle(VFX, false)
                end
            elseif a1 and VFX then
                EmitterManager.toggle(VFX, true)
            end
            TweenService:Create(Mesh, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0), {Scale = v1}):Play()
            TweenService:Create(
                Decal,
                TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = if not a1 then 1 else 0.8}
            ):Play()
        end,
    }
end

return u30