-- Script path: ReplicatedStorage.Shared.Modules.Scheduler
-- Decompile time: 4.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local FixedStep = require(script.FixedStep)
local NoYield = require(ReplicatedStorage.Shared.Modules.NoYield)
local Profiler = require(script.Profiler)
local u23 = {}
u23.customSchedule = require(script.CustomSchedule)
u23.disabledSystems = {}
u23.profiles = Profiler.profiles
u23._connections = {}
u23._callbacks = {}
u23._callbackNames = {}
u23.noYieldChecksEnabled = false
local u34 = {}

local function getSignalName(a1) -- Line: 37 -- upvalues: u34 (val) -- types: a1: userdata
    if u34[a1] then
        return u34[a1]
    end
    local v1 = tostring(a1):match("^Signal%s(.+)$")
    assert(v1, "Unable to get signal name")
    u34[a1] = v1
    return v1
end

local u36 = 0

local function getId() -- Line: 50 -- upvalues: u36 (ref)
    u36 = u36 + 1
    return string.format("%02x", u36)
end

function u23._execute(a1, ...) -- Line: 57 -- upvalues: u23 (val) -- types: a1: userdata
    local result, success
    local v1 = u23._callbacks[a1]
    if not v1 then
        return
    end
    for i, j in v1 do
        if not u23.disabledSystems[j] then
            success, result = xpcall(i, debug.traceback, ...)
            if not success then
                warn(result)
            end
        end
    end
end

function u23._addContext(a1) -- Line: 76 -- upvalues: u23 (val), u34 (val), Profiler (val) -- types: a1: userdata
    local v1
    if u23._connections[a1] then
        return false
    end
    if not u34[a1] then
        local v2 = tostring(a1):match("^Signal%s(.+)$")
        assert(v2, "Unable to get signal name")
        u34[a1] = v2
        v1 = v2
    else
        v1 = u34[a1]
    end
    if not Profiler.profiles[v1] then
        Profiler.profiles[v1] = {}
    end
    u23._connections[a1] = (a1:Connect(function(...) -- Line: 86 -- upvalues: u23 (upval), a1 (val)
        u23._execute(a1, ...)
    end))
    return true
end

function u23.getProfile(a1, a2) -- Line: 93 -- upvalues: Profiler (val) -- types: a1: string, a2: string
    return Profiler.getProfile(a2, a1)
end

function u23.profileCallback(a1, a2, ...) -- Line: 97 -- upvalues: Profiler (val) -- types: a1: string, a2: function
    local v1 = os.clock()
    a2(...)
    Profiler.updateProfile(a1, "Custom", os.clock() - v1)
end

function u23.customProfile(a1, a2) -- Line: 103 -- upvalues: Profiler (val) -- types: a1: string, a2: number
    Profiler.updateProfile(a1, "Custom", a2)
end

function u23.profile(a1, a2, a3) -- Line: 107 -- upvalues: Profiler (val) -- types: a1: string, a2: string, a3: number
    Profiler.updateProfile(a1, a2, a3)
end

function u23.setNoYieldChecksEnabled(a1) -- Line: 111 -- upvalues: u23 (val) -- types: a1: boolean
    u23.noYieldChecksEnabled = a1
end

local function runCallback(a1, ...) -- Line: 115 -- upvalues: u23 (val), NoYield (val)
    if u23.noYieldChecksEnabled then
        return NoYield(a1, ...)
    end
    return a1(...)
end

local function runProfiledCallback(a1, a2, a3, ...) -- Line: 123
    -- upvalues: runCallback (val), Profiler (val)
    local v1 = os.clock()
    local success, result = xpcall(runCallback, debug.traceback, a3, ...)
    Profiler.updateProfile(a1, a2, os.clock() - v1)
    if not success then
        error(result, 0)
    end
end

function u23.add(a1, a2, a3) -- Line: 133
    -- upvalues: u23 (val), u34 (val), runProfiledCallback (val), Profiler (val)
    local u37
    u23._addContext(a2)
    if not u23._callbacks[a2] then
        u23._callbacks[a2] = {}
    end
    if not u23._callbackNames[a2] then
        u23._callbackNames[a2] = {}
    end
    if not u34[a2] then
        local v1 = tostring(a2):match("^Signal%s(.+)$")
        assert(v1, "Unable to get signal name")
        u34[a2] = v1
        u37 = v1
    else
        u37 = u34[a2]
    end

    local function profiledCallback(...) -- Line: 146
        -- upvalues: runProfiledCallback (upval), a1 (val), u37 (val), a3 (val)
        runProfiledCallback(a1, u37, a3, ...)
    end

    local v2 = u23._callbackNames[a2][a1]
    if v2 then
        local v3 = u23._callbacks[a2]
        v3[v2] = nil
        Profiler.removeProfile(a1, u37)
    end
    u23._callbacks[a2][profiledCallback] = a1
    u23._callbackNames[a2][a1] = profiledCallback
    return function() -- Line: 159
        -- upvalues: u23 (upval), a2 (val), a1 (val), profiledCallback (val), Profiler (upval), u37 (val)
        local v1
        if u23._callbackNames[a2] then
            v1 = u23._callbackNames[a2][a1]
            if v1 == profiledCallback then
                v1 = u23._callbackNames[a2]
                v1[a1] = nil
            end
        end
        if u23._callbacks[a2] then
            v1 = u23._callbacks[a2][profiledCallback]
            if v1 == a1 then
                v1 = u23._callbacks[a2]
                v1[profiledCallback] = nil
                Profiler.removeProfile(a1, u37)
            end
        end
    end
end

function u23.addDynamic(a1, a2, a3) -- Line: 177
    -- upvalues: u23 (val), u36 (ref)
    local add = u23.add
    u36 = u36 + 1
    return add(("%*_%*"):format(a1, (string.format("%02x", u36))), a2, a3)
end

local u49 = {
    [Enum.StepFrequency.Hz1] = 1,
    [Enum.StepFrequency.Hz5] = 0.2,
    [Enum.StepFrequency.Hz10] = 0.1,
    [Enum.StepFrequency.Hz15] = 0.06666666666666667,
    [Enum.StepFrequency.Hz30] = 0.03333333333333333,
    [Enum.StepFrequency.Hz60] = 0.016666666666666666,
}

function u23.bindToSimulation(a1, a2, a3, a4) -- Line: 195
    -- upvalues: Profiler (val), u23 (val), runProfiledCallback (val), u49 (val), FixedStep (val), RunService (val)
    if not Profiler.profiles.Simulation then
        Profiler.profiles.Simulation = {}
    end
    local v1, u26 = FixedStep(u49[a3 or Enum.StepFrequency.Hz30] or 0.03333333333333333, function(a1_2) -- Line: 205
        -- upvalues: u23 (upval), a1 (val), runProfiledCallback (upval), a2 (val)
        if u23.disabledSystems[a1] then
            return
        end
        runProfiledCallback(a1, "Simulation", a2, a1_2)
    end)
    local u32 = RunService.Heartbeat:Connect(v1)
    return function() -- Line: 217 -- upvalues: u26 (val), u32 (val), Profiler (upval), a1 (val)
        u26()
        u32:Disconnect()
        Profiler.removeProfile(a1, "Simulation")
    end
end

function u23.bindToSimulationDynamic(a1, a2, a3, a4) -- Line: 224
    -- upvalues: u23 (val), u36 (ref)
    local bindToSimulation = u23.bindToSimulation
    u36 = u36 + 1
    return bindToSimulation(("%*_%*"):format(a1, (string.format("%02x", u36))), a2, a3, a4)
end

function u23.stop() -- Line: 233 -- upvalues: u23 (val)
    for i, j in u23._connections do
        j:Disconnect()
    end
    u23._connections = {}
    u23._callbacks = {}
    u23._callbackNames = {}
end

function u23.clear(a1) -- Line: 243 -- upvalues: u23 (val) -- types: a1: userdata
    u23.stop()
    u23.profiler = {}
end

return u23