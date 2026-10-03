-- Script path: ReplicatedStorage.Content.Unit.Goon1.Animator
-- Decompile time: 3.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u36 = {}

u36["Game Master"] = function(a1, a2, a3) -- Line: 14 -- upvalues: SoundService (val), TweenService (val)
    local DynamicSound = a1.Model.HumanoidRootPart.DynamicSound
    local PercSound = a1.Model.HumanoidRootPart.PercSound
    if not PercSound.IsPlaying then
        PercSound:Play()
    end
    DynamicSound.SoundGroup = SoundService.Towers
    if not DynamicSound.IsPlaying then
        DynamicSound:Play()
    end
    if not a3 then
        TweenService:Create(
            DynamicSound,
            TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut),
            {Volume = if a2 then 0.2 else 0.3, PlaybackSpeed = if a2 then 0.85 else 1}
        ):Play()
        return
    end
    TweenService:Create(DynamicSound, TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Volume = 0.1, PlaybackSpeed = 0}):Play()
    TweenService:Create(PercSound, TweenInfo.new(2.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Volume = 0.1, PlaybackSpeed = 0}):Play()
end

function v1.Initialize(a1) -- Line: 56
    -- upvalues: u36 (val), Animation (val), SoundService (val), SoundPool (val), GameState (val), EmitterManager (val)
    local Animations = a1.Model:FindFirstChild("Animations")
    a1.animController = a1.Model:FindFirstChild("AnimationController")
    if u36[a1.Model.Name] then
        u36[a1.Model.Name](a1, false)
    end
    a1._walkAnim = Animation.new({
        IsPersistent = true,
        IgnorePriority = true,
        Target = a1.animController,
        Track = Animations.Walk,
    })
    a1._idleAnim = Animation.new({
        IsPersistent = true,
        IgnorePriority = true,
        Preload = true,
        Target = a1.animController,
        Track = Animations.Idle,
    })
    a1._fireAnim = Animation.new({
        IsPersistent = true,
        IgnorePriority = true,
        Preload = true,
        Target = a1.animController,
        Track = Animations.Fire,
    })
    a1._firing = false
    a1._lastShot = tick()

    function a1:fire(a2) -- Line: 92
        -- upvalues: SoundService (upval), SoundPool (upval), GameState (upval), EmitterManager (upval)
        local v1
        local Weapon = self.Model.Weapon
        local Configuration = Weapon:FindFirstChild("Configuration")
        local Handle = Weapon:FindFirstChild("Handle", true)
        local Value = Configuration and Configuration.Start.Value or Handle.Start
        local Value_2 = Configuration and Configuration.Fire.Value or Handle.Fire
        if Value_2 and Value_2:IsA("Sound") then
            if SoundService:FindFirstChild("Towers") then
                Value_2.SoundGroup = SoundService.Towers
            end
            local _soundPools = self._soundPools or {}
            self._soundPools = _soundPools
            local v2 = self._soundPools[Value_2]
            if not v2 then
                local v3 = string.match(Value_2.SoundId or "", "%d+")
                v1 = v3 and tonumber(v3) or nil
                if v1 then
                    v2 = SoundPool.new({
                        size = 4,
                        audioGroup = "Towers",
                        timeScaled = true,
                        id = v1,
                        parent = Value_2.Parent,
                        volume = Value_2.Volume,
                        playbackSpeed = Value_2.PlaybackSpeed,
                    })
                    self._soundPools[Value_2] = v2
                end
            end
            if not v2 then
                Value_2.PlaybackSpeed = GameState.TimeScale
                Value_2:Play()
            else
                local Attribute = Value_2:GetAttribute("PlaybackSpeed") or Value_2.PlaybackSpeed or 1
                v2:play({
                    playbackSpeed = (Random.new()):NextNumber(Attribute * 0.9, Attribute * 1.1),
                    volume = Value_2.Volume,
                })
            end
        end
        self._fireAnim:Play()
        EmitterManager.manualEmit(Value)
        if Weapon then
            v1 = {Start = Value.WorldPosition, End = a2, Spread = 50, Speed = 140}
            v1.Bullet = Configuration and Configuration:GetAttribute("Bullet") or nil
            v1.Reversed = Configuration and Configuration:GetAttribute("Reversed") or nil
            v1.NoColor = Configuration and Configuration:GetAttribute("NoColor") or nil
            v1.Color = Weapon:GetAttribute("BulletColor") or nil
            self:Bullet(v1)
        end
        self:Delay(self.Cooldown)
    end

    a1.Executables = {
        ShootState = function(a1_2) -- Line: 159 -- upvalues: a1 (val), u36 (upval) -- types: a1_2: boolean
            if not a1_2 then
                a1._walkAnim:Play()
                a1._idleAnim:Stop()
            else
                a1._walkAnim:Stop()
                a1._idleAnim:Play()
            end
            if u36[a1.Model.Name] then
                u36[a1.Model.Name](a1, a1_2)
            end
        end,
        Death = function() -- Line: 172 -- upvalues: u36 (upval), a1 (val), Animation (upval), Animations (val)
            if u36[a1.Model.Name] then
                u36[a1.Model.Name](a1, false, true)
            end
            a1.Dead = true
            Animation.new({Track = Animations.Death, Target = a1.animController}):Play()
            a1._walkAnim:Stop()
            a1._idleAnim:Stop()
        end,
        Face = function(a1_2) -- Line: 186 -- upvalues: a1 (val) -- types: a1_2: vector
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
        Shoot = function(a1_2) -- Line: 189 -- upvalues: a1 (val) -- types: a1_2: vector
            a1:fire(a1_2)
        end,
    }
    a1.Replicator:Set("Name", "Pistol Goon")
    a1._walkAnim:Play()
    if a1.Model.Name == "Rat King" then
        a1._keySpin = Animation.new({
            IsPersistent = true,
            IgnorePriority = true,
            Preload = true,
            Target = a1.animController,
            Track = Animations.KeySpin,
        })
        a1._keySpin:Play()
    end
    a1._fireAnim.Priority = Enum.AnimationPriority.Action
    if a1.Maid then
        a1.Maid:Mark(function() -- Line: 218 -- upvalues: a1 (val)
            if a1._soundPools then
                for i, j in a1._soundPools do
                    j:destroy()
                end
                a1._soundPools = nil
            end
        end)
    end
end

return v1