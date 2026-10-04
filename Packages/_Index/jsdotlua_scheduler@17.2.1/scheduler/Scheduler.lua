-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.Scheduler
-- Decompile time: 9.50 ms

return function(a1) -- Line: 12
    local u92
    local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
    local SchedulerFeatureFlags = require(script.Parent:WaitForChild("SchedulerFeatureFlags"))
    local enableSchedulerDebugging = SchedulerFeatureFlags.enableSchedulerDebugging
    local enableProfiling = SchedulerFeatureFlags.enableProfiling
    local SchedulerHostConfig = a1 or require(script.Parent:WaitForChild("SchedulerHostConfig"))
    local requestHostCallback = SchedulerHostConfig.requestHostCallback
    local requestHostTimeout = SchedulerHostConfig.requestHostTimeout
    local cancelHostTimeout = SchedulerHostConfig.cancelHostTimeout
    local shouldYieldToHost = SchedulerHostConfig.shouldYieldToHost
    local getCurrentTime = SchedulerHostConfig.getCurrentTime
    local forceFrameRate = SchedulerHostConfig.forceFrameRate
    local requestPaint = SchedulerHostConfig.requestPaint
    local u38 = nil
    local u39 = nil
    local u40 = nil

    local function v1(a1, a2) -- Line: 42 -- upvalues: u39 (ref) -- types: a1: table, a2: table
        local v1 = #a1 + 1
        a1[v1] = a2
        u39(a1, a2, v1)
    end

    local function v2(a1) -- Line: 49 -- types: a1: table
        return a1[1]
    end

    local function v3(a1) -- Line: 53 -- upvalues: u40 (ref) -- types: a1: table
        local v1 = a1[1]
        if v1 == nil then
            return nil
        end
        local v2 = a1[#a1]
        a1[#a1] = nil
        if v2 ~= v1 then
            a1[1] = v2
            u40(a1, v2, 1)
        end
        return v1
    end

    function u39(a1, a2, a3) -- Line: 69 -- upvalues: u38 (ref) -- types: a1: table, a2: table, a3: number
        local v1, v2
        while true do
            v1 = math.floor(a3 / 2)
            v2 = a1[v1]
            if v2 == nil or not (0 < (u38(v2, a2))) then
                break
            end
            a1[v1] = a2
            a1[a3] = v2
        end
    end

    function u40(a1, a2, a3) -- Line: 85 -- upvalues: u38 (ref) -- types: a1: table, a2: table, a3: number
        local v1, v2, v3, v4
        local v5 = #a1
        local v6, v7, v8 = a3, a1, a2
        while v6 < v5 do
            v1 = v6 * 2
            v2 = v7[v1]
            v3 = v1 + 1
            v4 = v7[v3]
            if v2 ~= nil and (u38(v2, v8)) < 0 then
                if v4 == nil or not ((u38(v4, v2)) < 0) then
                    v7[v6] = v2
                    v7[v1] = v8
                    v6 = v1
                else
                    v7[v6] = v4
                    v7[v3] = v8
                    v6 = v3
                end
                continue
            end
            if v4 ~= nil and (u38(v4, v8)) < 0 then
                v7[v6] = v4
                v7[v3] = v8
                v6 = v3
                continue
            end
            return
        end
    end

    function u38(a1, a2) -- Line: 115 -- types: a1: table, a2: table
        local v1 = a1.sortIndex - a2.sortIndex
        if v1 == 0 then
            return a1.id - a2.id
        end
        return v1
    end

    local SchedulerPriorities = require(script.Parent:WaitForChild("SchedulerPriorities"))
    local ImmediatePriority = SchedulerPriorities.ImmediatePriority
    local UserBlockingPriority = SchedulerPriorities.UserBlockingPriority
    local NormalPriority = SchedulerPriorities.NormalPriority
    local LowPriority = SchedulerPriorities.LowPriority
    local IdlePriority = SchedulerPriorities.IdlePriority
    local SchedulerProfiling = require(script.Parent:WaitForChild("SchedulerProfiling"))
    local markTaskRun = SchedulerProfiling.markTaskRun
    local markTaskYield = SchedulerProfiling.markTaskYield
    local markTaskCompleted = SchedulerProfiling.markTaskCompleted
    local markTaskCanceled = SchedulerProfiling.markTaskCanceled
    local markTaskErrored = SchedulerProfiling.markTaskErrored
    local markSchedulerSuspended = SchedulerProfiling.markSchedulerSuspended
    local markSchedulerUnsuspended = SchedulerProfiling.markSchedulerUnsuspended
    local markTaskStart = SchedulerProfiling.markTaskStart
    local stopLoggingProfilingEvents = SchedulerProfiling.stopLoggingProfilingEvents
    local startLoggingProfilingEvents = SchedulerProfiling.startLoggingProfilingEvents
    local u78 = {}
    local u79 = {}
    local u80 = 1
    local u81 = false
    local u82 = nil
    local u83 = NormalPriority
    local u84 = false
    local u85 = false
    local u86 = false
    local u88 = nil
    local u89 = nil

    local function advanceTimers(a1) -- Line: 182
        -- upvalues: u79 (val), u40 (ref), u78 (val), u39 (ref), enableProfiling (val), markTaskStart (val)
        local v1, v2, v3
        local v4 = u79[1]
        local v5 = a1
        while v4 ~= nil do
            if v4.callback == nil then
                v1 = u79
                v2 = v1[1]
                if v2 ~= nil then
                    v3 = v1[#v1]
                    v1[#v1] = nil
                    if v3 ~= v2 then
                        v1[1] = v3
                        u40(v1, v3, 1)
                    end
                end
                v4 = u79[1]
            elseif not (v4.startTime <= v5) then
                return
            else
                v1 = u79
                v2 = v1[1]
                if v2 ~= nil then
                    v3 = v1[#v1]
                    v1[#v1] = nil
                    if v3 ~= v2 then
                        v1[1] = v3
                        u40(v1, v3, 1)
                    end
                end
                v4.sortIndex = v4.expirationTime
                v1 = u78
                v3 = #v1 + 1
                v1[v3] = v4
                u39(v1, v4, v3)
                if enableProfiling then
                    markTaskStart(v4, v5)
                    v4.isQueued = true
                end
                v4 = u79[1]
            end
        end
    end

    function u92(a1) -- Line: 208
        -- upvalues: u86 (ref), advanceTimers (val), u85 (ref), u78 (val), requestHostCallback (val), u88 (ref)
        -- upvalues: u79 (val), requestHostTimeout (val), u92 (ref)
        u86 = false
        advanceTimers(a1)
        if not u85 then
            if u78[1] ~= nil then
                u85 = true
                requestHostCallback(u88)
                return
            end
            local v1 = u79[1]
            if v1 ~= nil then
                requestHostTimeout(u92, v1.startTime - a1)
            end
        end
    end

    function u88(a1, a2) -- Line: 225
        -- upvalues: enableProfiling (val), markSchedulerUnsuspended (val), u85 (ref), u86 (ref)
        -- upvalues: cancelHostTimeout (val), u84 (ref), u83 (ref), u89 (ref), describeError (val), u82 (ref)
        -- upvalues: getCurrentTime (val), markTaskErrored (val), markSchedulerSuspended (val)
        local v1, v2
        if enableProfiling then
            markSchedulerUnsuspended(a2)
        end
        u85 = false
        if u86 then
            u86 = false
            cancelHostTimeout()
        end
        u84 = true
        local v3 = u83
        if _G.__YOLO__ or not enableProfiling then
            v1 = true
            v2 = u89(a1, a2)
        else
            local success, result = xpcall(u89, describeError, a1, a2)
            v2 = result
            if not success and u82 ~= nil then
                local v4 = getCurrentTime()
                markTaskErrored(u82, v4)
                u82.isQueued = false
            end
        end
        u82 = nil
        u83 = v3
        u84 = false
        if enableProfiling then
            markSchedulerSuspended((getCurrentTime()))
        end
        if not v1 then
            error(v2)
        end
        return v2
    end

    function u89(a1, a2) -- Line: 282
        -- upvalues: advanceTimers (val), u82 (ref), u78 (val), enableSchedulerDebugging (val), u81 (ref)
        -- upvalues: shouldYieldToHost (val), u83 (ref), markTaskRun (val), getCurrentTime (val), markTaskYield (val)
        -- upvalues: enableProfiling (val), markTaskCompleted (val), u40 (ref), u79 (val), requestHostTimeout (val)
        -- upvalues: u92 (ref)
        local callback, v1, v2, v3, v4, v5, v6
        local v7 = a2
        advanceTimers(v7)
        u82 = u78[1]
        while u82 ~= nil do
            if enableSchedulerDebugging and u81 then
                break
            end
            if v7 < u82.expirationTime and (not v1 or shouldYieldToHost()) then
                break
            end
            callback = u82.callback
            if typeof(callback) ~= "function" then
                v2 = u78
                v3 = v2[1]
                if v3 ~= nil then
                    v4 = v2[#v2]
                    v2[#v2] = nil
                    if v4 ~= v3 then
                        v2[1] = v4
                        u40(v2, v4, 1)
                    end
                end
            else
                u82.callback = nil
                u83 = u82.priorityLevel
                v2 = u82.expirationTime <= v7
                markTaskRun(u82, v7)
                v3 = callback(v2)
                v7 = getCurrentTime()
                if typeof(v3) ~= "function" then
                    if enableProfiling then
                        markTaskCompleted(u82, v7)
                        u82.isQueued = false
                    end
                    if u82 == u78[1] then
                        v4 = u78
                        v5 = v4[1]
                        if v5 ~= nil then
                            v6 = v4[#v4]
                            v4[#v4] = nil
                            if v6 ~= v5 then
                                v4[1] = v6
                                u40(v4, v6, 1)
                            end
                        end
                    end
                else
                    u82.callback = v3
                    markTaskYield(u82, v7)
                end
                advanceTimers(v7)
            end
            u82 = u78[1]
        end
        if u82 ~= nil then
            return true
        end
        local v8 = u79[1]
        if v8 ~= nil then
            requestHostTimeout(u92, v8.startTime - v7)
        end
        return false
    end

    return {
        unstable_ImmediatePriority = ImmediatePriority,
        unstable_UserBlockingPriority = UserBlockingPriority,
        unstable_NormalPriority = NormalPriority,
        unstable_IdlePriority = IdlePriority,
        unstable_LowPriority = LowPriority,
        unstable_runWithPriority = function(a1, a2) -- Line: 339
            -- upvalues: ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val), LowPriority (val)
            -- upvalues: IdlePriority (val), u83 (ref), describeError (val)
            local v1, v2
            if a1 ~= ImmediatePriority
                and a1 ~= UserBlockingPriority
                and a1 ~= NormalPriority
                and a1 ~= LowPriority
                and a1 ~= IdlePriority then
                a1 = NormalPriority
            end
            local v3 = u83
            u83 = a1
            if _G.__YOLO__ then
                v1 = true
                v2 = a2()
            else
                local success, result = xpcall(a2, describeError)
                v1 = success
                v2 = result
            end
            u83 = v3
            if not v1 then
                error(v2)
            end
            return v2
        end,
        unstable_next = function(a1) -- Line: 374
            -- upvalues: u83 (ref), ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val)
            -- upvalues: describeError (val)
            local v1, v2
            local v3 = if u83 == ImmediatePriority then NormalPriority else if u83 == UserBlockingPriority then NormalPriority else if u83 ~= NormalPriority then u83 else NormalPriority
            local v4 = u83
            u83 = v3
            if _G.__YOLO__ then
                v1 = true
                v2 = a1()
            else
                local success, result = xpcall(a1, describeError)
                v1 = success
                v2 = result
            end
            u83 = v4
            if not v1 then
                error(v2)
            end
            return v2
        end,
        unstable_scheduleCallback = function(a1, a2, a3) -- Line: 438
            -- upvalues: getCurrentTime (val), ImmediatePriority (val), UserBlockingPriority (val), IdlePriority (val)
            -- upvalues: LowPriority (val), u80 (ref), enableProfiling (val), u79 (val), u39 (ref), u78 (val), u86 (ref)
            -- upvalues: cancelHostTimeout (val), requestHostTimeout (val), u92 (ref), markTaskStart (val), u85 (ref)
            -- upvalues: u84 (ref), requestHostCallback (val), u88 (ref)
            local v1, v2, v3
            local v4 = getCurrentTime()
            if typeof(a3) ~= "table" then
                v1 = v4
            else
                local delay = a3.delay
                v1 = if typeof(delay) ~= "number" then v4 else if not (delay > 0) then v4 else v4 + delay
            end
            local v5 = v1 + (if a1 ~= ImmediatePriority then if a1 ~= UserBlockingPriority then if a1 ~= IdlePriority then if a1 ~= LowPriority then 5000 else 10000 else 1073741823 else 250 else -1)
            local v6 = {
                sortIndex = -1,
                id = u80,
                callback = a2,
                priorityLevel = a1,
                startTime = v1,
                expirationTime = v5,
            }
            u80 = u80 + 1
            if enableProfiling then
                v6.isQueued = false
            end
            if v4 < v1 then
                v6.sortIndex = v1
                v2 = u79
                v3 = #v2 + 1
                v2[v3] = v6
                u39(v2, v6, v3)
                if #u78 == 0 and v6 == u79[1] then
                    if not u86 then
                        u86 = true
                    else
                        cancelHostTimeout()
                    end
                    requestHostTimeout(u92, v1 - v4)
                    return v6
                end
                return v6
            end
            v6.sortIndex = v5
            v2 = u78
            v3 = #v2 + 1
            v2[v3] = v6
            u39(v2, v6, v3)
            if enableProfiling then
                markTaskStart(v6, v4)
                v6.isQueued = true
            end
            if not u85 and not u84 then
                u85 = true
                requestHostCallback(u88)
            end
            return v6
        end,
        unstable_cancelCallback = function(a1) -- Line: 534 -- upvalues: enableProfiling (val), getCurrentTime (val), markTaskCanceled (val)
            if enableProfiling and a1.isQueued then
                markTaskCanceled(a1, (getCurrentTime()))
                a1.isQueued = false
            end
            a1.callback = nil
        end,
        unstable_wrapCallback = function(a1) -- Line: 410 -- upvalues: u83 (ref), describeError (val)
            local u1 = u83
            return function(...) -- Line: 413 -- upvalues: u83 (upval), u1 (val), a1 (val), describeError (upval)
                local v1, v2
                local v3 = u83
                u83 = u1
                if _G.__YOLO__ then
                    v1 = true
                    v2 = a1(...)
                else
                    local success, result = xpcall(a1, describeError, ...)
                    v1 = success
                    v2 = result
                end
                u83 = v3
                if not v1 then
                    error(v2)
                end
                return v2
            end
        end,
        unstable_getCurrentPriorityLevel = function() -- Line: 549 -- upvalues: u83 (ref)
            return u83
        end,
        unstable_shouldYield = shouldYieldToHost,
        unstable_requestPaint = requestPaint,
        unstable_continueExecution = function() -- Line: 522 -- upvalues: u81 (ref), u85 (ref), u84 (ref), requestHostCallback (val), u88 (ref)
            u81 = false
            if not u85 and not u84 then
                u85 = true
                requestHostCallback(u88)
            end
        end,
        unstable_pauseExecution = function() -- Line: 518 -- upvalues: u81 (ref)
            u81 = true
        end,
        unstable_getFirstCallbackNode = function() -- Line: 530 -- upvalues: u78 (val)
            return u78[1]
        end,
        unstable_now = getCurrentTime,
        unstable_forceFrameRate = forceFrameRate,
        unstable_Profiling = if not enableProfiling then nil else {
            startLoggingProfilingEvents = startLoggingProfilingEvents,
            stopLoggingProfilingEvents = stopLoggingProfilingEvents,
        },
    }
end