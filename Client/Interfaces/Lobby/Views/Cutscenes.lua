-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Cutscenes
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cutscenes = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Cutscenes)
local React = require(ReplicatedStorage.Shared.UI.React)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local createElement = React.createElement
return function() -- Line: 9 -- upvalues: useViewEnabled (val), createElement (val), Cutscenes (val)
    local Cutscenes_3, Cutscenes_2 = useViewEnabled("Cutscenes")
    return createElement(Cutscenes, {
        Visible = Cutscenes_3,
        Close = function() -- Line: 14 -- upvalues: Cutscenes_2 (val)
            Cutscenes_2("Hotbar")
        end,
    })
end