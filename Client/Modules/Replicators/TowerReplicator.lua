-- Script path: ReplicatedStorage.Client.Modules.Replicators.TowerReplicator
-- Decompile time: 45.64 ms

local scanReplace
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("TweenService")
local u20 = {}
u20.__index = u20
local Effects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects")
local Particles = Effects:WaitForChild("Particles")
local Buffs = Effects:WaitForChild("Buffs")
local AbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore)
local AbilityAmmoStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityAmmoStore)
local AbilityIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityIndicatorStore)
local DebugController = require(ReplicatedStorage.Client.Controllers.Shared.DebugController)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TowerSignals = require(ReplicatedStorage.Shared.Modules.TowerSignals)
local TowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerStore)
local TowerUpgradeUtils = require(ReplicatedStorage.Shared.Modules.TowerUpgradeUtils)
local Upgrades = require(ReplicatedStorage.Shared.Modules.Upgrades)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local StatusEffectRenderer = require(ReplicatedStorage.Client.Modules.StatusEffects.StatusEffectRenderer)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local AbilityStateConfig = require(ReplicatedStorage.Shared.Modules.AbilityStateConfig)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local HumanoidUtil = require(ReplicatedStorage.Shared.Modules.HumanoidUtil)
require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local NPCUtils = require(ReplicatedStorage.Shared.Modules.NPCUtils)
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local SkillsUtil = require(ReplicatedStorage.Shared.Modules.SkillsUtil)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local TaggedInstances = require(ReplicatedStorage.Shared.Modules.TaggedInstances)
local TransientVFX = require(ReplicatedStorage.Client.Modules.TransientVFX)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Troops = Network.Channel("Troops")
local USE_OWNER_ABILITY_STATE = AbilityStateConfig.USE_OWNER_ABILITY_STATE
local UserId = Players.LocalPlayer.UserId
local u251 = Random.new()

local function getAvailableAbilities(a1, a2, a3) -- Line: 70
    -- upvalues: TowerUpgradeUtils (val)
    local v1 = {}
    for i, j in a1 or {} do
        if (j.Level or 0) <= a2 and TowerUpgradeUtils.matchesPath(j, a3) then
            table.insert(v1, j)
        end
    end
    return v1
end

local u253 = {}

function u253.FrozenDeath(a1) -- Line: 83 -- upvalues: TransientVFX (val)
    local v1 = a1.Model:Clone()
    for i, j in v1:GetDescendants() do
        if j:IsA("MeshPart") then
            j.TextureID = ""
        end
        if j:IsA("BasePart") then
            j.Anchored = true
            j.Material = Enum.Material.Foil
            j.Color = Color3.fromRGB(213, 255, 255)
            j.LocalTransparencyModifier = 0
        end
    end
    v1.Parent = workspace.Trash
    debug.profilebegin("VFX_FrozenDeathTTL")
    TransientVFX.track(v1, {ttl = 5, profileName = "FrozenDeath"})
    debug.profileend()
end

local u255 = {}
u255[Enum_2.BuffType.Cooldown] = {
    Enter = function(a1) -- Line: 106 -- upvalues: Buffs (val), TransientVFX (val)
        if a1.CooldownBuffEffect then
            return
        end
        a1.CooldownBuffEffect = Buffs.Cooldown:Clone()
        a1.CooldownBuffEffect:PivotTo((CFrame.new(a1.BottomPosition)) * (CFrame.Angles(0, 0, 3.141592653589793)))
        a1.CooldownBuffEffect.Parent = workspace.Trash
        TransientVFX.track(a1.CooldownBuffEffect, {profileName = "CooldownBuff"})
    end,
    Exit = function(a1) -- Line: 117
        if not a1.CooldownBuffEffect then
            return
        end
        a1.CooldownBuffEffect:Destroy()
        a1.CooldownBuffEffect = nil
    end,
}
u255[Enum_2.BuffType.Damage] = {
    Enter = function(a1) -- Line: 127 -- upvalues: Buffs (val), TransientVFX (val)
        if a1.DamageBuffEffect then
            return
        end
        local v1 = Buffs.Damage:Clone()
        v1:PivotTo((CFrame.new(a1.BottomPosition)) * (CFrame.Angles(0, 0, 3.141592653589793)))
        v1.Parent = workspace.Trash
        TransientVFX.track(v1, {profileName = "DamageBuff"})
        a1.DamageBuffEffect = v1
        a1.Maid:Mark(v1)
    end,
    Exit = function(a1) -- Line: 141
        if not a1.DamageBuffEffect then
            return
        end
        a1.DamageBuffEffect:Destroy()
        a1.DamageBuffEffect = nil
    end,
}
u255[Enum_2.BuffType.Range] = {
    Enter = function(a1) -- Line: 151 -- upvalues: Buffs (val), TransientVFX (val)
        if a1.RangeBuffEffect then
            return
        end
        local v1 = Buffs.Range:Clone()
        v1:PivotTo((CFrame.new(a1.BottomPosition)) * (CFrame.Angles(0, 0, 3.141592653589793)))
        v1.Parent = workspace.Trash
        TransientVFX.track(v1, {profileName = "RangeBuff"})
        a1.RangeBuffEffect = v1
        a1.Maid:Mark(v1)
    end,
    Exit = function(a1) -- Line: 164
        if not a1.RangeBuffEffect then
            return
        end
        a1.RangeBuffEffect:Destroy()
        a1.RangeBuffEffect = nil
    end,
}
u255[Enum_2.BuffType.FortifyReduction] = {
    Enter = function(a1) -- Line: 174 -- upvalues: Buffs (val), TransientVFX (val), EmitterManager (val), RunService (val)
        if a1.FortifyBuffEffect then
            return
        end
        local v1 = Buffs.Fortify:Clone()
        local Shield = v1:FindFirstChild("Shield")
        local Deco = v1:FindFirstChild("Deco")
        local CFrame = a1.Model.PrimaryPart.CFrame
        if Shield then
            Shield.Anchored = true
            Shield.CFrame = CFrame
            Shield.Parent = workspace.Trash
            TransientVFX.track(Shield, {profileName = "FortifyShield"})
        end
        if Deco then
            Deco.Anchored = true
            Deco.CFrame = CFrame
            Deco.Parent = workspace.Trash
            TransientVFX.track(Deco, {profileName = "FortifyDeco"})
        end
        v1:Destroy()
        a1.FortifyBuffEffect = {Shield = Shield, Deco = Deco}
        if Shield then
            a1.Maid:Mark(Shield)
        end
        if Deco then
            a1.Maid:Mark(Deco)
        end
        if Shield then
            local Emit = Shield:FindFirstChild("Emit")
            local u65 = 0
            if Emit then
                EmitterManager.manualEmit(Emit)
            end
            a1._fortifySpinConn = RunService.Heartbeat:Connect(function(a1_2) -- Line: 216 -- upvalues: a1 (val), CFrame (ref), u65 (ref), Shield (val), Deco (val)
                if not a1.Model.PrimaryPart then
                    return
                end
                CFrame = a1.Model.PrimaryPart.CFrame
                u65 = (u65 + a1_2 * 3.141592653589793 / 2) % 6.283185307179586
                Shield.CFrame = CFrame
                if Deco then
                    Deco.CFrame = CFrame * CFrame.Angles(0, u65, 0)
                end
            end)
            a1.Maid:Mark(a1._fortifySpinConn)
        end
    end,
    Exit = function(a1) -- Line: 231
        if not a1.FortifyBuffEffect then
            return
        end
        if a1._fortifySpinConn then
            a1._fortifySpinConn:Disconnect()
            a1._fortifySpinConn = nil
        end
        if a1.FortifyBuffEffect.Shield then
            a1.FortifyBuffEffect.Shield:Destroy()
        end
        if a1.FortifyBuffEffect.Deco then
            a1.FortifyBuffEffect.Deco:Destroy()
        end
        a1.FortifyBuffEffect = nil
    end,
}
local u276 = {}
u276[Enum_2.StunType.Boomer] = {
    Enter = function(a1) -- Line: 254 -- upvalues: ReplicatedStorage (val), TransientVFX (val)
        local v1 = ReplicatedStorage.Assets.Effects.Particles.BoomerSmoke:Clone()
        v1:ScaleTo(a1.Model.Head.Size.Y * 2)
        v1:PivotTo(a1.Model.Head.CFrame)
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = a1.Model.Head
        WeldConstraint.Part1 = v1.Effect
        WeldConstraint.Parent = v1.Effect
        v1.Parent = workspace.Trash
        TransientVFX.track(v1, {profileName = "BoomerStun"})
        a1.Maid:Mark(v1)
        a1._boomerDebuffEffect = v1
    end,
    Exit = function(a1) -- Line: 270
        local _boomerDebuffEffect = a1._boomerDebuffEffect
        if _boomerDebuffEffect then
            _boomerDebuffEffect:Destroy()
        end
    end,
}
u276[Enum_2.StunType.Normal] = {
    Enter = function() end,
    Exit = function() end,
}
u276[Enum_2.StunType.Legacy] = {
    Enter = function(a1) -- Line: 283 -- upvalues: Particles (val)
        if a1.LegacyStunParticles then
            return
        end
        a1.LegacyStunParticles = Particles.Stun:Clone()
        a1.LegacyStunParticles.Enabled = true
        a1.LegacyStunParticles.Parent = a1.Model.Head
    end,
    Exit = function(a1) -- Line: 291
        if not a1.LegacyStunParticles then
            return
        end
        a1.LegacyStunParticles:Destroy()
        a1.LegacyStunParticles = nil
    end,
}
u276[Enum_2.StunType.Golden] = {
    Enter = function(a1) -- Line: 300 -- upvalues: ReplicatedStorage (val), TransientVFX (val)
        if a1.GoldenStunParticles then
            return
        end
        local v1 = ReplicatedStorage.Assets.Effects.Mob.GoldSpike.Ice2:Clone()
        v1.Transparency = 0.5
        v1.Position = (a1.Model:GetPivot()).Position + Vector3.new(0, v1.Size.Y / 2, 0)
        v1.Parent = workspace.Trash
        TransientVFX.track(v1, {profileName = "GoldenStun"})
        a1.GoldenStunParticles = v1
        a1.Maid:Mark(v1)
    end,
    Exit = function(a1) -- Line: 314 -- upvalues: TweenService (val), TimescaleUtilities (val)
        if not a1.GoldenStunParticles then
            return
        end
        local GoldenStunParticles = a1.GoldenStunParticles
        a1.GoldenStunParticles = nil
        TweenService:Create(
            GoldenStunParticles,
            TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
            {Transparency = 1}
        ):Play()
        TimescaleUtilities.Delay(1, function() -- Line: 327 -- upvalues: GoldenStunParticles (val)
            GoldenStunParticles:Destroy()
        end)
    end,
}
u276[Enum_2.StunType.Ducky] = {
    Enter = function(a1) -- Line: 333 -- upvalues: Particles (val)
        if a1.DuckyParticles then
            return
        end
        a1.DuckyParticles = Particles.Duck:Clone()
        a1.DuckyParticles.Enabled = true
        a1.DuckyParticles.Parent = a1.Model.Head
    end,
    Exit = function(a1) -- Line: 341
        if not a1.DuckyParticles then
            return
        end
        a1.DuckyParticles:Destroy()
        a1.DuckyParticles = nil
    end,
}
u276[Enum_2.StunType.Poison] = {
    Enter = function(a1) -- Line: 350 -- upvalues: Particles (val)
        if a1.PoisonParticles then
            return
        end
        a1.PoisonParticles = Particles.Poison:Clone()
        a1.PoisonParticles.Enabled = true
        a1.PoisonParticles.Parent = a1.Model.Head
    end,
    Exit = function(a1) -- Line: 358
        if not a1.PoisonParticles then
            return
        end
        a1.PoisonParticles:Destroy()
        a1.PoisonParticles = nil
    end,
}
u276[Enum_2.StunType.Fire] = {
    Enter = function(a1) -- Line: 367 -- upvalues: Effects (val)
        local v1
        if a1.FireParticles then
            return
        end
        local Torso = a1.Model:FindFirstChild("Torso") or a1.Model.PrimaryPart
        if not Torso then
            return
        end
        a1.FireParticles = {}
        for k, v in pairs(((Effects:WaitForChild("Particles")):WaitForChild("Flames")):GetChildren()) do
            v1 = v:Clone()
            v1.Parent = Torso
            v1.Enabled = true
            table.insert(a1.FireParticles, v1)
        end
    end,
    Exit = function(a1) -- Line: 387
        if not a1.FireParticles then
            return
        end
        for k, v in pairs(a1.FireParticles) do
            v:Destroy()
        end
        a1.FireParticles = nil
    end,
}
u276[Enum_2.StunType.Frozen] = {
    Enter = function(a1) -- Line: 399 -- upvalues: TransientVFX (val)
        if a1.FrozenParts then
            return
        end
        a1.FrozenParts = {}
        a1.AnchoredParts = {}
        a1.DestroyConnection = a1.OnDestroy:Connect(function() -- Line: 406 -- upvalues: a1 (val)
            for k, v in pairs(a1.FrozenParts) do
                v:Destroy()
            end
        end)

        local function v1(a1) -- Line: 412 -- upvalues: TransientVFX (upval)
            if not a1:IsA("BasePart") then
                return nil
            end
            local v1 = a1:Clone()
            v1.Anchored = true
            v1.CFrame = a1.CFrame
            v1.Size = Vector3.new(a1.Size.X * 1.1, a1.Size.Y * 1.1, a1.Size.Z * 1.1)
            v1.BrickColor = BrickColor.new("Pastel light blue")
            v1.Material = Enum.Material.Glass
            v1.Transparency = 0.25
            if v1:IsA("MeshPart") then
                v1.TextureID = ""
            end
            local SpecialMesh = v1:FindFirstChildWhichIsA("SpecialMesh")
            if SpecialMesh then
                SpecialMesh.Scale = Vector3.new(SpecialMesh.Scale.X * 1.1, SpecialMesh.Scale.Y * 1.1, SpecialMesh.Scale.Z * 1.1)
                SpecialMesh.TextureId = ""
            end
            for k, v in pairs(v1:GetDescendants()) do
                if v:IsA("Decal") then
                    v:Destroy()
                end
            end
            v1.Parent = workspace.Trash
            TransientVFX.track(v1, {profileName = "FrozenStatusPart"})
            return v1
        end

        for k, v in pairs(a1.Model:GetDescendants()) do
            if v:IsA("BasePart") and v.Anchored == false and v.Transparency == 0 then
                v.Anchored = true
                table.insert(a1.FrozenParts, (v1(v)))
                table.insert(a1.AnchoredParts, v)
            end
        end
    end,
    Exit = function(a1) -- Line: 464
        if not a1.FrozenParts then
            return
        end
        a1.DestroyConnection:Disconnect()
        for k, v in pairs(a1.FrozenParts) do
            v:Destroy()
        end
        for k2, i in pairs(a1.AnchoredParts) do
            i.Anchored = false
        end
        a1.FrozenParts = nil
        a1.AnchoredParts = nil
    end,
}
u276[Enum_2.StunType.Spooky] = {
    Enter = function(a1) -- Line: 482 -- upvalues: Animation (val), Create (val)
        if not a1.Spooked and a1.Model:FindFirstChild("AnimationController") then
            a1.Spooked = Animation.new({Id = 15046387335, Looped = true, Target = a1.Model.AnimationController}):Play()
        end
        if not a1.SpookedSound and a1.Model.PrimaryPart then
            a1.SpookedSound = Create("Sound", {SoundId = "rbxassetid://4678640322", Looped = true})
            a1.SpookedSound.Parent = a1.Model.PrimaryPart
            a1.SpookedSound:Play()
        end
    end,
    Exit = function(a1) -- Line: 507
        if a1.Spooked then
            a1.Spooked:Stop()
            a1.Spooked = nil
        end
        if a1.SpookedSound then
            a1.SpookedSound:Destroy()
            a1.SpookedSound = nil
        end
    end,
}
local u322 = {}
u322[Enum_2.StatusEffect.Frozen] = {
    Enter = function(a1) -- Line: 523
        -- upvalues: ReplicatedStorage (val), TransientVFX (val), TweenService (val), EmitterManager (val)
        local Part1, WeldConstraint, v1, v2
        local PrimaryPart = a1.Model.PrimaryPart
        local Children = ReplicatedStorage.Assets.Effects.Misc.IceModels:GetChildren()
        a1.freezeWelds = {}
        a1.freezeParts = {}
        for k, v in pairs(a1.Model:GetDescendants()) do
            if v:IsA("Motor6D") and v.Part1 ~= PrimaryPart then
                Part1 = v.Part1
                WeldConstraint = Instance.new("WeldConstraint")
                WeldConstraint.Part0 = PrimaryPart
                WeldConstraint.Part1 = Part1
                WeldConstraint.Name = Part1.Name .. "_ICE_WELD"
                WeldConstraint.Enabled = true
                v1 = Children[math.random(1, #Children)]:Clone()
                WeldConstraint.Parent = v1
                v2 = Part1.Size + Vector3.new(0.25, 0.25, 0.25)
                v1.Parent = workspace.Trash
                TransientVFX.track(v1, {profileName = "FreezeStatusIce"})
                v1.Size = Vector3.new(0, 0, 0)
                v1.CFrame = Part1.CFrame
                v1.Weld.Part1 = Part1
                TweenService:Create(
                    v1,
                    TweenInfo.new(Random.new():NextNumber(0.1, 0.25), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
                    {Size = v2}
                ):Play()
                a1.Maid:Mark(v1)
                table.insert(a1.freezeWelds, WeldConstraint)
                table.insert(a1.freezeParts, v1)
            end
        end
        EmitterManager.Emit("Freeze", PrimaryPart.CFrame, nil, nil, nil, nil, {priority = "GameplayCritical"})
    end,
    Exit = function(a1) -- Line: 573 -- upvalues: TweenService (val)
        if a1.freezeParts then
            local v1, v2
            for k, v in pairs(a1.freezeParts) do
                v1 = Random.new():NextNumber(0.1, 0.25)
                v2 = TweenInfo.new(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
                TweenService:Create(v, v2, {Transparency = 1}):Play()
                game.Debris:AddItem(v, v1)
            end
        end
        if a1.freezeWelds then
            for k2, i in pairs(a1.freezeWelds) do
                i:Destroy()
            end
        end
    end,
}
u322[Enum_2.StatusEffect.Cursed] = {
    Enter = function(a1) -- Line: 602 -- upvalues: ReplicatedStorage (val)
        if not a1.Model:FindFirstChild("CurseTower") then
            local CurseTower = ReplicatedStorage.Assets.Effects.Buffs:FindFirstChild("CurseTower")
            if CurseTower then
                local v1 = math.abs(a1.Model.PrimaryPart.HeightOffset.Position.Y)
                local v2 = (if not (v1 > 1.15) then 5.5 else v1 * 2) * 2
                local v3 = CurseTower:Clone()
                v3:ScaleTo(v2)
                v3:PivotTo((a1.Model:GetPivot()) * (CFrame.new(0, v1, 0)))
                v3.Parent = a1.Model
                a1._cursedEffect = v3
                a1.Maid:Mark(v3)
            end
        end
    end,
    Exit = function(a1) -- Line: 620
        local _cursedEffect = a1._cursedEffect
        if _cursedEffect then
            _cursedEffect:Destroy()
        end
    end,
}
u322[Enum_2.StatusEffect.Jailed] = {
    Enter = function(a1) -- Line: 629
        -- upvalues: ReplicatedStorage (val), TransientVFX (val), spr (val), Scheduler (val), RunService (val)
        if a1.Model:GetAttribute("SuppressJailedVFX") then
            if a1._jailedEffect then
                a1._jailedEffect:Destroy()
                a1._jailedEffect = nil
            end
            return
        end
        if not a1.Model:FindFirstChild("Jail") and not a1.Model:FindFirstChild("CurseTower") then
            local Jailed = ReplicatedStorage.Assets.Effects.Buffs:FindFirstChild("Jailed")
            if Jailed then
                local v1 = math.abs(a1.Model.PrimaryPart.HeightOffset.Position.Y)
                local u39 = if not (v1 > 1.15) then 5.5 else v1 * 2
                local u41 = u39 * 2
                local u46 = Jailed:Clone()
                u46:ScaleTo(u41)
                local v2 = (a1.Model:GetPivot()) * (CFrame.new(0, v1, 0))
                u46:PivotTo(v2)
                u46.Parent = workspace.Trash
                TransientVFX.track(u46, {profileName = "JailedStatus"})
                a1._jailedEffect = u46
                a1.Maid:Mark(u46)
                local u78 = {progress = 0}
                spr.target(u78, 0.55, 1, {progress = 1})
                local u92 = Scheduler.addDynamic("JailedModifier", RunService.RenderStepped, function() -- Line: 659 -- upvalues: u41 (val), u39 (val), u78 (val), u46 (ref)
                    local v1 = u41 - u39
                    local v2 = NumberSequence.new(1 - u78.progress)
                    u46:ScaleTo(u41 - v1 * u78.progress)
                    u46.Part.Chain1.Beam1.Transparency = v2
                    u46.Part.Chain1.Beam2.Transparency = v2
                    u46.Part.Chain2.Beam1.Transparency = v2
                    u46.Part.Chain2.Beam2.Transparency = v2
                end)
                spr.completed(u78, function() -- Line: 669 -- upvalues: u92 (val)
                    u92()
                end)
            end
        end
    end,
    Exit = function(a1) -- Line: 675
        local _jailedEffect = a1._jailedEffect
        if _jailedEffect then
            _jailedEffect:Destroy()
            a1._jailedEffect = nil
        end
    end,
}
local u338 = {}
local u339 = {}
local u340 = {}
local u341 = {}
local u342 = {}
local u343 = {}
local u344 = nil

local function scheduleAbilityStateFlush() -- Line: 694
    -- upvalues: u344 (ref), RunService (val), u342 (ref), u343 (ref), AbilitiesStore (val), AbilityAmmoStore (val)
    if u344 then
        return
    end
    u344 = RunService.Heartbeat:Connect(function() -- Line: 699
        -- upvalues: u344 (upval), u342 (upval), u343 (upval), AbilitiesStore (upval), AbilityAmmoStore (upval)
        u344:Disconnect()
        u344 = nil
        debug.profilebegin("AbilityState_ClientFlush")
        local v1 = {}
        for i, j in u342 do
            table.insert(v1, j)
        end
        u342 = {}
        local v2 = {}
        for k, n in u343 do
            table.insert(v2, n)
        end
        u343 = {}
        if #v1 > 0 then
            AbilitiesStore.updateAbilities(v1)
        end
        if #v2 > 0 then
            AbilityAmmoStore.bulkUpdate(v2)
        end
        debug.profileend()
    end)
end

local function queueAbilityStateUpdate(a1) -- Line: 729
    -- upvalues: u340 (val), u341 (val), UserId (val), u342 (ref), u343 (ref), AbilityAmmoStore (val), u344 (ref)
    -- upvalues: RunService (val), AbilitiesStore (val)
    local v1, v2
    local v3 = u340[a1.uid]
    if not v3 then
        v1 = u341[a1.uid]
        if not v1 then
            u341[a1.uid] = {}
        end
        table.insert(v1, a1)
        return
    end
    if (v3.Replicator:Get("OwnerId")) ~= UserId then
        return
    end
    if a1.cooldownEnd ~= nil or a1.cooldownDuration ~= nil then
        v1 = a1.name:gsub("[^%w]", "")
        v2 = u342
        local v4 = (tostring(a1.uid)) .. "\000" .. v1
        v2[v4] = {
            model = v3.Model,
            name = v1,
            deltaTime = a1.cooldownEnd or 0,
            maxDeltaTime = a1.cooldownDuration or 0,
        }
    end
    if a1.ammo ~= nil or a1.maxAmmo ~= nil or a1.interval ~= nil or a1.startTick ~= nil or a1.syncPoint ~= nil then
        v1 = a1.name .. tostring(a1.uid)
        v2 = u343[v1]
        local payload = if not v2 then AbilityAmmoStore.getState()[v1] or {} else v2.payload
        local v5 = u343
        local v6 = {id = v1}
        local v7 = {}
        local ammo = if a1.ammo == nil then payload.ammo else a1.ammo
        v7.ammo = ammo
        local maxAmmo = if a1.maxAmmo == nil then payload.maxAmmo else a1.maxAmmo
        v7.maxAmmo = maxAmmo
        local interval = if a1.interval == nil then payload.interval else a1.interval
        v7.interval = interval
        local startTick = if a1.startTick == nil then payload.startTick else a1.startTick
        v7.startTick = startTick
        local syncPoint = if a1.syncPoint == nil then payload.syncPoint else a1.syncPoint
        v7.syncPoint = syncPoint
        v6.payload = v7
        v5[v1] = v6
    end
    if u344 then
        return
    end
    u344 = RunService.Heartbeat:Connect(function() -- Line: 699
        -- upvalues: u344 (upval), u342 (upval), u343 (upval), AbilitiesStore (upval), AbilityAmmoStore (upval)
        u344:Disconnect()
        u344 = nil
        debug.profilebegin("AbilityState_ClientFlush")
        local v1 = {}
        for i, j in u342 do
            table.insert(v1, j)
        end
        u342 = {}
        local v2 = {}
        for k, n in u343 do
            table.insert(v2, n)
        end
        u343 = {}
        if #v1 > 0 then
            AbilitiesStore.updateAbilities(v1)
        end
        if #v2 > 0 then
            AbilityAmmoStore.bulkUpdate(v2)
        end
        debug.profileend()
    end)
end

local function flushBufferedAbilityState(a1) -- Line: 782 -- upvalues: u341 (val), queueAbilityStateUpdate (val)
    local v1 = u341[a1]
    if not v1 then
        return
    end
    u341[a1] = nil
    for i, j in v1 do
        queueAbilityStateUpdate(j)
    end
end

function scanReplace(a1) -- Line: 794 -- upvalues: ReplicatedStorage (val), scanReplace (val), NPCReplicator (val)
    local v1
    local UnitReplicator = require(ReplicatedStorage.Client.Modules.Replicators.UnitReplicator)
    for k, v in pairs(a1) do
        if typeof(v) == "table" then
            scanReplace(v)
        end
        if typeof(v) == "Instance" and v:IsA("Folder") then
            v1 = NPCReplicator.GetNPCFromFolder(v) or UnitReplicator.GetNPCFromFolder(v)
            if v1 then
                v2[k] = v1.Model
            end
        end
    end
end

local Replicate = Network.Channel("Replicate")
Replicate:On("TowerInstance", function(a1) -- Line: 814 -- upvalues: u339 (val), scanReplace (val)
    for i, j in a1 do
        task.spawn(function() -- Line: 816 -- upvalues: j (val), u339 (upval), scanReplace (upval)
            local v1 = j[2]
            local v2 = j[1]
            local v3 = {(table.unpack(j, 3))}
            local v4 = u339[v1]
            scanReplace(v3)
            if v4 and v4.Executables then
                v4.Executables[v2](unpack(v3))
            end
        end)
    end
end)
Replicate:On("SetTowerStats", function(a1, a2, a3, a4, a5, a6) -- Line: 833 -- upvalues: Content (val), TowerSignals (val)
    local v1 = Content("Tower"):FindFirstChild(a1)
    assert(v1, (("Tower with name %* does not exist"):format(a1)))
    local Stats = require(v1.Stats)
    assert(Stats, (("Tower with name %* does not have stats"):format(a1)))
    local Default = Stats.Stats[if not a2 then "Default" else "Golden"] or Stats.Stats.Default
    if not a6 then
        if a3 ~= "Defaults" then
            Default.Upgrades[a3].Stats[a4] = a5
        else
            Default.Defaults[a4] = a5
        end
    elseif a3 ~= "Defaults" then
        Default.Upgrades[a3][a6].Stats[a4] = a5
    else
        Default.Defaults[a6][a4] = a5
    end
    TowerSignals.StatsChanged:Fire(a1)
end)
Replicate:On("SetTowerDetection", function(a1, a2, a3, a4, a5, a6) -- Line: 860 -- upvalues: Content (val), TowerSignals (val)
    local v1 = Content("Tower"):FindFirstChild(a1)
    assert(v1, (("Tower with name %* does not exist"):format(a1)))
    local Stats = require(v1.Stats)
    assert(Stats, (("Tower with name %* does not have stats"):format(a1)))
    local Default = Stats.Stats[if not a2 then "Default" else "Golden"] or Stats.Stats.Default
    if not a6 then
        if a3 ~= "Defaults" then
            local Detections_4 = Default.Upgrades[a3].Stats.Detections or {}
            Detections_4[a4] = a5
            Default.Upgrades[a3].Stats.Detections = Detections_4
        else
            local Detections_3 = Default.Defaults.Detections or {}
            Detections_3[a4] = a5
            Default.Defaults.Detections = Detections_3
        end
    elseif a3 ~= "Defaults" then
        local Detections_2 = Default.Upgrades[a3][a6].Stats.Detections or {}
        Detections_2[a4] = a5
        Default.Upgrades[a3][a6].Stats.Detections = Detections_2
    else
        local Detections = Default.Defaults[a6].Detections or {}
        Detections[a4] = a5
        Default.Defaults[a6].Detections = Detections
    end
    TowerSignals.StatsChanged:Fire(a1)
end)
local Gizmo = DebugController.Gizmo
DebugController.createGizmo("Tower Targets", function() -- Line: 900 -- upvalues: Gizmo (val), u339 (val)
    local v1
    Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(255, 250, 93))
    for i, j in u339 do
        v1 = j:FindTarget()
        if v1 then
            Gizmo.Ray:Draw(j.Model.PrimaryPart.Position, (v1:GetPivot()).Position)
        end
    end
end)
DebugController.createGizmo("Tower Hitboxes", function() -- Line: 913 -- upvalues: Gizmo (val), u339 (val)
    local BoundingBox, BoundingBox_2
    Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(149, 255, 141))
    for i in u339 do
        BoundingBox, BoundingBox_2 = i:GetBoundingBox()
        Gizmo.Box:Draw(BoundingBox, BoundingBox_2, false)
    end
end)

function u20.getTowerByModel(a1) -- Line: 922 -- upvalues: u339 (val)
    return u339[a1]
end

function u20.getTowerByUID(a1) -- Line: 926 -- upvalues: u340 (val)
    return u340[a1]
end

function u20.getTowers() -- Line: 930 -- upvalues: u339 (val)
    return u339
end

function u20.waitForTowerByModel(a1) -- Line: 934 -- upvalues: u339 (val)
    while not u339[a1] do
        task.wait()
    end
    return u339[a1]
end

if USE_OWNER_ABILITY_STATE then
    Troops:On("AbilityState", function(a1) -- Line: 942 -- upvalues: queueAbilityStateUpdate (val)
        debug.profilebegin("AbilityState_ClientReceive")
        for i, j in a1 do
            queueAbilityStateUpdate(j)
        end
        debug.profileend()
    end)
    task.defer(function() -- Line: 952 -- upvalues: Troops (val)
        Troops:FireServer("AbilityStateReady")
    end)
end

function u20.new(a1, a2) -- Line: 957
    -- upvalues: Asset (val), u20 (val), HumanoidUtil (val), Maid (val), Signal (val), TagReplicator (val)
    -- upvalues: TaggedInstances (val), u339 (val), u340 (val), u341 (val), queueAbilityStateUpdate (val)
    -- upvalues: ParticleLODController (val), StatusEffectRenderer (val), getAvailableAbilities (val)
    -- upvalues: USE_OWNER_ABILITY_STATE (val), AbilitiesStore (val), Animation (val), Enum_2 (val)
    -- upvalues: TimescaleUtilities (val), TweenService (val), u322 (val), u255 (val), u276 (val), u338 (val)
    -- upvalues: TowerStore (val), AbilityAmmoStore (val)
    local Golden, Path_2, v1, v2
    local v3 = a2:WaitForState("Name")
    local v4 = Asset("Troops", v3)
    if not v4 then
        return
    end
    local v5 = {Model = a1.Parent}
    local Animator = v4.Animator
    local v6 = setmetatable(Animator, u20)
    local u510 = setmetatable(v5, v6)
    u510.Name = v3
    u510.Path = a2:Get("Path") or 0
    u510.FBXModel = HumanoidUtil.findFirstRigBone(u510.Model)
    v5, v6 = HumanoidUtil.createAnimationHost(u510.Model, u510.FBXModel ~= nil)
    u510.AnimationController = v5
    u510.AnimationAnimator = v6
    u510.BoneVFX = u510.Model:FindFirstChild("BoneVFX")
    u510.UID = a2:Get("UID")
    u510.Maid = Maid.new()
    u510.Reposition = Maid.new()

    local function clearSuppressedJailedVFX() -- Line: 980 -- upvalues: u510 (val)
        if u510.Model:GetAttribute("SuppressJailedVFX") and u510._jailedEffect then
            u510._jailedEffect:Destroy()
            u510._jailedEffect = nil
        end
    end

    u510.Maid:Mark(((u510.Model:GetAttributeChangedSignal("SuppressJailedVFX")):Connect(function() -- Line: 988 -- upvalues: u510 (val)
        if u510.Model:GetAttribute("SuppressJailedVFX") and u510._jailedEffect then
            u510._jailedEffect:Destroy()
            u510._jailedEffect = nil
        end
    end)))
    if u510.Model:GetAttribute("SuppressJailedVFX") and u510._jailedEffect then
        u510._jailedEffect:Destroy()
        u510._jailedEffect = nil
    end
    u510.Replicator = a2
    u510.OnDestroy = Signal.new()
    u510.OnUpgrade = Signal.new()
    u510.OnAbilitiesUpdated = Signal.new()
    u510.Queues = TagReplicator.getReplicatorEntityFromFolder(u510.Model:WaitForChild("Queues"))
    u510.Maid:Mark(u510.OnUpgrade)
    u510.Maid:Mark(u510.Queues)
    u510.PrimaryPart = u510.Model.PrimaryPart
    local UpgradeOptions = v4.UpgradeOptions or {}
    u510.AllOptions = UpgradeOptions
    u510.Options = {}
    u510.Tagged = TaggedInstances.getTaggedInstances(u510.Model)
    for i, j in u510.AllOptions do
        u510.Options[j.Name] = j.Default
    end
    u339[u510.Model] = u510
    u340[u510.UID] = u510
    local UID = u510.UID
    local v7 = u341[UID]
    if v7 then
        u341[UID] = nil
        for k, n in v7 do
            queueAbilityStateUpdate(n)
        end
    end
    ParticleLODController.registerModel(u510.Model, function() -- Line: 1018 -- upvalues: u510 (val)
        return u510.Model.PrimaryPart and u510.Model.PrimaryPart.Position or Vector3.new(0, 0, 0)
    end)
    u510.Maid:Mark(function() -- Line: 1021 -- upvalues: u510 (val), u339 (upval), u340 (upval), ParticleLODController (upval)
        u510.PrimaryPart = nil
        u339[u510.Model] = nil
        if u340[u510.UID] == u510 then
            u340[u510.UID] = nil
        end
        ParticleLODController.unregisterModel(u510.Model)
    end)
    a2:Hook(u510)
    u510.Asset = v4
    if not u510.GoldenPerks or not v4.Stats.Golden then
        Golden = v4.Stats.Default
    else
        Golden = v4.Stats.Golden
        if not Golden then
            Golden = v4.Stats.Default
        end
    end
    u510.Sellback = Golden.Defaults.Sellback
    u510.Stats = Golden
    u510.TowerName = v3
    u510.Deadzone = u510.Stats.Attributes and u510.Stats.Attributes.Deadzone or 0
    u510.Buildzone = if not u510.Stats.Attributes then 0 else u510.Stats.Attributes.Buildzone or u510.Stats.Attributes.FortifyRadius or 0
    local HumanoidRootPart = u510.Model:FindFirstChild("HumanoidRootPart") or u510.Model.PrimaryPart
    u510.CFrame = HumanoidRootPart.CFrame
    u510.UpdatedCFrame = false
    u510.Target = u510.Model:FindFirstChild("Target")
    u510.Upgrades = u510.Model:WaitForChild("Upgrades")
    u510.Animations = u510.Model:WaitForChild("Animations")
    local Position = u510.Model.PrimaryPart.Position
    local v8 = u510.Model:GetPivot().Position.Y - Position.Y
    u510.BottomPosition = u510.Model.PrimaryPart.HeightOffset.WorldPosition
    u510.Maid:Mark(((u510.Model.PrimaryPart:GetPropertyChangedSignal("Position")):Connect(function() -- Line: 1054 -- upvalues: u510 (val)
        u510.BottomPosition = u510.Model.PrimaryPart.HeightOffset.WorldPosition
        local v1 = (CFrame.new(u510.BottomPosition)) * CFrame.Angles(0, 0, 3.141592653589793)
        if u510.DamageBuffEffect then
            u510.DamageBuffEffect:PivotTo(v1)
        end
        if u510.CooldownBuffEffect then
            u510.CooldownBuffEffect:PivotTo(v1)
        end
        if u510.RangeBuffEffect then
            u510.RangeBuffEffect:PivotTo(v1)
        end
    end)))
    u510.Upgrade = a2:Get("Upgrade")
    u510.State = {
        Type = a2:Get("Name"),
        Owner = a2:Get("Owner"),
        Target = a2:Get("Target"),
        Upgrade = a2:Get("Upgrade"),
        Cooldown = a2:Get("Cooldown"),
        TargetingMode = a2:Get("TargetingMode"),
    }
    local StatusEffects = a2.Folder:WaitForChild("StatusEffects")
    if StatusEffects then
        u510.StatusEffectRenderer = StatusEffectRenderer.new(u510, StatusEffects)
        u510.StatusEffects = u510.StatusEffectRenderer
        u510.Maid:Mark(u510.StatusEffectRenderer)
    end
    u510.Stuns = TagReplicator.getReplicatorEntityFromFolder(a2.Folder:WaitForChild("Stuns"))
    u510.BuffEffects = TagReplicator.getReplicatorEntityFromFolder(a2.Folder:WaitForChild("AbilityEffects"))
    u510.Attributes = TagReplicator.getReplicatorEntityFromFolder(a2.Folder:WaitForChild("Attributes"))
    u510.Abilities = TagReplicator.getReplicatorEntityFromFolder(a2.Folder:WaitForChild("Abilities"))
    u510.AbilityDataReplicator = TagReplicator.getReplicatorEntityFromFolder(a2.Folder:WaitForChild("AbilityData"))
    u510.Maid:Mark(u510.Stuns)
    u510.Maid:Mark(u510.BuffEffects)
    u510.Maid:Mark(u510.Attributes)
    u510.Maid:Mark(u510.Abilities)
    u510.Maid:Mark(u510.AbilityDataReplicator)
    u510.AvailableAbilities = {}
    u510.AbilityCallbacks = {}
    u510.AvailableAbilities = getAvailableAbilities(Golden.Defaults.Abilities, u510.State.Upgrade, u510.Path)
    for k2, v in pairs(u510.State) do
        u510.State[k2] = v
    end
    u510.Maid:Mark((a2.Changed:Connect(function(a1, a2) -- Line: 1112 -- upvalues: u510 (val), getAvailableAbilities (upval), Golden (val)
        u510.State[a1] = a2
        u510.Stats[a1] = a2
        if a1 == "Path" then
            u510.Path = a2 or 0
            u510.AvailableAbilities = getAvailableAbilities(Golden.Defaults.Abilities, u510.Upgrade, u510.Path)
            u510.OnAbilitiesUpdated:Fire(u510.AvailableAbilities)
        end
    end)))
    u510.Maid:Mark((u510.Attributes.Changed:Connect(function(a1, a2) -- Line: 1124 -- upvalues: u510 (val)
        u510.Stats.Attributes[a1] = a2
    end)))
    if not USE_OWNER_ABILITY_STATE then
        u510.Maid:Mark((u510.Abilities.Changed:Connect(function(a1, a2) -- Line: 1129 -- upvalues: AbilitiesStore (upval), u510 (val)
            local v1, v2
            if not a2 then
                v1 = 0
                v2 = 0
            else
                local v3, v4 = a2:match("^([^,]+),([^,]+)$")
                v1 = v3
                v2 = v4
            end
            local v5 = tonumber(v1)
            AbilitiesStore.updateAbility(u510.Model, a1, v5, (tonumber(v2)))
        end)))
    end
    u510.Animations = {}
    local AnimationController = u510.Model:FindFirstChild("AnimationController")
    if not AnimationController then
        v1 = a2
    else
        v1 = a2
        for k3, m in pairs(u510.Model:WaitForChild("Animations"):GetChildren()) do
            if not u510.Animations[m.Name] then
                u510.Animations[m.Name] = {}
            end
            v2 = {}
            for k4, i5 in pairs(m:GetChildren()) do
                if i5:IsA("Animation") then
                    v2[i5.Name] = (Animation.new({
                        IgnorePriority = true,
                        IsPersistent = true,
                        Preload = true,
                        Track = i5,
                        Target = AnimationController,
                        Entity = u510,
                    }))
                end
            end
            u510.Animations[m.Name] = v2
        end
    end
    u510.Upgrades_D = v4.Upgrades
    u510.Stats = {}
    u510.Stats.Attributes = {}
    for i6, i7 in v1:GetAllStates() do
        u510.Stats[i6] = i7
    end
    for i8, i9 in u510.Attributes:GetAllStates() do
        u510.Stats.Attributes[i8] = i9
    end
    if not USE_OWNER_ABILITY_STATE then
        local v9, v10
        for i10, i11 in u510.Abilities:GetAllStates() do
            v9, v2 = i11:match("^([^,]+),([^,]+)$")
            v10 = tonumber(v9)
            AbilitiesStore.updateAbility(u510.Model, i10, v10, (tonumber(v2)))
        end
    end
    u510._idleAnimation = nil
    u510:Initialize()
    u510.Maid:Mark(((u510.Replicator:GetStateChangedSignal("Position")):Connect(function(a1) -- Line: 1201 -- upvalues: u510 (val)
        local HumanoidRootPart = u510.Model:FindFirstChild("HumanoidRootPart") or u510.Model.PrimaryPart
        u510.CFrame = HumanoidRootPart.CFrame
        u510.UpdatedCFrame = true
    end)))
    u510.Maid:Mark(((u510.Replicator:GetStateChangedSignal("Upgrade")):Connect(function(a1) -- Line: 1206 -- upvalues: getAvailableAbilities (upval), Golden (val), u510 (val)
        local v1 = getAvailableAbilities(Golden.Defaults.Abilities, a1, u510.Path)
        u510.Upgrade = a1
        u510.AvailableAbilities = v1
        u510.OnAbilitiesUpdated:Fire(v1)
        u510:DoUpgrade(a1, u510.Path)
        u510:Animate("Idle", {Priority = Enum.AnimationPriority.Core})
    end)))
    local Path = u510.Path
    local Upgrade = u510.Upgrade
    u510.UpgradeFolder = u510.Model.Upgrades:FindFirstChild((("%*%*"):format(Upgrade, Path)))
    if not u510.UpgradeFolder then
        u510.UpgradeFolder = u510.Model.Upgrades:FindFirstChild((tostring(Upgrade)))
    end
    u510.Maid:Mark((u510.Model.ChildAdded:Connect(function(a1) -- Line: 1226 -- upvalues: u510 (val)
        if a1.Name == "Target" then
            u510.Target = a1
        end
    end)))

    local function updateHidenModel(a1) -- Line: 1232
        -- upvalues: u510 (val), Enum_2 (upval), TimescaleUtilities (upval), TweenService (upval)
        if not u510.Replicator:Get(Enum_2.StatusEffect.Hologram) then
            return
        end
        if not a1 then
            u510.Model:SetAttribute("Flying", false)
            for i, j in u510.Model:GetDescendants() do
                if j:IsA("BasePart") or j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
                    if j:IsA("BasePart") then
                        j.CanQuery = true
                    end
                    TimescaleUtilities.Delay(Random.new():NextNumber(0, 1.25), function() -- Line: 1266 -- upvalues: TweenService (upval), j (val)
                        TweenService:Create(
                            j,
                            TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
                            {LocalTransparencyModifier = 0}
                        ):Play()
                    end)
                end
            end
            return
        end
        u510.Model:SetAttribute("Flying", true)
        for k, n in u510.Model:GetDescendants() do
            if n:IsA("BasePart")
                or n:IsA("Decal")
                or n:IsA("Texture")
                or n:IsA("ParticleEmitter")
                or n:IsA("Beam")
                or n:IsA("Trail") then
                n.LocalTransparencyModifier = 1
                if n:IsA("BasePart") then
                    n.CanQuery = false
                end
            end
        end
    end

    u510.Maid:Mark(((u510.Replicator:GetStateChangedSignal("HideModel")):Connect(updateHidenModel)))
    updateHidenModel(u510.Replicator:Get("HideModel"))
    if u510.StatusEffectRenderer then
        for i12, i13 in u322 do
            if i13 then
                u510.Maid:Mark((u510.StatusEffectRenderer.Changed:Connect(function(a1, a2) -- Line: 1291 -- upvalues: i12 (val), i13 (val), u510 (val)
                    if a1 ~= i12 then
                        return
                    end
                    if a2 then
                        i13.Enter(u510)
                        return
                    end
                    i13.Exit(u510)
                end)))
                if u510.StatusEffectRenderer:has(i12) then
                    i13.Enter(u510)
                end
            end
        end
    end
    for k5, i14 in pairs(Enum_2.BuffType) do
        if u255[i14] then
            u510.Maid:Mark(((u510.BuffEffects:GetStateChangedSignal(i14)):Connect(function(a1) -- Line: 1316 -- upvalues: u255 (upval), i14 (val), u510 (val)
                if a1 then
                    u255[i14].Enter(u510)
                    return
                end
                u255[i14].Exit(u510)
            end)))
            if u510.BuffEffects:Get(i14) then
                u255[i14].Enter(u510)
            end
        else
            warn("Missing buff function for " .. tostring(i14))
        end
    end
    for k6, i15 in pairs(Enum_2.StunType) do
        if u276[i15] then
            u510.Maid:Mark(((u510.Stuns:GetStateChangedSignal(i15)):Connect(function(a1) -- Line: 1336 -- upvalues: u276 (upval), i15 (val), u510 (val)
                if a1 then
                    u276[i15].Enter(u510)
                    return
                end
                u276[i15].Exit(u510)
            end)))
        else
            warn("Missing stun function for " .. tostring(i15))
        end
    end
    for i16 = 1, (v1:Get("Upgrade")) do
        Path_2 = u510.Path
        u510:DoUpgrade(i16, Path_2)
    end
    u510:Animate("Idle", {Priority = Enum.AnimationPriority.Core})
    u338[u510] = u510
    u510.Maid:Mark(function() -- Line: 1353
        -- upvalues: TowerStore (upval), u510 (val), AbilitiesStore (upval), AbilityAmmoStore (upval), u338 (upval)
        TowerStore.removeTower(u510.Model, u510)
        AbilitiesStore.removeTower(u510.Model)
        AbilityAmmoStore.removeTower(u510.UID)
        u338[u510] = nil
    end)
    TowerStore.addTower(u510.Model, v1, u510)
    return u510
end

function u20.ScanReplace(a1, a2) -- Line: 1365 -- upvalues: scanReplace (val)
    scanReplace(a2)
    return a2
end

function u20.toggleFigure8(a1, a2) -- Line: 1370 -- upvalues: UpgradesStore (val) -- types: a1: table, a2: boolean
    UpgradesStore.setFigure8Enabled(a2)
    a1.Figure8 = a2
end

function u20.StopPlacement(a1) -- Line: 1375 -- upvalues: ReplicatedStorage (val)
    require(ReplicatedStorage.Shared.Modules.SharedGameFunctions).StopPlacement()
end

function u20.DeselectTowers(a1) -- Line: 1380
    -- upvalues: ReplicatedStorage (val), AbilityIndicatorStore (val), UpgradesStore (val)
    local NewPlacementController = require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
    AbilityIndicatorStore.update({})
    UpgradesStore.updateTower({
        enabled = false,
        showBoundaries = false,
        valid = false,
        range = 0,
        boundary = 0,
        deadzone = 0,
        buildzone = 0,
    })
    NewPlacementController:Stop()
end

function u20.GetExplosionRadiusMultiplier(a1) -- Line: 1400 -- upvalues: GameRules (val), Enum_2 (val), SkillsUtil (val)
    local v1 = 1
    if a1.OwnerId then
        local v2 = {UserId = a1.OwnerId}
        if GameRules.HasSkill(Enum_2.SkillTreeNode.SplashDamage) then
            v1 = v1 + SkillsUtil.skillEval(v2, Enum_2.SkillTreeNode.SplashDamage) / 100
        end
    end
    return v1
end

function u20.ToggleReposition(a1, a2) -- Line: 1420
    -- upvalues: ReplicatedStorage (val), Scheduler (val), RunService (val), PathPlacementCursorController (val)
    -- upvalues: Sound (val), UpgradesStore (val), Enum_2 (val)
    local Name
    a1.Reposition:Sweep()
    if not a2.towerData then
        Name = a1.Name
    else
        Name = a2.towerData.Name
        if not Name then
            Name = a1.Name
        end
    end
    local NewPlacementController = require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
    if not a2.enabled then
        UpgradesStore.updateTower({
            enabled = false,
            showBoundaries = false,
            valid = false,
            range = 0,
            boundary = 0,
            deadzone = 0,
            buildzone = 0,
        })
        NewPlacementController:CleanHighlights()
        return
    end
    local SharedGameFunctions = require(ReplicatedStorage.Shared.Modules.SharedGameFunctions)
    a1.Reposition:Mark((Scheduler.addDynamic("TowerReposition", RunService.Heartbeat, function(a1_2) -- Line: 1436
        -- upvalues: PathPlacementCursorController (upval), SharedGameFunctions (val), Name (val), a1 (val), a2 (val)
        local v1 = SharedGameFunctions.CheckTowerCollisions(Name, PathPlacementCursorController.CurrentPosition, a1.Team, nil, a2.ignoredTower)
        PathPlacementCursorController.CantPlace = not v1
    end)))
    Sound("Click"):Play()
    UpgradesStore.updateTower({
        enabled = false,
        showBoundaries = true,
        valid = true,
        range = 0,
        flightRange = 0,
        deadzone = 0,
        buildzone = 0,
        model = a1.Model,
        tower = Name,
        boundary = a2.range * 2,
    })
    NewPlacementController:ShowHighlights(a2.towerData and a2.towerData.Class or Enum_2.TowerType.Ground)
end

function u20.Frozen(a1, a2) -- Line: 1485 -- upvalues: TransientVFX (val)
    local u2 = {}

    local function v1(a1, a2) -- Line: 1490 -- upvalues: TransientVFX (upval)
        if not a1:IsA("BasePart") then
            return nil
        end
        local v1 = a1:Clone()
        v1.Anchored = true
        v1.CFrame = a1.CFrame
        v1.Size = Vector3.new(a1.Size.X * 1.1, a1.Size.Y * 1.1, a1.Size.Z * 1.1)
        v1.BrickColor = BrickColor.new("Pastel light blue")
        v1.Material = Enum.Material.Glass
        v1.Transparency = 0.25
        if v1:IsA("MeshPart") then
            v1.TextureID = ""
        end
        local SpecialMesh = v1:FindFirstChildWhichIsA("SpecialMesh")
        if SpecialMesh then
            SpecialMesh.Scale = Vector3.new(SpecialMesh.Scale.X * 1.1, SpecialMesh.Scale.Y * 1.1, SpecialMesh.Scale.Z * 1.1)
            SpecialMesh.TextureId = ""
        end
        for k, v in pairs(v1:GetDescendants()) do
            if v:IsA("Decal") then
                v:Destroy()
            end
        end
        v1.Parent = workspace.CurrentCamera
        TransientVFX.track(v1, {profileName = "TowerFreezeClone", ttl = a2})
        game.Debris:AddItem(v1, a2)
        return v1
    end

    for k, v in pairs(a1.Model:GetDescendants()) do
        if v:IsA("BasePart") and v.Anchored == false and v.Transparency == 0 then
            table.insert(u2, v)
            v.Anchored = true
            v1(v, a2)
        end
    end
    a1:Delay(a2, function() -- Line: 1542 -- upvalues: u2 (val)
        for k, v in pairs(u2) do
            v.Anchored = false
        end
    end)
end

function u20.Face(a1, a2, a3, a4, a5) -- Line: 1555
    -- upvalues: TweenService (val)
    local v1
    local PrimaryPart = a1.Model.PrimaryPart
    local Position = PrimaryPart.Position
    local v2 = CFrame.lookAt(Position, if not a5 then Vector3.new(a2.X, Position.Y, a2.Z) else a2)
    if v1:FuzzyEq(Position, 1e-05) then
        return
    end
    if a4 ~= false then
        if a3 then
            TweenService:Create(PrimaryPart, a3, {CFrame = v2}):Play()
            return v2
        end
        a1.Model.PrimaryPart.CFrame = v2
    end
    return v2
end

function u20.UpdateCFrame(a1, a2) -- Line: 1591 -- types: a1: table, a2: userdata
    a1.CFrame = a2
    a1.UpdatedCFrame = true
end

function u20.Thread(a1, a2) -- Line: 1603
    a1.ThreadFunction = a2
    a1._threadCo = nil
    a1._threadDelayRemaining = 0
end

function u20.Wait(a1, a2) -- Line: 1616 -- upvalues: TimescaleUtilities (val)
    return TimescaleUtilities.Wait(a2)
end

function u20:Delay(a2, a3) -- Line: 1628 -- upvalues: TimescaleUtilities (val)
    if a3 then
        return TimescaleUtilities.Delay(a2, a3)
    end
    self:Wait(a2)
end

function u20.Tween(a1, a2, a3, a4) -- Line: 1646
    -- upvalues: GameState (val), TweenService (val)
    return TweenService:Create(a2, TweenInfo.new(
        a3.Time / GameState.TimeScale,
        a3.EasingStyle,
        a3.EasingDirection,
        a3.RepeatCount,
        a3.Reverses,
        a3.DelayTime / GameState.TimeScale
    ), a4)
end

function u20:FindTarget(a2) -- Line: 1659 -- upvalues: NPCReplicator (val)
    if not self.Target then
        return
    end
    if a2 then
        return self.Target.Value
    end
    local v1 = NPCReplicator.GetNPCFromFolder(self.Target.Value)
    return v1 and v1.Model or nil
end

function u20.GetLevel(a1) -- Line: 1672
    return a1.Upgrade
end

function u20:GetBuffCount(a2) -- Line: 1676
    return self.Replicator:Get(a2 .. "Buff") or 0
end

local function applyGlobalRangeMultipliers(a1) -- Line: 1680
    -- upvalues: GameState (val), GameRules (val)
    if GameState.IsModifierEnabled("Fog") then
        a1 = math.round(a1 * 0.65)
    end
    local v1 = GameRules.Get("TowerRangeMultiplier") or 1
    if v1 ~= 1 then
        a1 = math.round(a1 * v1)
    end
    return a1
end

local function getEnhancedOpticsRangeBonus(a1) -- Line: 1693
    -- upvalues: GameRules (val), Enum_2 (val), SkillsUtil (val)
    if a1.OwnerId and GameRules.HasSkill(Enum_2.SkillTreeNode.EnhancedOptics) then
        return a1.Stats.Range * SkillsUtil.skillEval({UserId = a1.OwnerId}, Enum_2.SkillTreeNode.EnhancedOptics) / 100
    end
    return 0
end

function u20.GetRange(a1) -- Line: 1704 -- upvalues: getEnhancedOpticsRangeBonus (val), GameState (val), GameRules (val)
    local v1 = a1.Replicator:Get("Range")
    local v2 = v1 + (v1 * ((a1:GetBuffCount("Range")) - a1:GetBuffCount("Scared")) / 100 + getEnhancedOpticsRangeBonus(a1))
    if GameState.IsModifierEnabled("Fog") then
        v2 = math.round(v2 * 0.65)
    end
    local v3 = GameRules.Get("TowerRangeMultiplier") or 1
    if v3 ~= 1 then
        v2 = math.round(v2 * v3)
    end
    return v2
end

function u20.GetCooldown(a1) -- Line: 1712
    return (math.clamp(a1.Cooldown - a1.Cooldown * (a1.CooldownBuff / 100) + a1.Cooldown * (a1.FatigueBuff / 100), 0.02, (1 / 0)))
end

function u20.Bullet(a1, a2) -- Line: 1721 -- upvalues: u251 (val), Laser (val) -- types: a1: table, a2: table
    if a2.End ~= nil and a2.Start ~= nil then
        local Magnitude = (a2.Start - a2.End).Magnitude
        local v1 = (CFrame.new(a2.Start, a2.End)) * CFrame.Angles(
            math.rad((u251:NextNumber(-a2.Spread, a2.Spread)) / Magnitude),
            math.rad((u251:NextNumber(-a2.Spread, a2.Spread)) / Magnitude),
            0
        )
        Laser:Cast({
            Start = v1.p,
            Pos = v1 * CFrame.new(0, 0, -Magnitude).Position,
            Color = if not a2.NoColor then a2.Color or BrickColor.new("Cork").Color else nil,
            Transparency = a2.Transparency or 0.1,
            Size = a2.Size or 0.04,
            Fade = a2.Speed or 90,
            Type = "Bullet",
            Bullet = a2.Bullet or "Normal",
            Reversed = a2.Reversed,
        })
        return
    end
end

function u20.GetMaxAmmo(a1) -- Line: 1759
    return a1.MaxAmmo
end

function u20:Animate(a2, a3, a4) -- Line: 1763
    if a2 == "Idle" and self._idleAnimation then
        self._idleAnimation:Stop()
        self._idleAnimation = nil
    end
    local u13 = self.Animations[a2]
    local u22 = if not self.Path or not (0 < self.Path) then nil else string.char(96 + self.Path)

    local function findClosestAnimation() -- Line: 1772 -- upvalues: self (val), u22 (val), u13 (val)
        local v1 = nil
        local Upgrade = self.Upgrade
        for i = 0, Upgrade do
            if not u22 then
                if u13[tostring(i)] then
                    v1 = u13[tostring(i)]
                end
            elseif u13[("%*%*"):format(i, u22)] then
                v1 = u13[("%*%*"):format(i, u22)]
            elseif u13[tostring(i)] then
                v1 = u13[tostring(i)]
            end
        end
        return v1
    end

    if u13 then
        local v1 = findClosestAnimation()
        if v1 then
            if a3 then
                for k, v in pairs(a3) do
                    v1[k] = v
                end
            end
            if a2 == "Idle" then
                self._idleAnimation = v1
            end
            return v1:Play(a4 and unpack(a4))
        end
    end
end

function u20:DoUpgrade(a2, a3) -- Line: 1805 -- upvalues: Upgrades (val) -- types: self: table, a2: number, a3: number
    local v1 = nil
    if self.Model:FindFirstChild("UpgradesModule") then
        v1 = Upgrades.upgrade(self, a2, "tower")
    elseif self.Asset.Upgrades then
        local v2 = self.Asset.Upgrades[a2]
        v1 = v2 and v2(self.Model, self.Model.Upgrades:FindFirstChild(a2), self)
    end
    self.UpgradeFolder = self.Model.Upgrades:FindFirstChild((("%*%*"):format(a2, if not a3 or not (a3 > 0) then nil else string.char(a3 + 96))))
    if not self.UpgradeFolder then
        self.UpgradeFolder = self.Model.Upgrades:FindFirstChild((tostring(a2)))
    end
    self.OnUpgrade:Fire(a2, a3)
    return v1
end

local function currentTimeScale() -- Line: 1828 -- upvalues: GameState (val)
    local State = GameState.State
    return State and State.TimeScale or GameState.TimeScale or 1
end

function u20:Step(a2) -- Line: 1834 -- upvalues: NPCUtils (val), GameState (val)
    if self.OnStepFunction then
        debug.profilebegin("TowerOnStepFunction")
        self.OnStepFunction(a2)
        debug.profileend()
    end
    debug.profilebegin("TowerThreadStep")
    local stepThread = NPCUtils.stepThread
    local State = GameState.State
    stepThread(self, a2 * (State and State.TimeScale or GameState.TimeScale or 1))
    debug.profileend()
end

function u20:InvokeServer(a2, ...) -- Line: 1846 -- upvalues: Troops (val)
    local v1 = {...}
    if #v1 == 0 then
        return
    end
    return Troops:InvokeServer("TowerServerEvent", a2, self.Model, (table.unpack(v1)))
end

function u20:FireServer(a2, ...) -- Line: 1860 -- upvalues: Troops (val)
    local v1 = {...}
    if #v1 == 0 then
        return
    end
    Troops:FireServer("TowerServerEvent", a2, self.Model, (table.unpack(v1)))
end

function u20.IsAlive(a1) -- Line: 1869
    return a1.Maid ~= nil
end

function u20:Destroy() -- Line: 1873 -- upvalues: u253 (val), Enum_2 (val), u255 (val), u276 (val), u322 (val)
    local v1 = self.Replicator:Get("DeathEffect")
    if v1 and u253[v1] then
        u253[v1](self)
    end
    for k, v in pairs(Enum_2.BuffType) do
        if u255[v] then
            u255[v].Exit(self)
        end
    end
    for k2, i in pairs(Enum_2.StunType) do
        if u276[i] then
            u276[i].Exit(self)
        end
    end
    for j, k3 in u322 do
        k3.Exit(self)
    end
    if self.Maid then
        self.OnDestroy:Fire()
        self.Maid:Sweep()
        self.Maid = nil
    end
    if self._threadCo then
        coroutine.close(self._threadCo)
        self._threadCo = nil
    end
end

Scheduler.bindToSimulation("TowerReplicator", function(a1) -- Line: 1913 -- upvalues: u338 (val)
    debug.profilebegin("TowerReplicator")
    local v1 = {}
    local v2 = {}
    local v3 = 0
    local v4 = false
    debug.profilebegin("TowerReplicatorStepLoop")
    for i, j in u338 do
        j.UpdatedCFrame = false
        j:Step(a1)
        if j.UpdatedCFrame then
            v4 = true
            v3 = v3 + 1
            v1[v3] = j.Model.PrimaryPart
            v2[v3] = j.CFrame
        end
    end
    debug.profileend()
    if v4 then
        debug.profilebegin("TowerReplicatorBulkMoveTo")
        workspace:BulkMoveTo(v1, v2, Enum.BulkMoveMode.FireCFrameChanged)
        debug.profileend()
    end
    debug.profileend()
end, Enum.StepFrequency.Hz15)
TagReplicator.hook("Tower", function(a1, a2) -- Line: 1951 -- upvalues: u20 (val)
    return (u20.new(a1, a2))
end)
return u20