-- Script path: ReplicatedStorage.Packages.Fusion.Logging.parseError
-- Decompile time: 0.27 ms

local Parent_2 = script.Parent.Parent
require(Parent_2.Types)
return function(a1) -- Line: 13 -- types: a1: string
    return {
        type = "Error",
        raw = a1,
        message = a1:gsub("^.+:%d+:%s*", ""),
        trace = debug.traceback(nil, 2),
    }
end