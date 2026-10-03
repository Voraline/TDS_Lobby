-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.Tracing
-- Decompile time: 3.49 ms

local Set = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Set
local v1 = {}
local enableSchedulerTracing = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulerTracing
local u22 = 0
local u23 = 0
local u29 = nil
local u31 = nil
if enableSchedulerTracing then
    u29 = {current = Set.new()}
    u31 = {}
end
v1.__interactionsRef = u29
v1.__subscriberRef = u31

function v1.unstable_clear(a1) -- Line: 91
    -- upvalues: enableSchedulerTracing (val), u29 (ref), Set (val)
    if not enableSchedulerTracing then
        return a1()
    end
    local current = u29.current
    u29.current = Set.new()
    local success, result = pcall(a1)
    u29.current = current
    if not success then
        error(result)
    end
    return result
end

function v1.unstable_getCurrent() -- Line: 111 -- upvalues: enableSchedulerTracing (val), u29 (ref)
    if not enableSchedulerTracing then
        return nil
    end
    return u29.current
end

function v1.unstable_getThreadID() -- Line: 119 -- upvalues: u23 (ref)
    u23 = u23 + 1
    return u23
end

function v1.unstable_trace(a1, a2, a3, a4) -- Line: 125
    -- upvalues: enableSchedulerTracing (val), u22 (ref), u29 (ref), Set (val), u31 (ref)
    local u5 = if a4 == nil then 0 else a4
    if not enableSchedulerTracing then
        return a3()
    end
    local u10 = {__count = 1, id = u22, name = a1, timestamp = a2}
    u22 = u22 + 1
    local current_2 = u29.current
    local u21 = Set.new(current_2)
    u21:add(u10)
    u29.current = u21
    local current = u31.current
    local u29_2 = nil
    local success, result = pcall(function() -- Line: 154 -- upvalues: current (val), u10 (val)
        if current ~= nil then
            current.onInteractionTraced(u10)
        end
    end)
    local success_2, result_2 = pcall(function() -- Line: 161 -- upvalues: current (val), u21 (val), u5 (val)
        if current ~= nil then
            current.onWorkStarted(u21, u5)
        end
    end)
    local success_3, result_3 = pcall(function() -- Line: 169 -- upvalues: u29_2 (ref), a3 (val)
        u29_2 = a3()
    end)
    u29.current = current_2
    local success_4, result_4 = pcall(function() -- Line: 175 -- upvalues: current (val), u21 (val), u5 (val)
        if current ~= nil then
            current.onWorkStopped(u21, u5)
        end
    end)
    u10.__count = u10.__count - 1
    if current ~= nil and u10.__count == 0 then
        current.onInteractionScheduledWorkCompleted(u10)
    end
    if not success_4 then
        error(result_4)
    end
    if not success_3 then
        error(result_3)
    end
    if not success_2 then
        error(result_2)
    end
    if not success then
        error(result)
    end
    return u29_2
end

function v1.unstable_wrap(a1, a2) -- Line: 208
    -- upvalues: enableSchedulerTracing (val), u29 (ref), u31 (ref)
    if a2 == nil then
        a2 = 0
    end
    if not enableSchedulerTracing then
        return a1
    end
    local current = u29.current
    local current_2 = u31.current
    if current_2 ~= nil then
        current_2.onWorkScheduled(current, a2)
    end
    for i, j in current do
        j.__count = j.__count + 1
    end
    local u25 = false
    local v1 = {}
    local v2 = {
        __call = function(a1_2, ...) -- Line: 236
            -- upvalues: u29 (upval), current (val), current_2 (ref), u31 (upval), a2 (ref), a1 (val), u25 (ref)
            local current_3 = u29.current
            u29.current = current
            current_2 = u31.current
            local success, result = pcall(function(...) -- Line: 243
                -- upvalues: current_2 (upval), current (upval), a2 (upval), a1 (upval), u29 (upval), current_3 (val)
                local u0 = nil
                local success, result = pcall(function() -- Line: 247 -- upvalues: current_2 (upval), current (upval), a2 (upval)
                    if current_2 ~= nil then
                        current_2.onWorkStarted(current, a2)
                    end
                end)
                local success_2, result_2 = pcall(function(...) -- Line: 254 -- upvalues: u0 (ref), a1 (upval)
                    u0 = a1(...)
                end, ...)
                u29.current = current_3
                if current_2 ~= nil then
                    current_2.onWorkStopped(current, a2)
                end
                if not success_2 then
                    error(result_2)
                end
                if not success then
                    error(result)
                end
                return u0
            end, ...)
            if not u25 then
                u25 = true
                for i, j in current do
                    j.__count = j.__count - 1
                    if current_2 ~= nil and j.__count == 0 then
                        current_2.onInteractionScheduledWorkCompleted(j)
                    end
                end
            end
            if not success then
                error(result)
            end
            return result
        end,
    }
    setmetatable(v1, v2)

    function v1.cancel() -- Line: 301 -- upvalues: current_2 (ref), u31 (upval), current (val), a2 (ref)
        current_2 = u31.current
        local success, result = pcall(function() -- Line: 304 -- upvalues: current_2 (upval), current (upval), a2 (upval)
            if current_2 ~= nil then
                current_2.onWorkCanceled(current, a2)
            end
        end)
        for i, j in current do
            j.__count = j.__count - 1
            if current_2 ~= nil and j.__count == 0 then
                current_2.onInteractionScheduledWorkCompleted(j)
            end
        end
        if not success then
            error(result)
        end
    end

    return v1
end

return v1