-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityAmmoStore
-- Decompile time: 7.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({})
local v1 = {getState = u12}

local function isEqual(a1, a2) -- Line: 31 -- types: a1: table?, a2: table
    local v1 = a1
    if v1 then
        v1 = false
        if a1.ammo == a2.ammo then
            v1 = false
            if a1.maxAmmo == a2.maxAmmo then
                v1 = false
                if a1.interval == a2.interval then
                    v1 = false
                    if a1.startTick == a2.startTick then
                        v1 = a1.syncPoint == a2.syncPoint
                    end
                end
            end
        end
    end
    return v1
end

local function hasTowerSuffix(a1, a2) -- Line: 40 -- types: a1: string, a2: string
    return string.sub(a1, -#a2) == a2
end

local function toAmmoState(a1) -- Line: 44 -- types: a1: table
    return {
        ammo = a1.Ammo,
        maxAmmo = a1.MaxAmmo,
        interval = a1.Interval,
        startTick = a1.StartTick,
        syncPoint = a1.SyncPoint,
    }
end

function v1.update(a1, a2) -- Line: 54 -- upvalues: u12 (val), u13 (val) -- types: a1: string, a2: table
    local v1 = u12()
    local v2 = v1[a1]
    local v3 = v2
    if v3 then
        v3 = false
        if v2.ammo == a2.ammo then
            v3 = false
            if v2.maxAmmo == a2.maxAmmo then
                v3 = false
                if v2.interval == a2.interval then
                    v3 = false
                    if v2.startTick == a2.startTick then
                        v3 = v2.syncPoint == a2.syncPoint
                    end
                end
            end
        end
    end
    if v3 then
        return
    end
    v3 = table.clone(v1)
    v3[a1] = a2
    u13(v3)
end

function v1.bulkUpdate(a1) -- Line: 65 -- upvalues: u12 (val), u13 (val) -- types: a1: table
    local payload, v1, v2
    local v3 = u12()
    local v4 = v3
    local v5 = nil
    local v6 = nil
    for i, j in a1, v5, v6 do
        v2 = v3[j.id]
        payload = j.payload
        v1 = v2
        if v1 then
            v1 = false
            if v2.ammo == payload.ammo then
                v1 = false
                if v2.maxAmmo == payload.maxAmmo then
                    v1 = false
                    if v2.interval == payload.interval then
                        v1 = false
                        if v2.startTick == payload.startTick then
                            v1 = v2.syncPoint == payload.syncPoint
                        end
                    end
                end
            end
        end
        if not v1 then
            if v4 == v3 then
                v4 = table.clone(v3)
            end
            v4[j.id] = j.payload
        end
    end
    if v4 ~= v3 then
        u13(v4)
    end
end

function v1.remove(a1) -- Line: 86 -- upvalues: u12 (val), u13 (val) -- types: a1: string
    local v1 = u12()
    if v1[a1] == nil then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = nil
    u13(v2)
end

function v1.removeTower(a1) -- Line: 97 -- upvalues: u12 (val), u13 (val)
    local v1
    local v2 = u12()
    local v3 = tostring(a1)
    local v4 = v2
    local v5 = nil
    local v6 = nil
    for i in v2, v5, v6 do
        v1 = -#v3
        if string.sub(i, v1) == v3 then
            if v4 == v2 then
                v4 = table.clone(v2)
            end
            v4[i] = nil
        end
    end
    if v4 ~= v2 then
        u13(v4)
    end
end

function v1.setTower(a1, a2) -- Line: 119 -- upvalues: u12 (val), u13 (val) -- types: a2: table?
    local v1, v2, v3, v4
    local v5 = u12()
    local v6 = tostring(a1)
    local v7 = v5
    local v8 = {}
    local v9 = nil
    local v10 = nil
    for i, j in a2 or {}, v9, v10 do
        v1 = i .. v6
        v2 = {
            ammo = j.Ammo,
            maxAmmo = j.MaxAmmo,
            interval = j.Interval,
            startTick = j.StartTick,
            syncPoint = j.SyncPoint,
        }
        v8[v1] = true
        v4 = v5[v1]
        v3 = v4
        if v3 then
            v3 = false
            if v4.ammo == v2.ammo then
                v3 = false
                if v4.maxAmmo == v2.maxAmmo then
                    v3 = false
                    if v4.interval == v2.interval then
                        v3 = false
                        if v4.startTick == v2.startTick then
                            v3 = v4.syncPoint == v2.syncPoint
                        end
                    end
                end
            end
        end
        if not v3 then
            if v7 == v5 then
                v7 = table.clone(v5)
            end
            v7[v1] = v2
        end
    end
    v9 = nil
    v10 = nil
    for k in v5, v9, v10 do
        v4 = -#v6
        if string.sub(k, v4) == v6 and not v8[k] then
            if v7 == v5 then
                v7 = table.clone(v5)
            end
            v7[k] = nil
        end
    end
    if v7 ~= v5 then
        u13(v7)
    end
end

return v1