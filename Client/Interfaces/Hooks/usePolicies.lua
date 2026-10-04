-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePolicies
-- Decompile time: 1.60 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local UserPolicies = require(ReplicatedStorage.Shared.Modules.UserPolicies)
local useEffect = React.useEffect
local useState = React.useState
return function() -- Line: 13 -- upvalues: useState (val), useEffect (val), UserPolicies (val), Players (val)
    local v1, u3 = useState(true)
    local v2, u7 = useState({})
    useEffect(function() -- Line: 17 -- upvalues: UserPolicies (upval), Players (upval), u7 (val), u3 (val)
        local u11 = ((UserPolicies(Players.LocalPlayer)):andThen(function(a1) -- Line: 18 -- upvalues: u7 (upval)
            u7(a1)
        end)):finally(function() -- Line: 20 -- upvalues: u3 (upval)
            u3(false)
        end)
        return function() -- Line: 24 -- upvalues: u11 (val)
            u11:cancel()
        end
    end, {})
    return v1, v2
end