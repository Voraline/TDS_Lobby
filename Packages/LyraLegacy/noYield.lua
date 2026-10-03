-- Script path: ReplicatedStorage.Packages.LyraLegacy.noYield
-- Decompile time: 0.33 ms

local function resultHandler(a1, a2, ...) -- Line: 10 -- types: a1: thread, a2: boolean
    if not a2 then
        error(debug.traceback(a1, (...)), 2)
    end
    if coroutine.status(a1) ~= "dead" then
        error(debug.traceback(a1, "attempt to yield"), 2)
    end
    return ...
end

return function(a1, ...) -- Line: 23 -- upvalues: resultHandler (val) -- types: a1: function
    local v1 = coroutine.create(a1)
    return resultHandler(v1, coroutine.resume(v1, ...))
end