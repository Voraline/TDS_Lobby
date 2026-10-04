-- Script path: ReplicatedStorage.Packages.Lyra.Locks
-- Decompile time: 7.46 ms

local HttpService = game:GetService("HttpService")
require(script.Parent.Types)
local Promise = require(script.Parent.Promise)
local Constants = require(script.Parent.Constants)
local dataStoreRetry = require(script.Parent.dataStoreRetry)
local hashMapRetry = require(script.Parent.hashMapRetry)
return {
    acquireLock = function(a1) -- Line: 87
        -- upvalues: HttpService (val), dataStoreRetry (val), hashMapRetry (val), Promise (val)
        local u5 = HttpService:GenerateGUID(false)
        local u6 = {}
        local u7 = nil
        local u8 = nil
        local u9 = nil
        local u10 = nil
        local storeContext = a1.storeContext
        local key = a1.key
        local u17 = storeContext.logger:extend({method = "acquireLock", key = key, lockId = u5})

        local function transitionTo(a1) -- Line: 113 -- upvalues: u17 (val), u9 (ref) -- types: a1: string
            u17:log("trace", (("lock transition: %* -> %*"):format(u9 or "nil", a1)))
            u9 = a1
        end

        local function spawnExpiryCallbacks() -- Line: 124 -- upvalues: u9 (ref), u17 (val), u6 (val)
            if u9 == "held" then
                u17:log("warn", "lock expiry timer fired or refresh failed, invoking onLockLost callbacks")
                u17:log("trace", (("lock transition: %* -> released"):format(u9 or "nil")))
                u9 = "released"
                for i, j in u6 do
                    task.spawn(j)
                end
            end
        end

        local function tryUpdate(a1_2) -- Line: 151
            -- upvalues: u17 (val), key (val), storeContext (val), a1 (val), u5 (val), dataStoreRetry (upval)
            -- upvalues: hashMapRetry (upval), u10 (ref), u7 (ref), spawnExpiryCallbacks (val)
            local v1
            u17:log("trace", (("attempting UpdateAsync on key '%*' with ttl %*"):format(key, a1_2)))

            local function transformFunction(a1_2, a2) -- Line: 155
                -- upvalues: storeContext (upval), a1 (upval), u5 (upval)
                if storeContext.useDSSLocking and a2 then
                    local v1 = os.time() - a2.UpdatedTime / 1000
                    if a1.duration <= v1 then
                        a1_2 = nil
                    end
                end
                if a1_2 ~= nil and a1_2 ~= u5 then
                    return nil
                end
                return u5
            end

            ;(if not storeContext.useDSSLocking then hashMapRetry(function() -- Line: 189 -- upvalues: storeContext (upval), key (upval), transformFunction (val), a1_2 (val)
                return storeContext.lockHashMap:UpdateAsync(key, transformFunction, a1_2)
            end) else {
                promise = dataStoreRetry(function() -- Line: 177 -- upvalues: a1_2 (val), storeContext (upval), key (upval), u5 (upval), transformFunction (val)
                    if a1_2 ~= 0 then
                        return (storeContext.lockHashMap:UpdateAsync(key, transformFunction))
                    end
                    local v1 = key
                    storeContext.lockHashMap:RemoveAsync(v1)
                    return u5
                end),
                cancel = function() end,
            }).promise:tap(function(a1) -- Line: 195 -- upvalues: u10 (upval), a1_2 (val), u17 (upval), u7 (upval), spawnExpiryCallbacks (upval)
                if a1 == nil then
                    u17:log("trace", "UpdateAsync failed or returned nil (lock held by another?)")
                    return
                end
                u10 = os.clock() + a1_2 - 0.2
                u17:log("trace", (("UpdateAsync succeeded, lastConfirmedExpiry updated to %*"):format(u10)))
                if u7 then
                    task.cancel(u7)
                end
                if not (a1_2 > 0) then
                    return
                end
                u17:log("trace", (("starting local expiry timer for %* seconds"):format(a1_2)))
                u7 = task.delay(a1_2, spawnExpiryCallbacks)
            end)
            return v1
        end

        local function release() -- Line: 229
            -- upvalues: u17 (val), u9 (ref), Promise (upval), u7 (ref), u8 (ref), a1 (val), u10 (ref), tryUpdate (val)
            u17:log("trace", "release function called")
            if u9 ~= "held" then
                u17:log("trace", (("lock not 'held' (status: %*), skipping release logic"):format(u9)))
                return Promise.resolve()
            end
            u17:log("trace", (("lock transition: %* -> released"):format(u9 or "nil")))
            u9 = "released"
            if u7 then
                task.cancel(u7)
                u7 = nil
                u17:log("trace", "cancelled expiryThread")
            end
            if u8 then
                u8:cancel()
                u8 = nil
                u17:log("trace", "cancelled refreshPromise")
            end
            local v1 = u10
            if v1 then
                local v2 = u10
                v1 = os.clock() < v2
            end
            if v1 then
                u17:log("trace", "attempting to clear lock in MemoryStore (UpdateAsync with TTL 0)")
                return (tryUpdate(0)).promise:catch(function(a1) -- Line: 262 -- upvalues: u17 (upval), Promise (upval)
                    u17:log("warn", "failed during final UpdateAsync(ttl=0) on release", {error = a1})
                    return Promise.reject(a1)
                end)
            end
            u17:log("trace", "lock likely already expired remotely, skipping final UpdateAsync")
            return Promise.resolve()
        end

        local function waitForLock() -- Line: 280
            -- upvalues: u17 (val), u9 (ref), a1 (val), Promise (upval), release (val), tryUpdate (val), key (val)
            u17:log("trace", "entering waitForLock loop")
            u17:log("trace", (("lock transition: %* -> acquiring"):format(u9 or "nil")))
            u9 = "acquiring"
            local u19 = os.clock()
            local u20 = nil
            local u21 = 0
            local duration = a1.duration
            return (Promise.new(function(a1_2, a2, a3) -- Line: 289
                -- upvalues: u17 (upval), Promise (upval), u20 (ref), release (upval), u19 (val), duration (val)
                -- upvalues: u21 (ref), tryUpdate (upval), a1 (upval), u9 (upval), key (upval)
                a3(function() -- Line: 291 -- upvalues: u17 (upval), Promise (upval), u20 (upval), release (upval)
                    u17:log("trace", "waitForLock cancelled")
                    local promise = Promise.resolve()
                    if u20 then
                        u20.cancel()
                        promise = u20.promise
                    end
                    promise:finally(function() -- Line: 302 -- upvalues: release (upval), u17 (upval)
                        (release()):catch(function(a1) -- Line: 303 -- upvalues: u17 (upval)
                            u17:log("error", "failed to release lock during cancellation", {error = a1})
                        end)
                    end)
                end)
                task.spawn(function() -- Line: 312
                    -- upvalues: u19 (upval), duration (upval), a3 (val), u17 (upval), u21 (upval), u20 (upval)
                    -- upvalues: tryUpdate (upval), a1 (upval), u9 (upval), a1_2 (val), a2 (val), key (upval)
                    local v1, v2, v3
                    while true do
                        if not (os.clock() - u19 < duration) then
                            break
                        end
                        if a3() then
                            u17:log("trace", "detected cancellation within loop")
                            return
                        end
                        u21 = u21 + 1
                        u17:log("trace", (("acquisition attempt %*"):format(u21)))
                        u20 = tryUpdate(a1.duration)
                        v1, v2 = u20.promise:await()
                        u20 = nil
                        if v1 and v2 ~= nil then
                            u17:log("info", "lock acquired successfully")
                            u17:log("trace", (("lock transition: %* -> held"):format(u9 or "nil")))
                            u9 = "held"
                            return a1_2()
                        end
                        if v1 then
                            u17:log("trace", "lock currently held by another instance")
                        else
                            u17:log("warn", "attempt to acquire lock failed", {attemptCount = u21, error = v2})
                        end
                        if a3() then
                            u17:log("trace", "detected cancellation after attempt")
                            return
                        end
                        v3 = math.min(2 ^ (u21 - 1), 30)
                        u17:log("trace", (("waiting %*s before next attempt"):format(v3)))
                        task.wait(v3)
                    end
                    u17:log("error", "failed to acquire lock within time limit", {duration = duration})
                    return a2((("Failed to acquire lock for key '%*' within %* seconds"):format(key, duration)))
                end)
            end))
        end

        local function setupLockRefresh() -- Line: 369
            -- upvalues: u17 (val), u8 (ref), Promise (upval), u9 (ref), a1 (val), tryUpdate (val)
            -- upvalues: spawnExpiryCallbacks (val)
            u17:log("trace", "setting up background lock refresh loop")
            local u6 = nil
            u8 = Promise.new(function(a1_2, a2, a3) -- Line: 375
                -- upvalues: u17 (upval), u6 (ref), u9 (upval), a1 (upval), tryUpdate (upval)
                -- upvalues: spawnExpiryCallbacks (upval)
                a3(function() -- Line: 377 -- upvalues: u17 (upval), u6 (upval)
                    u17:log("trace", "refreshPromise cancelled")
                    if u6 then
                        u6.cancel()
                    end
                end)
                task.spawn(function() -- Line: 387
                    -- upvalues: u9 (upval), a1 (upval), a3 (val), u17 (upval), u6 (upval), tryUpdate (upval)
                    -- upvalues: spawnExpiryCallbacks (upval), a1_2 (val)
                    local v1, v2
                    while u9 == "held" do
                        task.wait(a1.refreshInterval)
                        if not a3() and u9 == "held" then
                            u17:log("trace", "attempting lock refresh")
                            u6 = tryUpdate(a1.duration)
                            v1, v2 = u6.promise:await()
                            u6 = nil
                            if u9 ~= "held" then
                                u17:log("trace", "exiting refresh loop, status changed during refresh attempt")
                                break
                            end
                            if v1 and v2 ~= nil then
                                u17:log("trace", "lock refreshed successfully")
                                continue
                            end
                            u17:log("warn", "failed to refresh lock, lock considered lost", {error = v2})
                            spawnExpiryCallbacks()
                            break
                        end
                        u17:log("trace", "exiting refresh loop due to cancellation or status change")
                        break
                    end
                    u17:log("trace", "background refresh loop finished")
                    a1_2()
                end)
            end)
        end

        local u24 = {release = release}

        function u24.isLocked() -- Line: 433 -- upvalues: u9 (ref), u10 (ref)
            local v1 = false
            if u9 == "held" then
                local v2 = u10 or 0
                v1 = os.clock() < v2
            end
            return v1
        end

        function u24.onLockLost(a1) -- Line: 437 -- upvalues: u6 (val) -- types: a1: function
            table.insert(u6, a1)
            return function() -- Line: 441 -- upvalues: u6 (upval), a1 (val)
                local v1 = table.find(u6, a1)
                if v1 then
                    table.remove(u6, v1)
                end
            end
        end

        return (((waitForLock()):andThen(function() -- Line: 452
            -- upvalues: u17 (val), u8 (ref), Promise (upval), u9 (ref), a1 (val), tryUpdate (val)
            -- upvalues: spawnExpiryCallbacks (val), u24 (val)
            u17:log("trace", "setting up background lock refresh loop")
            local u6 = nil
            u8 = Promise.new(function(a1_2, a2, a3) -- Line: 375
                -- upvalues: u17 (upval), u6 (ref), u9 (upval), a1 (upval), tryUpdate (upval)
                -- upvalues: spawnExpiryCallbacks (upval)
                a3(function() -- Line: 377 -- upvalues: u17 (upval), u6 (upval)
                    u17:log("trace", "refreshPromise cancelled")
                    if u6 then
                        u6.cancel()
                    end
                end)
                task.spawn(function() -- Line: 387
                    -- upvalues: u9 (upval), a1 (upval), a3 (val), u17 (upval), u6 (upval), tryUpdate (upval)
                    -- upvalues: spawnExpiryCallbacks (upval), a1_2 (val)
                    local v1, v2
                    while u9 == "held" do
                        task.wait(a1.refreshInterval)
                        if not a3() and u9 == "held" then
                            u17:log("trace", "attempting lock refresh")
                            u6 = tryUpdate(a1.duration)
                            v1, v2 = u6.promise:await()
                            u6 = nil
                            if u9 ~= "held" then
                                u17:log("trace", "exiting refresh loop, status changed during refresh attempt")
                                break
                            end
                            if v1 and v2 ~= nil then
                                u17:log("trace", "lock refreshed successfully")
                                continue
                            end
                            u17:log("warn", "failed to refresh lock, lock considered lost", {error = v2})
                            spawnExpiryCallbacks()
                            break
                        end
                        u17:log("trace", "exiting refresh loop due to cancellation or status change")
                        break
                    end
                    u17:log("trace", "background refresh loop finished")
                    a1_2()
                end)
            end)
            return u24
        end)):catch(function(a1) -- Line: 457 -- upvalues: u17 (val), release (val), Promise (upval)
            u17:log("error", "failed to acquire lock", {error = a1})
            return (release()):andThen(function() -- Line: 461 -- upvalues: Promise (upval), a1 (val)
                return Promise.reject(a1)
            end)
        end))
    end,
    probeLockActive = function(a1) -- Line: 492 -- upvalues: dataStoreRetry (val), Constants (val), hashMapRetry (val) -- types: a1: table
        local storeContext = a1.storeContext
        local key = a1.key
        local u7 = storeContext.logger:extend({method = "probeLockActive", key = key})
        u7:log("trace", "probing if lock is active via GetAsync")
        return (if not storeContext.useDSSLocking then hashMapRetry(function() -- Line: 512 -- upvalues: storeContext (val), key (val)
            return storeContext.lockHashMap:GetAsync(key)
        end).promise else dataStoreRetry(function() -- Line: 502 -- upvalues: storeContext (val), key (val), Constants (upval)
            local Async, Async_2 = storeContext.lockHashMap:GetAsync(key)
            if Async_2 then
                local v1 = os.time() - Async_2.UpdatedTime / 1000
                if Constants.LOCK_DURATION_SECONDS <= v1 then
                    Async = nil
                end
            end
            return Async
        end)):andThen(function(a1) -- Line: 518 -- upvalues: u7 (val)
            local v1
            u7:log("trace", (("probe result: %*"):format(a1 ~= nil)))
            return v1
        end)
    end,
}