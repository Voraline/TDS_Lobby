-- Script path: ReplicatedStorage.Shared.Modules.MapManager
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
local u17 = RunService:IsServer()
local Enum = require(script.Parent.Enum)
local GameState = require(script.Parent.GameState)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u38 = nil
local u39 = {}
u39.MapChanged = Signal.new()

local function getContextualMap(a1) -- Line: 17
    -- upvalues: u17 (val), GameState (val), ReplicatedStorage (val), Enum (val)
    if u17 then
        return a1
    end
    local v1, v2 = GameState.GetAsync("GameMode"):await()
    if not v1 then
        warn("could not get GameMode (This should never error)")
        return a1
    end
    if v2 == "PVP" then
        return (a1:WaitForChild((Enum.Team.ToString((require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator).GetLocalPlayer():expect()).Team))))
    end
    return a1
end

workspace.ChildAdded:Connect(function(a1) -- Line: 44 -- upvalues: u38 (ref), getContextualMap (val), u39 (val)
    if a1.Name == "Map" and a1 ~= u38 then
        u38 = getContextualMap(a1)
        u39.MapChanged:Fire(u38)
    end
end)
task.spawn(function() -- Line: 51 -- upvalues: u38 (ref), getContextualMap (val), u39 (val)
    if workspace:FindFirstChild("Map") then
        u38 = getContextualMap(workspace:FindFirstChild("Map"))
        u39.MapChanged:Fire(u38)
    end
end)

function u39.GetLoadedMap() -- Line: 58 -- upvalues: Promise (val), u38 (ref)
    return Promise.new(function(a1) -- Line: 59 -- upvalues: u38 (upval)
        while not u38 do
            task.wait()
        end
        a1(u38)
    end)
end

function u39.GetLoadedMapRaw() -- Line: 67 -- upvalues: u38 (ref)
    return u38
end

return u39