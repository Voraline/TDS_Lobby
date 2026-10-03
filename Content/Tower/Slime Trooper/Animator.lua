-- Script path: ReplicatedStorage.Content.Tower.Slime Trooper.Animator
-- Decompile time: 5.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1._debugLog(a1, a2) end

function v1._getAnimationTimeScale(a1) -- Line: 22 -- upvalues: GameState (val)
    return (math.max(GameState.TimeScale or 1, 0))
end

function v1:_syncTrackSpeed(a2) -- Line: 26
    if a2 then
        a2:AdjustSpeed((self:_getAnimationTimeScale()))
    end
end

function v1._isValidTarget(a1, a2) -- Line: 32
    if not a2 then
        return false
    end
    if typeof(a2) ~= "Instance" then
        if type(a2) == "table" and type(a2.IsAlive) == "function" then
            return a2:IsAlive()
        end
        return false
    end
    if not a2:IsA("Model") then
        return a2.Parent ~= nil
    end
    local Humanoid = a2:FindFirstChild("Humanoid")
    local v1 = false
    if a2.Parent ~= nil then
        v1 = not Humanoid or 0 < Humanoid.Health
    end
    return v1
end

function v1:_resolveTarget() -- Line: 52
    local v1 = self:FindTarget()
    if v1 then
        self._lastTarget = v1
        self._lastTargetSeenAt = tick()
        return v1
    end
    if tick() - (self._lastTargetSeenAt or 0) <= 0.35 and self:_isValidTarget(self._lastTarget) then
        return self._lastTarget
    end
    return nil
end

function v1._stopTrack(a1, a2, a3) -- Line: 68
    if a2 then
        a2:Stop(a3 or 0)
    end
end

function v1:_playStance(a2) -- Line: 74 -- types: self: table, a2: string
    if self._stanceName == a2 and self._stanceTrack then
        return
    end
    local v1 = self:Animate(a2, {
        Priority = if a2 ~= "ADS" then Enum.AnimationPriority.Action else Enum.AnimationPriority.Action2,
    }, {0.2})
    if v1 or a2 ~= "ADS" then
        self._stanceName = a2
    else
        v1 = self:Animate("Idle", {Priority = Enum.AnimationPriority.Action}, {0})
        self._stanceName = "Idle"
    end
    self:_stopTrack(self._stanceTrack, 0.2)
    self._stanceTrack = v1
    self:_syncTrackSpeed(self._stanceTrack)
end

function v1:_playReloadVisual() -- Line: 95
    if self._actionName == "Reload" then
        return
    end
    self:_playReloadSfx()
    self:_stopTrack(self._actionTrack, 0.1)
    self._actionName = "Reload"
    self._actionTrack = self:Animate("Reload", {Priority = Enum.AnimationPriority.Action4}, {0.1, 1})
    self:_syncTrackSpeed(self._actionTrack)
    if self._actionTrack then
        local _actionTrack = self._actionTrack
        self._actionTrack.Stopped:Once(function() -- Line: 112 -- upvalues: self (val), _actionTrack (val)
            if self._actionTrack ~= _actionTrack or _actionTrack.IsPlaying then
                return
            end
            self._actionTrack = nil
            self._actionName = nil
        end)
    end
end

function v1:_playReloadSfx() -- Line: 125 -- upvalues: EasySound (val)
    local _sounds = self._sounds and self._sounds.Reload
    if not _sounds then
        return
    end
    EasySound.Play({
        soundGroupName = "Towers",
        destroyOnEnd = true,
        id = _sounds.id,
        parent = self.Model.PrimaryPart,
        volume = _sounds.volume,
    })
end

function v1:_emitMuzzleVfx() -- Line: 140 -- upvalues: EmitterManager (val)
    for i, j in self._configFireAttachments do
        EmitterManager.manualEmit(j)
    end
end

function v1:_spawnProjectile(a2) -- Line: 146
    -- upvalues: ReplicatedStorage (val), CustomProjectile (val), EmitterManager (val), EasySound (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Value = nil
    local Level = self:GetLevel()
    local Weapon = self.Model:FindFirstChild("Weapon")
    local Configuration = Weapon and Weapon:FindFirstChild("Configuration")
    local Projectile = Configuration and Configuration:FindFirstChild("Projectile")
    if Projectile and Projectile:IsA("ObjectValue") and Projectile.Value then
        Value = Projectile.Value
    end
    local v1 = if not (Level >= 4) then "SlimeProjectile" else "SuperSlimeProjectile"
    if not Value then
        local Projectile_2 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Projectile")
        if not Projectile_2:FindFirstChild(v1) and not Projectile_2:FindFirstChild("SlimeProjectile") then
            warn((("SlimeTrooper: missing projectile template \"%*\" and fallback \"SlimeProjectile\""):format(v1)))
            return
        end
    end
    local WorldPosition = if not self._configFireAttachments[1] then self.Model.PrimaryPart.Position + Vector3.new(0, 2, 0) else self._configFireAttachments[1].WorldPosition
    local Position = PrimaryPart.Position
    local u100 = Value:Clone()
    u100.Parent = workspace.CurrentCamera
    u100.CFrame = CFrame.new(WorldPosition, Position)
    CustomProjectile:ThrowProjectile(WorldPosition, Position, (WorldPosition - Position).Magnitude / 40, u100, function(a1) -- Line: 189 -- upvalues: a2 (val)
        local Position = if not a2.PrimaryPart then a1.goal else a2.PrimaryPart.Position
        a1.goal = Position
        return CFrame.lookAt(a1.start:Lerp(Position, a1.alpha), Position)
    end, function(a1) -- Line: 196 -- upvalues: u100 (val), EmitterManager (upval), Level (val), EasySound (upval), self (val)
        u100:Destroy()
        EmitterManager.Emit(if not (Level >= 4) then "SlimeHit" else "SlimeSplatter", CFrame.new(a1.goal))
        EasySound.Play({
            soundGroupName = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = self._sounds.Impact.id,
            parent = workspace.Terrain,
            position = a1.goal,
            volume = self._sounds.Impact.volume,
        })
    end)
end

function v1:Fire(a2) -- Line: 214 -- upvalues: EasySound (val)
    local PrimaryPart = a2 and a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    self._lastTarget = a2
    self._lastTargetSeenAt = tick()
    self:Face(PrimaryPart.Position)
    self:_playStance("ADS")
    self:_stopTrack(self._actionTrack, 0)
    self._actionName = "Fire"
    self._actionTrack = self:Animate("Fire", {Priority = Enum.AnimationPriority.Action4}, {0.1, 1})
    self:_syncTrackSpeed(self._actionTrack)
    EasySound.Play({
        soundGroupName = "Towers",
        destroyOnEnd = true,
        id = self._sounds.Fire.id,
        parent = self.Model.PrimaryPart,
        volume = self._sounds.Fire.volume,
    })
    self:_emitMuzzleVfx()
    self:_spawnProjectile(a2)
    if self._actionTrack then
        local _actionTrack = self._actionTrack
        self._actionTrack.Stopped:Once(function() -- Line: 247 -- upvalues: self (val), _actionTrack (val)
            if self._actionTrack ~= _actionTrack then
                return
            end
            self._actionTrack = nil
            self._actionName = nil
            if self._pendingReloadVisual and self._reloading then
                self._pendingReloadVisual = false
                self:_playReloadVisual()
            end
        end)
    end
end

function v1.Initialize(a1) -- Line: 262
    a1._sounds = require(script.Parent:WaitForChild("Sounds"))
    a1._reloading = false
    a1._pendingReloadVisual = false
    a1._actionTrack = nil
    a1._actionName = nil
    a1._stanceTrack = nil
    a1._stanceName = nil
    a1._lastTarget = nil
    a1._lastTargetSeenAt = 0
    a1._configFireAttachments = {}
    local Configuration = a1.Model:FindFirstChild("Configuration", true)
    if Configuration then
        for i, j in Configuration:GetChildren() do
            if j.Name == "Fire" and j:IsA("ObjectValue") and j.Value then
                table.insert(a1._configFireAttachments, j.Value)
            end
        end
    end
    local Animations = a1.Model:FindFirstChild("Animations")
    if Animations then
        for k, n in Animations:GetChildren() do
            for m, i5 in n:GetChildren() do
                if i5:IsA("Animation") then
                    a1.Model.AnimationController:LoadAnimation(i5)
                elseif i5:IsA("Folder") then
                    for i6, i7 in i5:GetChildren() do
                        if i7:IsA("Animation") then
                            a1.Model.AnimationController:LoadAnimation(i7)
                        end
                    end
                end
            end
        end
    end
    a1.Executables = {
        Fire = function(a1_2) -- Line: 301 -- upvalues: a1 (val)
            if a1_2 then
                a1:Fire(a1_2)
            end
        end,
        Reloading = function(a1_2) -- Line: 306 -- upvalues: a1 (val) -- types: a1_2: boolean
            a1._reloading = a1_2
            if not a1_2 then
                a1._pendingReloadVisual = false
                return
            end
            if a1._actionName == "Fire" then
                a1._pendingReloadVisual = true
                return
            end
            a1._pendingReloadVisual = false
            a1:_playReloadVisual()
        end,
    }
    a1:_playStance("Idle")
    a1:Thread(function() -- Line: 323 -- upvalues: a1 (val)
        a1:_syncTrackSpeed(a1._stanceTrack)
        a1:_syncTrackSpeed(a1._actionTrack)
        if a1._actionTrack and a1._actionTrack.IsPlaying then
            return
        end
        if a1:_resolveTarget() then
            a1:_playStance("ADS")
            return
        end
        a1:_playStance("Idle")
    end)
    a1.OnUpgrade:Connect(function() -- Line: 339 -- upvalues: a1 (val)
        a1._reloading = false
        a1._pendingReloadVisual = false
        a1._lastTarget = nil
        a1._lastTargetSeenAt = 0
        a1:_stopTrack(a1._actionTrack, 0)
        a1._actionTrack = nil
        a1._actionName = nil
        a1:_playStance("Idle")
    end)
end

return v1