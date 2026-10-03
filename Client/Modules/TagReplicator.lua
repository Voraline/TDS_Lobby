-- Script path: ReplicatedStorage.Client.Modules.TagReplicator
-- Decompile time: 9.36 ms

local CollectionService = game:GetService("CollectionService")
game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u15 = {}
u15.__index = u15
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local AttributeSerializer = require(ReplicatedStorage.Shared.Modules.AttributeSerializer)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Deserialize = AttributeSerializer.Deserialize
local Serialize = AttributeSerializer.Serialize
local Sanetize = AttributeSerializer.Sanetize
local VALUE_OBJECT_OVERRIDES = SharedGameConstants.VALUE_OBJECT_OVERRIDES
local u45 = {}
local u46 = {}
local u47 = {}
local u48 = {Total = 0}
local u50 = Signal.new()
local u52 = Signal.new()
local u53 = {
    TowerReplicator = "TagReplicator_AttributeChanged_Tower",
    StatusEffects = "TagReplicator_AttributeChanged_StatusEffects",
    Attributes = "TagReplicator_AttributeChanged_Attributes",
    AbilityEffects = "TagReplicator_AttributeChanged_AbilityEffects",
    Stuns = "TagReplicator_AttributeChanged_Stuns",
    Abilities = "TagReplicator_AttributeChanged_Abilities",
    AbilityData = "TagReplicator_AttributeChanged_AbilityData",
    Queues = "TagReplicator_AttributeChanged_Queues",
}
local u54 = {
    Tower = "TagReplicator_Lifecycle_Tower",
    StatusEffects = "TagReplicator_Lifecycle_StatusEffects",
    Attributes = "TagReplicator_Lifecycle_Attributes",
    AbilityEffects = "TagReplicator_Lifecycle_AbilityEffects",
    Stuns = "TagReplicator_Lifecycle_Stuns",
    Abilities = "TagReplicator_Lifecycle_Abilities",
    AbilityData = "TagReplicator_Lifecycle_AbilityData",
    Queues = "TagReplicator_Lifecycle_Queues",
}

local function getProfileKind(a1) -- Line: 55
    if not a1 then
        return "Unknown"
    end
    if a1.Name == "TowerReplicator" then
        return "Tower"
    end
    return a1.Name
end

local function getAttributeProfileLabel(a1) -- Line: 67 -- upvalues: u53 (val)
    return u53[a1.Name] or "TagReplicator_AttributeChanged_Other"
end

local function getLifecycleProfileLabel(a1) -- Line: 72 -- upvalues: u54 (val)
    return u54[a1] or "TagReplicator_Lifecycle_Other"
end

local function bumpActiveCount(a1, a2) -- Line: 76 -- upvalues: u48 (val)
    local v1 = u48
    v1.Total = v1.Total + a2
    u48[a1] = (u48[a1] or 0) + a2
    if u48[a1] <= 0 then
        u48[a1] = nil
    end
end

local function hookStateObject(a1, a2) -- Line: 85
    local Name = a2.Name
    a1.Maid:Mark((a2.Changed:Connect(function() -- Line: 87 -- upvalues: a2 (val), a1 (val), Name (val)
        debug.profilebegin("TagReplicator_ValueChanged")
        local Value = a2.Value
        if a1.AttributeConnections[Name] then
            a1.AttributeConnections[Name]:Fire(Value)
        end
        a1.Changed:Fire(Name, Value)
        debug.profileend()
    end)))
    a1.Changed:Fire(Name, a2.Value)
end

local function isReplicatorAlive(a1) -- Line: 102
    return a1 and a1.Maid ~= nil
end

function u15._new(a1) -- Line: 125
    -- upvalues: u15 (val), Maid (val), Signal (val), u53 (val), u54 (val), u48 (val), Deserialize (val)
    -- upvalues: VALUE_OBJECT_OVERRIDES (val), hookStateObject (val)
    local u4 = setmetatable({}, u15)
    u4.Maid = Maid.new()
    u4.Changed = Signal.new()
    u4.Maid:Mark(u4.Changed)
    u4.Folder = a1
    u4.State = {}
    u4.RawState = {}
    u4.AttributeConnections = {}
    u4._profileKind = if a1 then if a1.Name ~= "TowerReplicator" then a1.Name else "Tower" else "Unknown"
    u4._attributeProfileLabel = u53[a1.Name] or "TagReplicator_AttributeChanged_Other"
    u4._lifecycleProfileLabel = u54[u4._profileKind] or "TagReplicator_Lifecycle_Other"
    debug.profilebegin("TagReplicator_Create")
    debug.profilebegin(u4._lifecycleProfileLabel)
    local _profileKind_2 = u4._profileKind
    local v1 = u48
    v1.Total = v1.Total + 1
    u48[_profileKind_2] = (u48[_profileKind_2] or 0) + 1
    if u48[_profileKind_2] <= 0 then
        u48[_profileKind_2] = nil
    end
    debug.profileend()
    debug.profileend()
    u4.Maid:Mark((u4.Folder.AttributeChanged:Connect(function(a1) -- Line: 147 -- upvalues: u4 (val), Deserialize (upval)
        debug.profilebegin("TagReplicator_AttributeChanged")
        debug.profilebegin(u4._attributeProfileLabel)
        local Attribute = u4.Folder:GetAttribute(a1)
        if u4.RawState[a1] == Attribute then
            debug.profileend()
            debug.profileend()
            return
        end
        u4.RawState[a1] = Attribute
        if Attribute ~= nil then
            Attribute = Deserialize(Attribute)
        end
        u4.State[a1] = Attribute
        u4.Changed:Fire(a1, Attribute)
        if u4.AttributeConnections[a1] then
            u4.AttributeConnections[a1]:Fire(Attribute)
        end
        debug.profileend()
        debug.profileend()
    end)))
    for k, v in pairs(u4.Folder:GetChildren()) do
        if VALUE_OBJECT_OVERRIDES[v.Name] then
            hookStateObject(u4, v)
        end
    end
    u4.Maid:Mark((u4.Folder.ChildAdded:Connect(function(a1) -- Line: 178 -- upvalues: VALUE_OBJECT_OVERRIDES (upval), hookStateObject (upval), u4 (val)
        debug.profilebegin("TagReplicator_ChildAdded")
        if VALUE_OBJECT_OVERRIDES[a1.Name] then
            hookStateObject(u4, a1)
        end
        debug.profileend()
    end)))
    u4.Maid:Mark((u4.Changed:Connect(function(a1, a2) -- Line: 186 -- upvalues: u4 (val)
        u4.State[a1] = a2
    end)))
    for i, j in u4.Folder:GetAttributes() do
        u4.RawState[i] = j
        u4.State[i] = (Deserialize(j))
    end
    return u4
end

function u15.WaitForState(a1, a2) -- Line: 198 -- upvalues: Sanetize (val), TypedPromise (val)
    local u5 = Sanetize(a2)
    return (TypedPromise.new(function(a1_2, a2, a3) -- Line: 201 -- upvalues: a1 (val), u5 (ref)
        if a1:Get(u5) ~= nil then
            a1_2(a1:Get(u5))
            return
        end
        local u18 = task.delay(10, function() -- Line: 207 -- upvalues: u5 (upval)
            local v1 = u5
            warn((("Potential infinite yield on WaitForState: %*"):format(v1)))
        end)
        local u19 = nil

        local function u20() -- Line: 212 -- upvalues: u19 (ref), u18 (val), a2 (val)
            u19:Disconnect()
            task.cancel(u18)
            a2("State was destroyed")
        end

        local v1 = a1.Changed:Connect(function(a1_3, a2) -- Line: 219 -- upvalues: u5 (upval), a1_2 (val), a1 (upval), u20 (val), u18 (val), u19 (ref)
            if a1_3 == u5 then
                a1_2(a2)
                a1.Maid:Unmark(u20)
                task.cancel(u18)
                u19:Disconnect()
            end
        end)
        a3(u20)
        a1.Maid:Mark(u20)
    end):expect())
end

function u15.Has(a1, a2) -- Line: 235 -- upvalues: Sanetize (val)
    return a1.Folder:GetAttribute((Sanetize(a2))) ~= nil
end

function u15.Set(a1, a2, a3) -- Line: 240 -- upvalues: VALUE_OBJECT_OVERRIDES (val), Sanetize (val), Serialize (val)
    if not VALUE_OBJECT_OVERRIDES[a2] then
        a1.Folder:SetAttribute(Sanetize(a2), (Serialize(a3)))
        return
    end
    local v1 = a1.Folder:FindFirstChild(a2)
    if v1 then
        v1.Value = a3
        return
    end
    v1 = Instance.new(VALUE_OBJECT_OVERRIDES[a2])
    v1.Name = a2
    v1.Value = a3
    v1.Parent = a1.Folder
    a1.Maid:Mark(v1)
end

function u15:Get(a2) -- Line: 259 -- upvalues: VALUE_OBJECT_OVERRIDES (val), Sanetize (val), Deserialize (val)
    if VALUE_OBJECT_OVERRIDES[a2] then
        return self.Folder:FindFirstChild(a2) and self.Folder:FindFirstChild(a2).Value
    end
    local v1 = Sanetize(a2)
    local v2 = self.State[v1]
    if v2 ~= nil then
        return v2
    end
    local Attribute = self.Folder:GetAttribute(v1)
    if Attribute == nil then
        return nil
    end
    v2 = Deserialize(Attribute)
    self.State[v1] = v2
    return v2
end

function u15.GetObject(a1, a2) -- Line: 280 -- upvalues: VALUE_OBJECT_OVERRIDES (val)
    if VALUE_OBJECT_OVERRIDES[a2] then
        return a1.Folder:FindFirstChild(a2) and a1.Folder:FindFirstChild(a2)
    end
end

function u15.RefreshValueObjects(a1, a2) -- Line: 286 -- upvalues: VALUE_OBJECT_OVERRIDES (val)
    local v1
    for k in pairs(VALUE_OBJECT_OVERRIDES) do
        v1 = a1.Folder:FindFirstChild(k)
        if v1 then
            a2[v1.Name] = v1.Value
        end
    end
end

function u15.Hook(a1, a2) -- Line: 300 -- upvalues: Sanetize (val), Deserialize (val), VALUE_OBJECT_OVERRIDES (val)
    local v1
    local v2 = next
    local Attributes, Attributes_2 = a1.Folder:GetAttributes()
    for k, v in v2, Attributes, Attributes_2 do
        v1 = Sanetize(k)
        a2[v1] = (Deserialize(v))
    end
    for k2, i in pairs(a1.Folder:GetChildren()) do
        if VALUE_OBJECT_OVERRIDES[i.Name] then
            a2[i.Name] = i.Value
        end
    end
    a1.Maid:Mark((a1.Folder.ChildAdded:Connect(function(a1) -- Line: 312 -- upvalues: VALUE_OBJECT_OVERRIDES (upval), a2 (val)
        if VALUE_OBJECT_OVERRIDES[a1.Name] then
            a2[a1.Name] = a1.Value
        end
    end)))
    a1.Maid:Mark((a1.Changed:Connect(function(a1, a2_2) -- Line: 318 -- upvalues: a2 (val)
        a2[a1] = a2_2
    end)))
end

function u15.GetStateChangedSignal(a1, a2) -- Line: 330 -- upvalues: Sanetize (val), Signal (val)
    local v1 = Sanetize(a2)
    if not a1.AttributeConnections[v1] then
        a1.AttributeConnections[v1] = (Signal.new())
        a1.Maid:Mark(a1.AttributeConnections[v1])
    end
    return a1.AttributeConnections[v1]
end

function u15._initializeState(a1) -- Line: 346 -- upvalues: Deserialize (val), VALUE_OBJECT_OVERRIDES (val)
    local v1 = a1
    for k, v in pairs(a1.Folder:GetAttributes()) do
        if v1.AttributeConnections[k] then
            v1.AttributeConnections[k]:Fire((Deserialize(v)))
        end
        v1.Changed:Fire(k, v)
    end
    for k2, i in pairs(v1.Folder:GetChildren()) do
        if VALUE_OBJECT_OVERRIDES[i.Name] then
            if v1.AttributeConnections[i.Name] then
                v1.AttributeConnections[i.Name]:Fire(i.Value)
            end
            v1.Changed:Fire(i.Name, i.Value)
        end
    end
end

function u15.GetAllStates(a1) -- Line: 366
    return a1.State
end

function u15:Destroy() -- Line: 370 -- upvalues: u48 (val)
    if self.Maid then
        debug.profilebegin("TagReplicator_Destroy")
        debug.profilebegin(self._lifecycleProfileLabel)
        self.Maid:Sweep()
        self.Maid = nil
        local _profileKind = self._profileKind
        local v1 = u48
        v1.Total = v1.Total + -1
        u48[_profileKind] = (u48[_profileKind] or 0) + -1
        if u48[_profileKind] <= 0 then
            u48[_profileKind] = nil
        end
        debug.profileend()
        debug.profileend()
    end
end

function u15.hook(a1, a2) -- Line: 417
    -- upvalues: u45 (val), u15 (val), u46 (val), u50 (val), u52 (val), CollectionService (val)
    if u45[a1] ~= nil then
        warn("TagReplicator.hook: tag already hooked: " .. a1)
        return
    end
    u45[a1] = {}
    local u6 = {}

    local function onTagAdded(a1_2) -- Line: 427
        -- upvalues: u6 (val), u15 (upval), u46 (upval), u50 (upval), a2 (val), u45 (upval), a1 (val), u52 (upval)
        if u6[a1_2] then
            return
        end
        local v1 = u15._new(a1_2)
        v1._tracked = true
        local v2 = {creating = true, removed = false}
        u6[a1_2] = v2
        u46[a1_2] = v1
        u50:Fire(v1)
        local v3 = a2(a1_2, v1)
        if v3 then
            if v3.Maid then
                v3.Maid:Mark(v1)
            end
            if u6[a1_2] ~= v2 or v2.removed then
                v3:Destroy()
            else
                u45[a1][a1_2] = v3
            end
        end
        if u6[a1_2] == v2 and not v2.removed then
            u6[a1_2] = true
            return
        end
        if u6[a1_2] ~= true or v2.removed then
            if u46[a1_2] == v1 then
                u52:Fire(v1)
                u46[a1_2] = nil
            end
            v1:Destroy()
        end
    end

    ;(CollectionService:GetInstanceAddedSignal(a1)):Connect(onTagAdded)
    ;(CollectionService:GetInstanceRemovedSignal(a1)):Connect(function(a1_2) -- Line: 469 -- upvalues: u6 (val), u46 (upval), u45 (upval), a1 (val), u52 (upval)
        local v1 = u6[a1_2]
        if typeof(v1) == "table" and v1.creating then
            v1.removed = true
            u6[a1_2] = nil
            return
        end
        u6[a1_2] = nil
        local v2 = u46[a1_2]
        if u45[a1][a1_2] then
            u45[a1][a1_2]:Destroy()
            local v3 = u45[a1]
            v3[a1_2] = nil
        elseif v2 then
            v2:Destroy()
        end
        if v2 then
            u52:Fire(v2)
            u46[a1_2] = nil
        end
    end)
    for i, j in CollectionService:GetTagged(a1) do
        task.defer(onTagAdded, j)
    end
end

function u15.getTrackedReplicator(a1) -- Line: 501 -- upvalues: u46 (val)
    local v1 = u46[a1]
    if v1 and v1.Maid ~= nil then
        return v1
    end
    return nil
end

function u15.watchTrackedReplicator(a1, a2, a3) -- Line: 506 -- upvalues: Maid (val), u46 (val), u50 (val), u52 (val)
    local u5 = Maid.new()
    local v1 = u46[a1]
    if v1 and v1.Maid ~= nil then
        task.defer(a2, v1)
    end
    u5:Mark((u50:Connect(function(a1_2) -- Line: 514 -- upvalues: a1 (val), a2 (val)
        if a1_2 and a1_2.Maid ~= nil and a1_2.Folder == a1 then
            a2(a1_2)
        end
    end)))
    if a3 then
        u5:Mark((u52:Connect(function(a1_2) -- Line: 521 -- upvalues: a1 (val), a3 (val)
            if a1_2 and a1_2.Folder == a1 then
                a3(a1_2)
            end
        end)))
    end
    return function() -- Line: 528 -- upvalues: u5 (val)
        u5:Sweep()
    end
end

function u15.getChangedReplicators(a1, a2, a3) -- Line: 533 -- upvalues: Maid (val), u50 (val), u52 (val)
    local u5 = Maid.new()
    u5:Mark((u50:Connect(function(a1_2) -- Line: 536 -- upvalues: a1 (val), a2 (val)
        if a1_2 and (a1_2:Get("Name")) == a1 then
            a2(a1_2)
        end
    end)))
    u5:Mark((u52:Connect(function(a1_2) -- Line: 542 -- upvalues: a1 (val), a3 (val)
        if a1_2 and (a1_2:Get("Name")) == a1 then
            a3(a1_2)
        end
    end)))
    return function() -- Line: 548 -- upvalues: u5 (val)
        u5:Sweep()
    end
end

function u15.acquireReplicatorEntityFromFolder(a1) -- Line: 553 -- upvalues: u46 (val), u47 (val), u15 (val)
    local v1 = u46[a1]
    if v1 and v1.Maid ~= nil then
        return v1, function() end
    end
    local u22 = u47[a1]
    if not u22 or not u22.replicator.Maid then
        u22 = {references = 0, replicator = u15._new(a1)}
        u22.replicator._transient = true
        u47[a1] = u22
    end
    u22.references = u22.references + 1
    local u29 = false
    return u22.replicator, function() -- Line: 573 -- upvalues: u29 (ref), u22 (ref), u47 (upval), a1 (val)
        if u29 then
            return
        end
        u29 = true
        local v1 = u22
        v1.references = v1.references - 1
        if u22.references <= 0 and u47[a1] == u22 then
            u47[a1] = nil
            u22.replicator:Destroy()
        end
    end
end

function u15.getReplicatorEntityFromFolder(a1) -- Line: 588 -- upvalues: u15 (val)
    return u15._new(a1)
end

function u15.getActiveCounts() -- Line: 592 -- upvalues: u48 (val)
    local v1 = {}
    for i, j in u48 do
        v1[i] = j
    end
    return v1
end

return u15