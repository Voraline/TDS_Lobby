-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAtomSelector
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Packages.Charm)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
return function(a1, a2) -- Line: 6 -- upvalues: ReactCharm (val) -- types: a2: function?
    return ReactCharm.useSignalState(function() -- Line: 7 -- upvalues: a1 (val), a2 (val)
        local v1 = a1()
        if a2 then
            return (a2(v1))
        end
        return v1
    end, {a1, a2})
end