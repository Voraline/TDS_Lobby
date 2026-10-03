-- Script path: ReplicatedStorage.Shared.Modules.Thread
-- Decompile time: 1.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
RunService:IsStudio()
require(ReplicatedStorage.Shared.Modules.Maid)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
require(ReplicatedStorage.Shared.Modules.Signal)
local u40 = {_yields = {}, _functions = {}}

function u40.Add(a1, a2, a3) -- Line: 21 -- upvalues: u40 (val)
    u40._functions[a1] = {
        f = function() -- Line: 24 -- upvalues: a2 (val)
            a2()
        end,
        n = a3 or "Unnamed",
    }
end

function u40.Remove(a1) -- Line: 33 -- upvalues: u40 (val)
    u40._functions[a1] = nil
end

function u40.Wait(a1) -- Line: 39 -- upvalues: table (val), u40 (val)
    local v1 = coroutine.running()
    table.insert(u40._yields, {time = a1 or 1, clock = tick(), thread = v1})
    return coroutine.yield()
end

Scheduler.add("CustomThreads", RunService.Stepped, function() -- Line: 55 -- upvalues: u40 (val)
    local thread, v1, v2, v3
    debug.profilebegin("Threads")
    debug.profilebegin("ThreadDelayedWaits")
    local v4 = tick()
    local _yields = u40._yields
    for i = #_yields, 1, -1 do
        v1 = _yields[i]
        if v1.time <= v4 - v1.clock then
            thread = v1.thread
            if thread then
                coroutine.resume(thread)
            end
            _yields[i] = _yields[#_yields]
            _yields[#_yields] = nil
        end
    end
    debug.profileend()
    debug.profilebegin("ThreadFunctions")
    for k, v in pairs(u40._functions) do
        debug.profilebegin("Step_" .. v.n)
        if not v.t then
            v.t = coroutine.create(v.f)
            v2, v3 = coroutine.resume(v.t)
            v.s = v2
            v.m = v3
        elseif coroutine.status(v.t) == "dead" or not v.t then
            v.t = nil
        end
        debug.profileend()
    end
    debug.profileend()
    debug.profileend()
end)
return u40