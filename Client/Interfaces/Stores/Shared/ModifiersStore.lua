-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.ModifiersStore
-- Decompile time: 2.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({})
local v1 = {getState = u18}

local function valuesEqual(a1, a2) -- Line: 36 -- upvalues: table (val)
    if a1 == a2 then
        return true
    end
    if typeof(a1) == "table" and typeof(a2) == "table" then
        return table.deepCompare(a1, a2)
    end
    return false
end

function v1.add(a1) -- Line: 48 -- upvalues: table (val), u18 (val), u19 (val) -- types: a1: table
    local v1
    local v2 = table.deepClone(u18())
    local v3 = #v2
    for i = 1, v3 do
        if v2[i].Name == a1.Name then
            v1 = v2[i]
            if if v1 ~= a1 then if typeof(v1) ~= "table" then false else if typeof(a1) ~= "table" then false else table.deepCompare(v1, a1) else true then
                return
            end
            v2[i] = a1
            u19(v2)
            return
        end
    end
    table.insert(v2, a1)
    u19(v2)
end

function v1.update(a1, a2) -- Line: 67 -- upvalues: table (val), u18 (val), u19 (val) -- types: a1: string, a2: table
    local v1
    local v2 = table.deepClone(u18())
    local v3 = #v2
    for i = 1, v3 do
        if v2[i].Name == a1 then
            v1 = false
            for k, v in pairs(a2) do
                if v2[i][k] ~= v then
                    v2[i][k] = v
                    v1 = true
                end
            end
            if not v1 then
                return
            end
            u19(v2)
            return
        end
    end
end

function v1.remove(a1) -- Line: 93 -- upvalues: table (val), u18 (val), u19 (val) -- types: a1: table
    local v1 = table.deepClone(u18())
    for i = #v1, 1, -1 do
        if v1[i].Name == a1.Name then
            table.remove(v1, i)
            u19(v1)
            return
        end
    end
end

return v1