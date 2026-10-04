-- Script path: ReplicatedStorage.Shared.Modules.NPCUtils
-- Decompile time: 1.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

local function resumeThread(a1, a2) -- Line: 14 -- types: a2: thread
    local v1, v2 = coroutine.resume(a2)
    if not v1 then
        warn("[NPC] coroutine resume failed for", a1.Name, v2)
        a1._threadCo = nil
        a1._threadDelayRemaining = 0.1
    end
end

local function configureModelBasePart(a1) -- Line: 79 -- types: a1: userdata
    a1.CanCollide = false
    if a1.Transparency < 0.99 then
        a1.CanQuery = true
    end
end

local function configureModelBaseParts(a1) -- Line: 87 -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = false
            if j.Transparency < 0.99 then
                j.CanQuery = true
            end
        end
    end
end

return {
    configureModelParts = function(a1) -- Line: 95 -- upvalues: configureModelBaseParts (val) -- types: a1: userdata
        configureModelBaseParts(a1)
        task.defer(function() -- Line: 99 -- upvalues: configureModelBaseParts (upval), a1 (val)
            configureModelBaseParts(a1)
        end)
    end,
    stepThread = function(a1, a2) -- Line: 23 -- upvalues: TimescaleUtilities (val) -- types: a2: number
        local _threadCo, v1, v2, v3
        if not a1.ThreadFunction then
            return
        end
        a1._threadDelayRemaining = (a1._threadDelayRemaining or 0) - a2
        local v4 = 16
        local v5 = false
        while true do
            if not ((a1._threadDelayRemaining or 0) <= 0) or not (v4 > 0) then
                break
            end
            v4 = v4 - 1
            _threadCo = a1._threadCo
            if (_threadCo and coroutine.status(_threadCo) or "dead") ~= "suspended" then
                if v5 then
                    break
                end
                v1 = coroutine.create(function() -- Line: 53 -- upvalues: a1 (val)
                    local success, result = xpcall(a1.ThreadFunction, debug.traceback, a1)
                    if not success then
                        warn("[NPC] ThreadFunction error for", a1.Name, result)
                    end
                end)
                a1._threadCo = v1
                TimescaleUtilities._registerNPCThread(v1, a1)
                v2, v3 = coroutine.resume(v1)
                if not v2 then
                    warn("[NPC] coroutine resume failed for", a1.Name, v3)
                    a1._threadCo = nil
                    a1._threadDelayRemaining = 0.1
                end
                if coroutine.status(v1) == "dead" then
                    a1._threadDelayRemaining = 0
                end
            else
                v2, v3 = coroutine.resume(_threadCo)
                if not v2 then
                    warn("[NPC] coroutine resume failed for", a1.Name, v3)
                    a1._threadCo = nil
                    a1._threadDelayRemaining = 0.1
                end
            end
        end
    end,
}