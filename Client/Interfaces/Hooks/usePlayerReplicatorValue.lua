-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicatorValue
-- Decompile time: 0.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useOtherPlayerReplicator = require(ReplicatedStorage.Client.Interfaces.Hooks.useOtherPlayerReplicator)
local useState = React.useState
local useEffect = React.useEffect
return function(a1, a2, a3) -- Line: 10
    -- upvalues: useOtherPlayerReplicator (val), useState (val), useEffect (val)
    local u5 = useOtherPlayerReplicator(a1)
    local v1, u9 = useState(function() -- Line: 12 -- upvalues: u5 (val), a2 (val), a3 (val)
        local v1 = nil
        if u5 then
            v1 = u5:Get(a2)
        end
        if v1 == nil then
            return a3
        end
        return v1
    end)
    local v2 = {u5, a2}
    useEffect(function() -- Line: 22 -- upvalues: u5 (val), u9 (val), a3 (val), a2 (val)
        if not u5 then
            u9(a3)
            return
        end
        local v1 = u5:Get(a2)
        if v1 == nil then
            v1 = a3
        end
        u9(v1)
        local u22 = (u5:GetStateChangedSignal(a2)):Connect(function(a1) -- Line: 35 -- upvalues: u9 (upval)
            u9(a1)
        end)
        return function() -- Line: 39 -- upvalues: u22 (val)
            u22:Disconnect()
        end
    end, v2)
    return v1
end