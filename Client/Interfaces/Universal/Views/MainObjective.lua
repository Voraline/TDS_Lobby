-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.MainObjective
-- Decompile time: 2.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Game.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local useGameStateValue = require(Hooks.useGameStateValue)
local useReplicatedState = require(Hooks.useReplicatedState)
local useTagReplicators = require(Hooks.useTagReplicators)
local useViewEnabled = require(Hooks.useViewEnabled)
local MainObjective = require(Components.MainObjective)
local createElement = React.createElement
return function(a1) -- Line: 23
    -- upvalues: useViewEnabled (val), useGameStateValue (val), useTagReplicators (val), useReplicatedState (val)
    -- upvalues: createElement (val), MainObjective (val)
    local Hotbar = useViewEnabled("Hotbar")
    local Upgrades = useViewEnabled("Upgrades")
    local v1 = useViewEnabled("")
    local v2 = useGameStateValue("Objective", {}) or {}
    local v3 = useGameStateValue("GameStarted", false)
    local v4 = useGameStateValue("GameOver", false)
    local v5 = useReplicatedState((useTagReplicators("VoteManager"))[1], "Enabled")
    local name = v2.name
    local icon = v2.icon
    local progress = v2.progress
    local completed = v2.completed
    local subText = v2.subText
    if v3 and not v4 then
        return createElement("Frame", {
            BackgroundTransparency = 1,
            Visible = if Hotbar then v5 ~= true else if v1 then v5 ~= true else Upgrades and v5 ~= true,
            Size = UDim2.fromScale(1, 1),
        }, {
            objective = createElement(MainObjective, {
                Visible = name ~= nil,
                title = name,
                icon = icon,
                collectText = progress,
                subText = subText,
                completed = completed,
            }),
        })
    end
end