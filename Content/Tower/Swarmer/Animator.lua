-- Script path: ReplicatedStorage.Content.Tower.Swarmer.Animator
-- Decompile time: 4.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
local Effects = ReplicatedStorage.Assets.Effects
local Game = SettingsController.Game
v1.__index = v1
local u41 = {Default = {BeeGrenade = 139814454216572, GunShoot = 92902966179654, Throw = 89892429755765}}
local u47 = Random.new()

function v1:_playAnimation(a2, a3) -- Line: 27 -- types: self: table, a2: string
    return self:Animate(a2, nil, {a3 or 0.1})
end

function v1.Initialize(a1) -- Line: 31
    -- upvalues: EasySound (val), u41 (val), Effects (val), ItemDrop (val), Game (val), EmitterManager (val), u47 (val)
    -- upvalues: TimescaleUtilities (val), EffectsController (val)
    a1._repositionToken = 0
    if a1.Replicator and a1.Replicator.GetStateChangedSignal then
        a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 35 -- upvalues: a1 (val)
            local v1 = a1
            v1._repositionToken = v1._repositionToken + 1
        end)))
    end
    a1.Executables = {
        Face = function(a1_2) -- Line: 41 -- upvalues: a1 (val)
            a1:Face(a1_2, TweenInfo.new(0.45), true)
        end,
        BeeGrenade = function(a1_2) -- Line: 45
            -- upvalues: a1 (val), EasySound (upval), u41 (upval), Effects (upval), ItemDrop (upval), Game (upval)
            -- upvalues: EmitterManager (upval), u47 (upval), TimescaleUtilities (upval), EffectsController (upval)
            a1:_playAnimation("Throw")
            a1:Delay(0.2)
            EasySound.Play({
                volume = 0.25,
                playbackSpeed = 0.87,
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = u41[a1.Model.Name].Throw,
                parent = a1.Model.PrimaryPart,
            })
            local u29 = Effects.Projectile.BeeGrenade:Clone()
            u29.Position = a1_2.startPosition
            u29.Parent = workspace
            ;(ItemDrop.Drop(a1_2.startPosition, a1_2.endPosition, u29, a1_2.dtMultiplier, a1_2.gravity, a1_2.speed, function(a1, a2, a3) -- Line: 69
                return (CFrame.new(a3, a2)).Rotation * CFrame.Angles(math.rad(a1 * 150), 0, 0)
            end)):andThen(function() -- Line: 73
                -- upvalues: Game (upval), Effects (upval), a1_2 (val), EmitterManager (upval), EasySound (upval)
                -- upvalues: u41 (upval), a1 (upval), u47 (upval), TimescaleUtilities (upval), EffectsController (upval)
                -- upvalues: u29 (val)
                if not Game:Get("HQ Explosions") then
                    EffectsController.Explosion({Radius = 5, Position = a1_2.endPosition})
                    EasySound.Play({
                        volume = 0.25,
                        destroyOnEnd = true,
                        audioGroup = "Towers",
                        id = u41[a1.Model.Name].BeeGrenade,
                        parent = a1_2.endPosition,
                        playbackSpeed = u47:NextNumber(0.9, 1.1),
                    })
                else
                    local v1 = Effects.Particles.HoneyExplosion:Clone()
                    v1.Parent = workspace
                    v1.Position = a1_2.endPosition + Vector3.new(0, 0.05000000074505806, 0)
                    EmitterManager.manualEmit(v1)
                    EasySound.Play({
                        volume = 0.25,
                        destroyOnEnd = true,
                        audioGroup = "Towers",
                        id = u41[a1.Model.Name].BeeGrenade,
                        parent = v1,
                        playbackSpeed = u47:NextNumber(0.9, 1.1),
                    })
                    TimescaleUtilities.CleanUp(v1, 4)
                end
                for i, j in u29:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                end
                u29.Transparency = 1
                TimescaleUtilities.CleanUp(u29, 4)
            end)
        end,
        GunProjectile = function(a1_2) -- Line: 117
            -- upvalues: Game (upval), Effects (upval), a1 (val), ItemDrop (upval), EmitterManager (upval)
            -- upvalues: TimescaleUtilities (upval)
            if not Game:Get("HQ Effects") then
                return
            end
            local u11 = Effects.Projectile.HoneyProjectile:Clone()
            u11.Position = a1_2.startPosition
            u11.Parent = workspace
            a1_2.startPosition = a1.Model.Configuration.GunAttachment.Value.WorldPosition
            ;(ItemDrop.Drop(a1_2.startPosition, a1_2.endPosition, u11, a1_2.dtMultiplier, a1_2.gravity, a1_2.speed, function(a1, a2, a3) -- Line: 136
                return (CFrame.new(a3, a2)).Rotation * CFrame.Angles(math.rad(a1 * 150), 0, 0)
            end)):andThen(function() -- Line: 140 -- upvalues: EmitterManager (upval), a1_2 (val), TimescaleUtilities (upval), u11 (val)
                EmitterManager.Emit("HoenyHit", CFrame.new(a1_2.endPosition), 1.25)
                TimescaleUtilities.CleanUp(u11, 3)
            end)
        end,
        Projectile = function(a1_2) -- Line: 146
            -- upvalues: a1 (val), EasySound (upval), u41 (upval), u47 (upval), TimescaleUtilities (upval)
            -- upvalues: ItemDrop (upval), EmitterManager (upval)
            if not a1.Model.Weapon:FindFirstChild("Beehive") then
                return
            end
            EasySound.Play({
                volume = 0.25,
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = u41[a1.Model.Name].Throw,
                parent = a1.Model.PrimaryPart,
                playbackSpeed = u47:NextNumber(0.9, 1),
            })
            local Beehive = a1.Model.Weapon.Beehive
            a1:Face(a1_2.endPosition, TweenInfo.new(0.25), true)
            local u46 = a1.Model.Weapon.Beehive:Clone()
            u46.Parent = workspace
            u46.Anchored = true
            for i, j in u46:GetChildren() do
                if j:IsA("RigidConstraint") then
                    j:Destroy()
                end
            end
            Beehive.Transparency = 1
            TimescaleUtilities.Delay(0.2, function() -- Line: 174 -- upvalues: Beehive (val)
                Beehive.Transparency = 0
            end)
            for k, n in u46.Trail:GetChildren() do
                if n:IsA("Trail") then
                    n.Enabled = true
                end
            end
            ;(ItemDrop.Drop(a1_2.startPosition, a1_2.endPosition, u46, a1_2.dtMultiplier, a1_2.gravity, a1_2.speed, function(a1, a2, a3) -- Line: 191
                return (CFrame.new(a3, a2)).Rotation * CFrame.Angles(math.rad(a1 * 250), 0, 0)
            end)):andThen(function() -- Line: 195 -- upvalues: EmitterManager (upval), a1_2 (val), u46 (val), TimescaleUtilities (upval)
                EmitterManager.Emit("HoenyHit", CFrame.new(a1_2.endPosition), 1)
                u46.Transparency = 1
                TimescaleUtilities.CleanUp(u46, 3)
            end)
        end,
    }
    a1:Thread(function() -- Line: 203 -- upvalues: a1 (val), EasySound (upval), u41 (upval), u47 (upval), EmitterManager (upval)
        local _repositionToken = a1._repositionToken
        local v1 = a1:FindTarget()
        if v1 then
            if _repositionToken ~= a1._repositionToken then
                return
            end
            local PrimaryPart = v1.PrimaryPart
            if not PrimaryPart then
                return
            end
            a1:_playAnimation("Fire")
            a1:Face(PrimaryPart.Position)
            local v2 = a1.Model.Configuration.GunEffects:FindFirstChild((math.clamp(a1:GetLevel(), 0, 4)))
            if v2 then
                EasySound.Play({
                    volume = 0.5,
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = u41[a1.Model.Name].GunShoot,
                    parent = a1.Model.PrimaryPart,
                    playbackSpeed = u47:NextNumber(0.9, 1.1),
                })
                EmitterManager.manualEmit(v2.Value)
            end
            a1:Delay((a1:GetCooldown()))
            if _repositionToken ~= a1._repositionToken then
                return
            end
        end
    end)
end

return v1