-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicator
-- Decompile time: 1.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
return function() -- Line: 9 -- upvalues: useState (val), PlayerReplicator (val), useEffect (val)
    local v1, u3 = useState(function() -- Line: 10 -- upvalues: PlayerReplicator (upval)
        local v1 = PlayerReplicator.GetLocalPlayerRaw()
        if v1 then
            return v1.Replicator
        end
        return nil
    end)
    useEffect(function() -- Line: 15 -- upvalues: PlayerReplicator (upval), u3 (val)
        local u0 = true
        local u3_2 = PlayerReplicator.GetLocalPlayer()
        u3_2:andThen(function(a1) -- Line: 19 -- upvalues: u0 (ref), u3 (upval)
            if u0 then
                u3(a1.Replicator)
            end
        end)
        return function() -- Line: 25 -- upvalues: u0 (ref), u3_2 (val)
            u0 = false
            u3_2:cancel()
        end
    end, {})
    return v1
end