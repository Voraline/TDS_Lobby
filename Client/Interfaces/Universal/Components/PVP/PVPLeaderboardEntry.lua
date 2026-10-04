-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PVP.PVPLeaderboardEntry
-- Decompile time: 3.74 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local PVPLeaderboardCard = require(script.Parent.PVPLeaderboardCard)
local PVPLeaderboardRank = require(script.Parent.PVPLeaderboardRank)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local memo = React.memo
local u39 = {}
u39[1] = (Color3.fromRGB(255, 170, 0))
u39[2] = (Color3.fromRGB(255, 255, 255))
u39[3] = (Color3.fromRGB(255, 114, 43))
return memo(function(a1) -- Line: 37
    -- upvalues: u39 (val), Enum (val), PVPConstants (val), useState (val), useEffect (val), Players (val)
    -- upvalues: createElement (val), PVPLeaderboardRank (val), PVPLeaderboardCard (val)
    local v1 = a1.globalRank or 1
    local v2 = u39[v1] or Color3.fromRGB(103, 103, 103)
    local rank = a1.rank or Enum.Rank.PrivateI
    local v3 = PVPConstants.RANK_DATA[rank] or PVPConstants.RANK_DATA[Enum.Rank.PrivateI]
    local u28 = a1.userId or 0
    local v4, u36 = useState((("Player#%*"):format(u28)))
    local v5 = {u28}
    useEffect(function() -- Line: 48 -- upvalues: u36 (val), u28 (val), Players (upval)
        local u0 = nil
        u0 = task.spawn(function() -- Line: 50 -- upvalues: u36 (upval), u28 (upval), Players (upval), u0 (ref)
            u36((("Player#%*"):format(u28)))
            local success, result = pcall(function() -- Line: 53 -- upvalues: Players (upval), u28 (upval)
                return Players:GetNameFromUserIdAsync(u28)
            end)
            if success and result then
                u36(result)
            end
            u0 = nil
        end)
        return function() -- Line: 64 -- upvalues: u0 (ref)
            if u0 then
                task.cancel(u0)
            end
        end
    end, v5)
    v5 = {BackgroundTransparency = 1}
    local size = a1.size or UDim2.fromScale(1, 1)
    v5.Size = size
    v5.Position = a1.position
    v5.AnchorPoint = a1.anchorPoint
    v5.LayoutOrder = a1.layoutOrder
    return createElement("Frame", v5, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = a1.aspectRatio or 4.26}),
        rank = createElement(PVPLeaderboardRank, {position = UDim2.fromScale(0.04, 0.5), text = ("#%*"):format(v1), color = v2}),
        playerInfoCard = createElement(PVPLeaderboardCard, {
            anchorPoint = Vector2.new(0, 0.5),
            position = UDim2.fromScale(0.22, 0.5),
            size = UDim2.fromScale(0.76, 0.75),
            userName = v4,
            displayName = v4,
            userId = a1.userId,
            rankIcon = v3.Icon,
            wins = a1.wins,
            losses = a1.losses,
        }),
    })
end)