-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.TowerPreviewPanel.Stats
-- Decompile time: 1.74 ms

local deepAssign
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local u11 = {
    {key = "Price", icon = "Cash"},
    {key = "Limit", icon = "Limit"},
    {key = "Damage", icon = "Damage"},
    {key = "Cooldown", icon = "Cooldown"},
    {key = "Range", icon = "Range"},
    {key = "SpawnTime", icon = "SpawnTime"},
}

function deepAssign(a1, a2) -- Line: 45 -- upvalues: deepAssign (val) -- types: a1: table, a2: table
    local v1
    local v2 = nil
    local v3 = nil
    local v4 = a1
    for i, j in a2, v2, v3 do
        if type(j) ~= "table" then
            v4[i] = j
        else
            v1 = v4[i]
            if type(v1) ~= "table" then
                v4[i] = {}
            end
            deepAssign(v1, j)
        end
    end
end

local function resolveStats(a1, a2, a3) -- Line: 61 -- upvalues: deepAssign (val) -- types: a2: number, a3: number?
    local v1 = {}
    if type(a1) == "table" and type(a1.Defaults) == "table" then
        local v2
        deepAssign(v1, a1.Defaults)
        local Upgrades = a1.Upgrades
        if type(Upgrades) ~= "table" then
            return v1
        end
        for i = 1, (math.max(0, (math.floor(a2)))) do
            v2 = Upgrades[i]
            if type(v2) ~= "table" then
                break
            end
            if type(v2[1]) == "table" then
                v2 = v2[a3 or 1]
            end
            if type(v2) ~= "table" then
                break
            end
            if type(v2.Stats) == "table" then
                deepAssign(v1, v2.Stats)
            end
        end
        return v1
    end
    return v1
end

return {
    createDisplayStats = function(a1, a2, a3) -- Line: 96
        -- upvalues: resolveStats (val), u11 (val), Icons (val)
        local v1, v2
        local v3 = {}
        local v4 = resolveStats(a1, a2, a3)
        for i, j in u11 do
            v1 = v4[j.key]
            v2 = Icons[j.icon]
            if type(v1) == "number" and v1 ~= 0 and type(v2) == "string" then
                table.insert(v3, {title = tostring(v1), image = v2})
            end
        end
        return v3
    end,
    resolveStats = resolveStats,
}