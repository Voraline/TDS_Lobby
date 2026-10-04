-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useGlobalModifiers
-- Decompile time: 1.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local useChildren = require(script.Parent.useChildren)
return function(a1) -- Line: 9
    -- upvalues: GameType (val), useChild (val), ReplicatedStorage (val), useChildren (val), React (val)
    if GameType:Get() == "Lobby" then
        return {}
    end
    local u16 = useChildren((useChild(useChild(ReplicatedStorage, "Content"), "GlobalModifiers")))
    return (React.useMemo(function() -- Line: 18 -- upvalues: u16 (val), a1 (val)
        local v1
        local v2 = {}
        local v3 = nil
        local v4 = nil
        for i, j in u16, v3, v4 do
            v1 = require(j)
            if not (if not a1 then v1.sandboxDisabled else false) and v1.displayName and v1.icon then
                v2[j.Name] = v1
            end
        end
        return v2
    end, {u16}))
end