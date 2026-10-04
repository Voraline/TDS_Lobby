-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.StatusEffectRenderer
-- Decompile time: 5.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
require(ReplicatedStorage.Shared.Types.StatusEffects)
local u25 = {}
u25.__index = u25
local u26 = {}
local u27 = {Stunned = "Stun"}

local function getVisuals(a1) -- Line: 38 -- upvalues: u26 (val), u27 (val) -- types: a1: string
    if u26[a1] ~= nil then
        return u26[a1]
    end
    local Visuals = script.Parent:FindFirstChild("Visuals")
    if Visuals then
        local v1
        local v2 = {a1}
        local v3 = u27[a1]
        if v3 then
            table.insert(v2, v3)
        end
        for i, j in v2 do
            v1 = Visuals:FindFirstChild((("%*Visuals"):format(j)))
            if v1 then
                u26[a1] = (require(v1))
                return u26[a1]
            end
        end
    end
    u26[a1] = nil
    return nil
end

function u25.new(a1, a2, a3) -- Line: 64
    -- upvalues: u25 (val), Maid (val), TagReplicator (val), Signal (val), getVisuals (val)
    local u6 = setmetatable({}, u25)
    u6._entity = a1
    u6._activeEffects = {}
    u6._cleanupData = {}
    u6._maid = Maid.new()
    u6._replicator = a3 or TagReplicator.getReplicatorEntityFromFolder(a2)
    if not a3 then
        u6._maid:Mark(u6._replicator)
    end
    u6.Changed = Signal.new()
    u6._maid:Mark(u6.Changed)

    local function onChanged(a1, a2) -- Line: 79 -- upvalues: u6 (val), getVisuals (upval) -- types: a1: string
        local v1
        if not a2 then
            local v2 = u6._activeEffects[a1]
            if v2 then
                v1 = getVisuals(a1)
                if v1 and v1.onRemoved then
                    v1.onRemoved(u6._entity, v2, u6._cleanupData[a1])
                end
                u6._activeEffects[a1] = nil
                u6._cleanupData[a1] = nil
            end
        elseif not u6._activeEffects[a1] then
            u6._activeEffects[a1] = a2
            v1 = getVisuals(a1)
            if v1 and v1.onAdded then
                u6._cleanupData[a1] = (v1.onAdded(u6._entity, a2))
            end
        else
            u6._activeEffects[a1] = a2
            v1 = getVisuals(a1)
            if v1 and v1.onUpdated then
                v1.onUpdated(u6._entity, a2, u6._cleanupData[a1])
            end
        end
        u6.Changed:Fire(a1, a2 ~= nil)
    end

    u6._maid:Mark((u6._replicator.Changed:Connect(onChanged)))
    for i, j in u6._replicator:GetAllStates() do
        task.spawn(onChanged, i, j)
    end
    return u6
end

function u25.has(a1, a2) -- Line: 118 -- types: a2: string
    return a1._activeEffects[a2] ~= nil
end

function u25.hasAnyWithTag(a1, a2) -- Line: 122 -- types: a2: string
    local v1 = nil
    local v2 = nil
    for i, j in a1._activeEffects, v1, v2 do
        for k, n in j.tags or {} do
            if n == v3 then
                return true
            end
        end
    end
    return false
end

function u25.get(a1, a2) -- Line: 134 -- types: a2: string
    return a1._activeEffects[a2]
end

function u25.destroy(a1) -- Line: 138 -- upvalues: getVisuals (val)
    local v1
    for i, j in a1._activeEffects do
        v1 = getVisuals(i)
        if v1 and v1.onRemoved then
            v1.onRemoved(a1._entity, j, a1._cleanupData[i])
        end
    end
    table.clear(a1._activeEffects)
    table.clear(a1._cleanupData)
    a1._maid:Sweep()
    setmetatable(a1, nil)
end

return u25