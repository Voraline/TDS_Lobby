-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useEnemyStats
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local useAsyncEffect = require(script.Parent.useAsyncEffect)
local EnemyStats = NewNetwork.Channel("EnemyStats")
return function(a1) -- Line: 9
    -- upvalues: React (val), useAsyncEffect (val), TypedPromise (val), EnemyStats (val)
    local v1, u5 = React.useState(nil)
    local v2 = {a1}
    useAsyncEffect(function() -- Line: 12 -- upvalues: TypedPromise (upval), u5 (val), EnemyStats (upval), a1 (val)
        return TypedPromise.new(function(a1_2) -- Line: 13 -- upvalues: u5 (upval), EnemyStats (upval), a1 (upval)
            u5(EnemyStats:invokeServer("Get", a1))
            a1_2()
        end)
    end, v2)
    return v1
end