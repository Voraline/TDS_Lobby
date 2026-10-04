-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useMerchStoreEnabled
-- Decompile time: 0.61 ms

local Hooks = (game:GetService("ReplicatedStorage")).Client.Interfaces.Hooks
local usePolicies = require(Hooks.usePolicies)
return function() -- Line: 10 -- upvalues: usePolicies (val)
    local v1, v2 = usePolicies()
    if v1 or not v2.IsEligibleToPurchaseCommerceProduct then
        return false
    end
    return true
end