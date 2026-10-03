-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.OldUpgrades
-- Decompile time: 0.96 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
require(ReplicatedStorage.Client.Interfaces.Game.Components.Upgrade)
require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Packages.ReactCharm)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local u78 = {}

function u78.Render() end

return function() -- Line: 121 -- upvalues: Players (val), Create (val), ReactRoblox (val), createElement (val), u78 (val)
    local PlayerGui = Players.LocalPlayer.PlayerGui
    local ReactUpgrades = PlayerGui:FindFirstChild("ReactUpgrades") or Create("ScreenGui", {
        Name = "ReactUpgrades",
        ResetOnSpawn = false,
        DisplayOrder = 1003,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    ReactUpgrades.DisplayOrder = 1003
    return ReactRoblox.createPortal({upgrades = createElement(u78.Render)}, ReactUpgrades)
end