-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.TopBarCurrencies
-- Decompile time: 2.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local Seasons = require(ReplicatedStorage.Shared.Data.Seasons)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local TopBarCollectible = require(script.Parent.TopBarCollectible)
local Fragment = React.Fragment
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local memo = React.memo
local Seasons_2 = Network.Channel("Seasons")
local u41 = memo(function(a1) -- Line: 21
    -- upvalues: useState (val), useEffect (val), Seasons_2 (val), Seasons (val), createElement (val)
    -- upvalues: TopBarCollectible (val)
    local name
    local LayoutOrder = a1.LayoutOrder
    local season = a1.season
    if not season then
        name = ""
    else
        name = season.name
        if not name then
            name = ""
        end
    end
    local v1, u8 = useState(0)
    local v2 = {name}
    useEffect(function() -- Line: 29 -- upvalues: name (val), u8 (val), Seasons_2 (upval), Seasons (upval)
        if name == "" then
            return
        end
        local u3 = task.spawn(function() -- Line: 34 -- upvalues: u8 (upval), Seasons_2 (upval), name (upval)
            u8(Seasons_2:InvokeServer("GetSeasonValue", name))
        end)
        local v1 = name
        local u11 = (Seasons.getSeasonChangedSignal(v1)):Connect(function(a1) -- Line: 38 -- upvalues: u8 (upval)
            u8(a1)
        end)
        return function() -- Line: 42 -- upvalues: u3 (val), u11 (val)
            task.cancel(u3)
            u11:Disconnect()
        end
    end, v2)
    return createElement(TopBarCollectible, {LayoutOrder = LayoutOrder, icon = season.currency.icon, amount = v1})
end)
return memo(function(a1) -- Line: 55
    -- upvalues: useState (val), useEffect (val), Seasons (val), table (val), createElement (val), u41 (val)
    -- upvalues: Fragment (val)
    local v1, v2, v3
    local v4 = {}
    local v5, u5 = useState({})
    useEffect(function() -- Line: 59 -- upvalues: u5 (val), Seasons (upval), table (upval)
        local function updateSeasons() -- Line: 60 -- upvalues: u5 (upval), Seasons (upval), table (upval)
            u5(function(a1) -- Line: 61 -- upvalues: Seasons (upval), table (upval)
                local ActiveSeasons = Seasons.ActiveSeasons
                if table.deepCompare(a1, ActiveSeasons) then
                    return a1
                end
                return table.clone(ActiveSeasons)
            end)
        end

        local u6 = Seasons.UpdatedSeasons:Connect(function() -- Line: 72 -- upvalues: u5 (upval), Seasons (upval), table (upval)
            u5(function(a1) -- Line: 61 -- upvalues: Seasons (upval), table (upval)
                local ActiveSeasons = Seasons.ActiveSeasons
                if table.deepCompare(a1, ActiveSeasons) then
                    return a1
                end
                return table.clone(ActiveSeasons)
            end)
        end)
        u5(function(a1) -- Line: 61 -- upvalues: Seasons (upval), table (upval)
            local ActiveSeasons = Seasons.ActiveSeasons
            if table.deepCompare(a1, ActiveSeasons) then
                return a1
            end
            return table.clone(ActiveSeasons)
        end)
        return function() -- Line: 78 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, {})
    local v6 = 1
    for k, v in pairs(v5) do
        if v.currency then
            v1 = createElement
            v2 = u41
            v3 = {season = v, LayoutOrder = -v6}
            v4[k] = (v1(v2, v3))
            v6 = v6 + 1
        end
    end
    return createElement(Fragment, {}, v4)
end)