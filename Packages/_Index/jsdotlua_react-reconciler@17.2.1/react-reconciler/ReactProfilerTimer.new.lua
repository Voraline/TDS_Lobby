-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactProfilerTimer.new
-- Decompile time: 2.44 ms

require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local enableProfilerCommitHooks = ReactFeatureFlags.enableProfilerCommitHooks
local Profiler = require(script.Parent:WaitForChild("ReactWorkTags")).Profiler
local unstable_now = require(script.Parent.Parent:WaitForChild("scheduler")).unstable_now
local u39 = 0
local u40 = -1
local u41 = -1
local u42 = -1

function getCommitTime() -- Line: 41 -- upvalues: u39 (ref)
    return u39
end

function recordCommitTime() -- Line: 45 -- upvalues: enableProfilerTimer (val), u39 (ref), unstable_now (val)
    if not enableProfilerTimer then
        return
    end
    u39 = unstable_now()
end

function startProfilerTimer(a1) -- Line: 52 -- upvalues: enableProfilerTimer (val), u41 (ref), unstable_now (val)
    if not enableProfilerTimer then
        return
    end
    u41 = unstable_now()
    if a1.actualStartTime ~= nil and a1.actualStartTime < 0 then
        a1.actualStartTime = unstable_now()
    end
end

function stopProfilerTimerIfRunning(a1) -- Line: 65 -- upvalues: enableProfilerTimer (val), u41 (ref)
    if not enableProfilerTimer then
        return
    end
    u41 = -1
end

function stopProfilerTimerIfRunningAndRecordDelta(a1, a2) -- Line: 72
    -- upvalues: enableProfilerTimer (val), u41 (ref), unstable_now (val)
    if not enableProfilerTimer then
        return
    end
    if u41 >= 0 then
        local v1 = unstable_now() - u41
        a1.actualDuration = a1.actualDuration + v1
        if a2 then
            a1.selfBaseDuration = v1
        end
        u41 = -1
    end
end

function recordLayoutEffectDuration(a1) -- Line: 90
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u40 (ref), unstable_now (val)
    -- upvalues: Profiler (val)
    if enableProfilerTimer and enableProfilerCommitHooks then
        if u40 >= 0 then
            local stateNode
            local v1 = unstable_now() - u40
            u40 = -1
            local return_ = a1.return_
            while return_ ~= nil do
                if return_.tag == Profiler then
                    stateNode = return_.stateNode
                    stateNode.effectDuration = stateNode.effectDuration + v1
                    return
                end
                return_ = return_.return_
            end
        end
        return
    end
end

function recordPassiveEffectDuration(a1) -- Line: 113
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u42 (ref), unstable_now (val)
    -- upvalues: Profiler (val)
    if enableProfilerTimer and enableProfilerCommitHooks then
        if u42 >= 0 then
            local stateNode
            local v1 = unstable_now() - u42
            u42 = -1
            local return_ = a1.return_
            while return_ ~= nil do
                if return_.tag == Profiler then
                    stateNode = return_.stateNode
                    if stateNode == nil then
                        break
                    end
                    stateNode.passiveEffectDuration = stateNode.passiveEffectDuration + v1
                    return
                end
                return_ = return_.return_
            end
        end
        return
    end
end

function startLayoutEffectTimer() -- Line: 141
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u40 (ref), unstable_now (val)
    if enableProfilerTimer and enableProfilerCommitHooks then
        u40 = unstable_now()
        return
    end
end

function startPassiveEffectTimer() -- Line: 148
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u42 (ref), unstable_now (val)
    if enableProfilerTimer and enableProfilerCommitHooks then
        u42 = unstable_now()
        return
    end
end

function transferActualDuration(a1) -- Line: 155
    local child = a1.child
    while child do
        a1.actualDuration = a1.actualDuration + child.actualDuration
        child = child.sibling
    end
end

return {
    getCommitTime = getCommitTime,
    recordCommitTime = recordCommitTime,
    recordLayoutEffectDuration = recordLayoutEffectDuration,
    recordPassiveEffectDuration = recordPassiveEffectDuration,
    startLayoutEffectTimer = startLayoutEffectTimer,
    startPassiveEffectTimer = startPassiveEffectTimer,
    startProfilerTimer = startProfilerTimer,
    stopProfilerTimerIfRunning = stopProfilerTimerIfRunning,
    stopProfilerTimerIfRunningAndRecordDelta = stopProfilerTimerIfRunningAndRecordDelta,
    transferActualDuration = transferActualDuration,
}