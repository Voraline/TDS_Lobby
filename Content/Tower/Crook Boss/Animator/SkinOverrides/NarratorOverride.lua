-- Script path: ReplicatedStorage.Content.Tower.Crook Boss.Animator.SkinOverrides.NarratorOverride
-- Decompile time: 2.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GlobalBus = require(ReplicatedStorage.Shared.Modules.GlobalBus)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u26 = Random.new()
local u27 = false
return {
    init = function(a1) -- Line: 11
        -- upvalues: SoundService (val), EmitterManager (val), GlobalBus (val), u27 (ref), TimescaleUtilities (val)
        local function createSound(a1_2) -- Line: 12 -- upvalues: a1 (val), SoundService (upval) -- types: a1_2: string
            local Sound = Instance.new("Sound")
            Sound.SoundId = a1_2
            Sound.Volume = 1
            Sound.Parent = a1.Model.PrimaryPart
            Sound.SoundGroup = SoundService:WaitForChild("Towers")
            return Sound
        end

        EmitterManager.manualEmit(a1.Model:WaitForChild("PlacementVFX"))
        local v1 = {}
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://78101083824737"
        Sound.Volume = 1
        Sound.Parent = a1.Model.PrimaryPart
        Sound.SoundGroup = SoundService:WaitForChild("Towers")
        local Sound_2 = Instance.new("Sound")
        Sound_2.SoundId = "rbxassetid://131272723702316"
        Sound_2.Volume = 1
        Sound_2.Parent = a1.Model.PrimaryPart
        Sound_2.SoundGroup = SoundService:WaitForChild("Towers")
        local Sound_3 = Instance.new("Sound")
        Sound_3.SoundId = "rbxassetid://120421924590141"
        Sound_3.Volume = 1
        Sound_3.Parent = a1.Model.PrimaryPart
        Sound_3.SoundGroup = SoundService:WaitForChild("Towers")
        local Sound_4 = Instance.new("Sound")
        Sound_4.SoundId = "rbxassetid://114209212300693"
        Sound_4.Volume = 1
        Sound_4.Parent = a1.Model.PrimaryPart
        Sound_4.SoundGroup = SoundService:WaitForChild("Towers")
        local Sound_5 = Instance.new("Sound")
        Sound_5.SoundId = "rbxassetid://95770416886263"
        Sound_5.Volume = 1
        Sound_5.Parent = a1.Model.PrimaryPart
        Sound_5.SoundGroup = SoundService:WaitForChild("Towers")
        local Sound_6 = Instance.new("Sound")
        Sound_6.SoundId = "rbxassetid://117333368099188"
        Sound_6.Volume = 1
        Sound_6.Parent = a1.Model.PrimaryPart
        Sound_6.SoundGroup = SoundService:WaitForChild("Towers")
        local Sound_7 = Instance.new("Sound")
        Sound_7.SoundId = "rbxassetid://77491442289804"
        Sound_7.Volume = 1
        Sound_7.Parent = a1.Model.PrimaryPart
        Sound_7.SoundGroup = SoundService:WaitForChild("Towers")
        local Sound_8 = Instance.new("Sound")
        Sound_8.SoundId = "rbxassetid://129975062609136"
        Sound_8.Volume = 1
        Sound_8.Parent = a1.Model.PrimaryPart
        Sound_8.SoundGroup = SoundService:WaitForChild("Towers")
        v1[1] = Sound
        v1[2] = Sound_2
        v1[3] = Sound_3
        v1[4] = Sound_4
        v1[5] = Sound_5
        v1[6] = Sound_6
        v1[7] = Sound_7
        v1[8] = Sound_8
        a1._backupSounds = v1
        local Sound_9 = Instance.new("Sound")
        Sound_9.SoundId = "rbxassetid://139228198460919"
        Sound_9.Volume = 1
        Sound_9.Parent = a1.Model.PrimaryPart
        Sound_9.SoundGroup = SoundService:WaitForChild("Towers")
        a1._talkingSound = Sound_9
        GlobalBus.Connect("NarratorTalkingCrookBoss", function(a1_2, a2) -- Line: 34 -- upvalues: a1 (val), u27 (upval), TimescaleUtilities (upval)
            if a1.Model == a1_2 then
                return
            end
            if math.random() < 0.43 and not u27 then
                u27 = true
                TimescaleUtilities.Wait(a2.TimeLength * 0.93)
                a1._talkingSound:Play()
                task.wait(a1._talkingSound.TimeLength)
                u27 = false
            end
        end)
        a1.num = 1
    end,
    idle = function(a1) -- Line: 150
        if a1._fireAnimation then
            a1._fireAnimation:Stop(0.2)
            a1._playingLoopedAnimation = false
        end
    end,
    fire = function(a1, a2) -- Line: 51 -- upvalues: u26 (val), EmitterManager (val)
        if not a1._ads then
            a1._ads = true
            a1._currentADS = a1:_playAnimation("ADS")
        end
        if a1._adsDelay then
            task.cancel(a1._adsDelay)
        end
        a1._adsDelay = task.spawn(function() -- Line: 61 -- upvalues: a1 (val)
            a1:Delay(1.5)
            a1._ads = false
            a1._currentADS:Stop()
            a1:_playAnimation("ADS_TO_IDLE")
            if a1._fireAnimation then
                a1._fireAnimation:Stop()
                a1._playingLoopedAnimation = false
            end
        end)
        if (a1:GetLevel()) < 3 then
            a1.Model.PrimaryPart.Shoot.PlaybackSpeed = u26:NextNumber(0.9, 1.1)
            a1.Model.PrimaryPart.Shoot:Play()
            local Value = a1.Model.Configuration.GunShoot.Value
            a1:_playAnimation("Fire")
            EmitterManager.manualEmit(Value)
            a1:Bullet({
                Bullet = "NarratorBullet",
                Spread = 20,
                Speed = 140,
                NoColor = true,
                Reversed = true,
                Start = Value.WorldPosition,
                End = a2.PrimaryPart.Position,
            })
            return
        end
        if a1:GetLevel() == 3 then
            if not a1._playingLoopedAnimation then
                a1._playingLoopedAnimation = true
                a1._fireAnimation = a1:_playAnimation("Fire")
            end
            local Value_2 = a1.Model.Configuration.LeftyHandShoot.Value
            Value_2.ShootMax.PlaybackSpeed = u26:NextNumber(0.7, 1.1)
            Value_2.ShootMax:Play()
            EmitterManager.manualEmit(Value_2)
            a1:Bullet({
                Bullet = "LeftyBullet",
                Spread = 20,
                Speed = 140,
                NoColor = true,
                Reversed = true,
                Start = Value_2.WorldPosition,
                End = a2.PrimaryPart.Position,
            })
            return
        end
        if a1:GetLevel() == 4 then
            if not a1._playingLoopedAnimation then
                a1._playingLoopedAnimation = true
                a1._fireAnimation = a1:_playAnimation("Fire")
            end
            local Value_3 = a1.Model.Configuration.LeftyHandShoot.Value
            local Value_4 = a1.Model.Configuration.RightyHandShoot.Value
            Value_3.ShootMax.PlaybackSpeed = u26:NextNumber(0.7, 1.1)
            Value_3.ShootMax:Play()
            Value_4.ShootMax.PlaybackSpeed = u26:NextNumber(0.7, 1.1)
            Value_4.ShootMax:Play()
            EmitterManager.manualEmit(Value_3)
            EmitterManager.manualEmit(Value_4)
            a1:Bullet({
                Bullet = "LeftyBullet",
                Spread = 20,
                Speed = 140,
                NoColor = true,
                Reversed = true,
                Start = Value_3.WorldPosition,
                End = a2.PrimaryPart.Position,
            })
            a1:Bullet({
                Bullet = "RightyBullet",
                Spread = 20,
                Speed = 140,
                NoColor = true,
                Reversed = true,
                Start = Value_4.WorldPosition,
                End = a2.PrimaryPart.Position,
            })
        end
    end,
    backup = function(a1) -- Line: 157 -- upvalues: GlobalBus (val)
        if a1._fireAnimation then
            a1._fireAnimation:Stop()
            a1._playingLoopedAnimation = false
        end
        if not a1._ads then
            a1:_playAnimation("SUMMON")
        else
            a1:_playAnimation("SummonADS")
        end
        local v1 = a1._backupSounds[math.random(1, #a1._backupSounds)]
        v1:Play()
        GlobalBus.Fire("NarratorTalkingCrookBoss", a1.Model, v1)
    end,
}