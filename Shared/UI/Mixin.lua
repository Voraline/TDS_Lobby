-- Script path: ReplicatedStorage.Shared.UI.Mixin
-- Decompile time: 0.49 ms

local u0 = {}
u0.__index = u0
local v1 = {
    __call = function(a1) -- Line: 7
        return a1.new()
    end,
}
setmetatable(u0, v1)

function u0.new() -- Line: 12 -- upvalues: u0 (val)
    return (setmetatable({_events = {}}, u0))
end

function u0.Destroy(a1) -- Line: 18
    table.clear(a1._events)
    setmetatable(a1, nil)
end

function u0.Include(a1, a2, a3) -- Line: 23
    a1._events[a2] = a3
end

function u0.Use(a1, a2, ...) -- Line: 27
    if not a1._events[a2] then
        return nil
    end
    return a1._events[a2](...)
end

return u0