-- Script path: ReplicatedStorage.Content.NewEnemies.Null Guardian.Animator.NullGuardianAnimatorStates
-- Decompile time: 6.97 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NullGuardianSounds = require(script.Parent:WaitForChild("NullGuardianSounds"))
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local NullGuardian = ReplicatedStorage.Assets.Effects.Mob.NullGuardian
local v1 = {}
local v2 = {
    name = "RageIntro",
    onEnter = function(a1) -- Line: 30 -- upvalues: Shaker (val)
        a1:animate("RageIntro")
        Shaker:Shake({1, 15, 0, 1.5}, 0.5, 1, {radius = 100, position = a1.Model:GetPivot().Position})
        a1:Wait(2.7)
    end,
}
local v3 = {
    name = "SwitchPath",
    onEnter = function(a1, a2, a3, a4, a5) -- Line: 57
        -- upvalues: TweenService (val), TimescaleUtilities (val), GameState (val), NullGuardian (val), EasySound (val)
        -- upvalues: NullGuardianSounds (val), EmitterManager (val)
        local WorldCFrame = a1.PrimaryPart.PortalPosition.WorldCFrame
        local v1 = WorldCFrame * CFrame.new(0, 2, 0)
        a1:Face(a4.endPosition, TweenInfo.new(0.6), true)
        a1:animate("Teleport")

        local function transparencyTween(a1_2) -- Line: 68
            -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
            local Transparency, v1, v2, v3
            local v4 = a1_2
            for i, j in a1.Model:GetDescendants() do
                if j.Name ~= "Hitbox" and j.Name ~= "RootPart" and j:IsA("BasePart") then
                    v2 = v4
                    if v4 == 1 and not j:GetAttribute("OriginalTransparency") then
                        Transparency = j.Transparency
                        j:SetAttribute("OriginalTransparency", Transparency)
                    end
                    if v4 == 0 and j:GetAttribute("OriginalTransparency") then
                        v2 = j:GetAttribute("OriginalTransparency")
                    end
                    v3 = TweenService
                    v1 = TweenInfo.new(TimescaleUtilities.GetScaledTime(0.5))
                    v3:Create(j, v1, {Transparency = v2}):Play()
                end
            end
        end

        local Scalar = GameState.Paths[a1.PathTeam][a2]:GetScalar(a1.PathDistance + 5, 1)
        a1.Rotation = CFrame.new() * CFrame.new(a1.Position, Scalar).Rotation
        local v2 = NullGuardian.LaneSwitchDoor:Clone()
        v2:PivotTo(WorldCFrame)
        v2.Parent = workspace.CurrentCamera
        EasySound.Play({
            volume = 1,
            destroyOnEnd = true,
            id = NullGuardianSounds.SwitchPathIntro,
            parent = a1.Model.PrimaryPart,
        })
        local v3 = TweenService:Create(
            v2,
            TweenInfo.new(TimescaleUtilities.GetScaledTime(0.5), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Transparency = 0.5}
        )
        v3:Play()
        v3.Completed:Wait()
        EmitterManager.toggle(v2, true)
        local v4 = TweenService:Create(
            v2,
            TweenInfo.new(TimescaleUtilities.GetScaledTime(1), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Transparency = 1, CFrame = v1}
        )
        EmitterManager.toggle(a1.Model, false)
        transparencyTween(1)
        v4:Play()
        v4.Completed:Wait()
        local v5 = NullGuardian.LaneSwitchParticle:Clone()
        v5:PivotTo(a1.Model.PrimaryPart.CFrame)
        v5:SetAttribute("OriginalTransparency", 1)
        v5.Parent = a1.Model
        transparencyTween(0)
        EasySound.Play({
            volume = 1,
            destroyOnEnd = true,
            id = NullGuardianSounds.SwitchPath,
            parent = a1.Model.PrimaryPart,
        })
        EmitterManager.toggle(a1.Model, true)
        EmitterManager.manualEmit(v5)
        v2:Destroy()
        TimescaleUtilities.Wait(0.5)
        v5:Destroy()
    end,
}
local v4 = {
    name = "SummonClones",
    onEnter = function(a1, a2, a3) -- Line: 159
        -- upvalues: EasySound (val), NullGuardianSounds (val)
        for i = 1, a3 do
            EasySound.Play({
                volume = 1,
                destroyOnEnd = true,
                id = NullGuardianSounds.SummonClones,
                parent = a1.Model.PrimaryPart,
            })
            a1:animate("SummonClones")
            a1:Wait(a2)
        end
    end,
}
local v5 = {
    name = "CosmicSpear",
    onEnter = function(a1, a2) -- Line: 181
        -- upvalues: TimescaleUtilities (val), NullGuardian (val), TweenService (val), EmitterManager (val)
        -- upvalues: CustomProjectile (val), EasySound (val), NullGuardianSounds (val), Shaker (val), Debris (val)
        local Length, Transparency, v1, v2, v3

        local function stepProjectile(a1) -- Line: 182
            return (CFrame.lookAt(a1.start:Lerp(a1.goal, (math.min(a1.elapsedTime / a1.timeToDest, 1))), a1.goal)) * CFrame.Angles(1.5707963267948966, 0, 0)
        end

        local v4 = Random.new()
        local FireRate = a1.Stats.Moveset.CosmicSpear.FireRate
        local TimeToLand = a1.Stats.Moveset.CosmicSpear.TimeToLand
        local v5 = TimescaleUtilities.GetScaledTime(1)
        local v6 = math.floor(FireRate * #a2 / v5)
        local v7 = FireRate * #a2 - (v5 * v6 - 1)
        local v8 = nil
        local v9 = nil
        local v10 = nil
        for i, j in a2, v9, v10 do
            if not a1:IsAlive() then
                break
            end
            local u46 = NullGuardian.CosmicSpear:Clone()
            Transparency = u46.Transparency
            u46.Transparency = 1
            TweenService:Create(u46, TweenInfo.new(TimescaleUtilities.GetScaledTime(0.3)), {Transparency = Transparency}):Play()
            u46.Anchored = true
            u46.CFrame = (a1.Model:GetPivot()) * CFrame.new(
                (math.pow(-1, (v4:NextInteger(0, 1)))) * Random.new():NextNumber(150, 250),
                100,
                (math.pow(-1, (v4:NextInteger(0, 1)))) * Random.new():NextNumber(150, 250)
            )
            u46.CFrame = (CFrame.new(u46.Position, j)) * CFrame.Angles(1.5707963267948966, 0, 0)
            u46.Transparency = 0
            u46.Parent = workspace.CurrentCamera
            EmitterManager.toggle(u46, true)
            if v6 > 0 then
                if not v8 or v5 < TimescaleUtilities.GetScaledTime(tick() - v8) then
                    v1 = a1:animate("CosmicSpear")
                    if not (v5 > 0) then
                        v2 = 0
                    else
                        Length = v1.Length
                        v2 = Length / (not (v6 ~= 1) and v7 or v5) or 0
                    end
                    v1:AdjustSpeed(v2)
                    v3 = TweenInfo.new(FireRate)
                    a1:Face(j, v3, true)
                    v8 = tick()
                    v6 = v6 - 1
                end
            end
            CustomProjectile:ThrowProjectile(u46.Position, j, TimeToLand, u46, stepProjectile, function() -- Line: 247
                -- upvalues: EasySound (upval), NullGuardianSounds (upval), j (val), EmitterManager (upval), a1 (val)
                -- upvalues: Shaker (upval), u46 (val), Debris (upval)
                EasySound.Play({
                    volume = 1,
                    destroyOnEnd = true,
                    id = NullGuardianSounds.CosmicSpear,
                    position = j,
                })
                EmitterManager.Emit("PurpleExplosion", CFrame.new(j), a1.Stats.Moveset.CosmicSpear.ExplosionRadius / 6)
                Shaker:Shake({0.75, 10, 0, 0.5}, 0.5, 1, {radius = 100, position = j})
                EmitterManager.toggle(u46, false, "ParticleEmitter")
                u46.Transparency = 1
                Debris:AddItem(u46, 2)
            end)
            a1:Wait(FireRate)
        end
    end,
}
v1[1] = {
    name = "Walk",
    onEnter = function(a1) -- Line: 18
        a1:animate("WalkAnimation")
    end,
}
v1[2] = {
    name = "RageWalk",
    onEnter = function(a1) -- Line: 24
        a1:animate("RageWalkAnimation")
    end,
}
v1[3] = v2
v1[4] = {
    name = "Death",
    onEnter = function(a1) -- Line: 41
        if not a1._isDead then
            if a1._nullBubbleEffect then
                a1._nullBubbleEffect:Destroy()
            end
            local NullAura = a1.Model:FindFirstChild("NullAura")
            if NullAura then
                NullAura:Destroy()
            end
            a1._isDead = true
            a1:animate("Death")
        end
    end,
}
v1[5] = v3
v1[6] = {
    name = "LaneSwitch",
    onEnter = function(a1) end,
}
v1[7] = v4
v1[8] = {
    name = "NullBubble",
    onEnter = function(a1) -- Line: 174
        a1:animate("NullBubble")
        a1:Wait(2)
    end,
}
v1[9] = v5
return v1