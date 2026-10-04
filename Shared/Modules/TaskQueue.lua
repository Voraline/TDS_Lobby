-- Script path: ReplicatedStorage.Shared.Modules.TaskQueue
-- Decompile time: 0.66 ms

local u0 = {}
u0.__index = u0

function u0.new(a1) -- Line: 37 -- upvalues: u0 (val) -- types: a1: function
    local v1 = setmetatable({}, u0)
    v1._queue = {}
    v1._flushing = false
    v1._scheduled = nil
    v1._onFlush = a1
    return v1
end

function u0.Add(a1, a2) -- Line: 52
    table.insert(a1._queue, a2)
    if a1._scheduled == nil then
        a1._scheduled = task.defer(function() -- Line: 56 -- upvalues: a1 (val)
            a1._flushing = true
            a1._onFlush(a1._queue)
            table.clear(a1._queue)
            a1._flushing = false
            a1._scheduled = nil
        end)
    end
end

function u0:Clear() -- Line: 77
    if self._flushing then
        return
    end
    if self._scheduled ~= nil then
        task.cancel(self._scheduled)
        self._scheduled = nil
    end
    table.clear(self._queue)
end

function u0.Destroy(a1) -- Line: 93
    a1:Clear()
end

return u0