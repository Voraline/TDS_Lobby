-- Script path: ReplicatedStorage.Shared.Modules.Standalone.Binder
-- Decompile time: 0.40 ms

local u0 = {}
u0.__index = u0

function u0.new() -- Line: 4 -- upvalues: u0 (val)
    return (setmetatable({Binds = {}}, u0))
end

function u0.Invoke(a1, a2, ...) -- Line: 10
    if a1.Binds[a2] then
        return a1.Binds[a2](...)
    end
end

function u0.On(a1, a2, a3) -- Line: 16
    if not a1.Binds[a2] then
        a1.Binds[a2] = a3
    end
    return a1.Binds[a2]
end

return u0