-- Script path: ReplicatedStorage.Shared.Modules.Network.Server
-- Decompile time: 1.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function getOrCreateRemote(a1, a2) -- Line: 3
    -- upvalues: ReplicatedStorage (val)
    local v1 = ReplicatedStorage:FindFirstChild(a2)
    if not v1 or v1.ClassName ~= a1 then
        v1 = Instance.new(a1)
        v1.Name = a2
        v1.Parent = ReplicatedStorage
    end
    for i, j in ReplicatedStorage:GetChildren() do
        if j ~= v1 and j.Name == a2 and j.ClassName == a1 then
            j:Destroy()
        end
    end
    return v1
end

local u9 = getOrCreateRemote("RemoteEvent", "RemoteEvent")
local u13 = getOrCreateRemote("RemoteFunction", "RemoteFunction")
local u17 = getOrCreateRemote("UnreliableRemoteEvent", "UnreliableRemoteEvent")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 28 -- upvalues: u9 (val), u13 (val), u17 (val)
    u9.OnServerEvent:Connect(function(a1_2, a2, a3, ...) -- Line: 30 -- upvalues: a1 (val) -- types: a2: string, a3: string
        a1:Emit(a2, a3, a1_2, ...)
    end)

    function u13.OnServerInvoke(a1_2, a2, a3, ...) -- Line: 35 -- upvalues: a1 (val) -- types: a2: string, a3: string
        return a1:Emit(a2, a3, a1_2, ...)
    end

    u17.OnServerEvent:Connect(function(a1_2, a2, a3, ...) -- Line: 40 -- upvalues: a1 (val) -- types: a2: string, a3: string
        a1:Emit(a2, a3, a1_2, ...)
    end)
end

function v1:FireClient(a2, a3, ...) -- Line: 46 -- upvalues: u9 (val) -- types: self: table, a2: userdata, a3: string
    u9:FireClient(a2, self.Channel, a3, ...)
end

function v1.FireUnreliableClient(a1, a2, a3, ...) -- Line: 50
    -- upvalues: u17 (val)
    u17:FireClient(a2, a1.Channel, a3, ...)
end

function v1.FireAllClientsUnreliable(a1, a2, ...) -- Line: 54 -- upvalues: u17 (val) -- types: a1: table, a2: string
    u17:FireAllClients(a1.Channel, a2, ...)
end

function v1:FireAllClients(a2, ...) -- Line: 58 -- upvalues: u9 (val) -- types: self: table, a2: string
    u9:FireAllClients(self.Channel, a2, ...)
end

return v1