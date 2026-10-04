-- Script path: ReplicatedStorage.Content.Tower.EvolvedJuggernaut.Animator
-- Decompile time: 9.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local Sounds = require(script.Parent.Sounds)
local v1 = {}
v1.__index = v1

function v1:_getAnimKey(a2) -- Line: 19
    local v1, v2
    local Level = self:GetLevel()
    local v3 = ""
    if self.Path == 1 then
        v3 = "a"
    elseif self.Path == 2 then
        v3 = "b"
    end
    local v4 = a2[1]
    for i, v in ipairs(a2) do
        v1 = tonumber((v:match("^(%d+)")))
        v2 = v:match("^%d+(.*)$") or ""
        if v1 and v1 <= Level then
            if v2 == "" or v2 == v3 then
                v4 = v
            end
        end
    end
    return v4
end

function v1:_setFireStance(a2, a3, a4) -- Line: 41 -- upvalues: GameState (val)
    local v1 = self._fireStances[a2]
    if not v1 then
        return
    end
    local v2 = v1[a3]
    if not v2 or self._currentFireTrack == v2 then
        return
    end
    local v3 = 0
    v2:Play()
    if a4 then
        if v2.Looped then
            a4 = math.clamp(a4 - 0.1, 0, (1 / 0))
        end
        v2:AdjustSpeed(a4)
    end
    for k, v in pairs(self._fireStances) do
        for k2, i in pairs(v) do
            if i.IsPlaying and k2 == a3 and v2 then
                v3 = v2.Length * (i.TimePosition / i.Length) * GameState.TimeScale
            end
            if i ~= v2 then
                i:Stop()
            end
        end
    end
    if v2 then
        v2.TimePosition = v3
    end
    self._currentFireTrack = v2
    self._currentStance = a3
end

function v1:_stopAllFireStances() -- Line: 83
    for k, v in pairs(self._fireStances) do
        for k2, i in pairs(v) do
            if i.IsPlaying then
                i:Stop()
            end
        end
    end
    self._currentFireTrack = nil
end

function v1:_getWeaponConfig() -- Line: 94
    if self._weaponConfig then
        return self._weaponConfig
    end
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        self._weaponConfig = Weapon:FindFirstChild("Configuration")
    end
    return self._weaponConfig
end

function v1:_getSoundParent() -- Line: 105
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Handle = Weapon:FindFirstChild("Handle")
        if Handle then
            return Handle
        end
    end
    return self.Model.PrimaryPart
end

function v1:_getStartAttachment() -- Line: 116
    local v1, v2
    local v3 = self:_getWeaponConfig()
    if not v3 then
        return nil
    end
    local Starts = v3.Attachments.Starts
    local Level = self:GetLevel()
    local v4 = ""
    if self.Path == 1 then
        v4 = "a"
    elseif self.Path == 2 then
        v4 = "b"
    end
    local Start = Starts:FindFirstChild("Start")
    for i = 0, Level do
        v2 = Starts:FindFirstChild("Start" .. i .. v4)
        v1 = Starts:FindFirstChild("Start" .. i)
        if v4 == "" then
            if v1 then
                Start = v1
            end
        elseif v2 then
            Start = v2
        elseif v1 then
            Start = v1
        end
    end
    return Start and Start.Value or nil
end

function v1:_getBulletType() -- Line: 145 -- upvalues: ReplicatedStorage (val)
    local v1 = "Juggernaut"
    if self.Path == 1 then
        v1 = "Juggernaut_A"
    elseif self.Path == 2 then
        v1 = "Juggernaut_B"
    end
    if ReplicatedStorage.Assets.Effects.Misc.Bullets:FindFirstChild(v1) then
        return v1, true
    end
    return "Normal", false
end

function v1:_getSounds() -- Line: 160 -- upvalues: Sounds (val)
    return Sounds[self.Model.Name] or Sounds.Default
end

function v1:_getFireSoundId() -- Line: 164
    local v1 = self:_getSounds()
    local Level = self:GetLevel()
    if self.Path == 1 and Level >= 4 then
        if Level >= 6 then
            return v1.M240[3]
        end
        if Level >= 4 then
            return v1.M240[2]
        end
        return v1.M240[1]
    end
    if self.Path == 2 and Level >= 7 then
        return v1.Minigun[5]
    end
    if self.Path == 2 and Level >= 6 then
        return v1.Minigun[4]
    end
    if self.Path == 2 and Level >= 4 then
        return v1.Minigun[3]
    end
    if Level >= 3 then
        return v1.Minigun[2]
    end
    return v1.Minigun[1]
end

function v1:_playFireShot() -- Line: 191 -- upvalues: GameState (val)
    local _firePool = self._firePool
    if not _firePool then
        return
    end
    _firePool:play({playbackSpeed = math.random(95, 105) / 100 * GameState.TimeScale})
end

function v1:_startSpinLoop() -- Line: 199 -- upvalues: EasySound (val)
    if self._spinPlayer then
        return
    end
    if self.Path == 1 and 4 <= (self:GetLevel()) then
        return
    end
    local u10 = self:_getSounds()
    local u13 = self:_getSoundParent()
    self._spinIntroPlayer = EasySound.Play({
        looped = false,
        volume = 0.2,
        audioGroup = "Towers",
        id = u10.SpinIntro,
        parent = u13,
    })
    self:Delay(self._spinIntroPlayer and self._spinIntroPlayer.TimeLength or 0, function() -- Line: 220 -- upvalues: self (val), EasySound (upval), u10 (val), u13 (val)
        if self._spinIntroPlayer then
            EasySound.Destroy(self._spinIntroPlayer)
            self._spinIntroPlayer = nil
        end
        if self._spinStopping then
            return
        end
        self._spinPlayer = EasySound.Play({
            looped = true,
            volume = 0.2,
            audioGroup = "Towers",
            id = u10.SpinLoop,
            parent = u13,
        })
    end)
end

function v1:_stopSpinLoop() -- Line: 239 -- upvalues: EasySound (val)
    if self.Path == 1 and 4 <= (self:GetLevel()) then
        return
    end
    self._spinStopping = true
    if self._spinIntroPlayer then
        self._spinIntroPlayer:Stop()
        EasySound.Destroy(self._spinIntroPlayer)
        self._spinIntroPlayer = nil
    end
    if self._spinPlayer then
        self._spinPlayer:Stop()
        EasySound.Destroy(self._spinPlayer)
        self._spinPlayer = nil
    end
    local v1 = self:_getSounds()
    local v2 = self:_getSoundParent()
    if self._spinOutroPlayer then
        local _spinOutroPlayer = self._spinOutroPlayer
        self._spinOutroPlayer = nil
        _spinOutroPlayer:Stop()
        EasySound.Destroy(_spinOutroPlayer)
    end
    local u52 = EasySound.Play({
        looped = false,
        volume = 0.2,
        audioGroup = "Towers",
        destroyOnEnd = true,
        id = v1.SpinOutro,
        parent = v2,
    })
    self._spinOutroPlayer = u52
    u52.Ended:Once(function() -- Line: 278 -- upvalues: self (val), u52 (val)
        if self._spinOutroPlayer == u52 then
            self._spinOutroPlayer = nil
        end
    end)
    self._spinStopping = false
end

function v1:_updateSpinPlaybackSpeeds() -- Line: 287 -- upvalues: GameState (val)
    local TimeScale = GameState.TimeScale
    if self._spinPlayer then
        self._spinPlayer.PlaybackSpeed = TimeScale
    end
    if self._spinIntroPlayer then
        self._spinIntroPlayer.PlaybackSpeed = TimeScale
    end
    if self._spinOutroPlayer then
        self._spinOutroPlayer.PlaybackSpeed = TimeScale
    end
end

function v1:Fire(a2) -- Line: 301 -- upvalues: SharedControllerFunctions (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local v1 = 0.1 / self.State.Cooldown
    self:_setFireStance(self:_getAnimKey(self._fireAnimKeys), "Loop", v1)
    self:_playFireShot()
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    SharedControllerFunctions.AimArmsAt(self, Position)
    SharedControllerFunctions.AimHeadAt(self, Position_2)
    local v2 = self:_getStartAttachment()
    if v2 then
        EmitterManager.manualEmit(v2)
    end
    local v3, v4 = self:_getBulletType()
    local v5 = {Spread = 50, Speed = 140}
    local WorldPosition = v2 and v2.WorldPosition or PrimaryPart.Position
    v5.Start = WorldPosition
    v5.End = Position
    v5.Bullet = v3
    v5.NoColor = v4
    self:Bullet(v5)
end

function v1.Initialize(a1) -- Line: 341
    -- upvalues: SoundPool (val), EasySound (val), RunService (val), SharedControllerFunctions (val), GameState (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local u222 = true
    local u214 = tick()
    local u230 = tick()
    a1.currentStance = ""
    a1._currentFireTrack = nil
    a1._currentStance = ""
    a1._adsTrack = nil
    a1._fireStances = {}
    a1._fireAnimKeys = {}
    a1._adsAnimations = {}
    a1._adsAnimKeys = {}
    a1._spinPlayer = nil
    a1._spinIntroPlayer = nil
    a1._spinOutroPlayer = nil
    a1._spinStopping = false
    a1._firePool = nil
    local v1 = a1:_getFireSoundId()
    a1._firePool = SoundPool.new({
        volume = 1,
        size = 4,
        audioGroup = "Towers",
        timeScaled = true,
        id = v1,
        parent = a1:_getSoundParent(),
    })
    a1.Maid:Mark(function() -- Line: 372 -- upvalues: a1 (val), EasySound (upval)
        if a1._firePool then
            a1._firePool:destroy()
            a1._firePool = nil
        end
        if a1._spinIntroPlayer then
            a1._spinIntroPlayer:Stop()
            EasySound.Destroy(a1._spinIntroPlayer)
            a1._spinIntroPlayer = nil
        end
        if a1._spinPlayer then
            a1._spinPlayer:Stop()
            EasySound.Destroy(a1._spinPlayer)
            a1._spinPlayer = nil
        end
        if a1._spinOutroPlayer then
            a1._spinOutroPlayer:Stop()
            EasySound.Destroy(a1._spinOutroPlayer)
            a1._spinOutroPlayer = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 395 -- upvalues: a1 (val), SoundPool (upval)
        local v1 = a1:_getFireSoundId()
        if a1._firePool then
            a1._firePool:destroy()
        end
        a1._firePool = SoundPool.new({
            volume = 1,
            size = 4,
            audioGroup = "Towers",
            timeScaled = true,
            id = v1,
            parent = a1:_getSoundParent(),
        })
    end)
    a1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 410 -- upvalues: a1 (val)
        a1:_updateSpinPlaybackSpeeds()
    end)))
    local Animations = a1.Model:WaitForChild("Animations")
    local Fire = Animations:FindFirstChild("Fire")
    if Fire then
        local Name, v2
        for k, v in pairs(Fire:GetChildren()) do
            if v:IsA("Folder") then
                Name = v.Name
                a1._fireStances[Name] = {}
                table.insert(a1._fireAnimKeys, Name)
                for k2, i in pairs(v:GetChildren()) do
                    if i:IsA("Animation") then
                        v2 = a1._fireStances[Name]
                        v2[i.Name] = (AnimationController:LoadAnimation(i))
                    end
                end
            end
        end
    end
    local ADSIdle = Animations:FindFirstChild("ADSIdle")
    if ADSIdle then
        for k3, j in pairs(ADSIdle:GetChildren()) do
            if j:IsA("Animation") then
                a1._adsAnimations[j.Name] = (AnimationController:LoadAnimation(j))
                table.insert(a1._adsAnimKeys, j.Name)
            end
        end
    end

    local function sortKeys(a1, a2) -- Line: 442
        local v1 = tonumber((a1:match("^(%d+)"))) or 0
        local v2 = tonumber((a2:match("^(%d+)"))) or 0
        if v1 ~= v2 then
            return v1 < v2
        end
        return a1 < a2
    end

    table.sort(a1._fireAnimKeys, sortKeys)
    table.sort(a1._adsAnimKeys, sortKeys)
    if not a1.FBXModel then
        local Torso = a1.Model:FindFirstChild("Torso")
        if Torso then
            local v3 = {}
            local v4 = Torso:FindFirstChild("Right Shoulder")
            local v5 = Torso:FindFirstChild("Left Shoulder")
            if v4 then
                table.insert(v3, v4)
            end
            if v5 then
                table.insert(v3, v5)
            end
            if #v3 > 0 then
                SharedControllerFunctions.RegisterJoints(a1, v3)
            end
        end
    end
    a1:Thread(function() -- Line: 471
        -- upvalues: a1 (val), u214 (ref), GameState (upval), u222 (ref), u230 (ref), SharedControllerFunctions (upval)
        local v1 = a1:FindTarget()
        local v2 = a1:_getAnimKey(a1._fireAnimKeys)
        local v3 = tick()
        local v4 = (v3 - u214) * GameState.TimeScale
        if a1.State.Cooldown <= v4 then
            if v1 and v1.PrimaryPart then
                if a1._adsTrack then
                    a1._adsTrack:Stop()
                    a1._adsTrack = nil
                    a1._currentStance = ""
                end
                if u222 then
                    u222 = false
                    u230 = v3
                    a1:_startSpinLoop()
                end
                if u222 then
                    a1:_setFireStance(v2, "Intro", 1.5 / (a1.Stats.Attributes.RevTime or 1.4) * GameState.TimeScale)
                    a1:Face(v1.PrimaryPart.Position)
                    SharedControllerFunctions.AimArmsAt(a1, v1.PrimaryPart.Position)
                    a1:Delay(a1.State.Cooldown)
                else
                    v4 = (v3 - u230) * GameState.TimeScale
                    if not ((a1.Stats.Attributes.RevTime or 1.4) <= v4) then
                        a1:_setFireStance(v2, "Intro", 1.5 / (a1.Stats.Attributes.RevTime or 1.4) * GameState.TimeScale)
                        a1:Face(v1.PrimaryPart.Position)
                        SharedControllerFunctions.AimArmsAt(a1, v1.PrimaryPart.Position)
                        a1:Delay(a1.State.Cooldown)
                    else
                        a1:Fire(v1)
                    end
                end
                u214 = v3
                return
            end
            if not u222 and (v3 - u214) * GameState.TimeScale < (a1.Stats.Attributes.SlowTime or 1) then
                if a1._currentStance == "ADSIdle" then
                    return
                end
                a1:_stopAllFireStances()
                local v5 = a1._adsAnimations[(a1:_getAnimKey(a1._adsAnimKeys))]
                if v5 then
                    v5:Play()
                    v5.Looped = true
                    a1._adsTrack = v5
                end
                a1._currentStance = "ADSIdle"
                return
            end
            if not u222 then
                v4 = (v3 - u214) * GameState.TimeScale
                if (a1.Stats.Attributes.SlowTime or 1) <= v4 then
                    u222 = true
                    if a1._adsTrack then
                        a1._adsTrack:Stop()
                        a1._adsTrack = nil
                    end
                    a1:_stopSpinLoop()
                    a1:_setFireStance(v2, "Outro", 1 * GameState.TimeScale)
                end
            end
        end
    end)
end

return v1