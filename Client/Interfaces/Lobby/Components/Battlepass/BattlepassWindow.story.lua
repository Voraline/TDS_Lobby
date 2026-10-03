-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassWindow.story
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local BattlepassWindow = require(script.Parent.BattlepassWindow)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), BattlepassWindow (val), ReactRoblox (val)
    local v1 = createElement(BattlepassWindow, {title = "Krampus' Revenge", subTitle = "3 Weeks, 2 Days Left"}, {})
    local u9 = ReactRoblox.createRoot(a1)
    u9:render(v1)
    return function() -- Line: 18 -- upvalues: u9 (val)
        u9:unmount()
    end
end