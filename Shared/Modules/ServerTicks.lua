-- Script path: ReplicatedStorage.Shared.Modules.ServerTicks
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local u17 = RunService:IsServer()
local u18 = 0
local ServerTime = GameState.Replicator.State.ServerTime
if not u17 then
    (GameState.Replicator:GetStateChangedSignal("ServerTime")):Connect(function(a1) -- Line: 17 -- upvalues: ServerTime (ref) -- types: a1: number
        ServerTime = a1
    end)
end
RunService.Heartbeat:Connect(function(a1) -- Line: 22 -- upvalues: GameState (val), ServerTime (ref), u17 (val), u18 (ref) -- types: a1: number
    if not GameState.GameStarted then
        return
    end
    ServerTime = ServerTime + a1 * GameState.TimeScale
    GameState.ServerTime = ServerTime
    if u17 then
        u18 = u18 + a1
        if u18 >= 0.5 then
            GameState.Replicator:Set("ServerTime", ServerTime)
            u18 = 0
        end
    end
end)
return {
    getTime = function() -- Line: 12 -- upvalues: ServerTime (ref)
        return ServerTime
    end,
}