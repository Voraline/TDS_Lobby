-- Script path: ReplicatedStorage.Shared.Modules.Globals
-- Decompile time: 1.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u10 = {}
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u27 = if not RunService:IsServer() then "Client" else "Server"

local function resultHandler(a1, a2, a3, ...) -- Line: 12
    -- upvalues: u27 (val)
    if not a3 then
        error(debug.traceback(a1, (...)), 2)
    end
    if coroutine.status(a1) ~= "dead" then
        warn((("\"%*\" yielded the main %* thread. This might not be the name of the module actually yielding."):format(a2, u27)))
    end
    return ...
end

local function noYield(a1, a2, ...) -- Line: 27 -- upvalues: resultHandler (val) -- types: a1: string, a2: function
    local u2 = {}
    u2[1] = ...
    local u4 = nil
    local u5 = false
    local v1 = coroutine.create(function() -- Line: 33 -- upvalues: u4 (ref), a2 (val), u2 (val), u5 (ref)
        u4 = a2(unpack(u2))
        u5 = true
        return u4
    end)
    resultHandler(v1, a1, coroutine.resume(v1, ...))
    while not u5 do
        if u4 then
            break
        end
        task.wait()
    end
    return u4
end

local function stringRequire(a1) -- Line: 49 -- upvalues: noYield (val), u10 (val) -- types: a1: string
    if typeof(a1) ~= "string" then
        return noYield(a1:GetFullName(), require, a1)
    end
    return u10[a1]
end

local function registerDebug(a1, a2) end

local function registerModuleOrService(a1, a2) -- Line: 79 -- upvalues: u10 (val) -- types: a1: string, a2: table
    local v1 = false
    if type(a2) == "table" then
        v1 = rawget(a2, 1) == "Service"
    end
    if not v1 then
        u10[a1] = a2
        return
    end
    local u13 = false
    task.defer(function() -- Line: 85 -- upvalues: a2 (val), u10 (upval), a1 (val), u13 (ref)
        if a2[2] then
            u10[a1] = (a2[2]())
        end
        u13 = true
    end)
    task.delay(5, function() -- Line: 93 -- upvalues: u13 (ref), a1 (val)
        if not u13 then
            warn((("Service %* is taking a while to load..."):format(a1)))
        end
    end)
end

local function mapPath(a1, a2) -- Line: 103 -- types: a1: string, a2: userdata
    local v1 = a2
    for k, v in pairs(string.split(a1, "/")) do
        v1 = v1:WaitForChild(v)
    end
    return v1, v1.Name
end

if not RunService:IsServer() then end
return {
    register = function(a1, a2) -- Line: 116
        -- upvalues: mapPath (val), noYield (val), registerModuleOrService (val)
        local v1, v2
        for i, j in a2 do
            v1, v2 = mapPath(j, a1)
            registerModuleOrService(v2, (noYield(v2, require, v1)))
        end
    end,
    registerSingle = function(a1, a2) -- Line: 125
        -- upvalues: registerModuleOrService (val), noYield (val)
        registerModuleOrService(a1, noYield(a2:GetFullName(), require, a2))
    end,
    get = function() -- Line: 129 -- upvalues: table (val), math (val), stringRequire (val)
        return table, math, stringRequire
    end,
}