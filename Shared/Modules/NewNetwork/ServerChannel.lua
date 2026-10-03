-- Script path: ReplicatedStorage.Shared.Modules.NewNetwork.ServerChannel
-- Decompile time: 4.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local BehaviorAnalyzer = require(ServerStorage.Server.Modules.BehaviorAnalyzer)
local NetworkContainer = require(ReplicatedStorage.Shared.Modules.NewNetwork.NetworkContainer)
local RateLimiter = require(ServerStorage.Server.Modules.RateLimiter)
require(ReplicatedStorage.Shared.Modules.NewNetwork.Types)
local u32 = nil

local function getExploitService() -- Line: 11 -- upvalues: u32 (ref), ServerStorage (val)
    if u32 then
        return u32
    end
    local success, result = pcall(function() -- Line: 15 -- upvalues: ServerStorage (upval)
        return require(ServerStorage.Server.Services.Game.ExploitService)
    end)
    if success then
        u32 = result
    end
    return u32
end

local u34 = {}
u34.__index = u34

function u34.new(a1, a2) -- Line: 27 -- upvalues: u34 (val), NetworkContainer (val) -- types: a1: string
    local v1 = setmetatable({}, u34)
    v1._listeners = {}
    v1._rateLimits = {}
    v1.Namespace = a1
    if a2 then
        if a2.events then
            for i, v in ipairs(a2.events) do
                NetworkContainer.getOrCreateEvent(a1, v, "RemoteEvent")
            end
        end
        if a2.unreliableEvents then
            for i2, i3 in ipairs(a2.unreliableEvents) do
                NetworkContainer.getOrCreateEvent(a1, i3, "UnreliableRemoteEvent")
            end
        end
        if a2.functions then
            for i4, j in ipairs(a2.functions) do
                NetworkContainer.getOrCreateEvent(a1, j, "RemoteFunction")
            end
        end
        if a2.rateLimits then
            for k, n in a2.rateLimits do
                v1._rateLimits[k] = n
            end
        end
    end
    return v1
end

function u34.setRateLimit(a1, a2, a3, a4) -- Line: 66 -- types: a1: table, a2: string, a3: number, a4: number
    a1._rateLimits[a2] = {burst = a3, refill = a4}
end

function u34:_wrapWithRateLimit(a2, a3, a4) -- Line: 75
    -- upvalues: RateLimiter (val), u32 (ref), ServerStorage (val), BehaviorAnalyzer (val)
    local u5 = self._rateLimits[a2]
    local u9 = self.Namespace .. "/" .. a2
    local burst = 0
    local refill = 0
    if u5 then
        burst = u5.burst
        refill = u5.refill
    end
    return function(a1, ...) -- Line: 83
        -- upvalues: u5 (val), RateLimiter (upval), u9 (val), burst (ref), refill (ref), u32 (upval)
        -- upvalues: ServerStorage (upval), self (val), a2 (val), BehaviorAnalyzer (upval), a4 (val), a3 (val)
        local v1
        if u5 and not RateLimiter.consume(a1, u9, burst, refill) then
            if not u32 then
                local success, result = pcall(function() -- Line: 15 -- upvalues: ServerStorage (upval)
                    return require(ServerStorage.Server.Services.Game.ExploitService)
                end)
                if success then
                    u32 = result
                end
            end
            v1 = u32
            if v1 then
                v1.report(a1, "rate_limit_exceeded:" .. u9, "low", {channel = self.Namespace, request = a2})
            end
            return
        end
        BehaviorAnalyzer.recordCall(a1, u9)
        if not a4 then
            return a3(a1, ...)
        end
        v1 = table.pack(a3(a1, ...))
        BehaviorAnalyzer.recordOutcome(a1, u9, BehaviorAnalyzer.classifyResult(v1[1]))
        return table.unpack(v1, 1, v1.n)
    end
end

function u34:Destroy() -- Line: 107 -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getNamespace(self.Namespace)
    if v1 then
        v1:Destroy()
    end
    self._listeners = {}
end

function u34.onEvent(a1, a2, a3) -- Line: 116 -- upvalues: NetworkContainer (val) -- types: a1: table, a2: string
    local u18 = (NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteEvent")).OnServerEvent:Connect((a1:_wrapWithRateLimit(a2, a3)))
    if not a1._listeners[a2] then
        a1._listeners[a2] = {}
    end
    local v1 = a1._listeners[a2]
    v1[a3] = true
    return function() -- Line: 129 -- upvalues: a1 (val), a2 (val), a3 (val), u18 (val)
        local v1 = a1._listeners[a2]
        v1[a3] = nil
        if u18.Connected then
            u18:Disconnect()
        end
    end
end

function u34.onUnreliableEvent(a1, a2, a3) -- Line: 138
    -- upvalues: NetworkContainer (val)
    local u18 = (NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "UnreliableRemoteEvent")).OnServerEvent:Connect((a1:_wrapWithRateLimit(a2, a3)))
    if not a1._listeners[a2] then
        a1._listeners[a2] = {}
    end
    local v1 = a1._listeners[a2]
    v1[a3] = true
    return function() -- Line: 151 -- upvalues: a1 (val), a2 (val), a3 (val), u18 (val)
        local v1 = a1._listeners[a2]
        v1[a3] = nil
        if u18.Connected then
            u18:Disconnect()
        end
    end
end

function u34.onInvoke(a1, a2, a3) -- Line: 160 -- upvalues: NetworkContainer (val) -- types: a1: table, a2: string
    local u8 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteFunction")
    u8.OnServerInvoke = a1:_wrapWithRateLimit(a2, a3, true)
    return function() -- Line: 166 -- upvalues: u8 (val)
        if u8.OnServerInvoke ~= nil then
            u8.OnServerInvoke = nil
        end
    end
end

function u34.fireLocal(a1, a2, a3, ...) -- Line: 173 -- types: a1: table, a2: string, a3: userdata
    local v1 = a1._listeners[a2]
    if not v1 then
        return
    end
    for i in v1 do
        i(a3, ...)
    end
end

function u34.fireAllClients(a1, a2, ...) -- Line: 184
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteEvent")
    assert(v1:IsA("RemoteEvent"), (("%*:%* is not of event type: RemoteEvent"):format(a1.Namespace, a2)))
    v1:FireAllClients(...)
end

function u34.fireClient(a1, a2, a3, ...) -- Line: 192
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteEvent")
    assert(v1:IsA("RemoteEvent"), (("%*:%* is not of event type: RemoteEvent"):format(a1.Namespace, a2)))
    v1:FireClient(a3, ...)
end

function u34.fireAllClientsUnreliable(a1, a2, ...) -- Line: 200
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "UnreliableRemoteEvent")
    assert(v1:IsA("UnreliableRemoteEvent"), (("%*:%* is not of event type: UnreliableRemoteEvent"):format(a1.Namespace, a2)))
    v1:FireAllClients(...)
end

function u34.fireClientUnreliable(a1, a2, a3, ...) -- Line: 211
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "UnreliableRemoteEvent")
    assert(v1:IsA("UnreliableRemoteEvent"), (("%*:%* is not of event type: UnreliableRemoteEvent"):format(a1.Namespace, a2)))
    v1:FireClient(a3, ...)
end

function u34.invokeClient(a1, a2, a3, ...) -- Line: 222
    -- upvalues: NetworkContainer (val)
    return (NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteFunction")):InvokeClient(a3, ...)
end

return u34