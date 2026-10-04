-- Script path: ReplicatedStorage.Content.Tower.EvolvedEnforcer.Animator
-- Decompile time: 10.45 ms

local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CharmUtil = require(ReplicatedStorage.Shared.Modules.CharmUtil)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local EnforcerAbilityAnimation = require(script.EnforcerAbilityAnimation)
local Sounds = require(script.Sounds)
local v1 = {}
v1.__index = v1
local cloneTowerAtom = ClientAtoms.cloneTowerAtom
local HackerAssets = ReplicatedStorage.Assets.HackerAssets
local u87 = Random.new()
local u91 = NumberRange.new(0.85, 1.15)

local function getArcCFrame(a1, a2, a3, a4) -- Line: 34 -- types: a1: vector, a2: vector, a3: number, a4: number
    local v1 = a1:Lerp(a2, a4)
    local v2 = a3 * 4 * a4
    local v3 = v1 + Vector3.new(0, 1, 0) * (v2 * (1 - a4))
    return CFrame.lookAt(v3, v3 + (a2 - a1 + Vector3.new(0, 1, 0) * (a3 * 4 * (1 - a4 * 2))))
end

local function setCloneSelectionState(a1) -- Line: 47 -- upvalues: cloneTowerAtom (val)
    cloneTowerAtom({
        enabled = a1.enabled,
        selected = a1.selected,
        dontSelect = a1.dontSelect,
        dontSelectList = a1.dontSelectList,
        dontSelectModel = a1.dontSelectModel,
        ownedTowersOnly = a1.ownedTowersOnly,
        blockOtherAbilities = a1.blockOtherAbilities,
        allowHolograms = a1.allowHolograms,
        isCloning = a1.isCloning,
        costPercent = a1.costPercent,
    })
end

function v1:_playSound(a2, a3) -- Line: 62 -- types: self: table, a2: string, a3: number?
    local v1 = self._sounds[a2]
    if not v1 then
        return nil
    end
    v1.TimePosition = 0
    v1.PlaybackSpeed = a3 or 1
    v1:Play()
    return v1
end

function v1:_playAnimation(a2, a3) -- Line: 74 -- types: self: table, a2: string
    local v1 = self:Animate(a2)
    if v1 and a3 then
        v1.Priority = a3
    end
    return v1
end

function v1:_getWeaponConfigValue(a2, a3) -- Line: 86 -- types: self: table, a2: string, a3: boolean?
    local v1 = (self.Model.Weapon.Weapon:FindFirstChild("Configuration")):FindFirstChild(a2, a3 == true)
    return v1 and v1.Value
end

function v1:_playFlashbangExplosion(a2, a3, a4) -- Line: 93
    -- upvalues: EmitterManager (val), TimescaleUtilities (val)
    self:_playSound("FlashbangExplosion")
    local Model = Instance.new("Model")
    a4.Parent = Model
    Model:ScaleTo(a3)
    a4:PivotTo((CFrame.new(a2)))
    Model.Parent = workspace
    EmitterManager.manualEmit(a4)
    TimescaleUtilities.Delay(2, function() -- Line: 107 -- upvalues: Model (val)
        if Model.Parent then
            Model:Destroy()
        end
    end)
end

function v1._throwFlashbangTo(a1, a2, a3, a4, a5, a6, a7) -- Line: 114
    -- upvalues: RunService (val), TimescaleUtilities (val), getArcCFrame (val)
    a6.Transparency = 0
    a6.Parent = workspace
    a6.Name = "EnforcerFlashbangProjectile"
    local Motor6D = a6:FindFirstChildWhichIsA("Motor6D")
    if Motor6D then
        Motor6D:Destroy()
    end
    local u24 = math.max(2, (a2 - a5).Magnitude * 0.1)
    local u25 = 0
    local u26 = nil
    local v1 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 134
        -- upvalues: u25 (ref), TimescaleUtilities (upval), a4 (val), a6 (val), getArcCFrame (upval), a5 (val), a2 (val)
        -- upvalues: u24 (val), u26 (ref), a1 (val), a3 (val), a7 (val)
        u25 = u25 + a1_2 / TimescaleUtilities.GetScaledTime(1)
        local v1 = math.clamp(u25 / a4, 0, 1)
        a6:PivotTo((getArcCFrame(a5, a2, u24, v1)))
        if v1 < 1 then
            return
        end
        u26:Disconnect()
        a6:Destroy()
        a1:_playFlashbangExplosion(a2, a3, a7)
    end)
end

function v1:_destroySoundCache() -- Line: 149 -- upvalues: EasySound (val)
    for i, j in self._sounds do
        EasySound.Destroy(j)
    end
    table.clear(self._sounds)
end

function v1:_cancelHelicopterSelection() -- Line: 157 -- upvalues: setCloneSelectionState (val)
    self._helicopterSelectionMaid:Sweep()
    setCloneSelectionState({
        enabled = false,
        ownedTowersOnly = false,
        blockOtherAbilities = false,
        allowHolograms = false,
        isCloning = false,
        costPercent = 0,
        dontSelectList = {},
    })
end

function v1:_tryBeginHelicopterSelection() -- Line: 174
    if self._helicopterSelectionInProgress then
        return false
    end
    self._helicopterSelectionInProgress = true
    return true
end

function v1:_endHelicopterSelection() -- Line: 183
    self._helicopterSelectionInProgress = false
end

function v1:_getTowerToReposition() -- Line: 187
    -- upvalues: ContextActionService (val), setCloneSelectionState (val), CharmUtil (val), ClientAtoms (val)
    -- upvalues: cloneTowerAtom (val), TypedPromise (val), RunService (val)
    local u3 = "CancelHelicopterReposition" .. self.UID
    local v1 = ContextActionService
    local Q = Enum.KeyCode.Q
    local ButtonB = Enum.KeyCode.ButtonB
    v1:BindAction(u3, function() -- Line: 189 -- upvalues: self (val)
        self:_cancelHelicopterSelection()
    end, false, Q, ButtonB)
    self._helicopterSelectionMaid:Mark(function() -- Line: 193 -- upvalues: ContextActionService (upval), u3 (val)
        ContextActionService:UnbindAction(u3)
    end)
    self:DeselectTowers()
    local v2 = self.Replicator:Get("RepositionTowerBlacklist") or {}
    local u35 = {}
    for i, j in v2 do
        if typeof(j) == "string" then
            u35[j] = true
        end
    end
    setCloneSelectionState({
        enabled = true,
        ownedTowersOnly = true,
        blockOtherAbilities = true,
        isCloning = false,
        costPercent = 0,
        dontSelectList = v2,
        dontSelectModel = self.Model,
        allowHolograms = self.Replicator:Get("CanRepositionClones") == true,
    })
    local u54 = false
    local u55 = nil

    local function u56() end

    u56 = CharmUtil.watch(function() -- Line: 224 -- upvalues: ClientAtoms (upval)
        return ClientAtoms.cloneTowerAtom().isCloning
    end, function(a1) -- Line: 226
        -- upvalues: ClientAtoms (upval), u55 (ref), cloneTowerAtom (upval), u35 (val), u54 (ref), u56 (ref)
        if a1 then
            u55 = ClientAtoms.cloneTowerAtom().selected
            if u55 == "none" then
                cloneTowerAtom({isCloning = false})
                return
            end
            if type(u55) == "table" then
                local Name = u55.State and u55.State.Name or u55.Name
                if Name and u35[Name] then
                    cloneTowerAtom({isCloning = false, selected = "none"})
                    u55 = nil
                    u54 = true
                    u56()
                    return
                end
            end
            u54 = true
            u56()
        end
    end)
    self._helicopterSelectionMaid:Mark(u56)
    local u72 = TypedPromise.new(function(a1, a2, a3) -- Line: 260 -- upvalues: RunService (upval), u54 (ref)
        local u3 = nil
        a3(function() -- Line: 263 -- upvalues: u3 (ref)
            if u3 then
                u3:Disconnect()
            end
        end)
        local v1 = RunService.RenderStepped:Connect(function() -- Line: 269 -- upvalues: u54 (upval), u3 (ref), a1 (val)
            if u54 then
                u3:Disconnect()
                a1()
            end
        end)
    end)
    self._helicopterSelectionMaid:Mark(function() -- Line: 277 -- upvalues: u72 (val)
        if u72 then
            u72:cancel()
        end
    end)
    u72:await()
    if u54 and u55 then
        self._helicopterSelectionMaid:Sweep()
        setCloneSelectionState({
            enabled = false,
            ownedTowersOnly = false,
            blockOtherAbilities = true,
            allowHolograms = false,
            isCloning = false,
            costPercent = 0,
            selected = u55,
            dontSelectList = {},
        })
        return u55
    end
    self:_cancelHelicopterSelection()
    return nil
end

function v1.Initialize(a1) -- Line: 309
    -- upvalues: Maid (val), Sounds (val), EasySound (val), cloneTowerAtom (val), ClientAtoms (val), GameState (val)
    -- upvalues: u87 (val), u91 (val), EmitterManager (val), EnforcerAbilityAnimation (val), HackerAssets (val)
    -- upvalues: RunService (val), TimescaleUtilities (val), PathPlacementCursorController (val)
    -- upvalues: SharedControllerFunctions (val), Notification (val)
    local Default
    a1._helicopterSelectionMaid = Maid.new()
    a1._helicopterSelectionInProgress = false
    a1._flashbangSequenceId = 0
    a1._sounds = {}
    local v1 = nil
    local v2 = nil
    for i, j in Sounds.Tower, v1, v2 do
        Default = j[a1.Model.Name] or j.Default
        if Default then
            a1._sounds[i] = (EasySound.Create({
                audioGroup = "Towers",
                timeScaled = true,
                id = Default,
                parent = a1.Model.PrimaryPart,
            }))
        end
    end
    a1.Maid:Mark(function() -- Line: 329 -- upvalues: cloneTowerAtom (upval), a1 (val)
        cloneTowerAtom(function(a1) -- Line: 330
            if a1.blockOtherAbilities ~= true then
                return a1
            end
            local v1 = table.clone(a1)
            v1.blockOtherAbilities = false
            return v1
        end)
        a1._helicopterSelectionInProgress = false
        a1._helicopterSelectionMaid:Sweep()
        a1:_destroySoundCache()
    end)
    local u30 = Maid.new()
    local u31 = true

    local function cleanPlacementPreview() -- Line: 348 -- upvalues: a1 (val), ClientAtoms (upval), u30 (val)
        a1:ToggleReposition({enabled = false, range = 0})
        ClientAtoms.cloneTowerRangeRing({
            position = Vector3.new(0, 0, 0),
            enabled = false,
            range = 0,
            towerBoundary = 0,
            color = Color3.fromRGB(255, 255, 255),
        })
        if a1.crossHair then
            a1.crossHair:Destroy()
            a1.crossHair = nil
        end
        u30:Sweep()
    end

    a1.Executables = {
        Fire = function(a1_2, a2, a3, a4) -- Line: 373
            -- upvalues: a1 (val), GameState (upval), u87 (upval), u91 (upval)
            local v1
            local Configuration = a1.Model.Weapon.Weapon:FindFirstChild("Configuration")
            local v2 = a1:_playAnimation("Fire", Enum.AnimationPriority.Action)
            if v2 then
                v2:AdjustSpeed((1 + a1:GetBuffCount("Cooldown") / 100) * GameState.TimeScale)
            end
            a1:_playSound(
                if not (Configuration:GetAttribute("AutoFire") == true) then "FirePump" else "FireAuto",
                (u87:NextNumber(u91.Min, u91.Max))
            )
            a1:Face(a1_2)
            local Attribute = Configuration:GetAttribute("BulletType")
            if Attribute == "" then
                Attribute = nil
            end
            local v3 = a1:_getWeaponConfigValue("Start", true)
            for i, j in a2 do
                a1:Bullet({
                    Size = 0.05,
                    Spread = 30,
                    Speed = 180,
                    Start = v3.WorldPosition,
                    End = j,
                    Bullet = Attribute,
                })
            end
            if not v1 and a4 and a4 > 0 then
                a1:_playSound("Pump")
            end
        end,
        Flashbang = function(a1_2, a2, a3) -- Line: 415 -- upvalues: a1 (val) -- types: a1_2: vector, a2: number, a3: number
            local v1 = a1
            v1._flashbangSequenceId = v1._flashbangSequenceId + 1
            local _flashbangSequenceId = a1._flashbangSequenceId
            local u13 = a1:_getWeaponConfigValue("Flashbang", true)
            local u16 = u13:Clone()
            local u25 = a1:_getWeaponConfigValue("FlashbangExplosion", true):Clone()
            local WorldPosition = a1:_getWeaponConfigValue("Start", true).WorldPosition
            u13.Transparency = 0
            a1:Face(a1_2)
            a1:_playAnimation("Flash", Enum.AnimationPriority.Action2)
            a1:Delay(a1.Stats.Attributes.FlashbangAnimationDelay, function() -- Line: 430
                -- upvalues: _flashbangSequenceId (val), a1 (upval), u16 (val), u25 (val), a1_2 (val), a2 (val)
                -- upvalues: a3 (val), WorldPosition (val), u13 (val)
                if _flashbangSequenceId ~= a1._flashbangSequenceId then
                    u16:Destroy()
                    u25:Destroy()
                    return
                end
                a1:_throwFlashbangTo(a1_2, a2, a3, WorldPosition, u16, u25)
                if u13.Parent then
                    u13.Transparency = 1
                end
            end)
        end,
        SWATVan = function() -- Line: 451 -- upvalues: a1 (val), EmitterManager (upval)
            a1:_playAnimation("Radio", Enum.AnimationPriority.Action2)
            EmitterManager.manualEmit(a1.Model.RadioVFX)
            a1:_playSound("CallSWATVan")
        end,
        Reload = function() -- Line: 457 -- upvalues: a1 (val)
            a1:_playAnimation("Reload", Enum.AnimationPriority.Action)
            a1:_playSound("ReloadAuto")
        end,
        HelicopterReposition = function(a1_2, a2) -- Line: 462
            -- upvalues: a1 (val), EmitterManager (upval), EnforcerAbilityAnimation (upval)
            a1:_playAnimation("Radio", Enum.AnimationPriority.Action2)
            EmitterManager.manualEmit(a1.Model.RadioVFX)
            a1:_playSound("CallSWATVan")
            EnforcerAbilityAnimation.new({
                pickupPos = a1_2:GetPivot().Position,
                dropoffPos = a2,
                towerModel = a1_2,
                helicopterSpeed = a1.Stats.Attributes.HelicopterSpeed,
                transportSpeedMultiplier = a1.Stats.Attributes.HelicopterTransportSpeedMultiplier,
                hoverDuration = a1.Stats.Attributes.HelicopterHoverDuration,
                minTransportDuration = a1.Stats.Attributes.HelicopterMinTransportDuration,
                approachDistance = a1.Stats.Attributes.HelicopterApproachDistance,
                exitDistance = a1.Stats.Attributes.HelicopterExitDistance,
                skinName = a1.Model.Name,
            }):play()
        end,
    }
    a1.AbilityCallbacks = {
        ["Helicopter Reposition"] = function() -- Line: 485
            -- upvalues: a1 (val), u31 (ref), cleanPlacementPreview (val), HackerAssets (upval), u30 (val)
            -- upvalues: RunService (upval), TimescaleUtilities (upval), PathPlacementCursorController (upval)
            -- upvalues: ClientAtoms (upval), SharedControllerFunctions (upval), Notification (upval)
            -- upvalues: cloneTowerAtom (upval)
            if not a1:_tryBeginHelicopterSelection() then
                return false
            end
            local success, result = pcall(function() -- Line: 490
                -- upvalues: a1 (upval), u31 (upval), cleanPlacementPreview (upval), HackerAssets (upval), u30 (upval)
                -- upvalues: RunService (upval), TimescaleUtilities (upval), PathPlacementCursorController (upval)
                -- upvalues: ClientAtoms (upval), SharedControllerFunctions (upval), Notification (upval)
                local u3 = a1:_getTowerToReposition()
                if not u3 then
                    return false
                end
                u31 = false
                task.defer(function() -- Line: 498 -- upvalues: u31 (upval)
                    u31 = true
                end)
                cleanPlacementPreview()
                local u14 = u3.Asset.Properties.BoundarySize or 2
                a1.crossHair = HackerAssets.TowerCloningPlacement:Clone()
                a1.crossHair.Parent = workspace.Terrain
                local u25 = nil
                local u26 = 0
                local u27 = 0
                u30:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 511
                    -- upvalues: TimescaleUtilities (upval), u27 (ref), u25 (ref), PathPlacementCursorController (upval)
                    -- upvalues: u26 (ref), a1 (upval), ClientAtoms (upval), u3 (val), u14 (val)
                    local v1 = a1_2 / TimescaleUtilities.GetScaledTime(1)
                    u27 = u27 + v1
                    u25 = PathPlacementCursorController.CurrentPosition
                    u26 = u26 + 90 * v1
                    a1.crossHair.CFrame = (CFrame.new(u25, (Vector3.new(u25.X, 0, u25.Z)))) * CFrame.Angles(1.5707963267948966, math.rad(u26), 0) * CFrame.new(0, math.sin(u27) + 3.5, 0)
                    local cloneTowerRangeRing = ClientAtoms.cloneTowerRangeRing
                    local v2 = {enabled = true, position = u25, range = u3.Range, towerBoundary = u14}
                    local v3 = PathPlacementCursorController.CantPlace and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
                    v2.color = v3
                    cloneTowerRangeRing(v2)
                end)))
                a1:ToggleReposition({enabled = true, range = u14, towerData = u3, ignoredTower = u3})
                local v1 = SharedControllerFunctions.getPlacement():await()
                if u31 then
                    cleanPlacementPreview()
                end
                if v1 and not PathPlacementCursorController.CantPlace then
                    if u3.Model and u3.Model.Parent then
                        return {towerModel = u3.Model, position = u25}
                    end
                    Notification.Create({
                        Text = "That tower is no longer available.",
                        Color = Color3.fromRGB(236, 0, 0),
                    })
                    return false
                end
                return false
            end)
            a1:_endHelicopterSelection()
            cloneTowerAtom(function(a1) -- Line: 570
                if a1.blockOtherAbilities ~= true then
                    return a1
                end
                local v1 = table.clone(a1)
                v1.blockOtherAbilities = false
                return v1
            end)
            if success then
                return result
            end
            warn("[EvolvedEnforcer.Animator] Helicopter reposition selection failed", result)
            return false
        end,
    }
end

return v1