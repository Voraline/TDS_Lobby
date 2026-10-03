-- Script path: ReplicatedStorage.Content.Tower.EvolvedKingpin.Animator
-- Decompile time: 12.06 ms

local destroySounds
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local EnemySelectionCursorController = require(ReplicatedStorage.Client.Controllers.Game.EnemySelectionCursorController)
local KingpinStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.KingpinStore)
local KingpinUtils = require(ReplicatedStorage.Shared.Modules.Utils.KingpinUtils)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MoneyCollectEffect = require(ReplicatedStorage.Client.Modules.VisualEffects.MoneyCollectEffect)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Sounds = require(script.Sounds)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u99 = Color3.fromRGB(236, 0, 0)
local v1 = {}
v1.__index = v1

local function getWeaponConfig(a1) -- Line: 33 -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    if not Weapon then
        return nil
    end
    local Gun = Weapon:FindFirstChild("Gun")
    if not Gun then
        return nil
    end
    return Gun:FindFirstChildOfClass("Configuration")
end

function destroySounds(a1) -- Line: 47 -- upvalues: EasySound (val), destroySounds (val)
    if typeof(a1) == "Instance" then
        EasySound.Destroy(a1)
        return
    end
    if typeof(a1) == "table" then
        for i, j in a1 do
            destroySounds(j)
        end
    end
end

function v1:_playAnimation(a2, a3) -- Line: 57 -- types: self: table, a2: string
    local v1 = self:Animate(a2)
    if v1 and a3 then
        v1.Priority = a3
    end
    return v1
end

function v1:_getWeaponConfigValue(a2, a3) -- Line: 69 -- types: self: table, a2: string, a3: boolean?
    local v1
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Gun = Weapon:FindFirstChild("Gun")
        v1 = if Gun then Gun:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    if not v1 then
        return nil
    end
    local v2 = v1:FindFirstChild(a2, a3 == true)
    return v2 and v2.Value
end

function v1:_clearTrackConnections() -- Line: 80
    local v1 = nil
    local v2 = nil
    for i, j in self._trackConns, v1, v2 do
        for k, n in j do
            n:Disconnect()
        end
    end
    table.clear(self._trackConns)
end

function v1:_getVoiceline(a2, a3) -- Line: 90 -- types: self: table, a2: string, a3: number?
    local Voicelines = self._sounds.Voicelines and self._sounds.Voicelines[a2]
    if Voicelines and not (#Voicelines <= 0) then
        local _voicelineRandom = if not a3 then self._voicelineRandom else Random.new(a3)
        return Voicelines[_voicelineRandom:NextInteger(1, #Voicelines)]
    end
    return nil
end

function v1:_playVoiceline(a2, a3) -- Line: 100 -- types: self: table, a2: string, a3: number?
    local v1 = self:_getVoiceline(a2, a3)
    if not v1 then
        return nil
    end
    if self._currentVoiceline and self._currentVoiceline.IsPlaying then
        self._currentVoiceline:Stop()
    end
    v1.TimePosition = 0
    v1:Play()
    self._currentVoiceline = v1
    return v1
end

function v1.Initialize(a1) -- Line: 117
    -- upvalues: Sounds (val), EasySound (val), Players (val), NPCReplicator (val), destroySounds (val)
    -- upvalues: ReplicatedStorage (val), EmitterManager (val), MoneyCollectEffect (val), Maid (val), spr (val)
    -- upvalues: EnemySelectionCursorController (val), Sound (val), Notification (val), u99 (val)
    -- upvalues: ContextActionService (val), KingpinStore (val), RunService (val), KingpinUtils (val), ServerTicks (val)
    a1._currentBounty = nil
    a1._fireRight = true
    a1._lastShotTime = 0
    a1._adsTrack = nil
    a1._sounds = {}
    a1._currentVoiceline = nil
    a1._voicelineRandom = Random.new()
    a1._trackConns = {}
    local PrimaryPart = a1.Model.PrimaryPart
    local Name = a1.Model.Name
    if PrimaryPart then
        local Default, Default_2
        local v1 = nil
        local v2 = nil
        for i, j in Sounds.Fire, v1, v2 do
            Default_2 = j[Name] or j.Default
            if Default_2 then
                a1._sounds[i] = (EasySound.Create({audioGroup = "Towers", timeScaled = true, id = Default_2, parent = PrimaryPart}))
            end
        end
        a1._sounds.Voicelines = {}
        v1 = nil
        v2 = nil
        for k, n in Sounds.Voicelines, v1, v2 do
            Default = n[Name] or n.Default
            if Default then
                a1._sounds.Voicelines[k] = {}
                for m, i5 in Default do
                    table.insert(
                        a1._sounds.Voicelines[k],
                        (EasySound.Create({audioGroup = "Towers", timeScaled = true, id = i5, parent = PrimaryPart}))
                    )
                end
            end
        end
    end
    ;(a1.Replicator:GetStateChangedSignal("Bounty")):Connect(function(a1_2) -- Line: 169 -- upvalues: a1 (val), Players (upval), NPCReplicator (upval)
        if a1._currentBounty then
            a1:_clearBounty()
        end
        if not a1_2 then
            return
        end
        local OwnerId = a1.OwnerId or a1.Replicator:Get("OwnerId")
        if OwnerId ~= Players.LocalPlayer.UserId then
            return
        end
        local ReplicatorFolder = a1_2.ReplicatorFolder
        local v1 = NPCReplicator.GetNPCFromFolder(ReplicatorFolder)
        if not v1 then
            return
        end
        local v2 = a1:_playAnimation("Bounty", Enum.AnimationPriority.Action2)
        if v2 and not a1._trackConns[v2] then
            local Value = a1.Model.Phone.Value
            local u43 = a1:_getWeaponConfigValue("Handle")
            a1._trackConns[v2] = {
                (v2:GetMarkerReachedSignal("Show")):Connect(function() -- Line: 194 -- upvalues: Value (val), u43 (val)
                    Value.Transparency = 0
                    if u43 then
                        u43.Transparency = 1
                    end
                end),
                ((v2:GetMarkerReachedSignal("Hide")):Connect(function() -- Line: 200 -- upvalues: Value (val), u43 (val)
                    Value.Transparency = 1
                    if u43 then
                        u43.Transparency = 0
                    end
                end)),
            }
        end
        a1:_setBounty(v1, a1_2.Amount)
    end)
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 213 -- upvalues: a1 (val) -- types: a1_2: number
        if not a1._adsTrack then
            return
        end
        a1._adsTrack:Stop()
        a1._adsTrack = nil
        if a1_2 < 6 then
            a1._adsTrack = a1:_playAnimation("ADS", Enum.AnimationPriority.Idle)
        end
    end)
    a1.Maid:Mark(function() -- Line: 226 -- upvalues: destroySounds (upval), a1 (val)
        destroySounds(a1._sounds)
        a1:_clearTrackConnections()
        a1:_clearBounty()
    end)
    a1.Executables = {
        Voiceline = function(a1_2, a2) -- Line: 234 -- upvalues: a1 (val) -- types: a1_2: string, a2: number?
            a1:_playVoiceline(a1_2, a2)
        end,
        ClaimBounty = function(a1_2) -- Line: 238
            -- upvalues: a1 (val), Players (upval), ReplicatedStorage (upval), EmitterManager (upval)
            -- upvalues: MoneyCollectEffect (upval), Sounds (upval), Name (val), EasySound (upval)
            local _currentBounty = a1._currentBounty
            local Target = _currentBounty and _currentBounty.Target
            local Position = if a1_2 then a1_2 else if not Target then a1_2 else if not Target.Part then Target.Position else Target.Part.Position
            if not Position then
                return
            end
            local OwnerId = a1.OwnerId or a1.Replicator:Get("OwnerId")
            if not OwnerId then
                return
            end
            local PlayerByUserId = Players:GetPlayerByUserId(OwnerId)
            if not PlayerByUserId then
                return
            end
            local Character = PlayerByUserId.Character
            if not Character then
                return
            end
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
            if not HumanoidRootPart then
                return
            end
            local u38 = ReplicatedStorage.Assets.Effects.Client.Cash:Clone()
            EmitterManager.toggle(u38, true)
            local v1 = Position
            local v2 = v1 + Vector3.new(Random.new():NextNumber(-20, 20), Random.new():NextNumber(10, 25), (Random.new():NextNumber(-20, 20)))
            local Position_2 = HumanoidRootPart.Position
            MoneyCollectEffect.createHandler({
                duration = 1,
                part = u38,
                onUpdate = function(a1, a2, a3, a4) -- Line: 283
                    return CFrame.Angles(-math.rad(a3 * 270), math.rad(a3 * 360), (math.rad(a3 * 180)))
                end,
                onFinished = function(a1, a2) -- Line: 290
                    -- upvalues: EmitterManager (upval), Sounds (upval), Name (upval), EasySound (upval), u38 (val)
                    EmitterManager.Emit("KingpinBountyClaim", CFrame.new(a2), 2)
                    local Default = Sounds.BountyClaim[Name] or Sounds.BountyClaim.Default
                    if Default then
                        EasySound.Play({
                            destroyOnEnd = true,
                            audioGroup = "Towers",
                            timeScaled = true,
                            id = Default,
                            position = a2,
                        })
                    end
                    EmitterManager.toggle(u38, false)
                    u38.Transparency = 1
                    task.wait(2)
                end,
            }).play(
                v1,
                v2,
                Position_2
            )
        end,
    }
    a1.AbilityCallbacks = {
        Bounty = function() -- Line: 317
            -- upvalues: a1 (val), Maid (upval), ReplicatedStorage (upval), spr (upval)
            -- upvalues: EnemySelectionCursorController (upval), Sound (upval), NPCReplicator (upval)
            -- upvalues: Notification (upval), u99 (upval), ContextActionService (upval), KingpinStore (upval)
            -- upvalues: RunService (upval), KingpinUtils (upval)
            a1:DeselectTowers()
            local v1 = Maid.new()
            local Range = a1:GetRange()
            local v2 = ReplicatedStorage.Assets.Effects.Client.Circle:Clone()
            v2.Size = Vector3.new(0, 0, 0)
            spr.target(v2, 0.6, 4, {Size = Vector3.new(Range * 2, 0, Range * 2)})
            v2.Position = a1.BottomPosition
            local Trash = workspace:FindFirstChild("Trash") or workspace
            v2.Parent = Trash
            v1:Mark(v2)
            local v3 = EnemySelectionCursorController.start(function(a1_2, a2) -- Line: 331
                -- upvalues: Sound (upval), NPCReplicator (upval), a1 (upval), Notification (upval), u99 (upval)
                Sound("New Click"):Play(true)
                local v1 = NPCReplicator.GetNPCFromFolder(a2)
                local v2 = a1:_getBountySelectionError(v1, a2)
                if not v2 then
                    return true
                end
                Notification.Create({Text = v2, Color = u99})
                return false
            end)
            local v4 = ContextActionService
            local v5 = "CancelBounty" .. a1.UID
            local Q = Enum.KeyCode.Q
            local ButtonB = Enum.KeyCode.ButtonB
            v4:BindAction(v5, function() -- Line: 347 -- upvalues: EnemySelectionCursorController (upval)
                EnemySelectionCursorController.stop()
            end, false, Q, ButtonB)
            v1:Mark(function() -- Line: 350 -- upvalues: ContextActionService (upval), a1 (upval), KingpinStore (upval)
                ContextActionService:UnbindAction("CancelBounty" .. a1.UID)
                KingpinStore.clearBountySelection()
            end)
            local u67 = nil
            local u68 = nil
            local u69 = false
            local u70 = nil
            v1:Mark((RunService.RenderStepped:Connect(function() -- Line: 359
                -- upvalues: EnemySelectionCursorController (upval), u70 (ref), Sound (upval), u67 (ref), u68 (ref)
                -- upvalues: u69 (ref), NPCReplicator (upval), KingpinStore (upval), KingpinUtils (upval), a1 (upval)
                local v1 = EnemySelectionCursorController.getCurrentSelection()
                local RootPointer = v1 and v1:FindFirstChild("RootPointer") and v1:FindFirstChild("RootPointer").Value
                if RootPointer and RootPointer ~= u70 then
                    Sound("HoverHotbar"):Play(true)
                end
                u70 = RootPointer
                u67 = nil
                u68 = nil
                u69 = false
                if RootPointer then
                    local v2 = NPCReplicator.GetNPCFromFolder(RootPointer)
                    if v2 then
                        u67 = v2.Name
                        local v3 = KingpinStore.getBounty(RootPointer)
                        local v4 = if not KingpinUtils.hasOwner(v2) then a1:_getBountyRewardFromTarget(v2) else 0
                        u69 = a1:_canBountyTarget(v2, RootPointer)
                        u68 = if not v3 then v4 else v3.amount
                    end
                end
                KingpinStore.setBountySelection({
                    enabled = true,
                    selected = RootPointer,
                    enemyName = u67,
                    reward = u68,
                    canSelect = u69,
                })
            end)))
            local v6, v7 = v3:await()
            v1:Sweep()
            if not v6 then
                return false
            end
            local v8 = NPCReplicator.GetNPCFromFolder(v7)
            if a1:_getBountySelectionError(v8, v7) then
                return false
            end
            Notification.Create({Text = ("Bounty placed on %*"):format(v8.Name)})
            return {ReplicatorFolder = v7}
        end,
    }
    a1:Thread(function() -- Line: 420 -- upvalues: a1 (val), ServerTicks (upval)
        local v1 = if a1.Replicator:Get("CanFire") ~= false then a1:FindTarget() else nil
        if v1 then
            a1:_fireAt(v1)
            return
        end
        if a1._adsTrack and 3 <= ServerTicks.getTime() - a1._lastShotTime then
            a1._adsTrack:Stop()
            a1._adsTrack = nil
            a1:_playAnimation("Unholster", Enum.AnimationPriority.Movement)
        end
    end)
end

function v1:_getBountyRewardFromTarget(a2) -- Line: 432 -- upvalues: KingpinUtils (val)
    return KingpinUtils.getBountyRewardFromTarget(a2, self.Stats.Attributes)
end

function v1:_isTargetInRange(a2) -- Line: 436 -- upvalues: KingpinUtils (val)
    return KingpinUtils.isTargetInRange(a2, self, self:GetRange())
end

function v1:_canBountyTarget(a2, a3) -- Line: 440 -- upvalues: KingpinUtils (val) -- types: self: table, a3: userdata
    return if not a2.IsAlive then not KingpinUtils.hasOwner(a2) and not self:_hasLocalBountyOnTarget(a3) and self:_isTargetInRange(a2) else a2:IsAlive() and not KingpinUtils.hasOwner(a2) and not self:_hasLocalBountyOnTarget(a3) and self:_isTargetInRange(a2)
end

function v1:_getBountySelectionError(a2, a3) -- Line: 447
    -- upvalues: KingpinUtils (val)
    if not a2 then
        return "Select Enemy"
    end
    if a2.IsAlive and not a2:IsAlive() then
        return "Enemy is already dead!"
    end
    if KingpinUtils.hasOwner(a2) then
        return "Can't select summoned enemy"
    end
    if self:_hasLocalBountyOnTarget(a3) then
        return "You already have a bounty on this enemy!"
    end
    if not self:_isTargetInRange(a2) then
        return "Enemy out of range!"
    end
    return nil
end

function v1:_hasLocalBountyOnTarget(a2) -- Line: 471
    -- upvalues: KingpinUtils (val), KingpinStore (val)
    local _currentBounty = self._currentBounty and KingpinUtils.getReplicatorFolder(self._currentBounty.Target)
    if _currentBounty == a2 then
        return true
    end
    return KingpinStore.hasBounty(a2)
end

function v1:_clearBounty() -- Line: 481 -- upvalues: KingpinUtils (val), KingpinStore (val)
    local _currentBounty = self._currentBounty
    self._currentBounty = nil
    if not _currentBounty then
        return
    end
    local v1 = KingpinUtils.getReplicatorFolder(_currentBounty.Target)
    if not v1 then
        return
    end
    KingpinStore.removeBounty(v1)
end

function v1:_setBounty(a2, a3) -- Line: 497
    -- upvalues: KingpinUtils (val), KingpinStore (val)
    local v1 = KingpinUtils.getReplicatorFolder(a2)
    if not v1 then
        return
    end
    local v2 = {Target = a2, Amount = a3}
    local OwnerId = self.OwnerId or self.Replicator:Get("OwnerId")
    v2.UserId = OwnerId
    self._currentBounty = v2
    KingpinStore.createBounty(v1, a3)
end

function v1._resolveBone(a1, a2) -- Line: 513 -- types: a1: table, a2: string
    local v1
    local Weapon = a1.Model:FindFirstChild("Weapon")
    if Weapon then
        local Gun = Weapon:FindFirstChild("Gun")
        v1 = if Gun then Gun:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    if not v1 then
        return nil
    end
    local Bones = v1:FindFirstChild("Bones")
    if not Bones then
        return nil
    end
    local v2 = Bones:FindFirstChild(a2, true)
    return v2 and v2.Value
end

function v1:_fireAt(a2) -- Line: 529
    -- upvalues: ServerTicks (val), EmitterManager (val)
    local v1, v2
    local Torso = a2:FindFirstChild("Torso")
    local Position = Torso and Torso.Position or a2:GetPivot().Position
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Gun = Weapon:FindFirstChild("Gun")
        v1 = if Gun then Gun:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    local v3 = v1 and v1:GetAttribute("DualWield") == true
    local _fireRight = self._fireRight
    if not v3 then
        if self.Upgrade < 6 and not self._adsTrack then
            self._adsTrack = self:_playAnimation("ADS", Enum.AnimationPriority.Idle)
        end
        self:_playAnimation("Fire", Enum.AnimationPriority.Action)
    else
        self:_playAnimation(if not _fireRight then "FireLeft" else "FireRight", Enum.AnimationPriority.Action)
    end
    self._lastShotTime = ServerTicks.getTime()
    self:Face(Position)
    local Attribute = v1 and v1:GetAttribute("GunType")
    local v4 = Attribute and self._sounds[Attribute]
    if v4 then
        v4.TimePosition = 0
        v4.PlaybackSpeed = Random.new():NextNumber(0.85, 1.15)
        v4:Play()
    end
    if not v3 then
        v2 = self:_getWeaponConfigValue("Start", true)
    else
        v2 = self:_getWeaponConfigValue(("Start%*"):format(if not _fireRight then 2 else 1), true)
        self._fireRight = not _fireRight
    end
    if v2 then
        EmitterManager.manualEmit(v2)
        self:Bullet({Start = v2.WorldPosition, End = Position, Spread = 30, Speed = 100})
    end
    self:Delay((self:GetCooldown()))
end

return v1