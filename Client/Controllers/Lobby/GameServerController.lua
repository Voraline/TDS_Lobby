-- Script path: ReplicatedStorage.Client.Controllers.Lobby.GameServerController
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local ServerCountStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.ServerCountStore)
local v1 = {}
local ServerCount = NewNetwork.Channel("ServerCount")

function v1.init() -- Line: 10 -- upvalues: ServerCount (val), ServerCountStore (val)
    ServerCount:onEvent("Update", function(a1) -- Line: 11 -- upvalues: ServerCountStore (upval)
        ServerCountStore.updateServerCount(a1)
    end)
    local v1 = ServerCount:invokeServer("GetCount")
    ServerCountStore.updateServerCount(v1)
end

task.spawn(v1.init)
return v1