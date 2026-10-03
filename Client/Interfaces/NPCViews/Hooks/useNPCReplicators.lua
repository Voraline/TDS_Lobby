-- Script path: ReplicatedStorage.Client.Interfaces.NPCViews.Hooks.useNPCReplicators
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 10 -- upvalues: useState (val), useEffect (val), Maid (val), TagReplicator (val)
    local v1, u4 = useState({})
    useEffect(function() -- Line: 13 -- upvalues: Maid (upval), u4 (val), TagReplicator (upval), a1 (val)
        local u2 = Maid.new()
        u2:Mark((TagReplicator.getChangedReplicators(a1, function(a1) -- Line: 16 -- upvalues: u4 (upval)
            u4(function(a1_2) -- Line: 17 -- upvalues: a1 (val)
                local v1 = table.clone(a1_2)
                table.insert(v1, a1)
                return v1
            end)
        end, function(a1) -- Line: 25 -- upvalues: u4 (upval)
            u4(function(a1_2) -- Line: 26 -- upvalues: a1 (val)
                local v1 = table.clone(a1_2)
                warn(table.find(v1, a1) ~= nil)
                table.remove(v1, table.find(v1, a1))
                return v1
            end)
        end)))
        return function() -- Line: 38 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, {})
    return v1
end