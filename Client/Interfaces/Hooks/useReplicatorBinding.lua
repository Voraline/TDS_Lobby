-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorBinding
-- Decompile time: 1.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Modules.TagReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local useBinding = React.useBinding
local useEffect = React.useEffect

local function getValue(a1, a2, a3) -- Line: 9 -- types: a2: string
    local v1
    if (if not a1 then nil else a1:Get(a2)) == nil then
        return a3
    end
    return v1
end

return function(a1, a2, a3) -- Line: 14 -- upvalues: useBinding (val), useEffect (val), React (val) -- types: a2: string
    local v1 = if not a1 then nil else a1:Get(a2)
    local v2, u17 = useBinding(if v1 ~= nil then v1 else a3)
    local v3 = {a1, a2}
    useEffect(function() -- Line: 21 -- upvalues: a1 (val), a2 (val), a3 (val), u17 (val)
        if not a1 then
            return
        end
        local v1 = a1
        local v2 = a3
        local v3 = if not v1 then nil else v1:Get(a2)
        local v4 = if v3 ~= nil then v3 else v2
        if a1 and a1.Maid then
            local u24 = (a1:GetStateChangedSignal(a2)):Connect(function(a1) -- Line: 31 -- upvalues: u17 (upval), a3 (upval)
                u17(if a1 ~= nil then a1 else a3)
            end)
            u17(v4)
            return function() -- Line: 37 -- upvalues: u24 (val)
                u24:Disconnect()
            end
        end
    end, v3)
    local v4 = {a1, a2}
    return v2, React.useCallback(function(a1_2) -- Line: 43 -- upvalues: a1 (val), a2 (val)
        if a1 then
            a1:Set(a2, a1_2)
        end
    end, v4)
end