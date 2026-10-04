-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Upgrade.upgradeHandler.troopHandler
-- Decompile time: 16.07 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local UsernameFromId = require(ReplicatedStorage.Shared.Modules.UsernameFromId)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local LocalPlayer = Players.LocalPlayer
local u54 = {}
u54.__index = u54
local u55 = {}

function u55.Hidden(a1) -- Line: 21 -- upvalues: Enum (val)
    local StatusEffectRenderer = a1.troopEntity.StatusEffectRenderer
    return StatusEffectRenderer and StatusEffectRenderer:has(Enum.StatusEffect.HiddenDetection) or false
end

function u55.HiddenBuff(a1) -- Line: 25 -- upvalues: Enum (val)
    local StatusEffectRenderer = a1.troopEntity.StatusEffectRenderer
    if StatusEffectRenderer and StatusEffectRenderer:has(Enum.StatusEffect.HiddenDetection) then
        return 100
    end
    return 0
end

function u55.FireworkBuff(a1) -- Line: 29 -- upvalues: Enum (val)
    local StatusEffectRenderer = a1.troopEntity.StatusEffectRenderer
    if StatusEffectRenderer and StatusEffectRenderer:has(Enum.StatusEffect.FireworkBuff) then
        return 100
    end
    return 0
end

function u55.Coordination(a1) -- Line: 33 -- upvalues: Enum (val)
    local StatusEffectRenderer = a1.troopEntity.StatusEffectRenderer
    local v1 = StatusEffectRenderer and StatusEffectRenderer:get(Enum.StatusEffect.Coordination)
    return v1 and v1.value or 0
end

function u55.SharedOptics(a1) -- Line: 38 -- upvalues: Enum (val)
    local StatusEffectRenderer = a1.troopEntity.StatusEffectRenderer
    if StatusEffectRenderer and StatusEffectRenderer:has(Enum.StatusEffect.SharedOptics) then
        return 100
    end
    return 0
end

function u55.Lead(a1) -- Line: 42 -- upvalues: Enum (val)
    local StatusEffectRenderer = a1.troopEntity.StatusEffectRenderer
    return StatusEffectRenderer and StatusEffectRenderer:has(Enum.StatusEffect.LeadDetection) or false
end

function u55.Flying(a1) -- Line: 46 -- upvalues: Enum (val)
    local StatusEffectRenderer = a1.troopEntity.StatusEffectRenderer
    return StatusEffectRenderer and StatusEffectRenderer:has(Enum.StatusEffect.FlyingDetection) or false
end

function u55.Buildzone(a1) -- Line: 50
    return a1.troopEntity.Stats.Attributes.Buildzone or a1.troopEntity.Stats.Attributes.FortifyRadius
end

function u55.Deadzone(a1) -- Line: 54
    return a1.troopEntity.Stats.Attributes.Deadzone
end

function u55.Path(a1) -- Line: 57
    return a1._troopPath
end

function u54.new(a1) -- Line: 62 -- upvalues: u54 (val), Maid (val), TowerReplicator (val), Signal (val), u55 (val)
    local u4 = setmetatable({}, u54)
    u4._troopMaid = Maid.new()
    u4._troopModel = a1
    u4._valueCache = {}
    u4._activeTimers = {}
    local PrimaryPart = a1.PrimaryPart or a1:FindFirstChild("HumanoidRootPart") or a1:FindFirstChild("RootPart")
    u4.humanoidRootPart = PrimaryPart
    TowerReplicator.waitForTowerByModel(a1)
    local v1 = TowerReplicator.getTowerByModel(a1)
    u4.troopEntity = v1
    u4.owns = u4
    u4.updateEvent = Signal.new()
    local u33 = nil
    local v2 = u4.humanoidRootPart.AncestryChanged:Connect(function() -- Line: 84 -- upvalues: u4 (val), u33 (ref)
        if not u4.humanoidRootPart:IsDescendantOf(workspace) then
            u33:Disconnect()
            u4.updateEvent:Fire("Removed")
        end
    end)
    local Target = a1:WaitForChild("Target")
    u4._targetEnemy = v1:FindTarget()
    u4._troopOptions = v1.Options
    u4._troopPath = v1.Replicator:Get("Path")
    u4._troopMaid:Mark(((v1.Replicator:GetStateChangedSignal("Options")):Connect(function(a1) -- Line: 99 -- upvalues: u4 (val)
        u4._troopOptions = a1
        u4.updateEvent:Fire("TroopOptions", u4._troopOptions)
    end)))
    u4._troopMaid:Mark(((Target:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 104 -- upvalues: u4 (val)
        u4._targetEnemy = u4.troopEntity:FindTarget()
        u4.updateEvent:Fire("TargetEnemy", u4._targetEnemy)
    end)))
    u4._troopMaid:Mark(((v1.Replicator:GetStateChangedSignal("Path")):Connect(function(a1) -- Line: 109 -- upvalues: u4 (val)
        u4._troopPath = a1
        u4.updateEvent:Fire("Path", u4._troopPath)
    end)))
    u4._troopMaid:Mark((v1.Replicator.Changed:Connect(function() -- Line: 114 -- upvalues: u4 (val)
        u4:update()
        u4:updateTroop()
    end)))
    if v1.StatusEffectRenderer then
        u4._troopMaid:Mark((v1.StatusEffectRenderer.Changed:Connect(function() -- Line: 120 -- upvalues: u4 (val), u55 (upval)
            local updateEvent, v1
            u4:update()
            u4:updateTroop()
            for i, j in u55 do
                updateEvent = u4.updateEvent
                v1 = j(u4)
                updateEvent:Fire(i, v1)
            end
        end)))
    end
    u4:update()
    return u4
end

function u54.Destroy(a1) -- Line: 134
    a1._troopMaid:Sweep()
end

function u54:update() -- Line: 138
    local Value, _baseValue, _searchString
    local v1 = self
    for k, v in pairs(self._valueCache) do
        _baseValue = v._baseValue
        _searchString = v._searchString
        if v1.troopEntity[v._searchString] then
            _baseValue = {Value = v1.troopEntity[v._searchString]}
        end
        Value = _baseValue.Value
        if Value ~= v.Value then
            v.Value = Value
            v1.updateEvent:Fire("Value", Value)
            v1.updateEvent:Fire(_searchString, Value)
        end
    end
end

function u54:getOwner() -- Line: 159
    return self.troopEntity.OwnerId
end

function u54.getOwnerName(a1) -- Line: 163 -- upvalues: UsernameFromId (val)
    local v1 = a1:getOwner()
    if not v1 then
        return ""
    end
    return UsernameFromId(v1)
end

function u54.isParent(a1) -- Line: 172 -- upvalues: LocalPlayer (val)
    return (a1:getOwner()) == LocalPlayer.UserId
end

function u54._createHandler(a1, a2, a3) -- Line: 176 -- upvalues: Promise (val)
    local u3 = {Value = a3.Value}
    return Promise.new(function(a1_2) -- Line: 180 -- upvalues: u3 (val), a3 (val), a2 (val), a1 (val)
        u3._baseValue = a3
        u3._searchString = a2
        a1_2(u3)
        a1.updateEvent:Fire(a2, u3.Value)
        a1.updateEvent:Fire("Value", u3.Value)
    end)
end

function u54:getHandler(a2) -- Line: 191 -- upvalues: u55 (val)
    if u55[a2] then
        return {Value = u55[a2](self)}
    end
    local v1 = self._valueCache[a2]
    if v1 then
        return v1
    end
    local v2 = string.split(a2, ".")
    if v2 then
        local _troopModel = self._troopModel
        local v3 = {Value = self.troopEntity[v2[#v2]]}
        local v4 = v3
        if v4 then
            local v5
            v3, v5 = self:_createHandler(a2, v4):awaitStatus()
            if v3 and v5 then
                self._valueCache[a2] = v5
                return v5
            end
        end
    end
end

function u54:getValue(a2) -- Line: 225
    local v1 = self:getHandler(a2)
    return v1 and v1.Value or 0
end

function u54.createTimer(a1, a2, a3) -- Line: 231 -- upvalues: table (val)
    table.insert(a1._activeTimers, {Identifier = a2, Time = tick() + a3})
end

function u54:updateTroop() -- Line: 238 -- upvalues: math (val), table (val)
    local Identifier, Time, v1
    local v2 = self
    for k, v in pairs(self._activeTimers) do
        Time = v.Time
        Identifier = v.Identifier
        v1 = math.floor(Time - tick())
        if not (v1 > 0) then
            table.remove(v2._activeTimers, k)
        end
        v2.updateEvent:Fire("Timer", Identifier, v1)
    end
end

function u54:onUpdate(a2, a3) -- Line: 251
    return self.updateEvent:Connect(function(a1, ...) -- Line: 252 -- upvalues: a2 (val), a3 (val)
        if a1 == a2 then
            pcall(a3, ...)
        end
    end)
end

function u54.listenTo(a1, a2, a3) -- Line: 259 -- upvalues: Promise (val)
    if a2 == "TargetEnemy" then
        a3(a1._targetEnemy)
        return a1:onUpdate(a2, a3)
    end
    if a2 == "TroopOptions" then
        a3(a1._troopOptions)
        return a1:onUpdate(a2, a3)
    end
    if a2 == "Path" then
        a3(a1._troopPath)
        return a1:onUpdate(a2, a3)
    end
    ;(Promise.new(function(a1_2, a2_2) -- Line: 271 -- upvalues: a1 (val), a2 (val), a3 (val)
        local v1 = a1:getValue(a2)
        if not v1 then
            a2_2("Could not obtain the desired value.")
        else
            local success, result = pcall(a3, v1)
            if not success then
                a2_2("The desired function threw an unexpected exception: " .. result)
            end
        end
        return a1_2()
    end)):catch(print)
    return a1:onUpdate(a2, a3)
end

function u54.getRange(a1) -- Line: 290
    return a1.troopEntity:GetRange()
end

function u54.getFlightRange(a1) -- Line: 294
    return (a1:getValue("FlightRange"))
end

function u54.getDeadzone(a1) -- Line: 299
    return (a1:getValue("Deadzone"))
end

function u54.getBuildzone(a1) -- Line: 305
    return (a1:getValue("Buildzone"))
end

function u54.getWorth(a1) -- Line: 311 -- upvalues: math (val)
    return math.floor(a1:getValue("Worth") / 3)
end

function u54.getMaxAmmo(a1) -- Line: 315
    return a1:getValue("MaxAmmo")
end

function u54.getPath(a1) -- Line: 319
    return a1:getValue("Path")
end

return u54