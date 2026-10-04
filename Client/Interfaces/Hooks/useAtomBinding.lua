-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAtomBinding
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Packages.Charm)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
return function(a1) -- Line: 6 -- upvalues: ReactCharm (val)
    return ReactCharm.useSignalBinding(a1, {a1})
end