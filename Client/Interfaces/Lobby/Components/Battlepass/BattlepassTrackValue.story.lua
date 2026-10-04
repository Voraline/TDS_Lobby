-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassTrackValue.story
-- Decompile time: 2.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local BattlepassTrackValue = require(script.Parent.BattlepassTrackValue)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), BattlepassTrackValue (val), ReactRoblox (val)
    local v1 = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(882, 391)}, {
        layout = createElement("UIListLayout", {
            Padding = UDim.new(0, 20),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        one = createElement(BattlepassTrackValue, {LayoutOrder = 1, regular = {completed = true}, premium = {completed = true}}),
        two = createElement(BattlepassTrackValue, {LayoutOrder = 2, regular = {}, premium = {}}),
        three = createElement(BattlepassTrackValue, {LayoutOrder = 3, regular = {locked = true}}),
        four = createElement(BattlepassTrackValue, {LayoutOrder = 4, locked = true, regular = {locked = true}, premium = {locked = true}}),
    })
    local u46 = ReactRoblox.createRoot(a1)
    u46:render(v1)
    return function() -- Line: 66 -- upvalues: u46 (val)
        u46:unmount()
    end
end