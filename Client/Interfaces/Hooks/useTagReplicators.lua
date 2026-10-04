-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators
-- Decompile time: 4.11 ms

local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect

local function updateValues(a1, a2, a3) -- Line: 11
    -- upvalues: table (val), TagReplicator (val)
    if a2[a3] then
        return a1, a2
    end
    local v1 = table.clone(a1)
    local v2, v3 = TagReplicator.acquireReplicatorEntityFromFolder(a3)
    a2[a3] = {replicator = v2, release = v3}
    table.insert(v1, v2)
    return v1, a2
end

local function removeValue(a1, a2, a3) -- Line: 28 -- upvalues: table (val) -- types: a1: table, a2: table, a3: userdata
    if not a2[a3] then
        return
    end
    local v1 = table.clone(a1)
    local v2 = a2[a3]
    local replicator = v2.replicator
    a2[a3] = nil
    for k, v in pairs(v1) do
        if v == replicator then
            table.remove(v1, k)
            break
        end
    end
    v2.release()
    return v1
end

return function(a1) -- Line: 51
    -- upvalues: useState (val), useEffect (val), CollectionService (val), updateValues (val), removeValue (val)
    local v1, u4 = useState({})
    local v2 = {a1}
    useEffect(function() -- Line: 54
        -- upvalues: CollectionService (upval), a1 (val), updateValues (upval), u4 (val), removeValue (upval)
        local u0 = {}
        local u49 = {}
        local u10 = (CollectionService:GetInstanceAddedSignal(a1)):Connect(function(a1) -- Line: 58 -- upvalues: u49 (ref), updateValues (upval), u0 (val), u4 (upval)
            u49 = updateValues(u49, u0, a1)
            u4(u49)
        end)
        local u19 = (CollectionService:GetInstanceRemovedSignal(a1)):Connect(function(a1) -- Line: 64 -- upvalues: u49 (ref), removeValue (upval), u0 (val), u4 (upval)
            u49 = removeValue(u49, u0, a1)
            u4(u49)
        end)
        for k, v in pairs(CollectionService:GetTagged(a1)) do
            u49 = updateValues(u49, u0, v)
        end
        u4(u49)
        return function() -- Line: 75 -- upvalues: u10 (val), u19 (val), u0 (val), u49 (ref), removeValue (upval)
            u10:Disconnect()
            u19:Disconnect()
            local v1 = {}
            for i in u0 do
                v1[#v1 + 1] = i
            end
            local v2 = nil
            local v3 = nil
            for j, k in v1, v2, v3 do
                u49 = removeValue(u49, u0, k) or u49
            end
        end
    end, v2)
    return v1
end