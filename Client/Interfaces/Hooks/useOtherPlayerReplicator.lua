-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useOtherPlayerReplicator
-- Decompile time: 1.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
return function(a1) -- Line: 9 -- upvalues: useState (val), PlayerReplicator (val), useEffect (val) -- types: a1: userdata
    local u3, u4 = useState(function() -- Line: 10 -- upvalues: PlayerReplicator (upval), a1 (val)
        local v1 = PlayerReplicator.GetEntityFromPlayer(a1)
        if v1 then
            return v1.Replicator
        end
        return nil
    end)
    useEffect(function() -- Line: 20 -- upvalues: u3 (val), PlayerReplicator (upval), a1 (val), u4 (val)
        if u3 then
            return
        end
        local u1 = true
        local u5 = PlayerReplicator.WaitForPlayer(a1)
        u5:andThen(function(a1) -- Line: 27 -- upvalues: u1 (ref), u4 (upval)
            if u1 then
                u4(a1.Replicator)
            end
        end)
        return function() -- Line: 33 -- upvalues: u1 (ref), u5 (val)
            u1 = false
            u5:cancel()
        end
    end, {})
    return u3
end