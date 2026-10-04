-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUnitsList
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local useChild = require(script.Parent.useChild)
local useEvent = require(script.Parent.useEvent)
local u26 = Signal.new()
return function() -- Line: 10 -- upvalues: useChild (val), ReplicatedStorage (val), React (val), useEvent (val), u26 (val)
    local u7 = useChild(useChild(ReplicatedStorage, "Content"), "Unit")
    local v1, u12 = React.useState({})
    local v2 = {u7}
    local v3 = React.useCallback(function() -- Line: 16 -- upvalues: u7 (val), u12 (val)
        if u7 == nil then
            return
        end
        local v1 = {}
        for i, j in u7:GetChildren() do
            table.insert(v1, j.Name)
        end
        u12(v1)
    end, v2)
    useEvent(if not u7 then u26 else u7.ChildAdded, v3, {u7})
    React.useEffect(v3, {u7})
    return v1
end