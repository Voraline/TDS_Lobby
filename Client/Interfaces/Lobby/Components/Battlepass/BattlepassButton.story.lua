-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassButton.story
-- Decompile time: 1.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BattlepassButton = require(script.Parent.BattlepassButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), BattlepassButton (val), ReactRoblox (val)
    local v1 = createElement(BattlepassButton, {
        text = "Skip",
        icon = 1197061307,
        Position = UDim2.fromOffset(20, 20),
        AnchorPoint = Vector2.new(0, 0),
        Size = UDim2.fromOffset(200, 50),
    })
    local u20 = ReactRoblox.createRoot(a1)
    u20:render(v1)
    return function() -- Line: 21 -- upvalues: u20 (val)
        u20:unmount()
    end
end