-- Script path: ReplicatedStorage.Content.Tower.Medic.Animator
-- Decompile time: 14.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local RunService = game:GetService("RunService")
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Cooldown = require(ReplicatedStorage.Client.Modules.Cooldown)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u83 = nil

local function watchValue(a1, a2) -- Line: 21 -- upvalues: RunService (val)
    local u2 = nil
    local u3 = false
    local u4 = false
    local u5 = nil

    local function disconnect() -- Line: 27 -- upvalues: u4 (ref), u5 (ref)
        u4 = true
        if u5 then
            u5:Disconnect()
        end
    end

    local function update() -- Line: 34 -- upvalues: u4 (ref), a1 (val), u3 (ref), u2 (ref), a2 (val), disconnect (val)
        if u4 then
            return
        end
        local v1 = a1()
        if u3 and v1 == u2 then
            return
        end
        u3 = true
        u2 = v1
        a2(v1, disconnect)
    end

    task.defer(update)
    local v1 = RunService.Heartbeat:Connect(update)
    return disconnect
end

local MedicAssets = ReplicatedStorage.Assets.MedicAssets
local v1 = {}
v1.__index = v1

function v1._enableSelector(a1, a2) -- Line: 60 -- upvalues: ClientAtoms (val)
    ClientAtoms.towerSelectorAtom(function(a1) -- Line: 61 -- upvalues: a2 (val)
        return {enabled = true, tower = a2}
    end)
end

function v1._disableSelector(a1) -- Line: 69 -- upvalues: ClientAtoms (val)
    ClientAtoms.towerSelectorAtom(function(a1) -- Line: 70
        return {enabled = false, tower = false}
    end)
end

function v1:_playAnimation(a2, a3) -- Line: 78 -- types: self: table, a2: string
    return self:Animate(a2, nil, {a3 or 0.1})
end

function v1.ToggleSelectedTower(a1, a2) -- Line: 82 -- upvalues: Sound (val), Notification (val)
    local v1, v2 = a1:InvokeServer("ToggleSelectedTower", a2)
    if not v1 then
        Sound("Error"):Play(true)
        Notification.Create({Text = v2, Color = Color3.fromRGB(236, 0, 0)})
    end
end

function v1:GetSelectedTowers() -- Line: 94
    return self.Replicator:Get("TowersSelected")
end

function v1.NumTowersSelected(a1) -- Line: 98 -- upvalues: table (val)
    return table.count(a1:GetSelectedTowers())
end

function v1:GetAttachment() -- Line: 102
    local v1 = self.Upgrades:FindFirstChild((tostring(self.Upgrade)))
    if not v1 then
        return nil
    end
    return v1.Beam.Value
end

function v1:_handleAnimations(a2) -- Line: 112 -- upvalues: table (val), TimescaleUtilities (val)
    if self._uberCharge then
        return
    end
    if 0 < (table.count(a2)) then
        if self._healing then
            return
        end
        self._healing = true
        self._fireIntro = self:_playAnimation("FireIntro", 0)
        self._fireLoop = self:_playAnimation("FireLoop")
        TimescaleUtilities.Delay(0.15, function() -- Line: 124 -- upvalues: self (val)
            self._canShoot = true
        end)
        self._healingAnimationCoolDown:setTime(2)
        return
    end
    if self._healingAnimationCoolDown:isActive() then
        return
    end
    if self._healing then
        self._healing = false
        self:_playAnimation("FireOutro")
        if self._fireIntro then
            self._fireIntro:Stop()
            self._fireIntro = nil
        end
        if self._fireLoop then
            self._fireLoop:Stop()
            self._fireLoop = nil
        end
    end
    self._canShoot = false
end

function v1:UpdateBeams() -- Line: 151 -- upvalues: table (val), u83 (ref)
    local Attachment_2, Children_4, Model_2, WeldConstraint, _canShoot, _canShoot_2, v1, v2, v3, v4, v5, v6
    local v7 = self.Replicator:Get("BeamSelected")
    if v7 == nil then
        return
    end
    local Attachment = self:GetAttachment()
    local v8 = self.Replicator:Get("TowersSelected")
    self:_handleAnimations(v8)
    if v7 ~= "Ubercharge" then
        for i, j in self._uberChargeEffects do
            if j then
                j:Destroy()
                self._uberChargeEffects[i] = nil
            end
        end
    end
    if self._currentSelected ~= v7 then
        self._currentSelected = v7
        v4 = nil
        v5 = nil
        for k, n in self._beams, v4, v5 do
            for m, i5 in n do
                i5:Destroy()
            end
        end
        self._beams = {}
        for i6, i7 in self._effects do
            i7:Destroy()
        end
        self._effects = {}
        for i8, i9 in self._assets[v7].Effects:GetChildren() do
            if i9:IsA("ParticleEmitter") then
                v6 = i9:Clone()
                v6.Parent = Attachment
                table.insert(self._effects, v6)
            end
        end
    end
    v4 = nil
    v5 = nil
    for i10, i11 in self._effects, v4, v5 do
        _canShoot_2 = false
        if 0 < (table.count(v8)) then
            _canShoot_2 = self._canShoot
        end
        i11.Enabled = _canShoot_2
    end
    v4 = nil
    v5 = nil
    for i12, i13 in self._beams, v4, v5 do
        v6 = u83.getTowerByModel(i12)
        if v6 and not v8[v6.UID] then
            for i14, i15 in i13 do
                i15:Destroy()
            end
            self._beams[i12] = nil
        end
    end
    v4 = nil
    v5 = nil
    for i16 in v8, v4, v5 do
        v6 = u83.getTowerByUID(i16)
        if v6 then
            Model_2 = v6.Model
            if v7 == "Ubercharge" and not self._uberChargeEffects[Model_2] then
                v2 = self.assetFolder.UberchargeEffect:Clone()
                self._uberChargeEffects[Model_2] = v2
                v2.CFrame = Model_2.PrimaryPart.CFrame
                WeldConstraint = Instance.new("WeldConstraint")
                WeldConstraint.Part0 = v2
                WeldConstraint.Part1 = Model_2.PrimaryPart
                WeldConstraint.Parent = v2
                v2.Parent = Model_2
            end
            if not self._beams[Model_2] then
                v2 = {}
                Children_4 = self._assets[v7].Beams:GetChildren()
                if not Model_2.PrimaryPart:FindFirstChild("CenterAttachment") then
                    Attachment_2 = Instance.new("Attachment")
                    Attachment_2.Name = "CenterAttachment"
                    Attachment_2.Parent = Model_2.PrimaryPart
                end
                for i17, i18 in Children_4 do
                    if i18:IsA("Beam") then
                        v3 = i18:Clone()
                        v3.Parent = Attachment
                        v3.Attachment0 = Attachment
                        v3.Attachment1 = Model_2.PrimaryPart.CenterAttachment
                        table.insert(v2, v3)
                    end
                end
                self._beams[Model_2] = v2
            end
        end
    end
    v4 = nil
    v5 = nil
    for i19, i20 in self._beams, v4, v5 do
        v1 = nil
        v2 = nil
        for i21, i22 in i20, v1, v2 do
            _canShoot = false
            if 0 < (table.count(v8)) then
                _canShoot = self._canShoot
            end
            i22.Enabled = _canShoot
        end
    end
    if table.count(self._beams) == 0 then
        return
    end
    local v9 = Vector3.new(0, 0, 0)
    for i23 in self._beams do
        v9 = v9 + i23:GetPivot().Position * Vector3.new(1, 0, 1)
    end
    v4 = v9 / table.count(self._beams)
    self.Model.PrimaryPart.CFrame = CFrame.new(self.CFrame.Position, (Vector3.new(v4.X, self.CFrame.Position.Y, v4.Z)))
end

function v1:_handleTowers(a2) -- Line: 281 -- upvalues: u83 (ref), Maid (val), Enum (val)
    local MedicShield, StatusEffectRenderer, v1, v2
    for i, j in self._attachedTowers do
        if not a2[i] then
            j:Sweep()
            self._attachedTowers[i] = nil
            v1 = u83.getTowerByUID(i)
            if v1 then
                MedicShield = v1.Model.PrimaryPart:FindFirstChild("MedicShield")
                if MedicShield then
                    MedicShield:Destroy()
                end
            end
        end
    end
    for k in a2 do
        local u25 = u83.getTowerByUID(k)
        if u25 and not self._attachedTowers[k] then
            StatusEffectRenderer = u25.StatusEffectRenderer
            if StatusEffectRenderer then
                v2 = Maid.new()
                self._attachedTowers[k] = v2

                local function giveShield() -- Line: 316 -- upvalues: u25 (val), self (val)
                    if u25.Model:FindFirstChild("MedicShield") then
                        return
                    end
                    local PrimaryPart = u25.Model.PrimaryPart
                    if u25.Model:FindFirstChild("FlightPos") then
                        PrimaryPart = u25.Model.FlightPos
                    end
                    local v1 = self.assetFolder.Shield:Clone()
                    v1.Name = "MedicShield"
                    v1.CFrame = PrimaryPart.CFrame
                    v1.Parent = u25.Model.PrimaryPart
                    local WeldConstraint = Instance.new("WeldConstraint")
                    WeldConstraint.Part0 = v1
                    WeldConstraint.Part1 = PrimaryPart
                    WeldConstraint.Parent = v1
                end

                v2:Mark((StatusEffectRenderer.Changed:Connect(function(a1, a2) -- Line: 338 -- upvalues: Enum (upval), giveShield (val), u25 (val)
                    if a1 ~= Enum.StatusEffect.Shield then
                        return
                    end
                    if a2 then
                        giveShield()
                        return
                    end
                    local MedicShield = u25.Model.PrimaryPart:FindFirstChild("MedicShield")
                    if MedicShield then
                        MedicShield:Destroy()
                    end
                end)))
                if StatusEffectRenderer:has(Enum.StatusEffect.Shield) then
                    giveShield()
                end
            end
        end
    end
end

function v1:_updateSounds(a2) -- Line: 360 -- upvalues: table (val), EasySound (val)
    local v1 = table.count(self.Replicator:Get("TowersSelected"))
    local v2 = self.Replicator:Get("BeamSelected")
    local _canShoot = self._canShoot and v1 > 0

    local function getLoop(a1) -- Line: 366 -- upvalues: self (val), EasySound (upval) -- types: a1: string
        if self._loopPlayers[a1] then
            return self._loopPlayers[a1]
        end
        local v1 = self._soundDefs[a1]
        if v1 and v1.looped then
            local v2 = EasySound.Create({
                volume = 0,
                looped = true,
                id = v1.id,
                parent = self.Model.PrimaryPart,
                audioGroup = v1.audioGroup,
            })
            self._loopPlayers[a1] = v2
            return v2
        end
        return nil
    end

    local BeamNormal = getLoop("BeamNormal")
    local BeamUbercharge = getLoop("BeamUbercharge")
    local volume = if v2 ~= "Normal" then 0 else if not _canShoot then 0 else self._soundDefs.BeamNormal and self._soundDefs.BeamNormal.volume or 0.3
    local volume_2 = if v2 ~= "Ubercharge" then 0 else if not _canShoot then 0 else self._soundDefs.BeamUbercharge and self._soundDefs.BeamUbercharge.volume or 0.3
    local v3 = if v2 ~= "Normal" then 0.2 else if not _canShoot then 0.2 else 1
    local v4 = if v2 ~= "Ubercharge" then 0.2 else if not _canShoot then 0.2 else 1
    if BeamNormal then
        if _canShoot and v2 == "Normal" and not BeamNormal.IsPlaying then
            BeamNormal:Play()
        end
        BeamNormal.Volume = math.lerp(BeamNormal.Volume, volume, a2 * 2)
        BeamNormal.PlaybackSpeed = math.lerp(BeamNormal.PlaybackSpeed, v3, a2 * 5)
        if volume == 0 and BeamNormal.IsPlaying and BeamNormal.Volume < 0.01 then
            BeamNormal:Stop()
        end
    end
    if BeamUbercharge then
        if _canShoot and v2 == "Ubercharge" and not BeamUbercharge.IsPlaying then
            BeamUbercharge:Play()
        end
        BeamUbercharge.Volume = math.lerp(BeamUbercharge.Volume, volume_2, a2 * 2)
        BeamUbercharge.PlaybackSpeed = math.lerp(BeamUbercharge.PlaybackSpeed, v4, a2 * 5)
        if volume_2 == 0 and BeamUbercharge.IsPlaying and BeamUbercharge.Volume < 0.01 then
            BeamUbercharge:Stop()
        end
    end
end

function v1.Initialize(a1) -- Line: 420
    -- upvalues: u83 (ref), ReplicatedStorage (val), MedicAssets (val), Cooldown (val), TweenService (val)
    -- upvalues: TimescaleUtilities (val), EmitterManager (val), watchValue (val), UpgradesStore (val), EasySound (val)
    -- upvalues: RunService (val), GameState (val)
    u83 = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
    local Default = MedicAssets:FindFirstChild(a1.Model.Name)
    if not Default then
        Default = MedicAssets.Default
    end
    a1._colorPartEffects = {}
    a1._effects = {}
    a1._beams = {}
    a1._assets = {}
    a1._uberChargeEffects = {}
    a1._soundDefs = {}
    a1._loopPlayers = {}
    a1._attachedTowers = {}
    a1.assetFolder = Default
    a1._currentSelected = nil
    a1._healing = false
    a1._healingAnimationCoolDown = Cooldown.new()

    local function updateBeamAnimation(a1_2, a2) -- Line: 447
        -- upvalues: a1 (val), TweenService (upval), TimescaleUtilities (upval)
        local v1, v2, v3, v4
        local _colorPartEffects = a1._colorPartEffects
        local v5 = nil
        local v6 = nil
        local v7, v8 = a1_2, a2
        for i, j in _colorPartEffects, v5, v6 do
            v4 = TweenService
            v1 = TweenInfo.new(0.35)
            v2 = {}
            v3 = if v7 ~= "Ubercharge" then "NormalColor" else "UberColor"
            v2.Color = j:GetAttribute(v3)
            v4:Create(j, v1, v2):Play()
        end
        if v7 ~= "Ubercharge" then
            if v8 then
                return
            end
            a1._canShoot = false
            if a1._uberIntro then
                a1._uberIntro:Stop()
                a1._uberIntro = nil
            end
            if a1._uberLoop then
                a1._uberLoop:Stop()
                a1._uberLoop = nil
            end
            a1:_playAnimation("UberOutro", 0)
            TimescaleUtilities.Delay(2, function() -- Line: 498 -- upvalues: a1 (upval)
                a1._uberCharge = false
            end)
            return
        end
        if a1._playOneShot then
            a1:_playOneShot("ActivateUbercharge")
        end
        a1._uberCharge = true
        a1._healing = false
        a1._canShoot = false
        if a1._fireIntro then
            a1._fireIntro:Stop()
            a1._fireIntro = nil
        end
        if a1._fireLoop then
            a1._fireLoop:Stop()
            a1._fireLoop = nil
        end
        a1._uberIntro = a1:_playAnimation("UberIntro", 0)
        a1._uberLoop = a1:_playAnimation("UberLoop")
        TimescaleUtilities.Delay(0.3, function() -- Line: 476 -- upvalues: a1 (upval)
            a1._canShoot = true
        end)
    end

    ;(a1.Replicator:GetStateChangedSignal("BeamSelected")):Connect(function(a1) -- Line: 504 -- upvalues: updateBeamAnimation (val)
        updateBeamAnimation(a1, false)
    end)
    updateBeamAnimation(a1.Replicator:Get("BeamSelected"), true)
    a1.Executables = {
        BaseHeal = function() -- Line: 510 -- upvalues: a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            if a1._playOneShot then
                a1:_playOneShot("Cleanse")
            end
            local v1 = a1.assetFolder.HealEffect:Clone()
            v1.CFrame = a1.Model.PrimaryPart.CFrame
            v1.Parent = a1.Model.PrimaryPart
            EmitterManager.manualEmit(v1)
            TimescaleUtilities.CleanUp(v1, 3)
        end,
    }
    a1.OnUpgrade:Connect(function() -- Line: 523 -- upvalues: a1 (val), EmitterManager (upval)
        if a1:GetLevel() == 5 then
            local Decal = a1.Model.Upgrades["5"]:FindFirstChildWhichIsA("Decal", true)
            if Decal and Decal.Name == "Face" and Decal.Transparency == 1 then
                Decal.Transparency = 0
            end
            EmitterManager.toggle(a1.Model.Upgrades["5"], true)
        end
    end)
    a1.Maid:Mark((watchValue(UpgradesStore.getState, function(a1_2) -- Line: 533 -- upvalues: a1 (val), u83 (upval)
        local enabled = false
        if a1_2.model == a1.Model then
            enabled = a1_2.enabled
        end
        local v1 = u83.getTowerByModel(a1_2.model)
        if enabled then
            a1:_enableSelector(v1)
            return
        end
        if not v1 or v1 and v1.Name ~= "Medic" then
            a1:_disableSelector()
        end
    end)))

    local function getAssetsByPathAndLevel(a1, a2) -- Line: 546 -- upvalues: Default (ref)
        local v1, v2, v3
        local v4 = {}
        local v5, v6 = a2, a1
        for i, j in Default:GetChildren() do
            v2 = nil
            v3 = if not v5 or not (v5 > 0) then nil else string.char(96 + v5)
            for k = 0, v6 do
                if not v3 then
                    v1 = tostring(k)
                    if j:FindFirstChild(v1) then
                        v2 = j[tostring(k)]
                    end
                else
                    v1 = ("%*%*"):format(k, v3)
                    if not j:FindFirstChild(v1) then
                        v1 = tostring(k)
                        if j:FindFirstChild(v1) then
                            v2 = j[tostring(k)]
                        end
                    else
                        v2 = j[("%*%*"):format(k, v3)]
                    end
                end
            end
            if v2 then
                v4[j.Name] = v2
            end
        end
        return v4
    end

    local function updateModelAssets() -- Line: 567
        -- upvalues: a1 (val), getAssetsByPathAndLevel (val), EasySound (upval)
        local _assets = a1._assets
        a1._assets = getAssetsByPathAndLevel(a1.Upgrade, a1.Path)
        if _assets ~= a1._assets then
            if a1._fireIntro then
                a1._fireIntro:Stop()
                a1._fireIntro = nil
            end
            if a1._fireLoop then
                a1._fireLoop:Stop()
                a1._fireLoop = nil
            end
            a1._currentSelected = nil
            a1._healing = false
            for i, j in a1._effects do
                j:Destroy()
            end
            a1._effects = {}
            local v1 = nil
            local v2 = nil
            for k, n in a1._beams, v1, v2 do
                for m, i5 in n do
                    i5:Destroy()
                end
            end
            a1._beams = {}
            v1 = nil
            v2 = nil
            for i6, i7 in a1._loopPlayers, v1, v2 do
                if i7 then
                    EasySound.Destroy(i7)
                end
                a1._loopPlayers[i6] = nil
            end
        end
    end

    a1.OnUpgrade:Connect(function() -- Line: 608 -- upvalues: updateModelAssets (val)
        updateModelAssets()
    end)
    updateModelAssets()
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("TowersSelected")):Connect(function(a1_2) -- Line: 614 -- upvalues: a1 (val)
        a1:_handleTowers(a1_2)
    end)))
    local Default_2 = script.Parent.Sounds:FindFirstChild(a1.Model.Name) or script.Parent.Sounds.Default
    a1._soundDefs = require(Default_2)

    function a1:_playOneShot(a2) -- Line: 628 -- upvalues: EasySound (upval) -- types: self: table, a2: string
        local v1 = self._soundDefs[a2]
        if v1 and not v1.looped then
            EasySound.Play({
                destroyOnEnd = true,
                id = v1.id,
                parent = self.Model.PrimaryPart,
                audioGroup = v1.audioGroup,
                volume = v1.volume,
            })
            return
        end
    end

    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 642 -- upvalues: GameState (upval), a1 (val)
        a1:_updateSounds(a1_2 * GameState.TimeScale)
    end)))
    a1:Thread(function() -- Line: 647 -- upvalues: a1 (val)
        a1:UpdateBeams()
    end)
    a1.Maid:Mark(function() -- Line: 651 -- upvalues: a1 (val), u83 (upval), EasySound (upval)
        local MedicShield, v1, v2
        a1:_disableSelector()
        local v3 = nil
        local v4 = nil
        for i, j in a1._attachedTowers, v3, v4 do
            a1._attachedTowers[i] = nil
            v1 = u83.getTowerByUID(i)
            if v1 then
                MedicShield = v1.Model.PrimaryPart:FindFirstChild("MedicShield")
                if MedicShield then
                    MedicShield:Destroy()
                end
                v2 = a1._uberChargeEffects[v1.Model]
                if v2 then
                    v2:Destroy()
                    a1._uberChargeEffects[v1.Model] = nil
                end
            end
        end
        v3 = nil
        v4 = nil
        for k, n in a1._loopPlayers, v3, v4 do
            if n then
                EasySound.Destroy(n)
            end
            a1._loopPlayers[k] = nil
        end
    end)
    for i, j in a1.Model:GetDescendants() do
        if j:IsA("BasePart") and j:GetAttribute("UberColor") then
            a1._colorPartEffects[j] = j
        end
    end
end

return v1