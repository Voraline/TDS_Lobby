-- Script path: ReplicatedStorage.Shared.Modules.NoYield
-- Decompile time: 0.35 ms

local function resultHandler(a1, a2, ...) -- Line: 10
    if not a2 then
        error(debug.traceback(a1, (...)), 2)
    end
    if coroutine.status(a1) ~= "dead" then
        error(debug.traceback(a1, "Attempted to yield inside changed event!"), 2)
    end
    return ...
end

return function(a1, ...) -- Line: 23 -- upvalues: resultHandler (val)
    local v1 = coroutine.create(a1)
    return resultHandler(v1, coroutine.resume(v1, ...))
end