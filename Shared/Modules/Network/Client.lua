-- Script path: ReplicatedStorage.Shared.Modules.Network.Client
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
local RemoteFunction = ReplicatedStorage:WaitForChild("RemoteFunction")
local UnreliableRemoteEvent = ReplicatedStorage:WaitForChild("UnreliableRemoteEvent")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: RemoteEvent (val), UnreliableRemoteEvent (val)
    RemoteEvent.OnClientEvent:Connect(function(a1_2, a2, ...) -- Line: 11 -- upvalues: a1 (val) -- types: a1_2: string, a2: string
        while not a1.Emit do
            task.wait()
        end
        a1:Emit(a1_2, a2, ...)
    end)
    UnreliableRemoteEvent.OnClientEvent:Connect(function(a1_2, a2, ...) -- Line: 19 -- upvalues: a1 (val) -- types: a1_2: string, a2: string
        while not a1.Emit do
            task.wait()
        end
        a1:Emit(a1_2, a2, ...)
    end)
end

function v1:FireServer(a2, ...) -- Line: 28 -- upvalues: RemoteEvent (val) -- types: self: table, a2: string
    RemoteEvent:FireServer(self.Channel, a2, ...)
end

function v1.FireUnreliableServer(a1, a2, ...) -- Line: 32
    -- upvalues: UnreliableRemoteEvent (val)
    UnreliableRemoteEvent:FireServer(a1.Channel, a2, ...)
end

function v1:InvokeServer(a2, ...) -- Line: 36 -- upvalues: RemoteFunction (val) -- types: self: table, a2: string
    return RemoteFunction:InvokeServer(self.Channel, a2, ...)
end

return v1