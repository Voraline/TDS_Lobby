-- Script path: ReplicatedStorage.Shared.UI.Components.ScreenQuery
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Value = require(ReplicatedStorage.Shared.UI.Fusion).Value
local MediaQuery = require(script.Parent.MediaQuery)
local ScreenStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ScreenStore)
local u25 = Value(false)
local u28 = Value(Vector2.zero)
local u30 = Value()
MediaQuery(function(a1, a2) -- Line: 14 -- upvalues: ScreenStore (val), u25 (val), u28 (val), u30 (val)
    ScreenStore.setScreenInfo(a1, a2)
    u25:set(a1.X <= 1200)
    u28:set(a1)
    u30:set(a2)
end)
return {IsMobile = u25, ScreenSize = u28, DeviceType = u30}