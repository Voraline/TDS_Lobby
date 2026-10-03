-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSandboxUnlock
-- Decompile time: 0.16 ms

local useCache = require(script.Parent.useCache)
return function(a1) -- Line: 5 -- upvalues: useCache (val) -- types: a1: string
    return useCache(("Sandbox.Unlocks.%*"):format(a1), {})
end