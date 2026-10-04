-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useChallenges
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Challenges = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Challenges)
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local useChildren = require(ReplicatedStorage.Client.Interfaces.Hooks.useChildren)
return function() -- Line: 7
    -- upvalues: useChild (val), ReplicatedStorage (val), useChildren (val), React (val), Challenges (val)
    local u10 = useChildren((useChild(useChild(ReplicatedStorage, "Content"), "Challenges")))
    return React.useMemo(function() -- Line: 12 -- upvalues: u10 (val), Challenges (upval)
        local v1
        local v2 = {}
        if u10 == nil then
            return v2
        end
        for i, j in u10 do
            v1 = Challenges(j.Name)
            if not v1.trial then
                v2[v1.name] = v1
            end
        end
        return v2
    end, {u10})
end