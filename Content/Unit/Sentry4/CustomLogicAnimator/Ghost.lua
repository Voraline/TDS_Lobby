-- Script path: ReplicatedStorage.Content.Unit.Sentry4.CustomLogicAnimator.Ghost
-- Decompile time: 4.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u45 = {}
u45.__index = u45
local u47 = Random.new()

function u45:_bulletEffect(a2, a3) -- Line: 17
    -- upvalues: EasySound (val), TimescaleUtilities (val), TweenService (val), EmitterManager (val)
    local u89 = self.Model.PrimaryPart.Bullet:Clone()
    u89.Parent = workspace.Trash
    u89.CFrame = CFrame.new(a2, a3)
    local u90 = (a2 - a3).Magnitude * 0.01
    local v1 = EasySound.Create({
        id = 124258924980357,
        volume = 0.5,
        soundGroupName = "Towers",
        parent = self.Model.PrimaryPart,
    })
    v1:Play()
    TimescaleUtilities.CleanUp(v1, 2)
    self.NPC.Maid:Mark(u89)
    TweenService:Create(u89.Front, TweenInfo.new(u90, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {WorldPosition = a3}):Play()
    for i, j in u89:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
            j.Enabled = true
        end
    end
    TimescaleUtilities.Delay(u90 * 0.5, function() -- Line: 49
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

function u45.Initialize(a1, a2) -- Line: 66
    -- upvalues: u45 (val), Animation (val), EmitterManager (val), u47 (val), Bezier (val), ReplicatedStorage (val)
    -- upvalues: RunService (val), GameState (val), TimescaleUtilities (val), TweenService (val)
    local u2 = {}
    setmetatable(u2, u45)
    u2.NPC = a2
    u2.Model = a2.Model
    u2.Model.PrimaryPart.Build:Play()
    u2._animations = {}
    Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Track = u2.Model.Animations.Idle,
        Target = (u2.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
    }):Play(0)
    for i, j in u2.Model.Animations.Shoot:GetChildren() do
        u2._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Track = j,
            Target = (u2.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
        }))
    end
    u2._armShooting = 0
    u2.NPC:Thread(function() -- Line: 94 -- upvalues: u2 (val), EmitterManager (upval)
        local v1 = u2.NPC:FindTarget()
        if v1 then
            local v2 = u2
            v2._armShooting = v2._armShooting + 1
            if 2 < u2._armShooting then
                u2._armShooting = 1
            end
            u2._animations[if u2._armShooting ~= 1 then "Right" else "Left"]:Play(0)
            EmitterManager.manualEmit(u2.Model[v2].Value)
            u2:_bulletEffect(u2.Model[v2].Value.WorldPosition, v1.PrimaryPart.Position)
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
        Projectile = function(a1, a2, a3) -- Line: 123
            -- upvalues: u2 (val), u47 (upval), Bezier (upval), ReplicatedStorage (upval), RunService (upval)
            -- upvalues: GameState (upval), EmitterManager (upval), TimescaleUtilities (upval)
            local PrimaryPart = a1.PrimaryPart
            if not PrimaryPart then
                return
            end
            local Position = PrimaryPart.Position
            local v1 = (u2.Model.PrimaryPart.Position + Position) / 2
            local v2 = {
                u2.Model.PrimaryPart.Position,
                u2.Model.PrimaryPart.Position + Vector3.new(0, 5, 0),
                v1 + Vector3.new(u47:NextNumber(-5, 5), 5, (u47:NextNumber(-5, 5))),
                Position + Vector3.new(0, 0, 0),
            }
            local u45 = Bezier.new(unpack(v2))
            local u51 = ReplicatedStorage.Assets.GhostExplosionBall:Clone()
            u51.CFrame = CFrame.new(PrimaryPart.Position + Vector3.new(0, 6, 0))
            u51.Parent = workspace.Trash
            u2.Model.PrimaryPart.Rocket:Play()
            u2.Model.PrimaryPart.Rocket.PlaybackSpeed = u47:NextNumber(0.9, 1.1)
            local u76 = nil
            local u77 = 0
            local v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 151
                -- upvalues: u77 (ref), GameState (upval), u76 (ref), ReplicatedStorage (upval), PrimaryPart (val)
                -- upvalues: EmitterManager (upval), TimescaleUtilities (upval), u51 (val), u45 (val), Position (val)
                u77 = u77 + a1 * 2 * GameState.TimeScale
                if not (u77 >= 1) then
                    u51.CFrame = CFrame.new(u45:Get((math.clamp(u77, 0, 1))), Position)
                    return
                end
                u76:Disconnect()
                local v1 = ReplicatedStorage.Assets.GhostExplosion:Clone()
                v1.CFrame = CFrame.new(PrimaryPart.Position)
                v1.Parent = workspace.Trash
                EmitterManager.manualEmit(v1)
                TimescaleUtilities.CleanUp(v1, 2)
                u51.Transparency = 1
                for i, j in u51:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(u51, 2)
            end)
        end,
        Shield = function(a1) -- Line: 180 -- upvalues: u2 (val), Scale (val), TweenService (upval)
            local Shield = u2.Model:WaitForChild("Shield")
            local Mesh = Shield:WaitForChild("Mesh")
            local Decal = Shield:WaitForChild("Decal")
            local Effect = Shield:WaitForChild("Effect")
            local v1 = a1 and Scale or Vector3.new(0, 0, 0)
            if not a1 then
                local Attribute
                Shield.Pop:Play()
                for k, v in pairs(Effect:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        Attribute = v:GetAttribute("EmitCount")
                        if Attribute then
                            v:Emit(Attribute)
                        end
                    end
                end
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

return u45