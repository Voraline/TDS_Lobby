-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PVP.PVPLeaderboardEntry.story
-- Decompile time: 1.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPLeaderboardEntry = require(script.Parent.PVPLeaderboardEntry)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), PVPLeaderboardEntry (val), Enum (val), ReactRoblox (val)
    local v1 = Random.new():NextInteger(0, 1000)
    local v2 = createElement(PVPLeaderboardEntry, {
        globalRank = 1,
        userId = 19004289,
        userName = "OutOfBears",
        displayName = "Bear",
        size = UDim2.fromOffset(300, 75),
        position = UDim2.fromScale(0.5, 0.5),
        anchorPoint = Vector2.new(0.5, 0.5),
        rank = Enum.Rank.GeneralI,
        wins = v1,
        losses = math.round(v1 * (Random.new():NextNumber(0.2, 0.8))),
    })
    local u40 = ReactRoblox.createRoot(a1)
    u40:render(v2)
    return function() -- Line: 31 -- upvalues: u40 (val)
        u40:unmount()
    end
end