-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.DebugTracing
-- Decompile time: 2.85 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = {}
local log = nil
require(script.Parent:WaitForChild("ReactFiberLane"))
local enableDebugTracing = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableDebugTracing
local u31 = nil
local u32 = {}
local u33 = 0

function decimalToBinaryString(a1) -- Line: 39 -- types: a1: number
    local v1, v2
    local v3 = ""
    repeat
        v1, v2 = math.modf(a1 / 2)
        v3 = (math.ceil(v2)) .. v3
    until v1 == 0
    return (string.rep("0", 31 - (string.len(v3)))) .. v3
end

local function formatLanes(a1) -- Line: 52
    return "0b" .. decimalToBinaryString(a1)
end

local function group(...) -- Line: 58 -- upvalues: u32 (val), u31 (ref), console (val), log (ref)
    for i, j in {...} do
        table.insert(u32, j)
    end
    if u31 == nil then
        u31 = console.log
        console.log = log
    end
end

local function groupEnd() -- Line: 68 -- upvalues: u32 (val), u33 (ref), console (val), u31 (ref)
    local v1
    table.remove(u32, 1)
    while true do
        v1 = u33
        if not (#u32 < v1) then
            break
        end
        console.groupEnd()
        u33 = u33 - 1
    end
    if #u32 == 0 then
        console.log = u31
        u31 = nil
    end
end

function log(...) -- Line: 80 -- upvalues: u33 (ref), u32 (val), console (val), u31 (ref)
    if u33 < #u32 then
        local v1 = u33 + 1
        local v2 = #u32
        for i = v1, v2 do
            console.group(u32[i])
        end
        u33 = #u32
    end
    if typeof(u31) == "function" then
        u31(...)
        return
    end
    console.log(...)
end

function v1.logCommitStarted(a1) -- Line: 98 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        group(string.format("* commit (%s)", "0b" .. decimalToBinaryString(a1)), "", "", "")
    end
end

function v1.logCommitStopped() -- Line: 113 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end

function v1.logComponentSuspended(a1, a2) -- Line: 141
    -- upvalues: enableDebugTracing (val), log (ref)
    if _G.__DEV__ and enableDebugTracing then
        log(string.format("* %s suspended", a1))
        a2:andThen(function() -- Line: 155 -- upvalues: log (upval), a1 (val)
            log(string.format("* %s resolved", a1))
        end, function() -- Line: 164 -- upvalues: log (upval), a1 (val)
            log(string.format("* %s rejected", a1))
        end)
    end
end

function v1.logLayoutEffectsStarted(a1) -- Line: 179 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        group(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(a1)))
    end
end

function v1.logLayoutEffectsStopped() -- Line: 194 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end

function v1.logPassiveEffectsStarted(a1) -- Line: 203 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        group(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(a1)))
    end
end

function v1.logPassiveEffectsStopped() -- Line: 218 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end

function v1.logRenderStarted(a1) -- Line: 227 -- upvalues: enableDebugTracing (val), group (val)
    if _G.__DEV__ and enableDebugTracing then
        group(string.format("* render (%s)", "0b" .. decimalToBinaryString(a1)))
    end
end

function v1.logRenderStopped() -- Line: 242 -- upvalues: enableDebugTracing (val), groupEnd (val)
    if _G.__DEV__ and enableDebugTracing then
        groupEnd()
    end
end

function v1.logForceUpdateScheduled(a1, a2) -- Line: 251
    -- upvalues: enableDebugTracing (val), log (ref)
    if _G.__DEV__ and enableDebugTracing then
        log(string.format("* %s forced update (%s)", a1, "0b" .. decimalToBinaryString(a2)))
    end
end

function v1.logStateUpdateScheduled(a1, a2, a3) -- Line: 266
    -- upvalues: enableDebugTracing (val), log (ref)
    if _G.__DEV__ and enableDebugTracing then
        log(string.format("* %s updated state (%s)", a1, "0b" .. decimalToBinaryString(a2)))
    end
end

return v1