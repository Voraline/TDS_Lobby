-- Script path: ReplicatedStorage.Packages.Lyra.Store
-- Decompile time: 17.30 ms

local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local RunService = game:GetService("RunService")
local Constants = require(script.Parent.Constants)
local Files = require(script.Parent.Files)
local JsonPatch = require(script.Parent.JsonPatch)
local Locks = require(script.Parent.Locks)
local Session = require(script.Parent.Session)
local Log = require(script.Parent.Log)
local MockDataStoreService = require(script.Parent.MockDataStoreService)
local MockMemoryStoreService = require(script.Parent.MockMemoryStoreService)
local PromiseQueue = require(script.Parent.PromiseQueue)
local Transactions = require(script.Parent.Transactions)
local Promise = require(script.Parent.Promise)
local Tables = require(script.Parent.Tables)
require(script.Parent.Types)
local dataStoreRetry = require(script.Parent.dataStoreRetry)
local noYield = require(script.Parent.noYield)
local t = require(script.Parent.Parent.t)
local u141 = t.strictInterface({
    name = t.string,
    template = t.any,
    schema = t.callback,
    migrationSteps = t.optional(t.array(t.strictInterface({name = t.string, apply = t.callback}))),
    importLegacyData = t.optional(t.callback),
    dataStoreService = t.optional(t.any),
    memoryStoreService = t.optional(t.any),
    changedCallbacks = t.optional(t.array(t.callback)),
    logCallback = t.optional(t.callback),
    onLockLost = t.optional(t.callback),
    useDSSLocking = t.optional(t.boolean),
    useMock = t.optional(t.boolean),
})
local u142 = {}
u142.__index = u142

function u142:load(a2, a3) -- Line: 356
    -- upvalues: t (val), Promise (val), Session (val)
    assert((t.string(a2)))
    assert((t.optional(t.array(t.number))(a3)))
    local u26 = self._ctx.logger:extend({method = "load", key = a2})
    u26:log("trace", "attempting to load key")
    if self._closed then
        u26:log("warn", "attempted to load key while store is closed")
        return Promise.reject("Store is closed")
    end
    if self._sessions[a2] and not self._unloadPromises[a2] then
        u26:log("trace", "key is already loaded")
        return Promise.resolve()
    end
    if self._loadPromises[a2] then
        u26:log("trace", "key is currently being loaded")
        return Promise.reject("Load already in progress")
    end
    local v1 = ((Promise.try(function() -- Line: 384 -- upvalues: self (val), a2 (val), u26 (val)
        local v1 = self._unloadPromises[a2]
        if v1 then
            u26:log("trace", "waiting for unload to complete")
            v1:await()
        end
    end)):andThenCall(
        Session.load,
        {storeContext = self._ctx, key = a2, userIds = a3}
    )):andThen(function(a1) -- Line: 398 -- upvalues: self (val), u26 (val), a2 (val), Promise (upval)
        if self._closed then
            u26:log("warn", "store closed before key loaded, unloading immediately")
            local v1 = a2
            self._unloadPromises[v1] = ((a1:unload()):finally(function() -- Line: 403 -- upvalues: u26 (upval), self (upval), a2 (upval)
                u26:log("trace", "key unloaded after store closed during load")
                self._unloadPromises[a2] = nil
            end))
            return Promise.reject("Store closed before key loaded")
        end
        self._sessions[a2] = a1
        a1:startAutosaving()
        a1.lockHandle.onLockLost(function() -- Line: 417 -- upvalues: u26 (upval), self (upval), a2 (upval)
            u26:log("warn", "lock lost for key, removing session")
            if self._ctx.onLockLost then
                pcall(self._ctx.onLockLost, a2)
            end
            self._sessions[a2] = nil
        end)
        u26:log("debug", "key loaded successfully")
    end)
    self._loadPromises[a2] = v1
    ;(v1:finally(function() -- Line: 435 -- upvalues: self (val), a2 (val)
        self._loadPromises[a2] = nil
    end)):catch(function() end)
    return v1:finally(function(a1) -- Line: 447 -- upvalues: Promise (upval), u26 (val)
        if a1 ~= Promise.Status.Cancelled then
            return
        end
        u26:log("trace", "load was cancelled")
        return Promise.reject("Load was cancelled")
    end)
end

function u142.loadAsync(a1, a2, a3) -- Line: 465 -- types: a1: table, a2: string, a3: table?
    a1:load(a2, a3):expect()
end

function u142:unload(a2) -- Line: 480 -- upvalues: t (val), Promise (val) -- types: self: table, a2: string
    assert((t.string(a2)))
    local u13 = self._ctx.logger:extend({method = "unload", key = a2})
    u13:log("trace", "attempting to unload key")
    if self._closed then
        u13:log("warn", "attempted to unload key while store is closed")
        return Promise.reject("Store is closed")
    end
    if self._loadPromises[a2] then
        u13:log("trace", "key is being loaded, cancelling load instead of unloading")
        self._loadPromises[a2]:cancel()
        return Promise.resolve()
    end
    if self._unloadPromises[a2] then
        u13:log("trace", "key is already being unloaded")
        return self._unloadPromises[a2]
    end
    local v1 = self._sessions[a2]
    if not v1 then
        u13:log("warn", "key not loaded, nothing to unload")
        return Promise.resolve()
    end
    u13:log("trace", "unloading key")
    self._unloadPromises[a2] = ((v1:unload()):finally(function() -- Line: 515 -- upvalues: u13 (val), self (val), a2 (val)
        u13:log("trace", "key unload finished, cleaning up state")
        self._sessions[a2] = nil
        self._unloadPromises[a2] = nil
    end))
    return self._unloadPromises[a2] or Promise.resolve()
end

function u142.unloadAsync(a1, a2) -- Line: 534 -- types: a1: table, a2: string
    a1:unload(a2):expect()
end

function u142:_withSession(a2, a3) -- Line: 548
    -- upvalues: Promise (val)
    local u8 = self._ctx.logger:extend({method = "_withSession", key = a2})
    return Promise.new(function(a1, a2_2) -- Line: 551 -- upvalues: self (val), u8 (val), a2 (val), Promise (upval), a3 (val)
        local v1
        if self._closed then
            u8:log("warn", "attempted to use key while store is closed")
            return a2_2("Store is closed")
        end
        local v2 = self._loadPromises[a2]
        if v2 then
            local v3
            u8:log("trace", "key being loaded, waiting for load promise")
            v1, v3 = v2:await()
            if not v1 then
                if (v2:getStatus()) == Promise.Status.Cancelled then
                    u8:log("trace", "load was cancelled while waiting")
                    return a2_2("Load was cancelled")
                end
                u8:log("warn", "load failed while waiting")
                return a2_2(v3)
            end
        end
        if self._unloadPromises[a2] then
            u8:log("warn", "key is being unloaded")
        end
        v1 = self._sessions[a2]
        if not v1 then
            u8:log("warn", "key not loaded")
            return a2_2("Key not loaded")
        end
        a1(Promise.try(a3, v1))
    end)
end

function u142._getKeyInfo(a1, a2) -- Line: 601 -- types: a1: table, a2: string
    return a1:_withSession(a2, function(a1) -- Line: 602
        return a1.keyInfo
    end)
end

function u142:get(a2) -- Line: 619 -- upvalues: t (val) -- types: self: table, a2: string
    assert((t.string(a2)))
    return self:_withSession(a2, function(a1) -- Line: 622
        return a1:get()
    end)
end

function u142.getAsync(a1, a2) -- Line: 638 -- types: a1: table, a2: string
    return a1:get(a2):expect()
end

function u142:update(a2, a3) -- Line: 660 -- upvalues: t (val) -- types: self: table, a2: string, a3: function
    assert((t.string(a2)))
    assert((t.callback(a3)))
    return self:_withSession(a2, function(a1) -- Line: 665 -- upvalues: a3 (val)
        return a1:update(a3)
    end)
end

function u142.updateAsync(a1, a2, a3) -- Line: 683 -- types: a1: table, a2: string, a3: function
    return a1:update(a2, a3):expect()
end

function u142:updateImmutable(a2, a3) -- Line: 707 -- upvalues: t (val) -- types: self: table, a2: string, a3: function
    assert((t.string(a2)))
    assert((t.callback(a3)))
    return self:_withSession(a2, function(a1) -- Line: 712 -- upvalues: a3 (val)
        return a1:updateImmutable(a3)
    end)
end

function u142.updateImmutableAsync(a1, a2, a3) -- Line: 730 -- types: a1: table, a2: string, a3: function
    return a1:updateImmutable(a2, a3):expect()
end

local function txInternal(a1, a2, a3, a4) -- Line: 769
    -- upvalues: HttpService (val), Promise (val), Tables (val), PromiseQueue (val), noYield (val), JsonPatch (val)
    -- upvalues: dataStoreRetry (val)
    local v1
    local u8 = HttpService:GenerateGUID(false)
    local u14 = a1._ctx.logger:extend({method = "tx", keys = a2, txId = u8, immutable = a4})
    u14:log("trace", "starting transaction")
    if a1._closed then
        u14:log("warn", "attempted to start transaction while store is closed")
        return Promise.reject("Store is closed")
    end
    for i, j in a2 do
        v1 = a1._sessions[j]
        if not v1 then
            u14:log("error", (("key not loaded: %*"):format(j)))
            return Promise.reject((("Key not loaded: %*"):format(j)))
        end
        if v1.txLockPromise then
            u14:log("error", (("key is already locked by another transaction: %*"):format(j)))
            return Promise.reject((("Key is already locked by another transaction: %*"):format(j)))
        end
        if v1.closed then
            u14:log("error", (("key is closed: %*"):format(j)))
            return Promise.reject((("Key is closed: %*"):format(j)))
        end
    end
    local u40 = nil
    local u44 = Promise.new(function(a1) -- Line: 807 -- upvalues: u40 (ref)
        u40 = a1
    end)
    local v2 = Tables.map(a2, function(a1_2) -- Line: 812 -- upvalues: a1 (val)
        return a1._sessions[a1_2].queue
    end)

    local function withTxLock(a1_2) -- Line: 817
        -- upvalues: a2 (val), a1 (val), u44 (val), u14 (val), Promise (upval), u40 (ref)
        local v1
        for i, j in a2 do
            v1 = a1._sessions[j]
            v1.txLockPromise = u44
        end
        u14:log("trace", "set txLockPromise on Sessions")
        return (Promise.try(a1_2)):finally(function() -- Line: 827 -- upvalues: a2 (upval), a1 (upval), u44 (upval), u14 (upval), u40 (upval)
            local v1
            for i, j in a2 do
                v1 = a1._sessions[j]
                if v1 and v1.txLockPromise == u44 then
                    v1.txLockPromise = nil
                end
            end
            u14:log("trace", "cleared txLockPromise on Sessions")
            u40()
        end)
    end

    u14:log("trace", "acquiring PromiseQueue lock on keys")
    return (PromiseQueue.multiQueueAdd(v2, function() -- Line: 845
        -- upvalues: u14 (val), withTxLock (val), a2 (val), a1 (val), a4 (val), Tables (upval), noYield (upval)
        -- upvalues: a3 (val), Promise (upval), JsonPatch (upval), dataStoreRetry (upval), u8 (val)
        u14:log("trace", "acquired PromiseQueue lock on keys")
        return withTxLock(function() -- Line: 849
            -- upvalues: a2 (upval), a1 (upval), a4 (upval), Tables (upval), noYield (upval), a3 (upval), u14 (upval)
            -- upvalues: Promise (upval), JsonPatch (upval), dataStoreRetry (upval), u8 (upval)
            local u79, v1, v2, v3
            local u0 = {}
            for i, j in a2 do
                u0[j] = a1._sessions[j].data
            end
            if not a4 then
                u79 = Tables.copyDeep(u0)
            else
                table.freeze(u0)
                u79 = u0
            end
            local success, result = pcall(noYield, a3, u79)
            if not success then
                u14:log("error", "tx transformFunction failed", {error = result})
                return (Promise.reject((("Store:tx transformFunction failed: %*"):format(result))))
            end
            if a4 ~= false then
                v3 = true
                if typeof(result) ~= "table" then
                    v3 = result == false
                end
                assert(v3, "Immutable transaction transform function must return a table or false")
            else
                assert(typeof(result) == "boolean", "Mutable transaction transform function must return a boolean")
            end
            if result == false then
                u14:log("trace", "tx transformFunction returned false, aborting")
                return (Promise.resolve(false))
            end
            if a4 then
                u79 = result
            end
            Tables.freezeDeep(u79)
            local v4 = false
            for k in u0 do
                if u79[k] == nil then
                    v4 = true
                    break
                end
            end
            if not v4 then
                for n in u79 do
                    if u0[n] == nil then
                        v4 = true
                        break
                    end
                end
            end
            if v4 then
                u14:log("error", "keys changed in transaction")
                return (Promise.reject("Keys changed in transaction"))
            end
            for m, i5 in a2 do
                v1, v2 = a1._ctx.schema(u79[i5])
                if not v1 then
                    u14:log("error", (("schema validation for key %* failed: %*"):format(i5, v2)))
                    return (Promise.reject((("Store:tx schema validation failed for key '%*': %*"):format(i5, v2))))
                end
            end
            v3 = {}
            local v5 = nil
            for i6 in u0, nil, v5 do
                if not Tables.equalsDeep(u0[i6], u79[i6]) then
                    table.insert(v3, i6)
                end
            end
            if #v3 == 0 then
                u14:log("trace", "tx had no mutations, skipping update")
                return (Promise.resolve(true))
            end
            if #v3 ~= 1 then
                u14:log("trace", "tx changed multiple keys, beginning multi-key update")
                local u210 = {}
                for i7, i8 in u79 do
                    u210[i7] = (JsonPatch.createPatch(u0[i7], i8))
                end
                return (((((((dataStoreRetry(function() -- Line: 975 -- upvalues: a1 (upval), u8 (upval)
                    local v1 = u8
                    return a1._ctx.txStore:SetAsync(v1, false)
                end)):catch(function(a1) -- Line: 977 -- upvalues: u14 (upval), Promise (upval)
                    u14:log("error", "failed to prepare txId", {error = a1})
                    return Promise.reject("Failed to prepare tx")
                end)):andThen(function() -- Line: 983
                    -- upvalues: u14 (upval), Promise (upval), Tables (upval), a2 (upval), u8 (upval), u210 (val)
                    -- upvalues: u0 (val), a1 (upval)
                    u14:log("trace", "tx status prepared, writing records with TxInfo")
                    return Promise.all(Tables.map(a2, function(a1_2) -- Line: 986 -- upvalues: u8 (upval), u210 (upval), u0 (upval), a1 (upval)
                        local v1 = {txId = u8, txPatch = u210[a1_2], committedData = u0[a1_2]}
                        return a1._sessions[a1_2]:writeRecord(v1)
                    end))
                end)):andThen(function() -- Line: 1027 -- upvalues: u14 (upval), dataStoreRetry (upval), a1 (upval), u8 (upval)
                    u14:log("trace", "multi-key records written successfully, committing transaction by removing tx status")
                    return dataStoreRetry(function() -- Line: 1032 -- upvalues: a1 (upval), u8 (upval)
                        local v1 = u8
                        return a1._ctx.txStore:RemoveAsync(v1)
                    end)
                end)):catch(function(a1_2) -- Line: 997
                    -- upvalues: u14 (upval), Tables (upval), a2 (upval), u0 (val), a1 (upval), Promise (upval)
                    -- upvalues: dataStoreRetry (upval), u8 (upval)
                    u14:log("error", "multi-key update or tx commit failed, reverting", {error = a1_2})
                    local v1 = a2
                    local v2 = Tables.map(v1, function(a1_2) -- Line: 1001 -- upvalues: u0 (upval), a1 (upval)
                        local v1 = {committedData = u0[a1_2]}
                        return a1._sessions[a1_2]:writeRecord(v1)
                    end)
                    return ((Promise.all(v2)):andThen(function() -- Line: 1012 -- upvalues: u14 (upval), dataStoreRetry (upval), a1 (upval), u8 (upval)
                        u14:log("trace", "multi-key update reverted, cleaning up tx status")
                        return dataStoreRetry(function() -- Line: 1014 -- upvalues: a1 (upval), u8 (upval)
                            local v1 = u8
                            return a1._ctx.txStore:RemoveAsync(v1)
                        end)
                    end)):finally(function() -- Line: 1018 -- upvalues: u14 (upval), Promise (upval), a1_2 (val)
                        u14:log("trace", "tx status cleanup attempted after failure")
                        return Promise.reject(a1_2)
                    end)
                end)):andThen(function() -- Line: 1040
                    -- upvalues: u14 (upval), a2 (upval), a1 (upval), u79 (ref), a4 (upval), u0 (val), Tables (upval)
                    local v1, v2, v3
                    u14:log("debug", "transaction committed successfully")
                    local v4 = nil
                    local v5 = nil
                    for i, j in a2, v4, v5 do
                        v1 = a1._sessions[j]
                        if v1 then
                            v2 = u79[j]
                            if a4 == false then
                                v3 = u0[j]
                                v2 = Tables.reconcileDeep(v3, v2)
                            end
                            v1:mutateKey(v2)
                            v1.changeSet = {}
                        end
                    end
                    return true
                end)):finally(function() -- Line: 1063 -- upvalues: u14 (upval)
                    u14:log("trace", "tx finished")
                end))
            end
            u14:log("trace", (("tx only changed one key ('%*'), treating as Session:update"):format(v3[1])))
            local v6 = v3[1]
            local v7 = u79[v6]
            if a4 == false then
                v5 = u0[v6]
                v7 = Tables.reconcileDeep(v5, v7)
            end
            a1._sessions[v6]:mutateKey(v7)
            return (Promise.resolve(true))
        end)
    end))
end

function u142.tx(a1, a2, a3) -- Line: 1092
    -- upvalues: t (val), txInternal (val)
    assert((t.array(t.string)(a2)))
    assert((t.callback(a3)))
    return txInternal(a1, a2, a3, false)
end

function u142.txAsync(a1, a2, a3) -- Line: 1109 -- types: a1: table, a2: table, a3: function
    a1:tx(a2, a3):expect()
end

function u142.txImmutable(a1, a2, a3) -- Line: 1137
    -- upvalues: t (val), txInternal (val)
    assert((t.array(t.string)(a2)))
    assert((t.callback(a3)))
    return txInternal(a1, a2, a3, true)
end

function u142.txImmutableAsync(a1, a2, a3) -- Line: 1157 -- types: a1: table, a2: table, a3: function
    return a1:txImmutable(a2, a3):expect()
end

function u142:save(a2) -- Line: 1183 -- upvalues: t (val) -- types: self: table, a2: string
    assert((t.string(a2)))
    return self:_withSession(a2, function(a1) -- Line: 1186
        return a1:save()
    end)
end

function u142.saveAsync(a1, a2) -- Line: 1200 -- types: a1: table, a2: string
    a1:save(a2):expect()
end

function u142:close() -- Line: 1213 -- upvalues: Promise (val)
    local u6 = self._ctx.logger:extend({method = "close"})
    u6:log("trace", "closing store")
    for i, j in self._loadPromises do
        u6:log("trace", "cancelling in-progress load", {key = i})
        j:cancel()
    end
    local u22 = {}
    local v1 = {}
    for k, n in self._sessions do
        if not self._unloadPromises[k] then
            u6:log("trace", "unloading key", {key = k})
            table.insert(v1, ((self:unload(k)):catch(function(a1) -- Line: 1236 -- upvalues: u6 (val), k (val), u22 (val)
                u6:log("error", "error unloading key during close", {key = k, error = a1})
                table.insert(u22, {key = k, error = a1})
            end)))
        else
            u6:log("trace", "key already being unloaded", {key = k})
            table.insert(v1, self._unloadPromises[k])
        end
    end
    self._closed = true
    u6:log("trace", "store marked as closed")
    return (Promise.allSettled(v1)):andThen(function() -- Line: 1249 -- upvalues: u6 (val), u22 (val), Promise (upval)
        u6:log("debug", "store closed")
        if #u22 > 0 then
            return Promise.reject(u22)
        end
    end)
end

function u142.closeAsync(a1) -- Line: 1266
    a1:close():expect()
end

function u142.peek(a1, a2) -- Line: 1284
    -- upvalues: dataStoreRetry (val), Files (val), Transactions (val)
    return ((dataStoreRetry(function() -- Line: 1286 -- upvalues: a1 (val), a2 (val)
        return a1._ctx.recordStore:GetAsync(a2)
    end)):andThen(function(a1_2) -- Line: 1289 -- upvalues: a1 (val), Files (upval)
        if a1_2 == nil then
            return nil
        end
        assert(a1_2, "luau")
        local file = a1_2.file
        if file then
            return Files.read({store = a1._ctx.shardStore, file = file})
        end
        return nil
    end)):andThen(function(a1_2) -- Line: 1308 -- upvalues: a1 (val), Transactions (upval)
        if a1_2 == nil then
            return nil
        end
        assert(a1_2, "luau")
        return Transactions.readTx({store = a1._ctx.txStore, txInfo = a1_2})
    end)
end

function u142.peekAsync(a1, a2) -- Line: 1332 -- types: a1: table, a2: string
    return a1:peek(a2):expect()
end

function u142:probeLockActive(a2) -- Line: 1345 -- upvalues: Locks (val) -- types: self: table, a2: string
    return Locks.probeLockActive({storeContext = self._ctx, key = a2})
end

function u142.probeLockActiveAsync(a1, a2) -- Line: 1363 -- types: a1: table, a2: string
    return a1:probeLockActive(a2):expect()
end

function u142.listVersions(a1, a2) -- Line: 1376 -- upvalues: dataStoreRetry (val) -- types: a1: table, a2: table
    return dataStoreRetry(function() -- Line: 1378 -- upvalues: a1 (val), a2 (val)
        return a1._ctx.recordStore:ListVersionsAsync(a2.key, a2.sortDirection, a2.minDate, a2.maxDate, a2.pageSize)
    end)
end

function u142.listVersionsAsync(a1, a2) -- Line: 1399 -- types: a1: table, a2: table
    return a1:listVersions(a2):expect()
end

function u142.readVersion(a1, a2, a3) -- Line: 1414
    -- upvalues: dataStoreRetry (val), Promise (val), Files (val), Transactions (val)
    return ((dataStoreRetry(function() -- Line: 1416 -- upvalues: a1 (val), a2 (val), a3 (val)
        return a1._ctx.recordStore:GetVersionAsync(a2, a3)
    end)):andThen(function(a1_2, a2) -- Line: 1419 -- upvalues: Promise (upval), a1 (val), Files (upval) -- types: a2: userdata?
        if a1_2 and a2 then
            local v1 = {store = a1._ctx.recordStore, file = a1_2.file}
            return (Files.read(v1)):andThen(function(a1) -- Line: 1430 -- upvalues: a2 (val)
                return a1, a2
            end)
        end
        return Promise.reject("Record not found for the specified version")
    end)):andThen(function(a1_2, a2) -- Line: 1434 -- upvalues: a1 (val), Transactions (upval) -- types: a2: userdata
        local v1 = {store = a1._ctx.txStore, txInfo = a1_2}
        return (Transactions.readTx(v1)):andThen(function(a1) -- Line: 1440 -- upvalues: a2 (val)
            return a1, a2
        end)
    end)
end

function u142.readVersionAsync(a1, a2, a3) -- Line: 1458 -- types: a1: table, a2: string, a3: string
    return a1:readVersion(a2, a3):expect()
end

return {
    createStore = function(a1) -- Line: 219
        -- upvalues: u141 (val), Log (val), RunService (val), MockDataStoreService (val), DataStoreService (val)
        -- upvalues: MockMemoryStoreService (val), MemoryStoreService (val), Constants (val), u142 (val)
        assert((u141(a1)))
        local v1 = Log.createLogger(a1.logCallback or function() -- Line: 222
            return
        end, {lib = "lyra", store = a1.name})
        v1:log("debug", "creating store")
        local dataStoreService = a1.dataStoreService
        if dataStoreService == nil then
            if not a1.useMock then
                v1:log("trace", "using real DataStoreService")
                dataStoreService = DataStoreService
            else
                assert(RunService:IsStudio(), "useMock can only be true in Studio")
                v1:log("info", "using mock DataStoreService")
                dataStoreService = MockDataStoreService.new()
            end
        end
        assert(dataStoreService, "luau")
        local memoryStoreService = a1.memoryStoreService
        if memoryStoreService == nil then
            if not a1.useMock then
                v1:log("trace", "using real MemoryStoreService")
                memoryStoreService = MemoryStoreService
            else
                assert(RunService:IsStudio(), "useMock can only be true in Studio")
                v1:log("info", "using mock MemoryStoreService")
                memoryStoreService = MockMemoryStoreService.new()
            end
        end
        assert(memoryStoreService, "luau")
        local migrationSteps = a1.migrationSteps or {}
        local v2 = {
            name = a1.name,
            template = a1.template,
            schema = a1.schema,
            migrationSteps = migrationSteps,
            importLegacyData = a1.importLegacyData,
            dataStoreService = dataStoreService,
            memoryStoreService = memoryStoreService,
        }
        local changedCallbacks = a1.changedCallbacks or {}
        v2.changedCallbacks = changedCallbacks
        v2.logger = v1
        v2.onLockLost = a1.onLockLost
        v2.useDSSLocking = a1.useDSSLocking == true
        v2.recordStore = dataStoreService:GetDataStore((("%*/%*"):format(Constants.RECORD_SCOPE, a1.name)))
        v2.shardStore = dataStoreService:GetDataStore((("%*/%*"):format(Constants.SHARD_SCOPE, a1.name)))
        v2.txStore = dataStoreService:GetDataStore((("%*/%*"):format(Constants.TX_SCOPE, a1.name)))
        local DataStore = if not a1.useDSSLocking then memoryStoreService:GetHashMap((("%*/%*"):format(Constants.LOCK_SCOPE, a1.name))) else dataStoreService:GetDataStore((("%*/%*"):format(Constants.LOCK_SCOPE, a1.name)))
        v2.lockHashMap = DataStore
        local v3, v4 = v2.schema(v2.template)
        if not v3 then
            error((("Failed to validate template for store '%*': %*"):format(a1.name, v4)))
        end
        local v5 = {
            _closed = false,
            _ctx = v2,
            _sessions = {},
            _loadPromises = {},
            _unloadPromises = {},
        }
        local v6 = setmetatable(v5, u142)
        v1:log("trace", "created store")
        return v6
    end,
}