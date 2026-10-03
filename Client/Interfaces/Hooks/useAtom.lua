-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAtom
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Packages.Charm)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
return function(a1) -- Line: 6 -- upvalues: ReactCharm (val)
    return ReactCharm.useSignalState(a1, {a1})
end