-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Upgrade.upgradeHandler
-- Decompile time: 63.36 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local v1 = {
    Cooldown = "rbxassetid://5652595271",
    Discount = "rbxassetid://5652597075",
    [Enum.StatusEffect.Fatigue] = "rbxassetid://5652596037",
    ["Damage"] = "rbxassetid://5652595012",
    [Enum.StatusEffect.Hidden] = "rbxassetid://5652660508",
    ["Range"] = "rbxassetid://5652596533",
    [Enum.StatusEffect.Scared] = "rbxassetid://10396577103",
    [Enum.StatusEffect.DisableDiscount] = "rbxassetid://128447486371630",
    [Enum.StatusEffect.FireworkBuff] = "rbxassetid://114727715199473",
    [Enum.StatusEffect.Coordination] = "rbxassetid://114589404718941",
    [Enum.StatusEffect.SharedOptics] = "rbxassetid://138731994983910",
}
local AbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore)
local AbilityAmmoStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityAmmoStore)
local CrosshairStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore)
local LockedAbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.LockedAbilitiesStore)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local AbilityStateConfig = require(ReplicatedStorage.Shared.Modules.AbilityStateConfig)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ExtraRangeRings = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.ExtraRangeRings)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
require(ReplicatedStorage.Shared.Modules.Render)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local Troops_2 = require(ReplicatedStorage.Shared.Modules.Network).Channel("Troops")
local LocalPlayer = Players.LocalPlayer
local USE_OWNER_ABILITY_STATE = AbilityStateConfig.USE_OWNER_ABILITY_STATE
local u179 = {
    "Discount",
    "Cooldown",
    Enum.StatusEffect.Fatigue,
    "Damage",
    Enum.StatusEffect.Hidden,
    "Range",
    Enum.StatusEffect.Scared,
    Enum.StatusEffect.DisableDiscount,
}
local u192 = {
    Enum.StatusEffect.Coordination,
    Enum.StatusEffect.SharedOptics,
    Enum.StatusEffect.FireworkBuff,
}

local function getTowerDisplayName(a1, a2, a3) -- Line: 71 -- types: a2: string
    return a1 and (a1.DisplayName or a1.Replicator and a1.Replicator:Get("DisplayName")) or a3 and a3.Properties and a3.Properties.DisplayName or a2
end

local function getQueueUnits(a1) -- Line: 83 -- upvalues: table (val)
    local v1, v2
    local v3 = {}
    if not a1 then
        return v3
    end
    local AllStates = a1:GetAllStates()
    for i, j in AllStates do
        v1 = i:match("^(.+)_time$")
        if v1 then
            v2 = AllStates[v1]
            if v2 then
                table.insert(v3, {id = v1, interval = j, started = v2})
            end
        end
    end
    return v3
end

local u202 = {}
local troopHandler = require(script:WaitForChild("troopHandler"))
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Effects = Assets:WaitForChild("Effects")
Assets:WaitForChild("Templates"):WaitForChild("Cards"):WaitForChild("Buffs")
Effects:WaitForChild("Client")
u202._troopCache = {}
u202._moduleCache = {}
u202._entityCache = {}
u202._troopConnections = Maid.new()
u202._queueConnections = Maid.new()

function u202._createTroop(a1, a2) -- Line: 131
    -- upvalues: troopHandler (val), Maid (val), TowerReplicator (val), u202 (val), USE_OWNER_ABILITY_STATE (val)
    -- upvalues: AbilityAmmoStore (val)
    local v1 = troopHandler.new(a2)
    local u8 = Maid.new()
    local u12 = TowerReplicator.getTowerByModel(a2)
    u202._entityCache[v1] = u12
    if not USE_OWNER_ABILITY_STATE then
        local AbilityDataReplicator = u12.AbilityDataReplicator
        for i, j in AbilityDataReplicator:GetAllStates() do
            AbilityAmmoStore.update(i .. u12.Replicator:Get("UID"), {
                ammo = j.Ammo,
                maxAmmo = j.MaxAmmo,
                interval = j.Interval,
                startTick = j.StartTick,
                syncPoint = j.SyncPoint,
            })
        end
        u8:Mark(function() -- Line: 150 -- upvalues: AbilityDataReplicator (val), AbilityAmmoStore (upval), u12 (val)
            for i, j in AbilityDataReplicator:GetAllStates() do
                AbilityAmmoStore.remove(i .. u12.Replicator:Get("UID"))
            end
        end)
        u8:Mark((AbilityDataReplicator.Changed:Connect(function(a1, a2) -- Line: 156 -- upvalues: AbilityAmmoStore (upval), u12 (val)
            AbilityAmmoStore.update(a1 .. u12.Replicator:Get("UID"), {
                ammo = a2.Ammo,
                maxAmmo = a2.MaxAmmo,
                interval = a2.Interval,
                startTick = a2.StartTick,
                syncPoint = a2.SyncPoint,
            })
        end)))
    end
    if v1:isParent() and u12.TowerName == "DJ Booth" then
        _G.Music:Enable()
        v1:onUpdate("Removed", function() -- Line: 171
            _G.Music:Disable()
        end)
        _G.Troop = a2
        _G.TroopEntity = u12
    end
    u8:Mark((a2.AncestryChanged:Connect(function() -- Line: 180 -- upvalues: a2 (val), u8 (val)
        if not a2:IsDescendantOf(workspace) then
            u8:Sweep()
        end
    end)))
    u202._troopConnections:Mark(v1)
    return v1
end

local function debounce(a1) -- Line: 209
    local u1 = false
    return function(...) -- Line: 212 -- upvalues: u1 (ref), a1 (val)
        if u1 then
            return
        end
        u1 = true
        local success, result = pcall(a1, ...)
        if not success then
            warn("Error:", result)
        end
        u1 = false
    end
end

function u202:_getTroop(a2) -- Line: 227
    return self._troopCache[a2] or self:_createTroop(a2)
end

function u202.selectTroop(a1, a2) -- Line: 231
    -- upvalues: CrosshairStore (val), ClientAtoms (val), UpgradesStore (val), u202 (val), Troops (val), table (val)
    -- upvalues: Promise (val), Troops_2 (val), Enum (val), Notification (val), getQueueUnits (val)
    -- upvalues: ExtraRangeRings (val), GameRules (val), GameState (val), u179 (val), u192 (val), Sound (val)
    -- upvalues: EmitterManager (val), LocalPlayer (val)
    local v1
    if CrosshairStore.getState().enabled then
        return
    end
    if a2 and a2:GetAttribute("Ignore") then
        return
    end
    if ClientAtoms.cloneTowerAtom().enabled then
        return
    end
    local v2 = UpgradesStore.getState()
    if v2.model == a2 then
        return
    end
    a1:clearTroop()
    if v2.disabled then
        return
    end
    local u348 = a1:_getTroop(a2)
    if not u348 then
        return
    end
    local u300 = u202._entityCache[u348]
    local u216 = u348:getValue("Name")
    local u258 = Troops(u216)
    local DisplayName = u300 and (u300.DisplayName or u300.Replicator and u300.Replicator:Get("DisplayName"))
    local DisplayName_2 = DisplayName or u258 and u258.Properties and u258.Properties.DisplayName or u216
    local u177 = {}
    local u446 = false
    local u181 = false

    local function queueUpgradeStoreUpdate(a1) -- Line: 268
        -- upvalues: u181 (ref), table (upval), u177 (ref), u446 (ref), UpgradesStore (upval), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, a1)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end

    a1._troopConnections:Mark(function() -- Line: 299 -- upvalues: u181 (ref), u177 (ref)
        u181 = true
        u177 = {}
    end)
    local _troopConnections_2 = a1._troopConnections
    local Target = UpgradesStore.Target

    local function u73(a1, a2_2) -- Line: 304
        -- upvalues: a2 (val), Promise (upval), Troops_2 (upval), Enum (upval), u348 (val), UpgradesStore (upval)
        assert(a1 == a2)
        ;(Promise.try(function() -- Line: 309 -- upvalues: Troops_2 (upval), a2 (upval), Enum (upval), a2_2 (val)
            return Troops_2:InvokeServer("Target", "Set", {Troop = a2, Target = Enum.TargetingMode.ToString(a2_2)})
        end)):andThen(function(a1) -- Line: 315 -- upvalues: Enum (upval), u348 (upval), UpgradesStore (upval)
            if not a1 then
                return
            end
            local First = Enum.TargetingMode[a1] or Enum.TargetingMode.First
            u348._target = First
            UpgradesStore.updateTarget(First)
        end):await()
    end

    local u77 = false
    _troopConnections_2:Mark((Target:Connect(function(...) -- Line: 212 -- upvalues: u77 (ref), u73 (val)
        if u77 then
            return
        end
        u77 = true
        local success, result = pcall(u73, ...)
        if not success then
            warn("Error:", result)
        end
        u77 = false
    end)))
    a1._troopConnections:Mark((u348:onUpdate("Timer", function(...) end)))
    a1._troopConnections:Mark(((a2:GetAttributeChangedSignal("Ignore")):Connect(function() -- Line: 333 -- upvalues: a2 (val), a1 (val)
        if a2:GetAttribute("Ignore") then
            a1:clearTroop()
        end
    end)))
    local v3 = {}
    if u258.UpgradeOptions and next(u258.UpgradeOptions) then
        local Default, v4
        v3 = table.deepClone(u258.UpgradeOptions)
        local Options = u300.Options or {}
        local v5 = nil
        v1 = nil
        for i, j in v3, v5, v1 do
            v4 = Options[j.Name]
            Default = if v4 == nil then j.Default else v4
            j.Selected = Default
            j.Default = nil
        end
        local u134 = true
        a1._troopConnections:Mark((u348:listenTo("TroopOptions", function(a1) -- Line: 352
            -- upvalues: u134 (ref), UpgradesStore (upval), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
            local u1 = {}
            for i, j in a1 do
                u1[i] = j
            end
            if u134 ~= true and not u181 then
                table.insert(u177, function() -- Line: 360 -- upvalues: UpgradesStore (upval), u1 (val)
                    UpgradesStore.updateTowerOptions(u1)
                end)
                if not u446 then
                    u446 = true
                    task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
                        u446 = false
                        if not u181 and UpgradesStore.getState().model == a2 then
                            local u7 = u177
                            u177 = {}
                            UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                                for i, j in u7 do
                                    j()
                                end
                            end)
                            return
                        end
                        u177 = {}
                    end)
                end
            end
            u134 = false
        end)))
        local _troopConnections_6 = a1._troopConnections
        local UpdateOption = UpgradesStore.UpdateOption

        local function u153(a1, a2_2, a3, a4) -- Line: 369
            -- upvalues: a2 (val), Promise (upval), Troops_2 (upval), Notification (upval), UpgradesStore (upval)
            assert(a1 == a2)
            ;(Promise.try(function() -- Line: 374 -- upvalues: Troops_2 (upval), a1 (val), a2_2 (val), a3 (val), a4 (val)
                local v1, v2 = Troops_2:InvokeServer("Option", "Set", {Troop = a1, Name = a2_2, Value = a3})
                return {
                    Success = v1,
                    Message = v2 or "Unknown error occured",
                    Name = a2_2,
                    Value = a4,
                }
            end)):andThen(function(a1) -- Line: 389 -- upvalues: Notification (upval), UpgradesStore (upval)
                if not a1.Success then
                    Notification.Create({Text = a1.Message, Color = Color3.fromRGB(236, 0, 0)})
                    return
                end
                local updateTowerOptions = UpgradesStore.updateTowerOptions
                local v1 = {}
                v1[a1.Name] = a1.Value
                updateTowerOptions(v1)
            end):await()
        end

        local u154 = false
        _troopConnections_6:Mark((UpdateOption:Connect(function(...) -- Line: 212 -- upvalues: u154 (ref), u153 (val)
            if u154 then
                return
            end
            u154 = true
            local success, result = pcall(u153, ...)
            if not success then
                warn("Error:", result)
            end
            u154 = false
        end)))
    end
    getQueueUnits(u300.Queues)
    local TargetingMode = u300.TargetingMode or Enum.TargetingMode.First
    local updateTower = UpgradesStore.updateTower
    v1 = {enabled = true, valid = true, boundary = 0}
    v1.golden = u300.GoldenPerks == true
    v1.model = a2
    v1.tower = u216
    v1.towerDisplayName = DisplayName_2
    v1.level = u300.Upgrade or 0
    v1.damage = u300.TotalDamage or 0
    v1.spent = u300.TotalSpent or 0
    v1.ammo = u300.Ammo or 0
    v1.maxAmmo = u300.MaxAmmo or 0
    v1.range = u348:getRange()
    v1.deadzone = u348:getDeadzone()
    v1.buildzone = u348:getBuildzone()
    v1.flightRange = u348:getFlightRange()
    v1.extraRings = ExtraRangeRings.forTowerEntity(u300, u258)
    v1.options = v3
    v1.path = u348:getPath()
    v1.ownerName = not u348:isParent() and u348:getOwnerName()
    v1.target = TargetingMode
    v1.figure8 = u300.Figure8 or false
    local v6 = u348.troopEntity.StatusEffectRenderer and u348.troopEntity.StatusEffectRenderer:has(Enum.StatusEffect.Jailed) or false
    v1.locked = v6
    v1.globalOptionsCoolDown = u300.Replicator:Get("GlobalOptionCoolDown")
    v1.globalOptionsStart = u300.Replicator:Get("GlobalOptionsStart")
    v1.globalOptionsSync = u300.Replicator:Get("GlobalOptionsSync")
    updateTower(v1)
    a1._troopConnections:Mark(((u300.Replicator:GetStateChangedSignal("DisplayName")):Connect(function() -- Line: 448 -- upvalues: UpgradesStore (upval), u300 (val), u216 (val), u258 (val)
        local v1 = u300
        local v2 = u258
        UpgradesStore.updateTowerDisplayName(v1 and (v1.DisplayName or v1.Replicator and v1.Replicator:Get("DisplayName")) or v2 and v2.Properties and v2.Properties.DisplayName or u216)
    end)))

    local function refreshRange() -- Line: 455
        -- upvalues: u348 (val), UpgradesStore (upval), ExtraRangeRings (upval), u300 (val), u258 (val), u181 (ref)
        -- upvalues: table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 456
            -- upvalues: u348 (upval), UpgradesStore (upval), ExtraRangeRings (upval), u300 (upval), u258 (upval)
            local v1 = u348:getRange()
            local v2 = u348:getDeadzone()
            local v3 = u348:getBuildzone()
            local v4 = u348:getFlightRange()
            UpgradesStore.updateZone({
                range = v1,
                deadzone = v2,
                buildzone = v3,
                flightRange = v4,
                extraRings = ExtraRangeRings.forTowerEntity(u300, u258),
            })
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end

    a1._troopConnections:Mark((u348:listenTo("Range", refreshRange)))
    a1._troopConnections:Mark((u348:listenTo("RangeBuff", refreshRange)))
    a1._troopConnections:Mark((u348:listenTo("ScaredBuff", refreshRange)))
    a1._troopConnections:Mark((GameRules.GetRuleChangedEvent("TowerRangeMultiplier"):Connect(refreshRange)))
    a1._troopConnections:Mark(((GameState.Replicator:GetStateChangedSignal("GlobalModifiersEnabled")):Connect(refreshRange)))
    if u300.Attributes then
        a1._troopConnections:Mark((u300.Attributes.Changed:Connect(function(a1) -- Line: 485
            -- upvalues: ExtraRangeRings (upval), u216 (val), u258 (val), u348 (val), UpgradesStore (upval), u300 (val)
            -- upvalues: u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
            if ExtraRangeRings.dependsOnAttribute(u216, a1, u258) then
                if u181 then
                    return
                end
                table.insert(u177, function() -- Line: 456
                    -- upvalues: u348 (upval), UpgradesStore (upval), ExtraRangeRings (upval), u300 (upval)
                    -- upvalues: u258 (upval)
                    local v1 = u348:getRange()
                    local v2 = u348:getDeadzone()
                    local v3 = u348:getBuildzone()
                    local v4 = u348:getFlightRange()
                    UpgradesStore.updateZone({
                        range = v1,
                        deadzone = v2,
                        buildzone = v3,
                        flightRange = v4,
                        extraRings = ExtraRangeRings.forTowerEntity(u300, u258),
                    })
                end)
                if u446 then
                    return
                end
                u446 = true
                task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
                    u446 = false
                    if not u181 and UpgradesStore.getState().model == a2 then
                        local u7 = u177
                        u177 = {}
                        UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                            for i, j in u7 do
                                j()
                            end
                        end)
                        return
                    end
                    u177 = {}
                end)
            end
        end)))
    end
    if not u181 then
        table.insert(u177, function() -- Line: 456 -- upvalues: u348 (val), UpgradesStore (upval), ExtraRangeRings (upval), u300 (val), u258 (val)
            local v1 = u348:getRange()
            local v2 = u348:getDeadzone()
            local v3 = u348:getBuildzone()
            local v4 = u348:getFlightRange()
            UpgradesStore.updateZone({
                range = v1,
                deadzone = v2,
                buildzone = v3,
                flightRange = v4,
                extraRings = ExtraRangeRings.forTowerEntity(u300, u258),
            })
        end)
        if not u446 then
            u446 = true
            task.defer(function() -- Line: 280 -- upvalues: u446 (ref), u181 (ref), UpgradesStore (upval), a2 (val), u177 (ref)
                u446 = false
                if not u181 and UpgradesStore.getState().model == a2 then
                    local u7 = u177
                    u177 = {}
                    UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                        for i, j in u7 do
                            j()
                        end
                    end)
                    return
                end
                u177 = {}
            end)
        end
    end
    for k, n in u179 do
        a1._troopConnections:Mark((u348:listenTo(n .. "Buff", function(a1) -- Line: 496
            -- upvalues: UpgradesStore (upval), n (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
            if u181 then
                return
            end
            table.insert(u177, function() -- Line: 497 -- upvalues: UpgradesStore (upval), n (upval), a1 (val)
                UpgradesStore.updateBuff(n, a1)
            end)
            if u446 then
                return
            end
            u446 = true
            task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
                u446 = false
                if not u181 and UpgradesStore.getState().model == a2 then
                    local u7 = u177
                    u177 = {}
                    UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                        for i, j in u7 do
                            j()
                        end
                    end)
                    return
                end
                u177 = {}
            end)
        end)))
    end
    for m, i5 in u192 do
        a1._troopConnections:Mark((u348:listenTo(i5, function(a1) -- Line: 504
            -- upvalues: UpgradesStore (upval), i5 (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
            if u181 then
                return
            end
            table.insert(u177, function() -- Line: 505 -- upvalues: UpgradesStore (upval), i5 (upval), a1 (val)
                UpgradesStore.updateBuff(i5, a1)
            end)
            if u446 then
                return
            end
            u446 = true
            task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
                u446 = false
                if not u181 and UpgradesStore.getState().model == a2 then
                    local u7 = u177
                    u177 = {}
                    UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                        for i, j in u7 do
                            j()
                        end
                    end)
                    return
                end
                u177 = {}
            end)
        end)))
    end
    if u348.troopEntity.StatusEffectRenderer then
        a1._troopConnections:Mark((u348.troopEntity.StatusEffectRenderer.Changed:Connect(function(a1) -- Line: 513 -- upvalues: Enum (upval), u348 (val), UpgradesStore (upval)
            if a1 ~= Enum.StatusEffect.Jailed then
                return
            end
            local v1 = u348.troopEntity.StatusEffectRenderer:has(Enum.StatusEffect.Jailed)
            UpgradesStore.setLocked(v1)
        end)))
    end
    a1._troopConnections:Mark((u348:listenTo("Path", function() -- Line: 526
        -- upvalues: UpgradesStore (upval), u348 (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 527 -- upvalues: UpgradesStore (upval), u348 (upval)
            UpgradesStore.updatePath(u348:getPath())
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("FlightRange", function() -- Line: 532
        -- upvalues: UpgradesStore (upval), u348 (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 533 -- upvalues: UpgradesStore (upval), u348 (upval)
            UpgradesStore.updateFlightRange(u348:getFlightRange())
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("Deadzone", function() -- Line: 538
        -- upvalues: UpgradesStore (upval), u348 (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 539 -- upvalues: UpgradesStore (upval), u348 (upval)
            UpgradesStore.updateZone({deadzone = u348:getDeadzone()})
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("Buildzone", function() -- Line: 546
        -- upvalues: UpgradesStore (upval), u348 (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 547 -- upvalues: UpgradesStore (upval), u348 (upval)
            UpgradesStore.updateZone({buildzone = u348:getBuildzone()})
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._hasTroop = true
    a1._troopConnections:Mark((u348:listenTo("TargetingMode", function(a1) -- Line: 556
        -- upvalues: UpgradesStore (upval), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 557 -- upvalues: UpgradesStore (upval), a1 (val)
            UpgradesStore.updateTarget(a1)
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("Upgrade", function(a1) -- Line: 562
        -- upvalues: UpgradesStore (upval), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val), u348 (val)
        -- upvalues: ExtraRangeRings (upval), u300 (val), u258 (val)
        if not u181 then
            table.insert(u177, function() -- Line: 563 -- upvalues: UpgradesStore (upval), a1 (val)
                UpgradesStore.updateLevel(a1)
            end)
            if not u446 then
                u446 = true
                task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
                    u446 = false
                    if not u181 and UpgradesStore.getState().model == a2 then
                        local u7 = u177
                        u177 = {}
                        UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                            for i, j in u7 do
                                j()
                            end
                        end)
                        return
                    end
                    u177 = {}
                end)
            end
        end
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 456
            -- upvalues: u348 (upval), UpgradesStore (upval), ExtraRangeRings (upval), u300 (upval), u258 (upval)
            local v1 = u348:getRange()
            local v2 = u348:getDeadzone()
            local v3 = u348:getBuildzone()
            local v4 = u348:getFlightRange()
            UpgradesStore.updateZone({
                range = v1,
                deadzone = v2,
                buildzone = v3,
                flightRange = v4,
                extraRings = ExtraRangeRings.forTowerEntity(u300, u258),
            })
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("TotalDamage", function(a1) -- Line: 569
        -- upvalues: UpgradesStore (upval), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 570 -- upvalues: UpgradesStore (upval), a1 (val)
            UpgradesStore.updateStats({damage = a1})
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("TotalSpent", function(a1) -- Line: 577
        -- upvalues: UpgradesStore (upval), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 578 -- upvalues: UpgradesStore (upval), a1 (val)
            UpgradesStore.updateStats({spent = a1})
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("Ammo", function(a1) -- Line: 585
        -- upvalues: UpgradesStore (upval), u348 (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 586 -- upvalues: UpgradesStore (upval), a1 (val), u348 (upval)
            UpgradesStore.updateStats({ammo = a1, maxAmmo = u348:getMaxAmmo()})
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("TargetEnemy", function(a1) -- Line: 594
        -- upvalues: UpgradesStore (upval), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 595 -- upvalues: UpgradesStore (upval), a1 (val)
            UpgradesStore.updateTargettedEnemy(a1)
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    a1._troopConnections:Mark((u348:listenTo("Owner", function(a1) -- Line: 600
        -- upvalues: UpgradesStore (upval), u348 (val), u181 (ref), table (upval), u177 (ref), u446 (ref), a2 (val)
        if u181 then
            return
        end
        table.insert(u177, function() -- Line: 601 -- upvalues: UpgradesStore (upval), u348 (upval)
            UpgradesStore.updateOwner(not u348:isParent() and u348:getOwnerName())
        end)
        if u446 then
            return
        end
        u446 = true
        task.defer(function() -- Line: 280 -- upvalues: u446 (upval), u181 (upval), UpgradesStore (upval), a2 (upval), u177 (upval)
            u446 = false
            if not u181 and UpgradesStore.getState().model == a2 then
                local u7 = u177
                u177 = {}
                UpgradesStore.batch(function() -- Line: 291 -- upvalues: u7 (val)
                    for i, j in u7 do
                        j()
                    end
                end)
                return
            end
            u177 = {}
        end)
    end)))
    local _troopConnections_26 = a1._troopConnections
    local Sell = UpgradesStore.Sell

    local function u603(a1_2) -- Line: 609
        -- upvalues: a2 (val), Promise (upval), Troops_2 (upval), Notification (upval), Sound (upval)
        -- upvalues: EmitterManager (upval), a1 (val)
        assert(a1_2 == a2)
        ;(Promise.try(function() -- Line: 613 -- upvalues: Troops_2 (upval), a2 (upval)
            return Troops_2:InvokeServer("Sell", {Troop = a2})
        end)):andThen(function(a1_3, a2) -- Line: 619
            -- upvalues: Notification (upval), Sound (upval), a1_2 (val), EmitterManager (upval), a1 (upval)
            if not a1_3 then
                Notification.Create({Text = a2, Color = Color3.fromRGB(236, 0, 0)})
                Sound("Error"):Play(true)
                return
            end
            Sound("New Sell"):Play()
            local HumanoidRootPart = a1_2:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                local Position = HumanoidRootPart.Position
                EmitterManager.Emit("SellEffect", CFrame.new(Position))
            end
            a1:clearTroop()
        end)
    end

    local u604 = false
    _troopConnections_26:Mark((Sell:Connect(function(...) -- Line: 212 -- upvalues: u604 (ref), u603 (val)
        if u604 then
            return
        end
        u604 = true
        local success, result = pcall(u603, ...)
        if not success then
            warn("Error:", result)
        end
        u604 = false
    end)))
    local _troopConnections_27 = a1._troopConnections
    local Upgrade = UpgradesStore.Upgrade

    local function u615(a1, a2_2, a3) -- Line: 644
        -- upvalues: a2 (val), UpgradesStore (upval), LocalPlayer (upval), Promise (upval), Troops_2 (upval)
        -- upvalues: Sound (upval), u300 (val), Notification (upval)
        assert(a1 == a2)
        local level = UpgradesStore.getState().level
        local u13 = level + 1
        if a2_2 then
            task.spawn(function() -- Line: 651 -- upvalues: UpgradesStore (upval), u13 (val)
                UpgradesStore.updateLevel(u13)
            end)
            local Cash = LocalPlayer.Cash
            Cash.Value = Cash.Value - a2_2
        end
        ;(Promise.try(function() -- Line: 658 -- upvalues: Troops_2 (upval), a2 (upval), a3 (val)
            return Troops_2:InvokeServer("Upgrade", "Set", {Troop = a2, Path = a3})
        end)):andThen(function(a1_2, a2) -- Line: 663
            -- upvalues: Sound (upval), UpgradesStore (upval), a2_2 (val), a1 (val), u13 (val), u300 (upval)
            -- upvalues: level (val), LocalPlayer (upval), Notification (upval)
            if a1_2 then
                Sound("New Upgrade"):Play(true)
                return
            end
            local v1 = UpgradesStore.getState()
            if a2_2 then
                if v1.model == a1 and v1.level == u13 then
                    local v2 = (u300.Replicator:Get("Upgrade")) or level
                    UpgradesStore.updateLevel(v2)
                end
                local Cash = LocalPlayer.Cash
                Cash.Value = Cash.Value + a2_2
            end
            Notification.Create({Text = a2, Color = Color3.fromRGB(236, 0, 0)})
            Sound("Error"):Play(true)
        end)
    end

    local u616 = false
    _troopConnections_27:Mark((Upgrade:Connect(function(...) -- Line: 212 -- upvalues: u616 (ref), u615 (val)
        if u616 then
            return
        end
        u616 = true
        local success, result = pcall(u615, ...)
        if not success then
            warn("Error:", result)
        end
        u616 = false
    end)))
    a1._troopConnections:Mark(((u348.troopEntity.Replicator:GetStateChangedSignal("GlobalOptionCoolDown")):Connect(function(a1) -- Line: 694 -- upvalues: UpgradesStore (upval)
        UpgradesStore.updateGlobalOptions(a1)
    end)))
    a1._troopConnections:Mark(((u348.troopEntity.Replicator:GetStateChangedSignal("GlobalOptionsStart")):Connect(function(a1) -- Line: 702 -- upvalues: UpgradesStore (upval)
        UpgradesStore.updateGlobalOptionsStart(a1)
    end)))
    a1._troopConnections:Mark(((u348.troopEntity.Replicator:GetStateChangedSignal("GlobalOptionsSync")):Connect(function(a1) -- Line: 710 -- upvalues: UpgradesStore (upval)
        UpgradesStore.updateGlobalOptionsSync(a1)
    end)))
    local Queues = u348.troopEntity.Queues
    UpgradesStore.updateUnits((getQueueUnits(Queues)))
    a1._troopConnections:Mark((Queues.Changed:Connect(function() -- Line: 718 -- upvalues: UpgradesStore (upval), getQueueUnits (upval), Queues (val)
        UpgradesStore.updateUnits((getQueueUnits(Queues)))
    end)))
    return true
end

function u202.hasTroop(a1) -- Line: 728
    return a1._hasTroop
end

function u202.getTroopModel(a1) -- Line: 732 -- upvalues: UpgradesStore (val)
    return UpgradesStore.getState().model
end

function u202:clearTroop() -- Line: 736 -- upvalues: UpgradesStore (val)
    local _hasTroop = self._hasTroop
    self._troopConnections:Sweep()
    self._hasTroop = false
    if _hasTroop then
        UpgradesStore.reset()
    end
    return true
end

AbilitiesStore.UseAbility:Connect(function(a1, a2) -- Line: 756
    -- upvalues: ClientAtoms (val), Notification (val), LockedAbilitiesStore (val), TowerReplicator (val)
    -- upvalues: Troops_2 (val)
    if ClientAtoms.cloneTowerAtom().blockOtherAbilities == true then
        Notification.Create({
            Text = "Finish or cancel reposition before using another ability.",
            Color = Color3.fromRGB(236, 0, 0),
        })
        return
    end
    if LockedAbilitiesStore.getState()[a2] then
        Notification.Create({Text = ("%* is currently locked!"):format(a2), Color = Color3.fromRGB(236, 0, 0)})
        return
    end
    local v1 = TowerReplicator.getTowerByModel(a1)
    if not v1 then
        return
    end
    local v2 = v1.AbilityCallbacks[a2]
    if v2 and not v1.Replicator:Get("DisabledAbilities")[a2] and (v2(v1)) == false then
        return
    end
    Troops_2:InvokeServer("Abilities", "Activate", {Name = a2, Troop = a1, Data = {}})
end)
return u202