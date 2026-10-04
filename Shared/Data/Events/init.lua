-- Script path: ReplicatedStorage.Shared.Data.Events
-- Decompile time: 2.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(script.Types)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u19 = {}
u19.Started = Signal.new()
u19.Active = {}
u19.All = {}

local function isActive(a1) -- Line: 15 -- upvalues: RunService (val)
    RunService:IsStudio()
    return a1.starts.UnixTimestamp < workspace:GetServerTimeNow()
end

local function runWithErrorHandler(a1, a2, ...) -- Line: 23 -- types: a1: string, a2: function
    local success, result = xpcall(function(...) -- Line: 24 -- upvalues: a2 (val)
        a2(...)
    end, debug.traceback, ...)
    if not success then
        local v1 = ""
        local v2 = string.split(result, "\n")[1]
        local v3 = string.find(v2, ": ")
        if v3 then
            v1 = v2:sub(v3 + 1)
        end
        warn((("Error occured while calling %* callback:%*\n%*"):format(a1, v1, result)))
    end
end

local function start(a1, a2) -- Line: 43 -- types: a2: boolean?
    if not a2 and a1.started then
        a1.started()
    end
    if a1.running then
        a1.running()
    end
end

local u27 = false

function u19.init() -- Line: 56
    -- upvalues: u27 (ref), RunService (val), u19 (val), start (val), runWithErrorHandler (val)
    local v1, v2
    assert(not u27, "Events has already been init")
    u27 = true
    local u88 = {}
    local u76 = RunService:IsClient()
    for i, j in script.Templates:GetChildren() do
        v1 = require(j)
        v2 = v1.clientOnly == false
        assert(not u19.All[v1.name], (("Found duplicate event with name \"%*\""):format(v1.name)))
        u19.All[v1.name] = v1
        RunService:IsStudio()
        if not (v1.starts.UnixTimestamp < workspace:GetServerTimeNow()) then
            u88[v1.name] = true
            if v1.inactive then
                task.spawn(v1.inactive)
            end
        else
            u19.Active[v1.name] = true
            if u76 or v2 then
                task.spawn(start, v1, true)
            end
        end
    end
    local u25 = nil
    local v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 88
        -- upvalues: u88 (val), u19 (upval), u76 (val), runWithErrorHandler (upval), start (upval), u25 (ref)
        local v1, v2, v3
        local v4 = false
        local ServerTimeNow = workspace:GetServerTimeNow()
        local v5 = nil
        local v6 = nil
        for i in u88, v5, v6 do
            v2 = u19.All[i]
            v3 = v2.clientOnly == false
            v1 = math.max(0, v2.starts.UnixTimestamp - ServerTimeNow)
            v4 = true
            if not (v1 > 0) then
                u88[i] = nil
                u19.Active[v2.name] = true
                u19.Started:Fire(v2.name)
                if u76 or v3 then
                    task.spawn(start, v2)
                end
            elseif u76 and v2.countdown then
                runWithErrorHandler(("%*.countdown"):format(i), v2.countdown, v1, v7)
            end
        end
        if not v4 then
            u25:Disconnect()
        end
    end)
end

function u19.getAll() -- Line: 120 -- upvalues: u19 (val)
    return u19.All
end

function u19.getActive() -- Line: 124 -- upvalues: u19 (val)
    return u19.Active
end

function u19.getEvent(a1) -- Line: 128 -- upvalues: u19 (val) -- types: a1: string
    return u19.All[a1]
end

function u19.isActive(a1) -- Line: 132 -- upvalues: u19 (val) -- types: a1: string
    return u19.Active[a1] ~= nil
end

u19.init()
return u19