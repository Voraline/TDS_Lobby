-- Script path: ReplicatedStorage.Content.NewEnemies.Champion Templar.Animator.ChampionTemplarAnimationStates
-- Decompile time: 7.57 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u27 = require("./ChampionTemplarSounds")
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local ChampionTemplar = ReplicatedStorage.Assets.Effects.Mob.ChampionTemplar
local u57 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 2)
local v1 = {}
local v2 = {
    name = "HammerToMinigun",
    onEnter = function(a1) -- Line: 65 -- upvalues: TweenService (val), u57 (val)
        a1:stopAllAnimations()
        local Hammer_Handle = a1.Model.PrimaryPart.Hammer_Handle
        local HammerToMinigun = a1.animations.HammerToMinigun
        local v1 = HammerToMinigun:Play()
        HammerToMinigun:AdjustSpeed(1 / (a1.Stats.ModeTransitionTime / v1.Length))
        a1:setWeaponTransparency("Minigun", 0)
        a1.sounds.HammerToMinigun:Play()
        a1:Delay(v1.Length * 0.95, function() -- Line: 78 -- upvalues: a1 (val), Hammer_Handle (val), TweenService (upval), u57 (upval)
            local u5 = a1.Model.HAMMER:Clone()
            u5.Transparency = 0
            local Motor6D = u5:FindFirstChildOfClass("Motor6D")
            if Motor6D then
                Motor6D:Destroy()
            end
            u5.Anchored = true
            u5.Parent = workspace.CurrentCamera
            u5.CFrame = Hammer_Handle.TransformedWorldCFrame * (Hammer_Handle.WorldCFrame:ToObjectSpace(u5.CFrame))
            local v1 = TweenService:Create(u5, u57, {Transparency = 1})
            v1:Play()
            v1.Completed:Once(function() -- Line: 95 -- upvalues: u5 (val)
                u5:Destroy()
            end)
        end)
        v1.Stopped:Wait()
        a1:setWeaponTransparency("Hammer", 1)
        return {a1}
    end,
}
local v3 = {
    name = "MinigunToHammer",
    onEnter = function(a1) -- Line: 111 -- upvalues: TweenService (val), u57 (val)
        a1:stopAllAnimations()
        local Minigun_BODY = a1.Model.PrimaryPart.ROOT.Minigun_BODY
        local MinigunToHammer = a1.animations.MinigunToHammer
        MinigunToHammer:AdjustSpeed(1 / (a1.Stats.ModeTransitionTime / MinigunToHammer.Controller.Length))
        local v1 = MinigunToHammer:Play()
        a1:setWeaponTransparency("Hammer", 0)
        a1.sounds.MinigunToHammer:Play()
        a1:Delay(v1.Length * 0.95, function() -- Line: 125 -- upvalues: a1 (val), Minigun_BODY (val), TweenService (upval), u57 (upval)
            local u5 = a1.Model.MINIGUN:Clone()
            u5.Transparency = 0
            local Motor6D = u5:FindFirstChildOfClass("Motor6D")
            if Motor6D then
                Motor6D:Destroy()
            end
            u5.Anchored = true
            u5.Parent = workspace.CurrentCamera
            u5.CFrame = Minigun_BODY.TransformedWorldCFrame * (Minigun_BODY.WorldCFrame:ToObjectSpace(u5.CFrame))
            local v1 = TweenService:Create(u5, u57, {Transparency = 1})
            v1:Play()
            v1.Completed:Once(function() -- Line: 142 -- upvalues: u5 (val)
                u5:Destroy()
            end)
        end)
        v1.Stopped:Wait()
        a1:setWeaponTransparency("Minigun", 1)
        return {a1}
    end,
}
local v4 = {
    name = "FocusedFire",
    onEnter = function(a1, a2) -- Line: 158
        -- upvalues: ReplicatedStorage (val), NewTween (val), EmitterManager (val)
        local FocusedFire = a1.Stats.Moveset.FocusedFire
        local HitboxSize = FocusedFire.HitboxSize
        local PrimaryPart = a1.Model.PrimaryPart
        a1:stopAllAnimations()
        a1:Face(a2, (TweenInfo.new(0.5)))
        local FireIntro = a1.animations.FireIntro
        local FireLoop = a1.animations.FireLoop
        local FireOutro = a1.animations.FireOutro
        local FireIntroTime = FocusedFire.FireIntroTime
        local FireDuration = FocusedFire.FireDuration
        local FireOutroTime = FocusedFire.FireOutroTime
        local v1 = 1 / (FireIntroTime / FireIntro.Controller.Length)
        FireIntro:AdjustSpeed(v1)
        FireIntro:Play()
        local MinigunIntro = a1.sounds.MinigunIntro
        MinigunIntro:SetAttribute("PlaybackSpeed", v1 - 0.2)
        MinigunIntro:Play()
        local v2 = PrimaryPart.Node.CFrame.Y + 0.1
        local u60 = ReplicatedStorage.Assets.Effects.Mob.ChampionTemplar.MinigunGround:Clone()
        u60.Size = Vector3.new(HitboxSize.X, 0.1, HitboxSize.Z)
        u60.Front.CFrame = CFrame.new(0, 0, -HitboxSize.Z / 2)
        u60.End.CFrame = CFrame.new(0, 0, HitboxSize.Z / 2)
        u60.CFrame = (CFrame.lookAlong(PrimaryPart.Position, (a2 - PrimaryPart.Position) * Vector3.new(1, 0, 1))) * CFrame.new(0, v2, -6)
        u60.Parent = workspace.CurrentCamera

        local function getNumSeq1(a1) -- Line: 193 -- types: a1: number
            local v1 = math.lerp(1, 0, a1)
            return NumberSequence.new({NumberSequenceKeypoint.new(0, v1), (NumberSequenceKeypoint.new(1, v1))})
        end

        local function getNumSeq2(a1) -- Line: 201 -- types: a1: number
            return NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.0646, (math.lerp(1, 0.5, a1))),
                (NumberSequenceKeypoint.new(1, 1)),
            })
        end

        local function getNumSeq3(a1) -- Line: 210 -- types: a1: number
            local v1 = math.lerp(1, 0.5, a1)
            return NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.2, v1),
                NumberSequenceKeypoint.new(0.8, v1),
                (NumberSequenceKeypoint.new(1, 1)),
            })
        end

        NewTween(u60, TweenInfo.new(FireIntroTime), function(a1) -- Line: 220 -- upvalues: u60 (val), getNumSeq1 (val), getNumSeq2 (val), getNumSeq3 (val)
            u60.IndicatorBeam.Transparency = getNumSeq1(a1)
            u60.Beam1.Transparency = getNumSeq2(a1)
            u60.Beam2.Transparency = getNumSeq3(a1)
        end)
        a1:Delay(FireIntroTime)
        FireLoop:Play()
        EmitterManager.toggle(a1.vfx.minigunShoot, true)
        local MinigunLoop = a1.sounds.MinigunLoop
        MinigunLoop:Play()
        a1:Delay(FireDuration)
        FireLoop:Stop()
        EmitterManager.toggle(a1.vfx.minigunShoot, false)
        EmitterManager.toggle(u60, false, "ParticleEmitter")
        MinigunLoop:Stop()
        local v3 = 1 / (FireOutroTime / FireOutro.Controller.Length)
        FireOutro:AdjustSpeed(v3)
        FireOutro:Play()
        local MinigunOutro = a1.sounds.MinigunOutro
        MinigunOutro:SetAttribute("PlaybackSpeed", v3)
        MinigunOutro:Play()
        NewTween(u60, TweenInfo.new(FireOutroTime), function(a1) -- Line: 249 -- upvalues: u60 (val), getNumSeq1 (val), getNumSeq2 (val), getNumSeq3 (val)
            local v1 = 1 - a1
            u60.IndicatorBeam.Transparency = getNumSeq1(v1)
            u60.Beam1.Transparency = getNumSeq2(v1)
            u60.Beam2.Transparency = getNumSeq3(v1)
        end, function() -- Line: 254 -- upvalues: u60 (val)
            u60:Destroy()
        end)
        return {a1}
    end,
}
local v5 = {
    name = "HammerThrow",
    onEnter = function(a1, a2, a3, a4) -- Line: 265
        -- upvalues: CustomProjectile (val), TweenService (val), u57 (val), Shaker (val), ReplicatedStorage (val)
        -- upvalues: EmitterManager (val), Debris (val), EasySound (val), u27 (val)
        a1:stopAllAnimations()
        local TotalDuration = a1.Stats.Moveset.HammerThrow.TotalDuration
        local HammerThrow = a1.animations.HammerThrow
        HammerThrow:AdjustSpeed(1 / (TotalDuration / HammerThrow.Controller.Length))
        local v1 = HammerThrow:Play()
        a1.sounds.Throw:Play()
        a1:Face(a2, (TweenInfo.new(0.5)))
        local v2 = (v1:GetMarkerReachedSignal("Throw")):Connect(function() -- Line: 278
            -- upvalues: a1 (val), a2 (val), CustomProjectile (upval), a3 (val), TweenService (upval), u57 (upval)
            -- upvalues: Shaker (upval), ReplicatedStorage (upval), a4 (val), EmitterManager (upval), Debris (upval)
            -- upvalues: EasySound (upval), u27 (upval)
            a1:setWeaponTransparency("Hammer", 1)
            local TransformedWorldCFrame = a1.Model.PrimaryPart.Hammer_Handle.TransformedWorldCFrame
            local Position = TransformedWorldCFrame.Position
            local u17 = a1.Model.HAMMER:Clone()
            local Motor6D = u17:FindFirstChildOfClass("Motor6D")
            if Motor6D then
                Motor6D:Destroy()
            end
            u17.Transparency = 0
            u17.Anchored = true
            u17.Parent = workspace.CurrentCamera
            local u49 = (CFrame.lookAlong(a2, (a2 - Position) * Vector3.new(1, 0, 1))) * CFrame.new(-1, 2, 1) * CFrame.fromEulerAnglesXYZ(3.6651914291880923, 0, -0.4363323129985824)
            CustomProjectile:ThrowProjectile(Position, a2, a3, u17, function(a1) -- Line: 306 -- upvalues: TransformedWorldCFrame (val), u49 (val)
                return (TransformedWorldCFrame:Lerp(u49, a1.alpha)) * CFrame.Angles(-6.283185307179586 * a1.alpha, 0, 0)
            end, function() -- Line: 310
                -- upvalues: TweenService (upval), u17 (val), u57 (upval), Shaker (upval), a2 (upval)
                -- upvalues: ReplicatedStorage (upval), a4 (upval), EmitterManager (upval), Debris (upval)
                -- upvalues: EasySound (upval), u27 (upval)
                local v1 = TweenService:Create(u17, u57, {Transparency = 1})
                v1:Play()
                v1.Completed:Once(function() -- Line: 315 -- upvalues: u17 (upval)
                    u17:Destroy()
                end)
                Shaker:Shake({1, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = a2})
                local v2 = ReplicatedStorage.Assets.Effects.Mob.ChampionTemplar.HammerExplosion:Clone()
                v2:PivotTo((CFrame.new(a2)))
                v2:ScaleTo(a4)
                v2.Parent = workspace.CurrentCamera
                EmitterManager.manualEmit(v2.PrimaryPart)
                Debris:AddItem(v2, 3)
                EasySound.Play({
                    volume = 2,
                    soundGroupName = "Enemies",
                    id = u27.ThrowImpact,
                    parent = v2.PrimaryPart,
                })
            end)
        end)
        local v3 = (v1:GetMarkerReachedSignal("Catch")):Connect(function() -- Line: 342 -- upvalues: a1 (val)
            a1:setWeaponTransparency("Hammer", 0)
        end)
        a1:Delay(TotalDuration)
        v2:Disconnect()
        v3:Disconnect()
        return {a1}
    end,
}
local v6 = {
    name = "FieryBoon",
    onEnter = function(a1, a2) -- Line: 358
        -- upvalues: ChampionTemplar (val), EmitterManager (val), Debris (val)
        local FieryBoon = a1.Stats.Moveset.FieryBoon
        a1:stopAllAnimations()
        local HammerSlam = a1.animations.HammerSlam
        HammerSlam:AdjustSpeed(1 / (FieryBoon.TotalDuration / HammerSlam.Controller.Length))
        local v1 = HammerSlam:Play()
        local v2 = (v1:GetMarkerReachedSignal("ShowTrail")):Connect(function() -- Line: 366 -- upvalues: a1 (val)
            a1:hammerEffects(true)
        end)
        local v3 = (v1:GetMarkerReachedSignal("HideTrail")):Connect(function() -- Line: 369 -- upvalues: a1 (val)
            a1:hammerEffects(false)
        end)
        a1.sounds.HammerSlam:Play()
        local v4 = ChampionTemplar.IndicatorArea:Clone()
        v4.Size = Vector3.new(a2 * 2, 0.1, a2 * 2)
        v4.CFrame = a1.Model.PrimaryPart.CFrame * CFrame.new(0, -a1.Height, 0)
        v4.Parent = workspace.CurrentCamera
        EmitterManager.toggle(v4, true)
        a1:Wait(FieryBoon.ImpactTime)
        local v5 = ChampionTemplar.HammerSmash:Clone()
        v5:ScaleTo(a2)
        v5:PivotTo(a1.Model.PrimaryPart.CFrame * (CFrame.new(0, -a1.Height, 0)))
        v5.PrimaryPart.Smash.CFrame = CFrame.new(0, 0, -6)
        v5.Parent = workspace.CurrentCamera
        EmitterManager.manualEmit(v5.PrimaryPart)
        Debris:AddItem(v5, 2)
        Debris:AddItem(v4, 2)
        v1.Stopped:Wait()
        EmitterManager.toggle(v4, false)
        v2:Disconnect()
        v3:Disconnect()
        return {a1}
    end,
}
v1[1] = {
    name = "Death",
    onEnter = function(a1) -- Line: 27
        local v1
        a1:stopAllAnimations()
        local MinigunDeath = a1.Replicator:Get("CurrentWeapon") == "Minigun" and a1.animations.MinigunDeath or a1.animations.HammerDeath
        local MinigunDeath_2 = v1 and a1.sounds.MinigunDeath or a1.sounds.HammerDeath
        MinigunDeath:Play()
        MinigunDeath_2:Play()
        return {a1}
    end,
}
v1[2] = {
    name = "MinigunWalk",
    onEnter = function(a1) -- Line: 45
        a1:stopAllAnimations()
        a1.animations.MinigunWalk:Play()
        return {a1}
    end,
}
v1[3] = {
    name = "HammerWalk",
    onEnter = function(a1) -- Line: 55
        a1:stopAllAnimations()
        a1.animations.HammerWalk:Play()
        return {a1}
    end,
}
v1[4] = v2
v1[5] = v3
v1[6] = v4
v1[7] = v5
v1[8] = v6
return v1