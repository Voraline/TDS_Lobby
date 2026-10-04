-- Script path: ReplicatedStorage.Client.Controllers.Lobby.EventSpawnerController
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local v1 = {
    init = function() -- Line: 6 -- upvalues: NewNetwork (val)
        NewNetwork.Channel("EventSpawner"):onEvent("EventTeleport", function() end)
    end,
}
task.spawn(v1.init)
return v1