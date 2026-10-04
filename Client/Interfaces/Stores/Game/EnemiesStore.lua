-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.EnemiesStore
-- Decompile time: 4.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({})
local v1 = {getState = u18}

local function getEnemy(a1, a2) -- Line: 35 -- types: a1: table
    for i, v in ipairs(a1) do
        if v.id == a2 then
            return v, i
        end
    end
end

function v1.addEnemy(a1) -- Line: 43 -- upvalues: table (val), u18 (val), u19 (val)
    assert(a1.id, "Enemy ID is nil")
    local v1 = table.deepClone(u18())
    table.insert(v1, {
        visible = true,
        id = a1.id,
        name = a1.name,
        displayName = a1.displayName,
        shield = a1.shield,
        health = a1.health,
        maxHealth = a1.maxHealth,
        team = a1.team,
        compact = a1.compact == true,
        phase = a1.phase,
    })
    u19(v1)
end

function v1.setVisibility(a1, a2) -- Line: 63 -- upvalues: table (val), u18 (val), u19 (val) -- types: a2: boolean
    local v1
    local v2 = table.deepClone(u18())
    for i, v in ipairs(v2) do
        if v.id == a1 then
            if not v then
                return
            end
            v1.visible = a2
            u19(v2)
            return
        end
    end
    if true then
        return
    end
    v1.visible = a2
    u19(v2)
end

function v1.removeEnemy(a1) -- Line: 74 -- upvalues: u18 (val), table (val), u19 (val)
    local v1, v2
    local v3 = u18()
    for i, v in ipairs(v3) do
        if v.id == a1 then
            if not i then
                return
            end
            v2 = table.deepClone(v3)
            table.remove(v2, v1)
            u19(v2)
            return
        end
    end
    if true then
        return
    end
    v2 = table.deepClone(v3)
    table.remove(v2, v1)
    u19(v2)
end

function v1.updateEnemy(a1) -- Line: 86 -- upvalues: table (val), u18 (val), u19 (val) -- types: a1: table
    local health, maxHealth, shield, v1
    local v2 = table.deepClone(u18())
    local id = a1.id
    for i, v in ipairs(v2) do
        if v.id == id then
            if not v then
                return
            end
            health = a1.health or v1.health
            v1.health = health
            maxHealth = a1.maxHealth or v1.maxHealth
            v1.maxHealth = maxHealth
            shield = a1.shield or v1.shield
            v1.shield = shield
            v1.phase = a1.phase or 1
            u19(v2)
            return
        end
    end
    if true then
        return
    end
    health = a1.health or v1.health
    v1.health = health
    maxHealth = a1.maxHealth or v1.maxHealth
    v1.maxHealth = maxHealth
    shield = a1.shield or v1.shield
    v1.shield = shield
    v1.phase = a1.phase or 1
    u19(v2)
end

return v1