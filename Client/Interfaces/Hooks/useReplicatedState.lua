-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState
-- Decompile time: 1.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Modules.TagReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect

local function getValue(a1, a2, a3) -- Line: 9 -- types: a2: string
    local v1
    if (if not a1 then nil else a1:Get(a2)) == nil then
        return a3
    end
    return v1
end

return function(a1, a2, a3) -- Line: 14 -- upvalues: useState (val), useEffect (val), React (val) -- types: a2: string
    local v1, u6 = useState(function() -- Line: 15 -- upvalues: a1 (val), a2 (val), a3 (val)
        local v1
        local v2 = a1
        if (if not v2 then nil else v2:Get(a2)) == nil then
            return a3
        end
        return v1
    end)
    local v2 = {a1, a2}
    useEffect(function() -- Line: 19 -- upvalues: a1 (val), a2 (val), a3 (val), u6 (val)
        if not a1 then
            return
        end
        local v1 = a1
        local v2 = a3
        local v3 = if not v1 then nil else v1:Get(a2)
        local v4 = if v3 ~= nil then v3 else v2
        if a1 and a1.Maid then
            local u24 = (a1:GetStateChangedSignal(a2)):Connect(function(a1) -- Line: 29 -- upvalues: u6 (upval), a3 (upval)
                u6(if a1 ~= nil then a1 else a3)
            end)
            u6(v4)
            return function() -- Line: 35 -- upvalues: u24 (val)
                u24:Disconnect()
            end
        end
    end, v2)
    local v3 = {a1, a2}
    return v1, React.useCallback(function(a1_2) -- Line: 41 -- upvalues: a1 (val), a2 (val)
        if a1 then
            a1:Set(a2, a1_2)
        end
    end, v3)
end