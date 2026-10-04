-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.SchedulerProfiling
-- Decompile time: 4.01 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local u10 = {}
require(script.Parent:WaitForChild("SchedulerPriorities"))
local enableProfiling = require(script.Parent:WaitForChild("SchedulerFeatureFlags")).enableProfiling
local u28 = 0
local u29 = 0
local u30 = 0
local u31 = nil
local u32 = nil
local u33 = 1

local function logEvent(a1) -- Line: 45
    -- upvalues: u32 (ref), u33 (ref), u30 (ref), console (val), u10 (val), u31 (ref)
    if u32 ~= nil then
        u33 = u33 + #a1
        local v1 = u33 + 1
        if u30 < v1 then
            u30 = u30 * 2
            if u30 > 524288 then
                console.error("Scheduler Profiling: Event log exceeded maximum size. Don't forget to call `stopLoggingProfilingEvents()`.")
                u10.stopLoggingProfilingEvents()
                return
            end
            v1 = {}
            table.insert(v1, u32)
            u31 = v1
            u32 = v1
        end
        table.insert(u32, a1)
    end
end

function u10.startLoggingProfilingEvents() -- Line: 69 -- upvalues: u30 (ref), u31 (ref), u32 (ref), u33 (ref)
    u30 = 131072
    u31 = {}
    u32 = u31
    u33 = 1
end

function u10.stopLoggingProfilingEvents() -- Line: 76 -- upvalues: u31 (ref), u30 (ref), u32 (ref), u33 (ref)
    local v1 = u31
    u30 = 0
    u31 = nil
    u32 = nil
    u33 = 1
    return v1
end

function u10.markTaskStart(a1, a2) -- Line: 86
    -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({1, a2 * 1000, a1.id, a1.priorityLevel})
    end
end

function u10.markTaskCompleted(a1, a2) -- Line: 97
    -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({2, a2 * 1000, a1.id})
    end
end

function u10.markTaskCanceled(a1, a2) -- Line: 108
    -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({4, a2 * 1000, a1.id})
    end
end

function u10.markTaskErrored(a1, a2) -- Line: 116
    -- upvalues: enableProfiling (val), u32 (ref), logEvent (val)
    if enableProfiling and u32 ~= nil then
        logEvent({3, a2 * 1000, a1.id})
    end
end

function u10.markTaskRun(a1, a2) -- Line: 124
    -- upvalues: enableProfiling (val), u28 (ref), u32 (ref), logEvent (val)
    if enableProfiling then
        u28 = u28 + 1
        if u32 ~= nil then
            logEvent({5, a2 * 1000, a1.id, u28})
        end
    end
end

function u10.markTaskYield(a1, a2) -- Line: 134
    -- upvalues: enableProfiling (val), u32 (ref), logEvent (val), u28 (ref)
    if enableProfiling and u32 ~= nil then
        logEvent({6, a2 * 1000, a1.id, u28})
    end
end

function u10.markSchedulerSuspended(a1) -- Line: 142
    -- upvalues: enableProfiling (val), u29 (ref), u32 (ref), logEvent (val)
    if enableProfiling then
        u29 = u29 + 1
        if u32 ~= nil then
            logEvent({7, a1 * 1000, u29})
        end
    end
end

function u10.markSchedulerUnsuspended(a1) -- Line: 152
    -- upvalues: enableProfiling (val), u32 (ref), logEvent (val), u29 (ref)
    if enableProfiling and u32 ~= nil then
        logEvent({8, a1 * 1000, u29})
    end
end

return u10