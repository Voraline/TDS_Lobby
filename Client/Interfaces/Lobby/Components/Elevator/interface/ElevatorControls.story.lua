-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.interface.ElevatorControls.story
-- Decompile time: 2.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ElevatorControls = require(script.Parent.ElevatorControls)
local React_2 = React.React
local ReactRoblox = React.ReactRoblox
local createElement = React_2.createElement
local useState = React_2.useState
return {
    react = React_2,
    reactRoblox = ReactRoblox,
    story = function(a1) -- Line: 16 -- upvalues: useState (val), createElement (val), ElevatorControls (val)
        local v1, u4 = useState(false)
        return createElement(ElevatorControls, {
            isReady = v1,
            canLeave = a1.controls.canLeave,
            size = a1.controls.size,
            ready = a1.controls.ready,
            onToggleReady = function() -- Line: 24 -- upvalues: u4 (val)
                u4(function(a1) -- Line: 25
                    return not a1
                end)
            end,
        })
    end,
    controls = {ready = 1, players = 4, canLeave = true},
}