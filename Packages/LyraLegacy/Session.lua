-- Script path: ReplicatedStorage.Packages.LyraLegacy.Session
-- Decompile time: 12.87 ms

local HttpService = game:GetService("HttpService")
local Constants = require(script.Parent.Constants)
local Files = require(script.Parent.Files)
local Locks = require(script.Parent.Locks)
require(script.Parent.Log)
local Migrations = require(script.Parent.Migrations)
local PromiseQueue = require(script.Parent.PromiseQueue)
local Promise = require(script.Parent.Promise)
local Tables = require(script.Parent.Tables)
local t = require(script.Parent.Parent.t)
require(script.Parent.Types)
local Transactions = require(script.Parent.Transactions)
local dataStoreRetry = require(script.Parent.dataStoreRetry)
local noYield = require(script.Parent.noYield)
local u80 = t.strictInterface({
    key = t.string,
    storeContext = t.any,
    userIds = t.optional(t.array(t.number)),
})

local function load(a1) -- Line: 228
    -- upvalues: Migrations (val), dataStoreRetry (val), Files (val), HttpService (val), Transactions (val)
    -- upvalues: Promise (val), Tables (val)
    local storeContext = a1.storeContext
    local key = a1.key
    local u8 = storeContext.logger:extend({method = "load", key = a1.key})
    u8:log("trace", "loading key")
    local u17 = Migrations.getStepNames(storeContext.migrationSteps)
    local u18 = {}
    local u19 = nil
    local u20 = nil
    return ((((((dataStoreRetry(function() -- Line: 242 -- upvalues: storeContext (val), key (val)
        return storeContext.recordStore:GetAsync(key)
    end)):andThen(function(a1, a2) -- Line: 245
        -- upvalues: u8 (val), u20 (ref), u17 (ref), u18 (ref), Files (upval), u19 (ref), HttpService (upval)
        -- upvalues: storeContext (val)
        u8:log("trace", "got record")
        if a1 == nil then
            a1 = {}
        end
        assert(a1, "luau")
        u20 = a2
        if a1.appliedMigrations then
            u17 = a1.appliedMigrations
        end
        if a1.orphanedFiles then
            u18 = a1.orphanedFiles
        end
        local file = a1.file
        if not file then
            u8:log("trace", "no file reference in record")
            return nil
        end
        if Files.isLargeFile(file) then
            u19 = file
        end
        u8:log("trace", "reading file", {file = HttpService:JSONEncode(file)})
        return Files.read({store = storeContext.shardStore, file = file})
    end)):andThen(function(a1) -- Line: 280 -- upvalues: u8 (val), storeContext (val), Transactions (upval), Promise (upval)
        if a1 then
            u8:log("trace", "got txInfo, resolving transaction", {txInfo = a1})
            return Transactions.readTx({store = storeContext.txStore, txInfo = a1})
        end
        u8:log("trace", "no txInfo from file")
        return Promise.resolve(nil)
    end)):andThen(function(a1) -- Line: 295 -- upvalues: u8 (val), storeContext (val), key (val), Promise (upval), u17 (ref)
        if a1 ~= nil then
            u8:log("trace", "got data from file/transaction")
            return a1
        end
        local importLegacyData = storeContext.importLegacyData
        if importLegacyData == nil then
            u8:log("trace", "no data, no importLegacyData function provided")
            return nil
        end
        u8:log("trace", "no data, attempting to import legacy data")
        local success, result = pcall(importLegacyData, key)
        if not success then
            u8:log("error", "failed to import legacy data", {error = result})
            return Promise.reject((("Failed to import legacy data for key %*: %*"):format(key, result)))
        end
        if result == nil then
            u8:log("trace", "legacy import returned nil")
            return nil
        end
        u17 = {}
        u8:log("trace", "imported legacy data", {oldData = result})
        return result
    end)):andThen(function(a1) -- Line: 327 -- upvalues: u8 (val), Tables (upval), storeContext (val), u17 (ref), Migrations (upval)
        if a1 == nil then
            u8:log("trace", "no data found, using template")
            a1 = Tables.copyDeep(storeContext.template)
        end
        assert(a1, "luau")
        if not (#storeContext.migrationSteps > 0) then
            u8:log("trace", "data loaded (no migrations run)")
            return a1
        end
        u8:log("debug", "applying migrations if necessary")
        local v1 = {
            logger = u8:extend({component = "Migrations"}),
            data = a1,
            steps = storeContext.migrationSteps,
            appliedMigrations = u17,
        }
        return (Migrations.apply(v1)):andThen(function(a1) -- Line: 345 -- upvalues: u17 (upval), u8 (upval)
            u17 = a1.appliedMigrations
            u8:log("trace", "migrations applied", {data = a1.data, appliedMigrations = u17})
            return a1.data
        end)
    end)):andThen(function(a1) -- Line: 361 -- upvalues: u8 (val), u17 (ref), u18 (ref), u19 (ref), u20 (ref)
        u8:log("trace", "load process complete")
        return {
            data = a1,
            appliedMigrations = u17,
            orphanedFiles = u18,
            currentFile = u19,
            keyInfo = u20,
        }
    end))
end

local u82 = {}
u82.__index = u82

local function createSession(a1) -- Line: 413 -- upvalues: PromiseQueue (val), u82 (val) -- types: a1: table
    local v1 = a1.storeContext.logger:extend({key = a1.key})
    return (setmetatable({
        closed = false,
        key = a1.key,
        ctx = a1.storeContext,
        lockHandle = a1.lockHandle,
        userIds = a1.userIds,
        appliedMigrations = a1.appliedMigrations,
        changeSet = {},
        orphanedFiles = a1.orphanedFiles,
        currentFile = a1.currentFile,
        queue = PromiseQueue.new({logger = v1:extend({component = "PromiseQueue"})}),
        keyInfo = a1.keyInfo,
        logger = v1,
    }, u82))
end

function u82.load(a1) -- Line: 470
    -- upvalues: u80 (val), Constants (val), Locks (val), load (val), Promise (val), createSession (val)
    assert((u80(a1)))
    local storeContext = a1.storeContext
    local u12 = storeContext.logger:extend({method = "load", key = a1.key})
    return (Locks.acquireLock({
        storeContext = storeContext,
        key = a1.key,
        duration = Constants.LOCK_DURATION_SECONDS,
        refreshInterval = Constants.LOCK_REFRESH_INTERVAL_SECONDS,
    })):andThen(function(a1_2) -- Line: 484
        -- upvalues: storeContext (val), a1 (val), load (upval), u12 (val), Promise (upval), createSession (upval)
        local v1 = {storeContext = storeContext, key = a1.key}
        return ((load(v1)):andThen(function(a1_3) -- Line: 492
            -- upvalues: a1_2 (val), u12 (upval), Promise (upval), storeContext (upval), a1 (upval)
            -- upvalues: createSession (upval)
            if not a1_2.isLocked() then
                u12:log("error", "lock was lost while loading key")
                return Promise.reject("Lock was lost while loading key")
            end
            local v1 = {
                storeContext = storeContext,
                key = a1.key,
                lockHandle = a1_2,
                userIds = a1.userIds,
                appliedMigrations = a1_3.appliedMigrations,
                orphanedFiles = a1_3.orphanedFiles,
                currentFile = a1_3.currentFile,
                keyInfo = a1_3.keyInfo,
            }
            local u27 = createSession(v1)
            a1_2.onLockLost(function() -- Line: 514 -- upvalues: u12 (upval), u27 (val), Promise (upval), storeContext (upval), a1 (upval)
                u12:log("warn", "lock was lost, closing session and stopping autosave")
                u27.closed = true
                u27:stopAutosaving()
                u27.unloadPromise = Promise.resolve()
                if storeContext.onLockLost then
                    storeContext.onLockLost(a1.key)
                end
            end)
            for i, j in a1_3.orphanedFiles do
                u27:orphanFile(j)
            end
            u12:log("trace", "loaded key, setting initial data", {data = a1_3.data})
            u27:mutateKey(a1_3.data)
            return u27
        end)):finally(function(a1) -- Line: 537 -- upvalues: Promise (upval), u12 (upval), a1_2 (val)
            if a1 ~= Promise.Status.Resolved then
                u12:log("trace", "failed to load key, releasing lock")
                ;(a1_2.release()):catch(function(a1) -- Line: 543 -- upvalues: u12 (upval)
                    u12:log("warn", "failed to release lock after load failure", {error = a1})
                end)
            end
        end)
    end)
end

function u82:updateRecord() -- Line: 559 -- upvalues: Promise (val)
    local v1 = self.logger:extend({method = "updateRecord"})
    v1:log("trace", "updateRecord called")
    if self:isSaved() then
        v1:log("trace", "no changes detected, skipping write")
        return Promise.resolve()
    end
    local v2 = {committedData = self.data}
    v1:log("trace", "writing record via writeRecord", {txInfo = v2})
    return self:writeRecord(v2)
end

function u82:orphanFile(a2) -- Line: 587 -- upvalues: Files (val), dataStoreRetry (val), Promise (val), Tables (val)
    if not Files.isLargeFile(a2) then
        return
    end
    local u13 = self.ctx.logger:extend({method = "orphanFile", key = self.key, shard = a2.shard})
    u13:log("trace", "adding file to orphaned list", {file = a2})
    table.insert(self.orphanedFiles, a2)
    task.spawn(function() -- Line: 599
        -- upvalues: self (val), u13 (val), a2 (val), dataStoreRetry (upval), Promise (upval), Tables (upval)
        local RequestBudgetForRequestType, count_2, v1
        while true do
            RequestBudgetForRequestType = self.ctx.dataStoreService:GetRequestBudgetForRequestType(Enum.DataStoreRequestType.SetIncrementAsync)
            if not (RequestBudgetForRequestType < 100) then
                break
            end
            u13:log("debug", "insufficient budget for orphan cleanup, waiting", {minBudget = 100, curBudget = RequestBudgetForRequestType})
            task.wait(1)
        end
        u13:log("debug", "sufficient budget, processing orphaned file")
        local v2 = {}
        local count = a2.count
        for i = 1, count do
            v1 = u13
            count_2 = a2.count
            v1:log("trace", (("Queueing removal of shard %* of %*"):format(i, count_2)))
            table.insert(v2, (dataStoreRetry(function() -- Line: 625 -- upvalues: self (upval), a2 (upval), i (val)
                return self.ctx.shardStore:RemoveAsync((("%*-%*"):format(a2.shard, i)))
            end)))
        end
        ;(((Promise.all(v2)):andThen(function() -- Line: 634 -- upvalues: u13 (upval), self (upval), Tables (upval), a2 (upval)
            u13:log("trace", "successfully removed all shards for orphaned file")
            for i, j in self.orphanedFiles do
                if Tables.equalsDeep(a2, j) then
                    table.remove(self.orphanedFiles, i)
                    return
                end
            end
        end)):catch(function(a1) -- Line: 644 -- upvalues: u13 (upval)
            u13:log("error", (("failed to remove shards for orphaned file: %*"):format(a1)))
        end)):finally(function() -- Line: 649 -- upvalues: u13 (upval)
            u13:log("trace", "finished processing orphaned file task")
        end)
    end)
end

function u82:writeRecord(a2) -- Line: 679 -- upvalues: Constants (val), Files (val), Promise (val), dataStoreRetry (val)
    local u6 = self.logger:extend({method = "writeRecord"})
    u6:log("trace", "writeRecord called")
    local v1 = {
        store = self.ctx.shardStore,
        data = a2,
        maxShardSize = Constants.MAX_CHUNK_SIZE,
        key = self.key,
        userIds = self.userIds,
    }
    u6:log("trace", "calling Files.write", {writeParams = v1})
    return ((Files.write(v1)):catch(function(a1) -- Line: 694 -- upvalues: u6 (val), self (val), Promise (upval)
        u6:log("error", "Files.write failed", {error = a1.error})
        self:orphanFile(a1.file)
        return Promise.reject(a1.error)
    end)):andThen(function(a1) -- Line: 701 -- upvalues: u6 (val), self (val), Promise (upval), dataStoreRetry (upval), Files (upval)
        u6:log("trace", "Files.write succeeded", {file = a1})
        if not self.lockHandle.isLocked() then
            u6:log("error", "lock was lost while writing file")
            self:orphanFile(a1)
            return Promise.reject("lock was lost while writing file")
        end
        local v1 = table.clone(self.orphanedFiles)
        if self.currentFile then
            table.insert(v1, self.currentFile)
        end
        local u38 = {}
        u38.appliedMigrations = self.appliedMigrations
        u38.file = a1
        u38.orphanedFiles = v1
        u6:log("trace", "writing main record", {record = u38})
        return ((dataStoreRetry(function() -- Line: 729 -- upvalues: self (upval), u38 (val)
            return self.ctx.recordStore:SetAsync(self.key, u38, self.userIds)
        end)):andThen(function() -- Line: 732 -- upvalues: u6 (upval), self (upval), Files (upval), a1 (val), u38 (val)
            u6:log("trace", "main record written successfully")
            if self.currentFile then
                self:orphanFile(self.currentFile)
            end
            self.currentFile = if not Files.isLargeFile(a1) then nil else a1
            return u38
        end)):catch(function(a1_2) -- Line: 746 -- upvalues: u6 (upval), self (upval), a1 (val), Promise (upval)
            u6:log("error", "failed to write main record", {error = a1_2})
            self:orphanFile(a1)
            return Promise.reject(a1_2)
        end)
    end)
end

function u82:isSaved() -- Line: 762
    return next(self.changeSet) == nil
end

function u82:setData(a2) -- Line: 775 -- upvalues: HttpService (val), Tables (val)
    local v1 = HttpService:GenerateGUID(false)
    self.changeSet[v1] = true
    Tables.freezeDeep(a2)
    self.data = a2
end

function u82:mutateKey(a2) -- Line: 792
    local data = self.data
    self:setData(a2)
    for i, j in self.ctx.changedCallbacks do
        task.spawn(j, self.key, self.data, data)
    end
end

function u82.startAutosaving(a1) -- Line: 810 -- upvalues: Constants (val)
    local u5 = a1.logger:extend({method = "startAutosaving"})
    if a1._cleanupAutosave then
        u5:log("warn", "autosave already started")
        return
    end
    if a1.closed then
        u5:log("warn", "Session is closed, not starting autosave")
        return
    end
    u5:log("trace", "starting autosave loop")
    local u23 = false
    task.spawn(function() -- Line: 826 -- upvalues: Constants (upval), a1 (val), u23 (ref), u5 (val)
        local v1, v2
        while true do
            task.wait(Constants.AUTOSAVE_INTERVAL_SECONDS)
            if a1.closed or u23 then
                break
            end
            u5:log("trace", "autosave triggered")
            v1, v2 = a1:save():await()
            if v1 then
                u5:log("trace", "autosave completed successfully")
            else
                u5:log("warn", "failed to autosave key", {error = v2})
            end
        end
        u5:log("trace", "autosave loop stopping", {closed = a1.closed, stop = u23})
    end)

    function a1._cleanupAutosave() -- Line: 850 -- upvalues: u5 (val), u23 (ref), a1 (val)
        u5:log("trace", "cleanup function called, signaling autosave loop to stop")
        u23 = true
        a1._cleanupAutosave = nil
    end
end

function u82:stopAutosaving() -- Line: 862
    if not self._cleanupAutosave then
        self.logger:log("trace", "autosave loop not running or already stopped")
        return
    end
    self.logger:log("trace", "stopping autosave loop")
    self._cleanupAutosave()
end

function u82.unload(a1) -- Line: 878
    local u5 = a1.logger:extend({method = "unload"})
    u5:log("trace", "unload called")
    if a1.unloadPromise then
        u5:log("trace", "unload already in progress, returning existing promise")
        return a1.unloadPromise
    end
    a1.closed = true
    a1:stopAutosaving()
    u5:log("trace", "queueing final save and lock release")
    a1.unloadPromise = ((a1.queue:add(function() -- Line: 897 -- upvalues: u5 (val), a1 (val)
        u5:log("trace", "performing final updateRecord before unloading")
        return a1:updateRecord()
    end)):andThenReturn(nil)):finally(function() -- Line: 903 -- upvalues: u5 (val), a1 (val)
        u5:log("trace", "releasing lock as part of unload")
        return (a1.lockHandle.release()):catch(function(a1) -- Line: 907 -- upvalues: u5 (upval)
            u5:log("warn", "failed to release lock during unload", {error = a1})
        end)
    end)
    return a1.unloadPromise
end

function u82.get(a1) -- Line: 921 -- upvalues: Promise (val)
    return (Promise.resolve(a1.data))
end

local function updateInternal(a1, a2, a3, a4) -- Line: 926
    -- upvalues: Promise (val), Tables (val), noYield (val)
    return Promise.new(function(a1_2, a2_2) -- Line: 933 -- upvalues: a1 (val), a4 (val), a3 (val), Tables (upval), noYield (upval), a2 (val)
        local v1, v2, v3, v4
        while a1.txLockPromise ~= nil do
            a4:log("trace", "waiting for txLockPromise to resolve")
            a1.txLockPromise:await()
            if a1.closed then
                a4:log("warn", "Session closed while waiting for txLockPromise, rejecting update")
                return a2_2("Session is closed")
            end
        end
        a4:log("trace", "txLockPromise resolved or was nil, proceeding with update")
        local data = a1.data
        local data_2 = if not a3 then Tables.copyDeep(a1.data) else a1.data
        local success, result = pcall(noYield, a2, data_2)
        if not success then
            a4:log("error", "transformFunction errored", {error = result})
            return a2_2((("transformFunction failed: %*"):format(result)))
        end
        if a3 == false then
            if typeof(result) ~= "boolean" then
                a4:log("error", "transformFunction did not return a boolean")
                return a2_2("transformFunction must return a boolean")
            end
            v1, v2 = a1_2, a2_2
            if result == false then
                a4:log("trace", "transformFunction returned false, update aborted")
                return v1(false)
            end
            if a3 then
                data_2 = result
            end
            v3, v4 = a1.ctx.schema(data_2)
            if not v3 then
                a4:log("error", "schema validation failed after transform", {error = v4})
                return v2((("Store:update schema validation failed: %*"):format(v4)))
            end
            Tables.freezeDeep(data_2)
            if Tables.equalsDeep(data_2, data) then
                a4:log("trace", "transform resulted in no data change, resolving true")
                return v1(true)
            end
            if a3 == false then
                data_2 = Tables.reconcileDeep(data, data_2)
            end
            a1:mutateKey(data_2)
            a4:log("trace", "update applied successfully")
            return v1(true)
        end
        if typeof(result) ~= "table" then
            if result ~= false then
                a4:log("error", "transformFunction returned a boolean when it should return data or false")
                return a2_2("transformFunction must return data or false")
            end
        end
        v1, v2 = a1_2, a2_2
        if result == false then
            a4:log("trace", "transformFunction returned false, update aborted")
            return v1(false)
        end
        if a3 then
            data_2 = result
        end
        v3, v4 = a1.ctx.schema(data_2)
        if not v3 then
            a4:log("error", "schema validation failed after transform", {error = v4})
            return v2((("Store:update schema validation failed: %*"):format(v4)))
        end
        Tables.freezeDeep(data_2)
        if Tables.equalsDeep(data_2, data) then
            a4:log("trace", "transform resulted in no data change, resolving true")
            return v1(true)
        end
        if a3 == false then
            data_2 = Tables.reconcileDeep(data, data_2)
        end
        a1:mutateKey(data_2)
        a4:log("trace", "update applied successfully")
        return v1(true)
    end)
end

function u82.update(a1, a2) -- Line: 1039
    -- upvalues: t (val), Promise (val), updateInternal (val)
    assert((t.callback(a2)))
    local v1 = a1.logger:extend({method = "update"})
    v1:log("trace", "update called")
    if not a1.closed then
        return updateInternal(a1, a2, false, v1)
    end
    v1:log("warn", "Session is closed, rejecting update")
    return Promise.reject("Session is closed")
end

function u82.updateImmutable(a1, a2) -- Line: 1068
    -- upvalues: t (val), Promise (val), updateInternal (val)
    assert((t.callback(a2)))
    local v1 = a1.logger:extend({method = "updateImmutable"})
    v1:log("trace", "updateImmutable called")
    if not a1.closed then
        return updateInternal(a1, a2, true, v1)
    end
    v1:log("warn", "Session is closed, rejecting update")
    return Promise.reject("Session is closed")
end

function u82:save() -- Line: 1091 -- upvalues: Promise (val)
    local u5 = self.logger:extend({method = "save"})
    u5:log("trace", "save called")
    if self.closed then
        u5:log("warn", "Session is closed, rejecting save")
        return Promise.reject("Session is closed")
    end
    if self:isSaved() then
        u5:log("trace", "no changes pending, resolving save immediately")
        return Promise.resolve()
    end
    local u34 = table.clone(self.changeSet)
    u5:log("trace", "queueing save operation")
    return self.queue:add(function() -- Line: 1111 -- upvalues: u5 (val), self (val), u34 (val), Promise (upval)
        u5:log("trace", "save task running from queue")
        local v1 = true
        for i in self.changeSet do
            if u34[i] then
                v1 = false
                break
            end
        end
        if v1 then
            u5:log("trace", "changes were already saved by another task, skipping redundant save")
            return Promise.resolve()
        end
        local u34_2 = table.clone(self.changeSet)
        u5:log("trace", "saving current changes", {changes = u34_2})
        return (self:updateRecord()):andThen(function() -- Line: 1135 -- upvalues: u34_2 (val), self (upval), u5 (upval)
            for i in u34_2 do
                self.changeSet[i] = nil
            end
            u5:log("trace", "changes saved successfully, updated changeSet", {latestChangeSet = self.changeSet})
        end)
    end)
end

return u82