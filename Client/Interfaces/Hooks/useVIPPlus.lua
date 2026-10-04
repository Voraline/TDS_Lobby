-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useVIPPlus
-- Decompile time: 1.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shop = require(ReplicatedStorage.Shared.Modules.Network).Channel("Shop")
local usePlayerReplicator = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
local useCallback = React.useCallback
return function() -- Line: 13
    -- upvalues: useState (val), usePlayerReplicator (val), useEffect (val), useCallback (val), Shop (val)
    local u2, u3 = useState(false)
    local u5 = usePlayerReplicator()
    local v1 = {u5}
    useEffect(function() -- Line: 17 -- upvalues: u5 (val), u3 (val)
        if not u5 then
            return
        end
        local u9 = (u5:GetStateChangedSignal("VIPPlus")):Connect(function(a1) -- Line: 22 -- upvalues: u3 (upval)
            u3(a1)
        end)
        u3(u5:Get("VIPPlus") or false)
        return function() -- Line: 28 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, v1)
    local v2 = {u2}
    return u2, useCallback(function() -- Line: 34 -- upvalues: u2 (val), Shop (upval)
        if not u2 then
            Shop:FireServer("SubscriptionPurchase", "EXP-5914385580085215338")
        end
    end, v2)
end