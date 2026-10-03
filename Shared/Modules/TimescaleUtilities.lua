-- Script path: ReplicatedStorage.Shared.Modules.TimescaleUtilities
-- Decompile time: 3.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u20 = {}
local u23 = RunService:IsServer()
local u27 = setmetatable({}, {__mode = "kv"})
local u31 = setmetatable({}, {__mode = "kv"})

local function currentTimeScale() -- Line: 15 -- upvalues: u23 (val), GameState (val)
    if u23 then
        return GameState.TimeScale or 1
    end
    local State = GameState.State
    return State and State.TimeScale or GameState.TimeScale or 1
end

function u20._registerNPCThread(a1, a2) -- Line: 23 -- upvalues: u27 (val) -- types: a1: thread
    if a1 then
        u27[a1] = a2
    end
end

function u20._registerNPCSubThread(a1, a2) -- Line: 29 -- upvalues: u31 (val) -- types: a1: thread
    if a1 then
        u31[a1] = a2
    end
end

function u20.Wait(a1) -- Line: 35 -- upvalues: u27 (val), u31 (val), u23 (val), GameState (val) -- types: a1: number
    local State, TimeScale, v1
    local v2 = a1 or 0.016666666666666666
    local v3 = coroutine.running()
    local v4 = u27[v3]
    if v4 then
        v4._threadDelayRemaining = (v4._threadDelayRemaining or 0) + v2
        return coroutine.yield()
    end
    if not v4 then
        v4 = u31[v3]
    end
    local v5 = v2
    while v5 > 0 do
        v1 = task.wait()
        if not v4 then
            if not u23 then
                State = GameState.State
                TimeScale = State and State.TimeScale or GameState.TimeScale or 1
            else
                TimeScale = GameState.TimeScale or 1
            end
        elseif not v4.TimeScaled then
            TimeScale = 1
        elseif not u23 then
            State = GameState.State
            TimeScale = State and State.TimeScale or GameState.TimeScale or 1
        else
            TimeScale = GameState.TimeScale or 1
        end
        v5 = v5 - v1 * TimeScale
    end
    return v2
end

function u20.Delay(a1, a2) -- Line: 66 -- upvalues: u27 (val), u31 (val), u20 (val) -- types: a1: number, a2: function
    local v1 = coroutine.running()
    local v2 = u27[v1] or u31[v1]
    local v3 = task.spawn(function() -- Line: 70 -- upvalues: u20 (upval), a1 (val), a2 (val)
        u20.Wait(a1)
        a2()
    end)
    if v2 then
        u20._registerNPCSubThread(v3, v2)
    end
    return v3
end

function u20.DelayPromise(a1) -- Line: 82
    -- upvalues: u27 (val), u31 (val), TypedPromise (val), u20 (val)
    local v1 = coroutine.running()
    local u6 = u27[v1]
    if not u6 then
        u6 = u31[v1]
    end
    return TypedPromise.new(function(a1_2, a2, a3) -- Line: 86 -- upvalues: u20 (upval), a1 (val), u6 (val)
        local u5 = task.spawn(function() -- Line: 87 -- upvalues: u20 (upval), a1 (upval), a1_2 (val)
            u20.Wait(a1)
            a1_2()
        end)
        a3(function() -- Line: 92 -- upvalues: u5 (val)
            task.cancel(u5)
        end)
        if u6 then
            u20._registerNPCSubThread(u5, u6)
        end
    end)
end

function u20.ConditionalDelay(a1, a2, a3) -- Line: 102
    -- upvalues: u27 (val), u31 (val), u23 (val), GameState (val), u20 (val)
    local u3 = a1
    local v1 = coroutine.running()
    local v2 = u27[v1] or u31[v1]
    local v3 = task.spawn(function() -- Line: 112 -- upvalues: u3 (ref), a2 (val), u23 (upval), GameState (upval), a3 (val)
        local State, TimeScale, v1, v2
        while u3 > 0 do
            if not a2() then
                return
            end
            v1 = u3
            v2 = task.wait()
            if not u23 then
                State = GameState.State
                TimeScale = State and State.TimeScale or GameState.TimeScale or 1
            else
                TimeScale = GameState.TimeScale or 1
            end
            u3 = v1 - v2 * TimeScale
        end
        a3()
    end)
    if v2 then
        u20._registerNPCSubThread(v3, v2)
    end
    return v3
end

function u20.GetScaledTime(a1) -- Line: 129 -- upvalues: GameState (val) -- types: a1: number
    return a1 / GameState.TimeScale
end

function u20.CleanUp(a1, a2, a3) -- Line: 133 -- upvalues: u20 (val) -- types: a1: userdata, a2: number, a3: function?
    u20.Delay(a2 or 0, function() -- Line: 136 -- upvalues: a1 (val), a3 (val)
        a1:Destroy()
        if a3 then
            a3()
        end
    end)
end

return u20