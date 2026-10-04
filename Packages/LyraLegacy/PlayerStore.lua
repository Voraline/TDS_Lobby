-- Script path: ReplicatedStorage.Packages.LyraLegacy.PlayerStore
-- Decompile time: 3.33 ms

local Players = game:GetService("Players")
require(script.Parent.Log)
local Promise = require(script.Parent.Promise)
local Store = require(script.Parent.Store)
require(script.Parent.Types)

local function getUserIdKey(a1) -- Line: 128 -- types: a1: userdata
    return (tostring(a1.UserId))
end

local u26 = {}
u26.__index = u26

function u26._kickPlayer(a1, a2, a3) -- Line: 193 -- upvalues: Players (val) -- types: a1: table, a3: string
    if typeof(a2) ~= "string" then
        a2:Kick(a3)
        return
    end
    local PlayerByUserId = Players:GetPlayerByUserId((tonumber(a2)))
    if PlayerByUserId ~= nil then
        PlayerByUserId:Kick(a3)
    end
end

function u26:get(a2) -- Line: 218 -- types: self: table, a2: userdata
    return self._store:get((tostring(a2.UserId)))
end

function u26.getAsync(a1, a2) -- Line: 229 -- types: a1: table, a2: userdata
    return a1:get(a2):expect()
end

function u26:load(a2) -- Line: 251 -- upvalues: Promise (val) -- types: self: table, a2: userdata
    return (self._store:load(tostring(a2.UserId), {a2.UserId})):catch(function(a1) -- Line: 253 -- upvalues: self (val), a2 (val), Promise (upval)
        self:_kickPlayer(a2, "DataStore load failed, please rejoin the game.")
        return Promise.reject(a1)
    end)
end

function u26.loadAsync(a1, a2) -- Line: 265 -- types: a1: table, a2: userdata
    return a1:load(a2):expect()
end

function u26:unload(a2) -- Line: 282 -- types: self: table, a2: userdata
    return self._store:unload((tostring(a2.UserId)))
end

function u26.unloadAsync(a1, a2) -- Line: 293 -- types: a1: table, a2: userdata
    return a1:unload(a2):expect()
end

function u26:update(a2, a3) -- Line: 317 -- types: self: table, a2: userdata, a3: function
    return self._store:update(tostring(a2.UserId), a3)
end

function u26.updateAsync(a1, a2, a3) -- Line: 328 -- types: a1: table, a2: userdata, a3: function
    return a1:update(a2, a3):expect()
end

function u26:updateImmutable(a2, a3) -- Line: 351 -- types: self: table, a2: userdata, a3: function
    return self._store:updateImmutable(tostring(a2.UserId), a3)
end

function u26.updateImmutableAsync(a1, a2, a3) -- Line: 365 -- types: a1: table, a2: userdata, a3: function
    return a1:updateImmutable(a2, a3):expect()
end

function u26:tx(a2, a3) -- Line: 391 -- types: self: table, a2: table, a3: function
    local v1
    local v2 = table.create(#a2)
    local u6 = {}
    for i, j in a2 do
        v1 = tostring(j.UserId)
        v2[i] = v1
        u6[v1] = j
    end
    return self._store:tx(v2, function(a1) -- Line: 403 -- upvalues: u6 (val), a3 (val) -- types: a1: table
        local UserId
        local v1 = {}
        for i, j in a1 do
            v1[u6[i]] = j
        end
        local v2 = a3(v1)
        if v2 == false then
            return false
        end
        for k in a1 do
            a1[k] = nil
        end
        for n, m in v1 do
            UserId = n.UserId
            a1[tostring(UserId)] = m
        end
        return v2
    end)
end

function u26.txAsync(a1, a2, a3) -- Line: 436 -- types: a1: table, a2: table, a3: function
    return a1:tx(a2, a3):expect()
end

function u26:txImmutable(a2, a3) -- Line: 463 -- types: self: table, a2: table, a3: function
    local v1
    local v2 = table.create(#a2)
    local u6 = {}
    for i, j in a2 do
        v1 = tostring(j.UserId)
        v2[i] = v1
        u6[v1] = j
    end
    return self._store:txImmutable(v2, function(a1) -- Line: 475 -- upvalues: u6 (val), a3 (val) -- types: a1: table
        local UserId
        local v1 = {}
        for i, j in a1 do
            v1[u6[i]] = j
        end
        local v2 = a3(v1)
        if v2 == false then
            return false
        end
        for k in a1 do
            a1[k] = nil
        end
        for n, m in v2 do
            UserId = n.UserId
            a1[tostring(UserId)] = m
        end
        return a1
    end)
end

function u26.txImmutableAsync(a1, a2, a3) -- Line: 508 -- types: a1: table, a2: table, a3: function
    return a1:txImmutable(a2, a3):expect()
end

function u26:save(a2) -- Line: 527 -- types: self: table, a2: userdata
    return self._store:save((tostring(a2.UserId)))
end

function u26.saveAsync(a1, a2) -- Line: 538 -- types: a1: table, a2: userdata
    return a1:save(a2):expect()
end

function u26:close() -- Line: 549
    return self._store:close()
end

function u26.closeAsync(a1) -- Line: 559
    return a1:close():expect()
end

function u26:peek(a2) -- Line: 575 -- types: self: table, a2: number
    return self._store:peek((tostring(a2)))
end

function u26.peekAsync(a1, a2) -- Line: 586 -- types: a1: table, a2: number
    return a1:peek(a2):expect()
end

return {
    createPlayerStore = function(a1) -- Line: 164 -- upvalues: Store (val), u26 (val) -- types: a1: table
        local u1 = nil
        local v1 = {
            _store = Store.createStore({
                name = a1.name,
                template = a1.template,
                schema = a1.schema,
                migrationSteps = a1.migrationSteps,
                importLegacyData = a1.importLegacyData,
                changedCallbacks = a1.changedCallbacks,
                logCallback = a1.logCallback,
                onLockLost = function(a1) -- Line: 175 -- upvalues: u1 (ref) -- types: a1: string
                    u1:_kickPlayer(a1, "DataStore lock lost, please rejoin the game.")
                end,
                memoryStoreService = a1.memoryStoreService,
                dataStoreService = a1.dataStoreService,
            }),
        }
        u1 = (setmetatable(v1, u26))
        return u1
    end,
}