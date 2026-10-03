-- Script path: ReplicatedStorage.Content.Tower.Sniper.Animator
-- Decompile time: 2.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local v1 = {}
v1.__index = v1

function v1:Fire(a2) -- Line: 9 -- upvalues: SoundPool (val), Animation (val)
    local v1
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Position = PrimaryPart.Position
    local Handle = self.Model.Weapon.Gun:FindFirstChild("Handle")
    if not Handle then
        return
    end
    local Fire = Handle:FindFirstChild("Fire")
    if Fire and Fire:IsA("Sound") then
        local _soundPools = self._soundPools or {}
        self._soundPools = _soundPools
        local v2 = self._soundPools[Fire]
        if not v2 then
            local v3 = string.match(Fire.SoundId or "", "%d+")
            v1 = v3 and tonumber(v3)
            if v1 then
                v2 = SoundPool.new({size = 4, id = v1, parent = Handle, volume = Fire.Volume})
                self._soundPools[Fire] = v2
            end
        end
        if v2 then
            v2:play({
                playbackSpeed = (Random.new()):NextNumber(Fire.PlaybackSpeed * 0.9, Fire.PlaybackSpeed * 1.2),
                volume = Fire.Volume,
            })
        end
    end
    Handle.Start.Flash:Emit(1)
    Handle.Start.Spark:Emit(1)
    self:Bullet({Start = Handle.Start.WorldPosition, End = Position, Spread = 30, Speed = 180})
    local Level = self:GetLevel()
    local Fire_2 = self.Model.Animations.Fire
    v1 = 0
    for i = 0, Level do
        if Fire_2:FindFirstChild((tostring(i))) then
            v1 = i
        end
    end
    if not self._fireAnims then
        self._fireAnims = {}
    end
    if not self._fireAnims[v1] then
        self._fireAnims[v1] = (Animation.new({Track = Fire_2[v1].Fire, Target = self.Model.AnimationController}))
    end
    local v4 = self._fireAnims[v1]
    v4:Play()
    self:Face(Position)
    if self._conn then
        self._conn:Disconnect()
    end
    self._conn = (v4.Controller:GetMarkerReachedSignal("Sound")):Connect(function(a1) -- Line: 88 -- upvalues: Handle (val), self (val), SoundPool (upval)
        local v1 = Handle:FindFirstChild(a1)
        if v1 and v1:IsA("Sound") then
            local _soundPools = self._soundPools or {}
            self._soundPools = _soundPools
            local v2 = self._soundPools[v1]
            if not v2 then
                local v3 = string.match(v1.SoundId or "", "%d+")
                local v4 = v3 and tonumber(v3)
                if v4 then
                    v2 = SoundPool.new({size = 2, id = v4, parent = Handle, volume = v1.Volume})
                    self._soundPools[v1] = v2
                end
            end
            if v2 then
                v2:play({playbackSpeed = Random.new():NextNumber(0.9, 1), volume = v1.Volume})
            end
        end
    end)
    self:Delay(self.State.Cooldown)
end

function v1.Initialize(a1) -- Line: 118
    a1._conn = nil
    a1._soundPools = nil
    a1._fireAnims = nil
    a1.Maid:Mark(function() -- Line: 124 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            a1._soundPools = nil
        end
        if a1._conn then
            a1._conn:Disconnect()
            a1._conn = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 137 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            for k in a1._soundPools do
                a1._soundPools[k] = nil
            end
        end
        a1._fireAnims = nil
    end)
    a1.Executables = {
        Fire = function(a1_2) -- Line: 150 -- upvalues: a1 (val)
            if a1_2 then
                a1:Fire(a1_2)
            end
        end,
    }
end

return v1