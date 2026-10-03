-- Script path: ReplicatedStorage.Client.Controllers.Shared.PersistController
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
local Persist = (require(ReplicatedStorage.Shared.Modules.Network)).Channel("Persist")

function v1.get(a1) -- Line: 9 -- upvalues: Persist (val) -- types: a1: table
    return Persist:InvokeServer("get", a1)
end

function v1.update(a1) -- Line: 13 -- upvalues: Persist (val) -- types: a1: table
    return Persist:InvokeServer("update", a1)
end

return v1