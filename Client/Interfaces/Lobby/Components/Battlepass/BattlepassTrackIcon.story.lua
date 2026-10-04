-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassTrackIcon.story
-- Decompile time: 1.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local BattlepassTrackIcon = require(script.Parent.BattlepassTrackIcon)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), BattlepassTrackIcon (val), ReactRoblox (val)
    local v1 = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(180, 300)}, {
        blue = createElement(BattlepassTrackIcon, {
            icon = "Blue",
            text = "Regular",
            clicked = function() end,
        }),
        gold = createElement(BattlepassTrackIcon, {
            icon = "Golden",
            text = "Premium",
            Position = UDim2.fromScale(0, 0.517),
            clicked = function() end,
        }),
    })
    local u27 = ReactRoblox.createRoot(a1)
    u27:render(v1)
    return function() -- Line: 31 -- upvalues: u27 (val)
        u27:unmount()
    end
end