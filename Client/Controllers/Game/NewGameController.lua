-- Script path: ReplicatedStorage.Client.Controllers.Game.NewGameController
-- Decompile time: 0.37 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Currency = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Hotbar.Views.Currency)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Currency"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
local v1 = Currency({DisableShop = true, GemsVisible = false, HideBuyIcons = true, OnlyShowOnChange = true})
v1.Parent = ScreenGui
v1.Position = UDim2.fromScale(0.5, 0.1)
return {}