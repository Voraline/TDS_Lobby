-- Script path: ReplicatedStorage.Shared.Modules.Network
-- Decompile time: 2.06 ms

local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local v2 = RunService:IsRunning()
local u29 = if not v2 then require(script:WaitForChild("Dummy")) else if not v1 then require(script.Client) else require(script.Server)
local v3 = {__index = u29}
local u35 = setmetatable({Channels = {}}, v3)
u35:Initialize()

local function merge(...) -- Line: 32
    local v1 = {}
    for k, v in pairs({...}) do
        for k2, i in pairs(v) do
            v1[k2] = i
        end
    end
    return v1
end

function u35.Channel(a1) -- Line: 44 -- upvalues: u35 (val), merge (val), u29 (ref) -- types: a1: string
    local v1 = u35.Channels[a1]
    if v1 then
        return v1
    end
    local u4 = {}
    local v2 = merge(u35, {Channel = a1})
    local v3 = {__index = u29}
    local v4 = setmetatable(v2, v3)

    function v4.Broadcast(a1, a2, ...) -- Line: 54 -- upvalues: u4 (val) -- types: a1: table, a2: string
        local v1 = u4[a2]
        if v1 then
            return v1(...)
        end
    end

    function v4.On(a1, a2, a3) -- Line: 62 -- upvalues: u4 (val) -- types: a1: table, a2: string, a3: function
        u4[a2] = a3
        return function() -- Line: 70 -- upvalues: u4 (upval), a2 (val)
            u4[a2] = nil
        end
    end

    u35.Channels[a1] = v4
    return v4
end

local u58 = nil
local u67 = nil
if v1 and v2 then
    local ServerStorage = game:GetService("ServerStorage")
    u58 = require(ServerStorage:WaitForChild("Server").Modules.NetworkMiddleware)
    u67 = require(ServerStorage:WaitForChild("Server").Modules.BehaviorAnalyzer)
end

function u35.Emit(a1, a2, a3, ...) -- Line: 94
    -- upvalues: u58 (ref), u67 (ref)
    if typeof(a2) == "string" and typeof(a3) == "string" then
        local v1
        debug.profilebegin("NetworkEmit")
        local v2 = a1.Channels[a2]
        if not v2 then
            debug.profileend()
            return
        end
        local v3 = nil
        local v4 = nil
        if u58 then
            debug.profilebegin("NetworkMiddleware")
            v1 = ...
            if typeof(v1) == "Instance" and v1:IsA("Player") then
                v4 = v1
                if not u58.allow(v1, a2, a3) then
                    debug.profileend()
                    debug.profileend()
                    return
                end
                v3 = a2 .. "/" .. a3
                u67.recordCall(v1, v3)
            end
            debug.profileend()
        end
        debug.profilebegin("NetworkBroadcast")
        v1 = table.pack(v2:Broadcast(a3, ...))
        debug.profileend()
        if u67 and v4 and v3 then
            debug.profilebegin("NetworkBehaviorOutcome")
            local v5 = u67.classifyResult(v1[1])
            u67.recordOutcome(v4, v3, v5)
            debug.profileend()
        end
        debug.profileend()
        return table.unpack(v1, 1, v1.n)
    end
end

return u35