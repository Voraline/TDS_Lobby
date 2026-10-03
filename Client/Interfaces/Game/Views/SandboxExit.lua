-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.SandboxExit
-- Decompile time: 0.90 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local SandboxExitButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.SandboxExitButton)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local createElement = React.createElement
local Teleport = NewNetwork.Channel("Teleport")
return function(a1) -- Line: 19
    -- upvalues: useGameStateValue (val), React (val), Players (val), Teleport (val), createElement (val)
    -- upvalues: SandboxExitButton (val)
    local GameMode = useGameStateValue("GameMode")
    local u7, u8 = React.useState(false)
    local useEffect = React.useEffect
    local v1 = {a1.setDisplayOrder}
    useEffect(function() -- Line: 23 -- upvalues: a1 (val)
        a1.setDisplayOrder(1003)
    end, v1)
    if GameMode ~= "Sandbox" then
        return nil
    end
    return createElement(SandboxExitButton, {
        exiting = u7,
        onExit = function() -- Line: 31 -- upvalues: u7 (val), u8 (val), Players (upval), Teleport (upval)
            if u7 then
                return
            end
            u8(true)
            Players.LocalPlayer:SetAttribute("Teleporting", true)
            Teleport:fireServer("backToLobby")
        end,
    })
end