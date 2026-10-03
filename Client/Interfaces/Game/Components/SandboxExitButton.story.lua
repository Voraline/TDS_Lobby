-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SandboxExitButton.story
-- Decompile time: 1.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SandboxExitButton = require(script.Parent.SandboxExitButton)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {returning = false},
    story = function(a1) -- Line: 13 -- upvalues: React (val), createElement (val), SandboxExitButton (val)
        local v1, u5 = React.useState(false)
        return createElement(SandboxExitButton, {
            exiting = a1.controls.returning or v1,
            onExit = function() -- Line: 18 -- upvalues: u5 (val)
                u5(true)
            end,
        })
    end,
}