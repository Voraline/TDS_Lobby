-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PVP.PVPLeaderboardCard.story
-- Decompile time: 2.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPLeaderboardCard = require(script.Parent.PVPLeaderboardCard)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), PVPLeaderboardCard (val), ReactRoblox (val)
    local v1 = Random.new():NextInteger(0, 1000)
    local v2 = createElement(PVPLeaderboardCard, {
        userId = 19004289,
        userName = "OutOfBears",
        displayName = "Bear",
        rankIcon = 79552995243967,
        size = UDim2.fromOffset(300, 75),
        position = UDim2.fromScale(0.5, 0.5),
        anchorPoint = Vector2.new(0.5, 0.5),
        wins = v1,
        losses = math.round(v1 * (Random.new():NextNumber(0.2, 0.8))),
    })
    local u37 = ReactRoblox.createRoot(a1)
    u37:render(v2)
    return function() -- Line: 27 -- upvalues: u37 (val)
        u37:unmount()
    end
end