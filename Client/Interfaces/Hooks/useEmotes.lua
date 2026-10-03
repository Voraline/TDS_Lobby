-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useEmotes
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ContentAssets = require(ReplicatedStorage.Shared.Modules.ContentAssets)
local NewEmotes = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewEmotes)
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local useChildren = require(script.Parent.useChildren)
local Emotes = ContentAssets("Emotes")
local u42 = RunService:IsRunning()
return function() -- Line: 15
    -- upvalues: u42 (val), Emotes (val), useChild (val), ReplicatedStorage (val), useChildren (val), React (val)
    -- upvalues: NewEmotes (val)
    local v1 = not u42 and Emotes or useChild(ReplicatedStorage, "Content")
    local v2 = useChild(v1, "Emote")
    local u13 = useChildren(v2)
    return React.useMemo(function() -- Line: 20 -- upvalues: u13 (val), NewEmotes (upval)
        local v1
        local v2 = {}
        for i, j in u13 do
            v1 = NewEmotes(j.Name)
            if v1 then
                v2[j.Name] = v1
            end
        end
        return v2
    end, {v1, v2, u13})
end