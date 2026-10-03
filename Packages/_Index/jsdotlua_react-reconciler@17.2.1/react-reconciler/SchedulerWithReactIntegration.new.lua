-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.SchedulerWithReactIntegration.new
-- Decompile time: 5.60 ms

local Array = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array
require(script.Parent:WaitForChild("ReactInternalTypes"))
local scheduler = require(script.Parent.Parent:WaitForChild("scheduler"))
local decoupleUpdatePriorityFromScheduler = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local SyncLanePriority = ReactFiberLane.SyncLanePriority
local getCurrentUpdateLanePriority = ReactFiberLane.getCurrentUpdateLanePriority
local setCurrentUpdateLanePriority = ReactFiberLane.setCurrentUpdateLanePriority
local unstable_runWithPriority = scheduler.unstable_runWithPriority
local unstable_scheduleCallback = scheduler.unstable_scheduleCallback
local unstable_cancelCallback = scheduler.unstable_cancelCallback
local unstable_shouldYield = scheduler.unstable_shouldYield
local unstable_requestPaint = scheduler.unstable_requestPaint
local unstable_now = scheduler.unstable_now
local unstable_getCurrentPriorityLevel = scheduler.unstable_getCurrentPriorityLevel
local unstable_ImmediatePriority = scheduler.unstable_ImmediatePriority
local unstable_UserBlockingPriority = scheduler.unstable_UserBlockingPriority
local unstable_NormalPriority = scheduler.unstable_NormalPriority
local unstable_LowPriority = scheduler.unstable_LowPriority
local unstable_IdlePriority = scheduler.unstable_IdlePriority
local v1 = require(script.Parent:WaitForChild("ReactFiberSchedulerPriorities.roblox"))
local ImmediatePriority = v1.ImmediatePriority
local UserBlockingPriority = v1.UserBlockingPriority
local NormalPriority = v1.NormalPriority
local LowPriority = v1.LowPriority
local IdlePriority = v1.IdlePriority
local NoPriority = v1.NoPriority
local u95 = nil
local u96 = {}
local v2 = if unstable_requestPaint == nil then function() end else unstable_requestPaint
local u100 = nil
local u101 = nil
local u102 = false
local u105 = unstable_now()

function reactPriorityToSchedulerPriority(a1) -- Line: 139
    -- upvalues: ImmediatePriority (val), unstable_ImmediatePriority (val), UserBlockingPriority (val)
    -- upvalues: unstable_UserBlockingPriority (val), NormalPriority (val), unstable_NormalPriority (val)
    -- upvalues: LowPriority (val), unstable_LowPriority (val), IdlePriority (val), unstable_IdlePriority (val)
    -- upvalues: invariant (val)
    if a1 == ImmediatePriority then
        return unstable_ImmediatePriority
    end
    if a1 == UserBlockingPriority then
        return unstable_UserBlockingPriority
    end
    if a1 == NormalPriority then
        return unstable_NormalPriority
    end
    if a1 == LowPriority then
        return unstable_LowPriority
    end
    if a1 == IdlePriority then
        return unstable_IdlePriority
    end
    invariant(false, "Unknown priority level.")
    return nil
end

local function runWithPriority(a1, a2) -- Line: 158 -- upvalues: unstable_runWithPriority (val) -- types: a2: function
    return unstable_runWithPriority(reactPriorityToSchedulerPriority(a1), a2)
end

local function flushSyncCallbackQueue() -- Line: 200 -- upvalues: u101 (ref), unstable_cancelCallback (val), u95 (ref)
    if u101 ~= nil then
        local v1 = u101
        u101 = nil
        unstable_cancelCallback(v1)
    end
    return u95()
end

function u95() -- Line: 209
    -- upvalues: u102 (ref), u100 (ref), decoupleUpdatePriorityFromScheduler (val), getCurrentUpdateLanePriority (val)
    -- upvalues: setCurrentUpdateLanePriority (val), SyncLanePriority (val), runWithPriority (val), describeError (val)
    -- upvalues: ImmediatePriority (val), unstable_runWithPriority (val), Array (val), unstable_scheduleCallback (val)
    -- upvalues: unstable_ImmediatePriority (val), flushSyncCallbackQueue (val)
    if not u102 and u100 ~= nil then
        local v1, v2
        u102 = true
        local u3 = 1
        if not decoupleUpdatePriorityFromScheduler then
            v2 = nil
            if _G.__YOLO__ then
                v1 = true
                local u78 = u100
                unstable_runWithPriority(reactPriorityToSchedulerPriority(ImmediatePriority), function() -- Line: 306 -- upvalues: u78 (val), u3 (ref)
                    local v1 = nil
                    local v2 = nil
                    for i, j in u78, v1, v2 do
                        u3 = i
                        repeat
                            j = j(true)
                        until j == nil
                    end
                end)
            else
                local u66 = u100
                local success_2, result_2 = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 290 -- upvalues: u66 (val), u3 (ref)
                    local v1 = nil
                    local v2 = nil
                    for i, j in u66, v1, v2 do
                        u3 = i
                        repeat
                            j = j(true)
                        until j == nil
                    end
                end)
                v1 = success_2
                v2 = result_2
            end
            u100 = nil
            u102 = false
            if not v1 then
                if u100 ~= nil then
                    u100 = Array.slice(u100, u3 + 1)
                end
                unstable_scheduleCallback(unstable_ImmediatePriority, flushSyncCallbackQueue)
                error(v2)
            end
        else
            v1 = getCurrentUpdateLanePriority()
            local v3 = nil
            if _G.__YOLO__ then
                v2 = true
                local u26 = u100
                setCurrentUpdateLanePriority(SyncLanePriority)
                unstable_runWithPriority(reactPriorityToSchedulerPriority(ImmediatePriority), function() -- Line: 248 -- upvalues: u26 (val), u3 (ref)
                    local v1 = nil
                    local v2 = nil
                    for i, j in u26, v1, v2 do
                        u3 = i
                        repeat
                            j = j(true)
                        until j == nil
                        u3 = u3 + 1
                    end
                end)
            else
                local u11 = u100
                setCurrentUpdateLanePriority(SyncLanePriority)
                local success, result = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 230 -- upvalues: u11 (val), u3 (ref)
                    local v1 = nil
                    local v2 = nil
                    for i, j in u11, v1, v2 do
                        u3 = i
                        repeat
                            j = j(true)
                        until j == nil
                    end
                end)
                v2 = success
                v3 = result
            end
            u100 = nil
            setCurrentUpdateLanePriority(v1)
            u102 = false
            if not v2 then
                if u100 ~= nil then
                    u100 = Array.slice(u100, u3 + 1)
                end
                unstable_scheduleCallback(unstable_ImmediatePriority, flushSyncCallbackQueue)
                error(v3)
            end
        end
        return true
    end
    return false
end

return {
    ImmediatePriority = ImmediatePriority,
    UserBlockingPriority = UserBlockingPriority,
    NormalPriority = NormalPriority,
    LowPriority = LowPriority,
    IdlePriority = IdlePriority,
    NoPriority = NoPriority,
    getCurrentPriorityLevel = function() -- Line: 120
        -- upvalues: unstable_getCurrentPriorityLevel (val), unstable_ImmediatePriority (val), ImmediatePriority (val)
        -- upvalues: unstable_UserBlockingPriority (val), UserBlockingPriority (val), unstable_NormalPriority (val)
        -- upvalues: NormalPriority (val), unstable_LowPriority (val), LowPriority (val), unstable_IdlePriority (val)
        -- upvalues: IdlePriority (val), invariant (val), NoPriority (val)
        local v1 = unstable_getCurrentPriorityLevel()
        if v1 == unstable_ImmediatePriority then
            return ImmediatePriority
        end
        if v1 == unstable_UserBlockingPriority then
            return UserBlockingPriority
        end
        if v1 == unstable_NormalPriority then
            return NormalPriority
        end
        if v1 == unstable_LowPriority then
            return LowPriority
        end
        if v1 == unstable_IdlePriority then
            return IdlePriority
        end
        invariant(false, "Unknown priority level.")
        return NoPriority
    end,
    flushSyncCallbackQueue = flushSyncCallbackQueue,
    runWithPriority = runWithPriority,
    scheduleCallback = function(a1, a2, a3) -- Line: 166 -- upvalues: unstable_scheduleCallback (val) -- types: a2: function, a3: table?
        return unstable_scheduleCallback(reactPriorityToSchedulerPriority(a1), a2, a3)
    end,
    scheduleSyncCallback = function(a1) -- Line: 175
        -- upvalues: u100 (ref), u101 (ref), unstable_scheduleCallback (val), unstable_ImmediatePriority (val)
        -- upvalues: u95 (ref), u96 (val)
        if u100 ~= nil then
            table.insert(u100, a1)
        else
            u100 = {a1}
            u101 = unstable_scheduleCallback(unstable_ImmediatePriority, u95)
        end
        return u96
    end,
    cancelCallback = function(a1) -- Line: 194 -- upvalues: u96 (val), unstable_cancelCallback (val)
        if a1 ~= u96 then
            unstable_cancelCallback(a1)
        end
    end,
    now = function() -- Line: 116 -- upvalues: unstable_now (val), u105 (val)
        return unstable_now() - u105
    end,
    requestPaint = v2,
    shouldYield = unstable_shouldYield,
}