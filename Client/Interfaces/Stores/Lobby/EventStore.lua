-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Lobby.EventStore
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u19, u20 = Charm.signal({
    title = "",
    description = "",
    thumbnail = "",
    smallDescription = "",
    objective = "",
    rewards = {},
})
local v1 = {getState = u19}

local function setField(a1, a2) -- Line: 25 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: string
    local v1 = u19()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u20(v2)
end

function v1.setRewards(a1) -- Line: 36 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: table
    local v1 = u19()
    if table.deepCompare(v1.rewards, a1) then
        return
    end
    local v2 = table.clone(v1)
    v2.rewards = table.deepClone(a1)
    u20(v2)
end

function v1.setTitle(a1) -- Line: 47 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: string
    local v1 = u19()
    if v1.title == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.title = a1
    u20(v2)
end

function v1.setDescription(a1) -- Line: 51 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: string
    local v1 = u19()
    if v1.description == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.description = a1
    u20(v2)
end

function v1.setThumbnail(a1) -- Line: 55 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: string
    local v1 = u19()
    if v1.thumbnail == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.thumbnail = a1
    u20(v2)
end

function v1.setSmallDescription(a1) -- Line: 59 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: string
    local v1 = u19()
    if v1.smallDescription == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.smallDescription = a1
    u20(v2)
end

function v1.setObjective(a1) -- Line: 63 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: string
    local v1 = u19()
    if v1.objective == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.objective = a1
    u20(v2)
end

return v1