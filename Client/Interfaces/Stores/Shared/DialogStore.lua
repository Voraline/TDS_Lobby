-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.DialogStore
-- Decompile time: 1.47 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u23, u24 = Charm.signal({})
local u25 = {getState = u23}

function u25.getCurrent() -- Line: 50 -- upvalues: u23 (val)
    return u23()[1]
end

function u25.add(a1, a2) -- Line: 54
    -- upvalues: table (val), HttpService (val), u23 (val), u24 (val)
    local v1 = table.clone(a1)
    local id = v1.id or HttpService:GenerateGUID(false)
    v1.id = id
    v1.skipLast = nil
    local v2 = table.clone(u23())
    if a1.skipLast then
        table.remove(v2, 1)
    end
    if not a2 then
        table.insert(v2, v1)
    else
        table.insert(v2, 1, v1)
    end
    u24(v2)
    return v1.id
end

function u25.remove(a1) -- Line: 74 -- upvalues: u23 (val), table (val), u24 (val) -- types: a1: string?
    if not a1 then
        return
    end
    local v1 = u23()
    local v2 = nil
    for i, j in v1 do
        if j.id == a1 then
            table.remove(table.clone(v1), i)
            break
        end
    end
    if v2 then
        u24(v2)
    end
end

function u25.clear() -- Line: 95 -- upvalues: u23 (val), u24 (val)
    if #u23() == 0 then
        return
    end
    u24({})
end

function u25.clearDisabled() -- Line: 103 -- upvalues: u23 (val), table (val), u24 (val)
    local v1 = {}
    for i, j in u23() do
        if j.OverrideSetting == true then
            table.insert(v1, j)
        end
    end
    u24(v1)
end

function u25.skip(a1) -- Line: 115 -- upvalues: u23 (val), u25 (val), table (val), u24 (val) -- types: a1: boolean?
    local v1 = u23()
    if a1 then
        u25.clear()
        return
    end
    if #v1 > 0 then
        local v2 = table.clone(v1)
        table.remove(v2, 1)
        u24(v2)
    end
end

return u25