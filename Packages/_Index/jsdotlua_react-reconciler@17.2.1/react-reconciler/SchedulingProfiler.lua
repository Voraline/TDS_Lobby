-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.SchedulingProfiler
-- Decompile time: 2.88 ms

local v1 = {}
local WeakMap = require(script.Parent.Parent:WaitForChild("luau-polyfill")).WeakMap
require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent.Parent:WaitForChild("shared"))
local enableSchedulingProfiler = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulingProfiler
local ReactVersion = require(script.Parent.Parent:WaitForChild("shared")).ReactVersion
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local u70 = _G.performance ~= nil
local performance = _G.performance
if not performance then
    performance = {}

    function performance.mark(a1) -- Line: 39
        debug.profilebegin(a1)
        debug.profileend()
    end
end

function formatLanes(a1) -- Line: 45
    return (tostring(a1))
end

if enableSchedulingProfiler and u70 then
    performance.mark("--react-init-" .. tostring(ReactVersion))
end

function v1.markCommitStarted(a1) -- Line: 56 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--commit-start-" .. formatLanes(a1))
    end
end

function v1.markCommitStopped() -- Line: 64 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--commit-stop")
    end
end

local u102 = WeakMap.new()
local u103 = 0

function getWakeableID(a1) -- Line: 78 -- upvalues: u102 (val), u103 (ref)
    if not u102:has(a1) then
        u102:set(a1, u103)
        u103 = u103 + 1
    end
    return u102:get(a1)
end

function v1.markComponentSuspended(a1, a2) -- Line: 86
    -- upvalues: enableSchedulingProfiler (val), u70 (val), getComponentName (val), performance (val)
    if enableSchedulingProfiler and u70 then
        local u6 = getWakeableID(a2)
        local u10 = getComponentName(a1.type) or "Unknown"
        performance.mark("--suspense-suspend-" .. (tostring(u6)) .. "-" .. u10)
        a2:andThen(function() -- Line: 95 -- upvalues: performance (upval), u6 (val), u10 (val)
            performance.mark("--suspense-resolved-" .. (tostring(u6)) .. "-" .. u10)
        end, function() -- Line: 99 -- upvalues: performance (upval), u6 (val), u10 (val)
            performance.mark("--suspense-rejected-" .. (tostring(u6)) .. "-" .. u10)
        end)
    end
end

function v1.markLayoutEffectsStarted(a1) -- Line: 108
    -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--layout-effects-start-" .. formatLanes(a1))
    end
end

function v1.markLayoutEffectsStopped() -- Line: 116
    -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--layout-effects-stop")
    end
end

function v1.markPassiveEffectsStarted(a1) -- Line: 124
    -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--passive-effects-start-" .. formatLanes(a1))
    end
end

function v1.markPassiveEffectsStopped() -- Line: 132
    -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--passive-effects-stop")
    end
end

function v1.markRenderStarted(a1) -- Line: 140 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--render-start-" .. formatLanes(a1))
    end
end

function v1.markRenderYielded() -- Line: 148 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--render-yield")
    end
end

function v1.markRenderStopped() -- Line: 156 -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--render-stop")
    end
end

function v1.markRenderScheduled(a1) -- Line: 164
    -- upvalues: enableSchedulingProfiler (val), u70 (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--schedule-render-" .. formatLanes(a1))
    end
end

function v1.markForceUpdateScheduled(a1, a2) -- Line: 172
    -- upvalues: enableSchedulingProfiler (val), u70 (val), getComponentName (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--schedule-forced-update-" .. (formatLanes(a2)) .. "-" .. (getComponentName(a1.type) or "Unknown"))
    end
end

function v1.markStateUpdateScheduled(a1, a2) -- Line: 184
    -- upvalues: enableSchedulingProfiler (val), u70 (val), getComponentName (val), performance (val)
    if enableSchedulingProfiler and u70 then
        performance.mark("--schedule-state-update-" .. (formatLanes(a2)) .. "-" .. (getComponentName(a1.type) or "Unknown"))
    end
end

return v1