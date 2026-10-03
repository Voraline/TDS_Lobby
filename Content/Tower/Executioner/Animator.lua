-- Script path: ReplicatedStorage.Content.Tower.Executioner.Animator
-- Decompile time: 16.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Path = require(script.Parent.Path)
local ExecutionerTiming = require(ReplicatedStorage.Shared.Modules.ExecutionerTiming)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local Sounds = require(script.Parent.Sounds)
local v1 = {}
v1.__index = v1
local u52 = Random.new()

function v1:_axeClearSounds() -- Line: 21
    local v1 = nil
    local v2 = nil
    local v3 = self
    for i, j in self._axeSoundPools, v1, v2 do
        for k, n in j.Voices do
            n.Pool:destroy()
            n.Anchor:Destroy()
        end
    end
    table.clear(v3._axeSoundPools)
    v3._axeSoundSkin = nil
end

function v1:_axePrepareSounds() -- Line: 32 -- upvalues: Sounds (val), SoundPool (val)
    if not self._axeRemoved and self._axeSoundSkin ~= self.Model.Name then
        local Attachment, Pitch, v1, v2
        self:_axeClearSounds()
        self._axeSoundSkin = self.Model.Name
        local Default = Sounds[self.Model.Name] or Sounds.Default
        local v3 = nil
        local v4 = nil
        for i, j in Sounds.Default, v3, v4 do
            v1 = Default[i] or j
            v2 = {NextVoice = 1, Voices = {}, Volume = v1.Volume}
            Pitch = v1.Pitch or j.Pitch
            v2.Pitch = Pitch
            v5._axeSoundPools[i] = v2
            for k = 1, 4 do
                Attachment = Instance.new("Attachment")
                Attachment.Name = "Executioner" .. i .. "Sound"
                Attachment.Parent = workspace.Terrain
                Attachment.WorldPosition = v5.Position
                table.insert(v2.Voices, {
                    Pool = SoundPool.new({
                        size = 1,
                        audioGroup = "Towers",
                        timeScaled = true,
                        id = v1.Id,
                        parent = Attachment,
                        volume = v1.Volume,
                    }),
                    Anchor = Attachment,
                })
            end
        end
        return
    end
end

function v1:_axePlaySound(a2, a3) -- Line: 67 -- upvalues: u52 (val)
    local v1
    if self._axeRemoved then
        return
    end
    if not a3 then
        v1 = self:_axeHandle()
        if not v1 then
            return
        end
        a3 = v1.Position
    end
    self:_axePrepareSounds()
    v1 = self._axeSoundPools[a2]
    local v2 = v1.Voices[v1.NextVoice]
    v1.NextVoice = v1.NextVoice % #v1.Voices + 1
    v2.Anchor.WorldPosition = a3
    local Pitch = v1.Pitch
    v2.Pool:play({
        playbackSpeed = if not Pitch then 1 else u52:NextNumber(Pitch.Min, Pitch.Max),
        volume = v1.Volume,
    })
end

local function cloneEffect(a1, a2) -- Line: 88
    local v1 = a1:Clone()
    v1.Anchored = true
    v1.CanCollide = false
    v1.CanTouch = false
    v1.CanQuery = false
    v1.Transparency = 1
    v1:PivotTo(a2)
    return v1
end

function v1:_axeEffectTemplate(a2) -- Line: 99
    local Default, v1
    local _axeAssets = self._axeAssets and self._axeAssets:FindFirstChild(a2)
    if not _axeAssets then
        return nil
    end
    for i = self.Upgrade or 0, 0, -1 do
        v1 = _axeAssets:FindFirstChild((tostring(i)))
        Default = v1 and (v1:FindFirstChild(self.Model.Name) or v1:FindFirstChild("Default"))
        if Default and Default:IsA("BasePart") then
            return Default
        end
    end
    return nil
end

function v1:_axeHandle() -- Line: 115
    local Weapon = self.Model:FindFirstChild("Weapon")
    return Weapon and Weapon:FindFirstChild("Handle") or self.Model:FindFirstChild("Handle")
end

function v1:_axeShowHandle(a2) -- Line: 120
    local v1 = self:_axeHandle()
    if not v1 then
        return
    end
    local Descendants = v1:GetDescendants()
    table.insert(Descendants, v1)
    local v2 = nil
    local v3 = nil
    for i, j in Descendants, v2, v3 do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = if not a2 then 1 else 0
        end
    end
end

function v1:CreateProjectile() -- Line: 136
    if not self._axeRemoved and self._axeProjectileMaid then
        self:_axePrepareSounds()
        self._axeProjectileMaid:Sweep()
        self._axeProjectile = nil
        self._axeSpin = nil
        self._axeTrailColor = nil
        local v1 = self:_axeHandle()
        if v1 and v1:IsA("BasePart") then
            local Model = Instance.new("Model")
            Model.Name = "ExecutionerAxe"
            local v2 = v1:Clone()
            v2.Name = "Handle"
            v2.Transparency = 0
            v2.Parent = Model
            Model.PrimaryPart = v2
            local v3 = self
            for i, j in Model:GetDescendants() do
                if j:IsA("JointInstance")
                    or j:IsA("WeldConstraint")
                    or j:IsA("LuaSourceContainer")
                    or j:IsA("Sound") then
                    j:Destroy()
                elseif j:IsA("BasePart") then
                    j.Anchored = true
                    j.CanCollide = false
                    j.CanTouch = false
                    j.CanQuery = false
                    j.LocalTransparencyModifier = 0
                elseif j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
            end
            Model:PivotTo(v3._axeFrame or v1.CFrame)
            local Trash = workspace:FindFirstChild("Trash") or workspace
            Model.Parent = Trash
            v3._axeProjectile = Model
            v3._axeProjectileMaid:Mark(Model)
            v3:_axeSetVisible(v3._axeAirborne == true)
            return
        end
        return
    end
end

function v1:_axeTintTrail() -- Line: 181
    local _axeSnapshot = self._axeSnapshot
    local _axeTrailColor = self._axeTrailColor
    if self._axeSpin and _axeSnapshot and _axeTrailColor then
        local ColorChangingTrail = self._axeSpin:FindFirstChild("ColorChangingTrail", true)
        if ColorChangingTrail and ColorChangingTrail:IsA("Trail") then
            local Time, Value, new, v1
            local v2 = 1 - 0.8 ^ math.max(0, _axeSnapshot.CompletedHits)
            local v3 = table.create(#_axeTrailColor.Keypoints)
            for i, j in _axeTrailColor.Keypoints do
                new = ColorSequenceKeypoint.new
                Time = j.Time
                Value = j.Value
                v1 = Color3.new(1, 0, 0)
                v3[i] = (new(Time, Value:Lerp(v1, v2)))
            end
            ColorChangingTrail.Color = ColorSequence.new(v3)
            return
        end
        return
    end
end

function v1:_axeSetVisible(a2) -- Line: 203
    self._axeAirborne = a2
    self:_axeShowHandle(not a2)
    local _axeProjectile = self._axeProjectile
    if not _axeProjectile then
        return
    end
    if not a2 then
        if not a2 and self._axeSpin then
            self._axeProjectileMaid:Unmark(self._axeSpin)
            self._axeSpin:Destroy()
            self._axeSpin = nil
            self._axeTrailColor = nil
        end
    elseif not self._axeSpin then
        local v1 = self:_axeEffectTemplate("AxeSpin")
        if v1 then
            local _axeVFXFrame = self._axeVFXFrame or _axeProjectile:GetPivot()
            local v2 = v1:Clone()
            v2.Anchored = true
            v2.CanCollide = false
            v2.CanTouch = false
            v2.CanQuery = false
            v2.Transparency = 1
            v2:PivotTo(_axeVFXFrame)
            v2.Name = "AxeSpin"
            v2.Parent = _axeProjectile.Parent
            self._axeProjectileMaid:Mark(v2)
            self._axeSpin = v2
            local ColorChangingTrail = v2:FindFirstChild("ColorChangingTrail", true)
            self._axeTrailColor = if not ColorChangingTrail then nil else if not ColorChangingTrail:IsA("Trail") then nil else ColorChangingTrail.Color
            self:_axeTintTrail()
        end
    elseif not a2 and self._axeSpin then
        self._axeProjectileMaid:Unmark(self._axeSpin)
        self._axeSpin:Destroy()
        self._axeSpin = nil
        self._axeTrailColor = nil
    end
    for i, j in _axeProjectile:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = if not a2 then 1 else 0
        elseif j:IsA("Trail") or j:IsA("Light") then
            j.Enabled = a2
        end
    end
end

function v1:_axeBaseFrame(a2) -- Line: 239 -- upvalues: Path (val)
    local _axeSnapshot = self._axeSnapshot
    if not _axeSnapshot then
        return nil
    end
    local v1, v2 = Path.activeCurve(_axeSnapshot.Curves, a2)
    if not v1 then
        return nil
    end
    local v3, v4 = Path.evaluate(v1, self._axePaths[v2], a2)
    local v5 = CFrame.lookAt(v3, v3 + v4)
    return v5 * CFrame.Angles(0, (a2 - _axeSnapshot.Started) * 25.132741228718345, -1.5707963267948966), v5
end

function v1:_axeContactEffect(a2, a3) -- Line: 254 -- upvalues: GameState (val), EmitterManager (val)
    local v1, v2
    if 0.35 < a3 - a2.Time then
        return
    end
    self:_axePlaySound("Hit", a2.Position)
    local v3 = self:_axeEffectTemplate("Impact")
    if v3 then
        local v4 = CFrame.new(a2.Position)
        local v5 = v3:Clone()
        v5.Anchored = true
        v5.CanCollide = false
        v5.CanTouch = false
        v5.CanQuery = false
        v5.Transparency = 1
        v5:PivotTo(v4)
        v5.Name = "ExecutionerImpact"
        v4 = 0.1
        for k, n in v5:GetDescendants() do
            if n:IsA("ParticleEmitter") then
                n.Enabled = false
                n.TimeScale = math.clamp(GameState.TimeScale, 0, 1)
                v4 = math.max(v4, (n:GetAttribute("EmitDelay") or 0) + (n:GetAttribute("EmitDuration") or 0) + n.Lifetime.Max)
            end
        end
        local Trash = workspace:FindFirstChild("Trash") or workspace
        v5.Parent = Trash
        self._axeEffectsMaid:Mark(v5)
        table.insert(self._axeEffects, {Instance = v5, Expires = a3 + v4})
        EmitterManager.manualEmit(v5)
        return
    end
    local _axeProjectile = self._axeProjectile
    if not _axeProjectile then
        return
    end
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = workspace.Terrain
    Attachment.WorldPosition = a2.Position
    local v6 = 0.1
    local v7 = {"DamageEmitter", "HitEmitter"}
    local v8 = nil
    local v9 = nil
    local v10, v11 = self, a3
    for i, j in v7, v8, v9 do
        v1 = _axeProjectile:FindFirstChild(j, true)
        if v1 and v1:IsA("ParticleEmitter") then
            v2 = v1:Clone()
            v2.Enabled = false
            v2.Parent = Attachment
            v2:Emit(if j ~= "DamageEmitter" then 1 else 5)
            v6 = math.max(v6, v2.Lifetime.Max)
        end
    end
    v10._axeEffectsMaid:Mark(Attachment)
    table.insert(v10._axeEffects, {Instance = Attachment, Expires = v11 + v6})
end

function v1:_axeClearCurves() -- Line: 305
    for i, j in self._axePaths do
        j:destroy()
    end
    self._axePaths = {}
    self._axeDebugMaid:Sweep()
end

function v1:_axeDebugPaths() -- Line: 313
    local Part, Trash, v1
    if self.Model:GetAttribute("ExecutionerDebugPath") ~= true then
        return
    end
    local v2 = nil
    local v3 = nil
    for i, j in self._axePaths, v2, v3 do
        for k = 0, 20 do
            Part = Instance.new("Part")
            Part.Name = "ExecutionerPathSample"
            Part.Shape = Enum.PartType.Ball
            Part.Size = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448)
            Part.Anchored = true
            Part.CanCollide = false
            Part.CanTouch = false
            Part.CanQuery = false
            Part.Color = Color3.fromHSV(i * 0.13 % 1, 0.8, 1)
            v1 = k / 20
            Part.Position = j:get(v1)
            Trash = workspace:FindFirstChild("Trash") or workspace
            Part.Parent = Trash
            self._axeDebugMaid:Mark(Part)
        end
    end
end

function v1:_axeReceive(a2, a3) -- Line: 335 -- upvalues: Path (val), ServerTicks (val)
    if not self._axeRemoved and a2 and Path.isNewer(a2, self._axeSnapshot) then
        local _axeSnapshot = self._axeSnapshot
        local _axeFrame = self._axeFrame
        self:_axeClearCurves()
        self._axeSnapshot = a2
        self._axeCorrection = nil
        local v1 = nil
        for i, j in a2.Curves, nil, v1 do
            table.insert(self._axePaths, (Path.build(j)))
        end
        local v2 = math.max(ServerTicks.getTime(), self._axeTime)
        local v3 = self:_axeBaseFrame(v2)
        if _axeFrame and v3 and _axeSnapshot and _axeSnapshot.ThrowId == a2.ThrowId then
            self._axeCorrection = v3:ToObjectSpace(_axeFrame)
            self._axeCorrectionStarted = v2
        end
        if not a3 and _axeSnapshot then
            v1 = _axeSnapshot.ThrowId == a2.ThrowId
            local v4 = true
            if a2.Phase ~= "Flying" then
                v4 = a2.Phase == "Returning"
            end
            local v5 = true
            if _axeSnapshot.Phase ~= "Flying" then
                v5 = _axeSnapshot.Phase == "Returning"
            end
            if a2.Position == self.Position then
                if not v4 then
                    if v1 and v5 and a2.Phase == "Catch" and v2 - a2.PhaseStarted <= 0.35 then
                        self:_axePlaySound("Catch")
                    end
                elseif not v1 then
                    if v2 - (a2.Started + Path.Windup) <= 0.35 then
                        self:_axePlaySound("Throw")
                    elseif v1 and v5 and a2.Phase == "Catch" and v2 - a2.PhaseStarted <= 0.35 then
                        self:_axePlaySound("Catch")
                    end
                elseif _axeSnapshot.Phase ~= "Windup" then
                    if v1 and v5 and a2.Phase == "Catch" and v2 - a2.PhaseStarted <= 0.35 then
                        self:_axePlaySound("Catch")
                    end
                elseif v2 - (a2.Started + Path.Windup) <= 0.35 then
                    self:_axePlaySound("Throw")
                elseif v1 and v5 and a2.Phase == "Catch" and v2 - a2.PhaseStarted <= 0.35 then
                    self:_axePlaySound("Catch")
                end
            end
            local CompletedHits = if not _axeSnapshot then 0 else if _axeSnapshot.ThrowId ~= a2.ThrowId then 0 else _axeSnapshot.CompletedHits
            for k, n in a2.Contacts do
                if CompletedHits < n.Id then
                    self:_axeContactEffect(n, v2)
                end
            end
        end
        self:_axeDebugPaths()
        self:_axeRender()
        self:_axeTintTrail()
        return
    end
end

function v1:_axeAnimate(a2, a3) -- Line: 391 -- upvalues: Path (val), ExecutionerTiming (val)
    local _axeSnapshot = self._axeSnapshot
    local v1 = if not _axeSnapshot or not _axeSnapshot.PhaseStarted then 0 else math.max(0, a3 - _axeSnapshot.PhaseStarted)
    local _axeCatchSnapshot = self._axeCatchSnapshot
    if a2 == "Catch" then
        _axeCatchSnapshot = _axeSnapshot
    elseif a2 ~= "Cooldown" or _axeCatchSnapshot and _axeCatchSnapshot.ThrowId ~= _axeSnapshot.ThrowId then
        _axeCatchSnapshot = nil
    end
    self._axeCatchSnapshot = _axeCatchSnapshot
    if a2 == "Cooldown" then
        v1 = if not _axeCatchSnapshot then v1 + Path.Catch else math.max(0, a3 - _axeCatchSnapshot.PhaseStarted)
        if v1 < ExecutionerTiming.CatchAnimation then
            a2 = "Catch"
        end
    end
    local v2 = if a2 ~= "Windup" then if a2 == "Flying" then "Wait" else if a2 ~= "Returning" then if a2 ~= "Catch" then nil else "Catch" else "Wait" else "Throw"
    if v2 then
        if not self.Animations.Throw or not self.Animations.Wait or not self.Animations.Catch then
            v2 = "Fire"
        end
    end
    if self._axeAnimationName ~= v2 then
        if self._axeTrack then
            self._axeTrack:Stop(0.05)
        end
        self._axeTrack = nil
        self._axeAnimationName = v2
    end
    local _axeTrack = self._axeTrack
    if v2 then
        if not _axeTrack or not _axeTrack.IsPlaying then
            _axeTrack = self:Animate(v2, {Speed = 0}, {0.05, 1, 0})
            self._axeTrack = _axeTrack
            self._axeReturnKeyframe = nil
            if _axeTrack then
                _axeTrack:SetAttribute("Speed", 0)
            end
        end
    end
    if _axeTrack and not (_axeTrack.Length <= 0) then
        local v3
        if v2 == "Fire" then
            v3 = math.min(Path.Windup, _axeTrack.Length - 0.01)
            if a2 == "Windup" then
                v3 = math.min(v3, v1)
            elseif a2 == "Catch" then
                if not self._axeReturnKeyframe then
                    local success, result = pcall(function() -- Line: 450 -- upvalues: _axeTrack (ref)
                        return _axeTrack:GetTimeOfKeyframe("Returned")
                    end)
                    self._axeReturnKeyframe = if not success then v3 else result
                end
                v3 = math.min(_axeTrack.Length - 0.01, self._axeReturnKeyframe + v1)
            end
        elseif v2 ~= "Wait" then
            local Windup_3 = if v2 ~= "Throw" then ExecutionerTiming.CatchAnimation else Path.Windup
            v3 = (math.clamp(v1 / Windup_3, 0, 1)) * _axeTrack.Length
        else
            v3 = (math.max(0, a3 - _axeSnapshot.Started - Path.Windup)) % _axeTrack.Length
        end
        local v4 = math.max(0, _axeTrack.Length - 0.001)
        _axeTrack.TimePosition = math.clamp(v3, 0, v4)
        return
    end
end

function v1:_axeRender() -- Line: 470 -- upvalues: ServerTicks (val), GameState (val)
    local v1
    if self._axeRemoved then
        return
    end
    local v2 = math.max(ServerTicks.getTime(), self._axeTime)
    self._axeTime = v2
    local _axeSnapshot = self._axeSnapshot
    local Phase = if not _axeSnapshot then "Idle" else _axeSnapshot.Phase
    local v3, v4 = self:_axeBaseFrame(v2)
    local v5 = _axeSnapshot and _axeSnapshot.Curves[#_axeSnapshot.Curves]
    local v6 = false
    if v3 ~= nil then
        if Phase == "Flying" then
            v6 = false
            if _axeSnapshot.Position == self.Position then
                v6 = v2 < v5.StartTime + v5.Duration
            end
        else
            v6 = false
            if Phase == "Returning" then
                v6 = false
                if _axeSnapshot.Position == self.Position then
                    v6 = v2 < v5.StartTime + v5.Duration
                end
            end
        end
    end
    if v6 then
        if self._axeCorrection then
            v3 = v3 * self._axeCorrection:Lerp(CFrame.identity, (math.clamp((v2 - self._axeCorrectionStarted) / 0.1, 0, 1)))
        end
        self._axeFrame = v3
        self._axeVFXFrame = (CFrame.new(v3.Position)) * v4.Rotation
        if not self._axeProjectile then
            self:CreateProjectile()
        end
        if self._axeProjectile then
            self._axeProjectile:PivotTo(v3)
        end
    end
    if v6 ~= self._axeAirborne then
        self:_axeSetVisible(v6)
    end
    if v6 and self._axeSpin then
        self._axeSpin:PivotTo(self._axeVFXFrame)
    end
    if Phase == "Windup" and 0 < GameState.TimeScale then
        local v7 = self:FindTarget()
        if v7 and v7.PrimaryPart then
            self:Face(v7.PrimaryPart.Position)
        end
    end
    self:_axeAnimate(Phase, v2)
    if self._axeSpin then
        for i, j in self._axeSpin:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                j.TimeScale = math.clamp(GameState.TimeScale, 0, 1)
            end
        end
    end
    local v8 = self
    for k = #self._axeEffects, 1, -1 do
        v1 = v8._axeEffects[k]
        if not (v1.Expires <= v2) then
            for n, m in v1.Instance:GetDescendants() do
                if m:IsA("ParticleEmitter") then
                    m.TimeScale = math.clamp(GameState.TimeScale, 0, 1)
                end
            end
        else
            v8._axeEffectsMaid:Unmark(v1.Instance)
            v1.Instance:Destroy()
            table.remove(v8._axeEffects, k)
        end
    end
end

function v1.Initialize(a1) -- Line: 535
    -- upvalues: ReplicatedStorage (val), ServerTicks (val), Maid (val), RunService (val)
    local Assets = ReplicatedStorage:FindFirstChild("Assets")
    a1._axeAssets = Assets and Assets:FindFirstChild("ExecutionerAssets")
    a1._axeSoundPools = {}
    a1._axePaths = {}
    a1._axeEffects = {}
    a1._axeTime = ServerTicks.getTime()
    a1._axeProjectileMaid = Maid.new()
    a1._axeEffectsMaid = Maid.new()
    a1._axeDebugMaid = Maid.new()
    a1.Maid:Mark(a1._axeProjectileMaid)
    a1.Maid:Mark(a1._axeEffectsMaid)
    a1.Maid:Mark(a1._axeDebugMaid)
    a1:CreateProjectile()
    a1:_axeReceive(a1.Replicator:Get("AxeThrow"), true)
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("AxeThrow")):Connect(function(a1_2) -- Line: 551 -- upvalues: a1 (val)
        a1:_axeReceive(a1_2, false)
    end)))
    a1.Maid:Mark((a1.OnUpgrade:Connect(function() -- Line: 554 -- upvalues: a1 (val)
        a1:CreateProjectile()
        if a1._axeTrack then
            a1._axeTrack:Stop(0)
            a1._axeTrack = nil
        end
        a1:_axeAnimate(if not a1._axeSnapshot then "Idle" else a1._axeSnapshot.Phase, a1._axeTime)
    end)))
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 565 -- upvalues: a1 (val)
        a1._axeFrame = nil
        a1._axeVFXFrame = nil
        a1._axeCorrection = nil
        a1:_axeSetVisible(false)
        a1:_axeClearSounds()
        a1:_axePrepareSounds()
        a1._axeEffectsMaid:Sweep()
        a1._axeEffects = {}
    end)))
    a1.Maid:Mark((RunService.RenderStepped:Connect(function() -- Line: 575 -- upvalues: a1 (val)
        a1:_axeRender()
    end)))
    a1.Maid:Mark(function() -- Line: 578 -- upvalues: a1 (val)
        a1._axeRemoved = true
        if a1._axeTrack then
            a1._axeTrack:Stop(0)
        end
        a1:_axeClearCurves()
        a1:_axeClearSounds()
        a1:_axeShowHandle(true)
    end)
end

return v1