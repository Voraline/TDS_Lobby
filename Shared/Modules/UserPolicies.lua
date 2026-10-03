-- Script path: ReplicatedStorage.Shared.Modules.UserPolicies
-- Decompile time: 0.96 ms

local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Types.PromiseTypes)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u30 = {}
local u31 = {}
Players.PlayerRemoving:Connect(function(a1) -- Line: 31 -- upvalues: u30 (val)
    u30[a1] = nil
end)
return function(a1) -- Line: 35
    -- upvalues: RunService (val), Players (val), TypedPromise (val), u30 (val), PolicyService (val), u31 (val)
    if RunService:IsClient() and a1 ~= Players.LocalPlayer then
        return TypedPromise.reject("Can only get policies for the current player on the client")
    end
    if u30[a1] then
        return TypedPromise.resolve(u30[a1])
    end
    local v1 = TypedPromise.new(function(a1_2, a2) -- Line: 46 -- upvalues: PolicyService (upval), a1 (val), u30 (upval)
        local success, result = pcall(function() -- Line: 47 -- upvalues: PolicyService (upval), a1 (upval)
            return PolicyService:GetPolicyInfoForPlayerAsync(a1)
        end)
        if not success then
            a2(result)
            return
        end
        u30[a1] = result
        a1_2(result)
    end)
    v1:finally(function() -- Line: 65 -- upvalues: u31 (upval), a1 (val)
        u31[a1] = nil
    end)
    u31[a1] = v1
    return v1
end