-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.CurseSelectedPopup
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurseVotedFor = require(ReplicatedStorage.Client.Interfaces.Game.Components.CurseVotedFor)
local React = require(ReplicatedStorage.Shared.UI.React)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicators = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
local createElement = React.createElement

local function render() -- Line: 11
    -- upvalues: useTagReplicators (val), useReplicatedState (val), useGameStateValue (val), createElement (val)
    -- upvalues: CurseVotedFor (val)
    local v1 = useTagReplicators("CurseReplicator")[1]
    local v2 = useReplicatedState(v1, "VotedWon")
    local v3 = useReplicatedState(v1, "Index")
    if useGameStateValue("GameStarted") and v2 ~= nil then
        return createElement(CurseVotedFor, {enabled = true, index = v3, modifier = v2})
    end
end

return function(a1) -- Line: 29 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(999999999)
    a1.setIgnoreGuiInset(true)
    a1.setZIndexBehavior(Enum.ZIndexBehavior.Global)
    return createElement(render)
end