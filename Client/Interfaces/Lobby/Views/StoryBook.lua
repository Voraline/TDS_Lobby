-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.StoryBook
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local StoryBook = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local createElement = React.createElement
return function() -- Line: 9 -- upvalues: useViewEnabled (val), createElement (val), StoryBook (val)
    local StoryBook_3, StoryBook_2 = useViewEnabled("StoryBook")
    return createElement(StoryBook, {
        Visible = StoryBook_3,
        Close = function() -- Line: 14 -- upvalues: StoryBook_2 (val)
            StoryBook_2("Hotbar")
        end,
    })
end