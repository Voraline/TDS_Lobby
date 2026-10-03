-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PVP.PVPLeaderboardRank.story
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPLeaderboardRank = require(script.Parent.PVPLeaderboardRank)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), PVPLeaderboardRank (val), ReactRoblox (val)
    local v1 = createElement(PVPLeaderboardRank, {
        text = "#1",
        size = UDim2.fromOffset(55, 55),
        position = UDim2.fromScale(0.5, 0.5),
        anchorPoint = Vector2.new(0.5, 0.5),
    })
    local u20 = ReactRoblox.createRoot(a1)
    u20:render(v1)
    return function() -- Line: 21 -- upvalues: u20 (val)
        u20:unmount()
    end
end