-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowerModel
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerModelResolver = require(ReplicatedStorage.Client.Modules.TowerModelResolver)
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 9 -- upvalues: useState (val), TowerModelResolver (val), useEffect (val)
    local u4 = if a1 == nil then nil else tostring(a1)
    local v1, u9 = useState(function() -- Line: 11 -- upvalues: TowerModelResolver (upval), u4 (val)
        return TowerModelResolver.getModel(u4)
    end)
    local v2 = {u4}
    useEffect(function() -- Line: 15 -- upvalues: u4 (val), u9 (val), TowerModelResolver (upval)
        if not u4 then
            u9(nil)
            return
        end

        local function refresh() -- Line: 21 -- upvalues: u9 (upval), TowerModelResolver (upval), u4 (upval)
            u9(TowerModelResolver.getModel(u4))
        end

        u9(TowerModelResolver.getModel(u4))
        return TowerModelResolver.observe(function() -- Line: 26 -- upvalues: u9 (upval), TowerModelResolver (upval), u4 (upval)
            u9(TowerModelResolver.getModel(u4))
        end)
    end, v2)
    return v1
end