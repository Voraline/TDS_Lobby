-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.InnovationTeleport
-- Decompile time: 0.60 ms

game:GetService("BadgeService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TeleportService")
require(ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen)
require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
require(ReplicatedStorage.Client.Interfaces.Lobby.InnovationTeleportConfig)
require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
require(Hooks.useFFlag)
require(Hooks.useScale)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local LocalPlayer = Players.LocalPlayer
return function() end