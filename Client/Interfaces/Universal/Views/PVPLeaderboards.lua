-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.PVPLeaderboards
-- Decompile time: 4.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local PVPLeaderboardEntry = require(ReplicatedStorage.Client.Interfaces.Universal.Components.PVP.PVPLeaderboardEntry)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useTagged = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagged)
local createPortal = ReactRoblox.createPortal
local createElement = React.createElement
local useEffect = React.useEffect
local memo = React.memo

local function getTimeDelta(a1) -- Line: 18 -- types: a1: number
    return (math.ceil((a1 - (workspace:GetServerTimeNow())) / 86400))
end

local u58 = memo(function(a1) -- Line: 26
    -- upvalues: useAtom (val), ClientAtoms (val), createElement (val), PVPLeaderboardEntry (val), React (val)
    local v1
    local v2 = useAtom(ClientAtoms[a1.state or "pvpLeaderboardPlayers"])
    local v3 = {
        list = createElement("UIListLayout", {
            Padding = UDim.new(-0.02, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            ItemLineAlignment = Enum.ItemLineAlignment.Start,
        }),
        padding = createElement("UIPadding", {PaddingRight = UDim.new(0, 4)}),
    }
    for i, j in v2 or {} do
        v1 = tostring(i)
        v3[v1] = (createElement(PVPLeaderboardEntry, {
            layoutOrder = i,
            userId = j.userId,
            globalRank = i,
            rank = j.rank,
            wins = j.wins,
            losses = j.losses,
        }))
    end
    return createElement(React.Fragment, nil, v3)
end)
return function() -- Line: 56
    -- upvalues: useTagged (val), table (val), createPortal (val), createElement (val), u58 (val), useEffect (val)
    -- upvalues: PVPConstants (val), React (val)
    local u3 = useTagged("PVP_LEADERBOARD", workspace)
    local v1 = table.reduce(u3, function(a1, a2) -- Line: 59 -- upvalues: createPortal (upval), createElement (upval), u58 (upval)
        local ScrollingFrame = a2:FindFirstChildWhichIsA("ScrollingFrame", true)
        if not ScrollingFrame then
            return a1
        end
        a1[#a1 + 1] = (createPortal({leaderboard = createElement(u58, {state = a2.Parent:GetAttribute("Type")})}, ScrollingFrame))
        return a1
    end, {})
    local v2 = {u3}
    useEffect(function() -- Line: 75 -- upvalues: PVPConstants (upval), u3 (val)
        local Season, SeasonDays, v1
        local v2 = PVPConstants.getLastSeason()
        local v3 = math.ceil((v2.endsAt.UnixTimestamp - (workspace:GetServerTimeNow())) / 86400)
        if not v2 then
            return
        end
        local v4 = nil
        local v5 = nil
        for i, j in u3, v4, v5 do
            Season = j:FindFirstChild("Season")
            SeasonDays = j:FindFirstChild("SeasonDays")
            if Season then
                Season.Text = v2.name
            end
            if SeasonDays then
                v1 = if not (v3 < 0) then ("Season Ends in %* days"):format(v3) else ("Season Ended %* days ago"):format(-v3)
                SeasonDays.Text = v1
            end
        end
    end, v2)
    return createElement(React.Fragment, nil, v1)
end