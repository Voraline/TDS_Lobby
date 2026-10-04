-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.PVPStats
-- Decompile time: 2.85 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local PVPProfileCard = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard)
local PVPUtilities = require(ReplicatedStorage.Shared.Modules.PVPUtilities)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useTagged = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagged)
local LocalPlayer = Players.LocalPlayer
local createPortal = ReactRoblox.createPortal
local createElement = React.createElement
local u61 = React.memo(function(a1) -- Line: 19 -- upvalues: PVPConstants (val), createElement (val), PVPProfileCard (val), LocalPlayer (val)
    local v1 = PVPConstants.RANK_DATA[a1.rank] or PVPConstants.RANK_DATA["-1"]
    return createElement(PVPProfileCard, {
        aspectRatio = 0.904651,
        physical = true,
        size = UDim2.fromScale(1, 1),
        position = UDim2.fromScale(0.5, 0.5),
        anchorPoint = Vector2.new(0.5, 0.5),
        userId = LocalPlayer.UserId,
        userName = LocalPlayer.Name,
        displayName = LocalPlayer.DisplayName,
        rankName = v1.Name,
        rankIcon = v1.Icon,
        enemiesSent = a1.enemiesSent or 0,
        enemiesKilled = a1.enemiesKilled or 0,
        wins = a1.wins or 0,
        losses = a1.losses or 0,
    })
end)
return function() -- Line: 46
    -- upvalues: useTagged (val), useCache (val), PVPUtilities (val), table (val), createPortal (val)
    -- upvalues: createElement (val), u61 (val), React (val)
    local v1 = useTagged("PVP_STATS", workspace)
    local u7 = useCache("Values.PVPWins", 0)
    local u11 = useCache("Values.PVPLosses", 0)
    local u15 = useCache("Values.EnemiesSent", 0)
    local u19 = useCache("Values.EnemiesKilled", 0)
    local u29 = PVPUtilities.getRankFromRating(useCache("RankedPVPRating.Rating", {}).Rating or -1)
    return createElement(React.Fragment, nil, (table.reduce(v1, function(a1, a2) -- Line: 56
        -- upvalues: createPortal (upval), createElement (upval), u61 (upval), u29 (val), u7 (val), u11 (val), u15 (val)
        -- upvalues: u19 (val)
        a1[#a1 + 1] = (createPortal({
            leaderboard = createElement(u61, {
                rank = u29,
                wins = u7,
                losses = u11,
                enemiesSent = u15,
                enemiesKilled = u19,
            }),
        }, a2))
        return a1
    end, {})))
end