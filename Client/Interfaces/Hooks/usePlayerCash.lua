-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePlayerCash
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local usePlayerReplicator = require(script.Parent.usePlayerReplicator)
local useEffect = React.useEffect
local useState = React.useState
return function() -- Line: 8 -- upvalues: usePlayerReplicator (val), useState (val), useEffect (val)
    local u1 = usePlayerReplicator()
    local v1, u5 = useState(0)
    local v2 = {u1}
    useEffect(function() -- Line: 12 -- upvalues: u1 (val), u5 (val)
        local u18 = nil
        if u1 then
            u5(u1:Get("Cash"))
            u18 = (u1:GetStateChangedSignal("Cash")):Connect(function(a1) -- Line: 16 -- upvalues: u5 (upval)
                u5(a1)
            end)
        end
        return function() -- Line: 21 -- upvalues: u18 (ref)
            if u18 then
                u18:Disconnect()
            end
        end
    end, v2)
    return v1
end