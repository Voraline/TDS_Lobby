-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.TracingSubscriptions
-- Decompile time: 2.15 ms

local v1 = {}
local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local Tracing = require(script.Parent:WaitForChild("Tracing"))
local enableSchedulerTracing = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulerTracing
local __subscriberRef = Tracing.__subscriberRef
local u32 = {}
if enableSchedulerTracing then
    u32 = {}
end

function v1.unstable_subscribe(a1) -- Line: 29
    -- upvalues: enableSchedulerTracing (val), u32 (ref), Object (val), __subscriberRef (val)
    if enableSchedulerTracing then
        u32[a1] = true
        if #Object.keys(u32) == 1 then
            __subscriberRef.current = {
                onInteractionScheduledWorkCompleted = onInteractionScheduledWorkCompleted,
                onInteractionTraced = onInteractionTraced,
                onWorkCanceled = onWorkCanceled,
                onWorkScheduled = onWorkScheduled,
                onWorkStarted = onWorkStarted,
                onWorkStopped = onWorkStopped,
            }
        end
    end
end

function v1.unstable_unsubscribe(a1) -- Line: 46
    -- upvalues: enableSchedulerTracing (val), u32 (ref), Object (val), __subscriberRef (val)
    if enableSchedulerTracing then
        u32[a1] = nil
        if #Object.keys(u32) == 0 then
            __subscriberRef.current = nil
        end
    end
end

function onInteractionTraced(a1) -- Line: 56 -- upvalues: u32 (ref)
    local result, success
    local v1 = false
    local v2 = nil
    for i, j in u32 do
        success, result = pcall(i.onInteractionTraced, a1)
        if not success and not v1 then
            v1 = true
            v2 = result
        end
    end
    if v1 then
        error(v2)
    end
end

function onInteractionScheduledWorkCompleted(a1) -- Line: 78 -- upvalues: u32 (ref)
    local result, success
    local v1 = false
    local v2 = nil
    for i, j in u32 do
        success, result = pcall(i.onInteractionScheduledWorkCompleted, a1)
        if not success and not v1 then
            v1 = true
            v2 = result
        end
    end
    if v1 then
        error(v2)
    end
end

function onWorkScheduled(a1, a2) -- Line: 101 -- upvalues: u32 (ref) -- types: a1: table, a2: number
    local result, success
    local v1 = false
    local v2 = nil
    for i, j in u32 do
        success, result = pcall(i.onWorkScheduled, a1, a2)
        if not success and not v1 then
            v1 = true
            v2 = result
        end
    end
    if v1 then
        error(v2)
    end
end

function onWorkStarted(a1, a2) -- Line: 123 -- upvalues: u32 (ref) -- types: a1: table, a2: number
    local result, success
    local v1 = false
    local v2 = nil
    for i, j in u32 do
        success, result = pcall(i.onWorkStarted, a1, a2)
        if not success and not v1 then
            v1 = true
            v2 = result
        end
    end
    if v1 then
        error(v2)
    end
end

function onWorkStopped(a1, a2) -- Line: 145 -- upvalues: u32 (ref) -- types: a1: table, a2: number
    local result, success
    local v1 = false
    local v2 = nil
    for i, j in u32 do
        success, result = pcall(i.onWorkStopped, a1, a2)
        if not success and not v1 then
            v1 = true
            v2 = result
        end
    end
    if v1 then
        error(v2)
    end
end

function onWorkCanceled(a1, a2) -- Line: 167 -- upvalues: u32 (ref) -- types: a1: table, a2: number
    local result, success
    local v1 = false
    local v2 = nil
    for i, j in u32 do
        success, result = pcall(i.onWorkCanceled, a1, a2)
        if not success and not v1 then
            v1 = true
            v2 = result
        end
    end
    if v1 then
        error(v2)
    end
end

return v1