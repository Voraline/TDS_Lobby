-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.isPromise
-- Decompile time: 0.27 ms

local promise = require(script.Parent.Parent:WaitForChild("promise"))
return {
    default = function(a1) -- Line: 14 -- upvalues: promise (val)
        return promise.is(a1)
    end,
}