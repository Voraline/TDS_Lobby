-- Script path: ReplicatedStorage.Shared.Modules.NewNetwork.ClientChannel
-- Decompile time: 1.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12 = game:GetService("RunService"):IsRunning()
local NetworkContainer = require(ReplicatedStorage.Shared.Modules.NewNetwork.NetworkContainer)
require(ReplicatedStorage.Shared.Modules.NewNetwork.Types)
local u25 = {}
u25.__index = u25

function u25.new(a1) -- Line: 12 -- upvalues: u25 (val) -- types: a1: string
    local v1 = setmetatable({}, u25)
    v1._listeners = {}
    v1._connections = {}
    v1.Namespace = a1
    return v1
end

function u25.Destroy(a1) -- Line: 23
    for i in a1._connections do
        if i.Connected then
            i:Disconnect()
        end
    end
    a1._listeners = {}
    a1._connections = {}
end

function u25:_fireServer(a2, a3, ...) -- Line: 34
    -- upvalues: NetworkContainer (val)
    (NetworkContainer.getEvent(self.Namespace, a2, a3)):FireServer(...)
end

function u25.onEvent(a1, a2, a3) -- Line: 45
    -- upvalues: u12 (val), NetworkContainer (val)
    if not u12 then
        return
    end
    local u14 = NetworkContainer.getEvent(a1.Namespace, a2, "RemoteEvent").OnClientEvent:Connect(a3)
    if not a1._listeners[a2] then
        a1._listeners[a2] = {}
    end
    local v1 = a1._listeners[a2]
    v1[a3] = true
    a1._connections[u14] = true
    return function() -- Line: 60 -- upvalues: a1 (val), u14 (val), a2 (val), a3 (val)
        a1._connections[u14] = nil
        local v1 = a1._listeners[a2]
        v1[a3] = nil
        if u14.Connected then
            u14:Disconnect()
        end
    end
end

function u25.onUnreliableEvent(a1, a2, a3) -- Line: 70
    -- upvalues: u12 (val), NetworkContainer (val)
    if not u12 then
        return
    end
    local u14 = NetworkContainer.getEvent(a1.Namespace, a2, "UnreliableRemoteEvent").OnClientEvent:Connect(a3)
    if not a1._listeners[a2] then
        a1._listeners[a2] = {}
    end
    local v1 = a1._listeners[a2]
    v1[a3] = true
    return function() -- Line: 85 -- upvalues: a1 (val), a2 (val), a3 (val), u14 (val)
        local v1 = a1._listeners[a2]
        v1[a3] = nil
        if u14.Connected then
            u14:Disconnect()
        end
    end
end

function u25.onInvoke(a1, a2, a3) -- Line: 94
    -- upvalues: u12 (val), NetworkContainer (val)
    if not u12 then
        return
    end
    local u9 = NetworkContainer.getEvent(a1.Namespace, a2, "RemoteFunction")
    u9.OnClientInvoke = a3
    return function() -- Line: 104 -- upvalues: u9 (val), a3 (val)
        if u9.OnClientInvoke == a3 then
            u9.OnClientInvoke = nil
        end
    end
end

function u25.fireLocal(a1, a2, ...) -- Line: 111 -- types: a1: table, a2: string
    local v1 = a1._listeners[a2]
    if not v1 then
        return
    end
    for i in v1 do
        i(...)
    end
end

function u25.fireServer(a1, a2, ...) -- Line: 122 -- types: a1: table, a2: string
    a1:_fireServer(a2, "RemoteEvent", ...)
end

function u25.fireUnreliableServer(a1, a2, ...) -- Line: 126 -- types: a1: table, a2: string
    a1:_fireServer(a2, "UnreliableRemoteEvent", ...)
end

function u25.invokeServer(a1, a2, ...) -- Line: 130 -- upvalues: NetworkContainer (val) -- types: a1: table, a2: string
    return (NetworkContainer.getEvent(a1.Namespace, a2, "RemoteFunction")):InvokeServer(...)
end

return u25