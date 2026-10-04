-- Script path: ReplicatedStorage.Shared.Modules.FastSignal.Immediate
-- Decompile time: 1.00 ms

local Deferred = require(script.Parent.Deferred)
local u5 = {}
for k, v in pairs(Deferred) do
    u5[k] = v
end
u5.__index = u5
local u19 = nil

local function RunHandlerInFreeThread(a1, ...) -- Line: 32 -- upvalues: u19 (ref)
    local v1 = u19
    u19 = nil
    a1(...)
    u19 = v1
end

local function CreateFreeThread() -- Line: 41 -- upvalues: u19 (ref), RunHandlerInFreeThread (val)
    u19 = coroutine.running()
    while true do
        RunHandlerInFreeThread(coroutine.yield())
    end
end

function u5.new() -- Line: 49 -- upvalues: u5 (val)
    return (setmetatable({_active = true}, u5))
end

function u5.Is(a1) -- Line: 56 -- upvalues: u5 (val)
    local v1 = false
    if typeof(a1) == "table" then
        v1 = (getmetatable(a1)) == u5
    end
    return v1
end

function u5.Fire(a1, ...) -- Line: 60 -- upvalues: u19 (ref), CreateFreeThread (val)
    local _head = a1._head
    while _head ~= nil do
        if _head._connection ~= nil then
            if u19 == nil then
                task.spawn(CreateFreeThread)
            end
            task.spawn(u19, _head._handler, ...)
        end
        _head = _head._next
    end
end

return u5