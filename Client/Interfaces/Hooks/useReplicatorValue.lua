-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorValue
-- Decompile time: 0.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Modules.TagReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
return function(a1, a2, a3) -- Line: 9 -- upvalues: useState (val), useEffect (val), React (val) -- types: a2: string
    local v1, u6 = useState(function() -- Line: 14 -- upvalues: a1 (val), a2 (val), a3 (val)
        if a1 then
            return a1:Get(a2)
        end
        return a3
    end)
    local v2 = {a1, a2}
    useEffect(function() -- Line: 22 -- upvalues: a1 (val), a2 (val), u6 (val)
        if not a1 then
            return
        end
        local v1 = a1:Get(a2)
        if a1 and a1.Maid then
            local u14 = a1.Changed:Connect(function(a1, a2_2) -- Line: 32 -- upvalues: a2 (upval), u6 (upval)
                if a1 == a2 then
                    u6(a2_2)
                end
            end)
            u6(v1)
            return function() -- Line: 40 -- upvalues: u14 (val)
                u14:Disconnect()
            end
        end
    end, v2)
    local v3 = {a1, a2}
    return v1, React.useCallback(function(a1_2) -- Line: 46 -- upvalues: a1 (val), a2 (val)
        a1:Set(a2, a1_2)
    end, v3)
end