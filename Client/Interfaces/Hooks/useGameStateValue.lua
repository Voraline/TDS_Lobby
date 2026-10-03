-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEvent = require(script.Parent.useEvent)
local useState = React.useState
local useBinding = React.useBinding
local u26 = workspace.Type.Value == "Game"
return function(a1, a2, a3) -- Line: 12
    -- upvalues: useBinding (val), useState (val), u26 (val), GameState (val), useEvent (val)
    local v1 = a3 and useBinding or useState
    if not u26 then
        return (v1(a2))
    end
    local v2 = GameState[a1]
    local v3, u19 = v1(if v2 == nil then a2 else v2)
    useEvent(GameState.Replicator:GetStateChangedSignal(a1), function(a1) -- Line: 19 -- upvalues: u19 (val)
        u19(a1)
    end)
    return v3
end