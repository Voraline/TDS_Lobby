-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Battlepass
-- Decompile time: 4.85 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Seasons = require(ReplicatedStorage.Shared.Data.Seasons)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
local BattlepassBanner = require(Components.Battlepass.BattlepassBanner)
local Battlepass = require(Components.Battlepass)
local BattlepassGift = require(Components.Battlepass.BattlepassGift)
local useAttribute = require(Hooks.useAttribute)
local useFFlag = require(Hooks.useFFlag)
local useNetworkCall = require(Hooks.useNetworkCall)
local useReactBindings = require(Hooks.useReactBindings)
local useScale = require(Hooks.useScale)
local useView = require(Hooks.useView)
local useViewEnabled = require(Hooks.useViewEnabled)
local useState = React.useState
local useEffect = React.useEffect
local useCallback = React.useCallback
local createElement = React.createElement
local useMemo = React.useMemo
local LocalPlayer = Players.LocalPlayer
return function() -- Line: 38
    -- upvalues: useAttribute (val), LocalPlayer (val), useFFlag (val), useScale (val), useViewEnabled (val)
    -- upvalues: useView (val), useState (val), useNetworkCall (val), useMemo (val), Seasons (val)
    -- upvalues: useReactBindings (val), useEffect (val), useCallback (val), ViewController (val), createElement (val)
    -- upvalues: BattlepassBanner (val), BattlepassGift (val), Battlepass (val)
    local v1 = useAttribute(LocalPlayer, "DailySpinShown")
    local u7 = useFFlag("battlepass.enabled", true)
    local u11 = useFFlag("battlepass.name", "Operation I.C.E")
    local v2 = math.max(1, (useScale(1.4, nil, nil, true)))
    local Battlepass_2 = useViewEnabled("Battlepass")
    local v3, u27 = useView(true)
    local v4, u31 = useState(false)
    local v5, u35 = useState(false)
    local v6, u39 = useState(true)
    local u43 = useNetworkCall("Seasons", true)
    local v7 = {u11}
    local u48 = useMemo(function() -- Line: 53 -- upvalues: Seasons (upval), u11 (val)
        return Seasons.Seasons[u11]
    end, v7)
    local v8 = {u48}
    local u53 = useMemo(function() -- Line: 57 -- upvalues: u48 (val)
        local v1 = {
            startTime = u48 and u48.startsAt and u48.startsAt.UnixTimestamp or 0,
        }
        v1.endTime = u48 and u48.endsAt and u48.endsAt.UnixTimestamp or 0
        return v1
    end, v8)
    local v9 = {v3}
    useReactBindings(function(a1) -- Line: 71 -- upvalues: u39 (val)
        local v1 = true
        if a1 ~= "Hotbar" then
            v1 = a1 == ""
        end
        u39(v1)
    end, v9)
    v9 = {u7, u53}
    useEffect(function() -- Line: 75 -- upvalues: u53 (val), u7 (val), u31 (val)
        local startTime = u53.startTime
        local endTime = u53.endTime
        if not u7 then
            return
        end
        local u5 = true
        local u8 = task.spawn(function() -- Line: 84 -- upvalues: u5 (ref), startTime (val), endTime (val), u31 (upval)
            local ServerTimeNow, v1
            while u5 do
                ServerTimeNow = workspace:GetServerTimeNow()
                if not (startTime > 0) or not (endTime > 0) then
                    v1 = if not (endTime > 0) then startTime <= ServerTimeNow else ServerTimeNow < endTime
                else
                    v1 = false
                    if startTime <= ServerTimeNow then
                        v1 = ServerTimeNow <= endTime
                    end
                end
                u31(v1)
                task.wait(1)
            end
        end)
        return function() -- Line: 97 -- upvalues: u5 (ref), u8 (val)
            u5 = false
            if u8 then
                task.cancel(u8)
            end
        end
    end, v9)
    v9 = {Battlepass_2}
    useEffect(function() -- Line: 106 -- upvalues: Battlepass_2 (val), u35 (val)
        if not Battlepass_2 then
            u35(false)
        end
    end, v9)
    v7 = Battlepass_2 and v5 and v4
    local v10 = {u11}
    v9 = useCallback(function(a1) -- Line: 114 -- upvalues: u43 (val), u11 (val), ViewController (upval) -- types: a1: userdata
        local v1, v2 = u43("GiftBattlepass", u11, a1)
        if not v1 then
            ViewController:notifyError(v2 or "Failed to gift battlepass")
        end
    end, v10)
    local v11 = useCallback(function() -- Line: 120 -- upvalues: u35 (val)
        u35(false)
    end, {})
    local v12 = {u11}
    v10 = useCallback(function() -- Line: 123 -- upvalues: u43 (val), u11 (val), ViewController (upval)
        local v1, v2 = u43("BuyBattlepass", u11)
        if not v1 then
            ViewController:notifyError(v2 or "Failed to gift battlepass")
        end
    end, v12)
    local v13 = useCallback(function() -- Line: 129 -- upvalues: u35 (val)
        u35(true)
    end, {})
    v12 = useCallback(function() -- Line: 132 -- upvalues: u27 (val)
        u27("Hotbar")
    end, {})
    local v14 = {u11}
    local v15 = useCallback(function() -- Line: 135 -- upvalues: u43 (val), u11 (val)
        u43("BuyNextRank", u11)
    end, v14)
    local v16 = {u11}
    local v17 = useCallback(function() -- Line: 138 -- upvalues: u43 (val), u11 (val)
        u43("BuyAllRank", u11)
    end, v16)
    local v18 = {
        BackgroundTransparency = 1,
        Active = false,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v19 = {
        banner = createElement(BattlepassBanner, {
            Visible = v6 and v4 and v1 ~= true,
            name = u11,
            clicked = useCallback(function() -- Line: 152 -- upvalues: u27 (val)
                u27("Battlepass")
            end, {}),
        }),
    }
    local v20 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(v2, v2),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v21 = {}
    local v22 = v7 and createElement(BattlepassGift, {Visible = true, Size = UDim2.fromScale(0.2759, 0.475), onGift = v9, closed = v11}) or nil
    v21.gift = v22
    v22 = not v6 and Battlepass_2 and not v5 and v4 and createElement(Battlepass, {
        Visible = true,
        name = u11,
        premiumClicked = v10,
        gift = v13,
        close = v12,
        skip = v15,
        skipAll = v17,
    }) or nil
    v21.battlepass = v22
    v19.scaled = createElement("Frame", v20, v21)
    v14 = createElement("Frame", v18, v19)
    if u7 then
        return v14
    end
    if not Battlepass_2 then
        return
    end
    u27("Hotbar")
end