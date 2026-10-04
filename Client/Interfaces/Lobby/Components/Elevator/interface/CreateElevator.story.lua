-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.interface.CreateElevator.story
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local CreateElevator = require(script.Parent.CreateElevator)
local React_2 = React.React
local ReactRoblox = React.ReactRoblox
local createElement = React_2.createElement
local useState = React_2.useState
return {
    react = React_2,
    reactRoblox = ReactRoblox,
    story = function() -- Line: 16 -- upvalues: useState (val), createElement (val), CreateElevator (val)
        local v1, v2 = useState(1)
        return createElement(CreateElevator, {size = v1, sizes = {1, 2, 3, 4}, onSetSize = v2, onCreate = print})
    end,
}