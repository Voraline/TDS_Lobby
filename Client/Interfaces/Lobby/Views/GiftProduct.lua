-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.GiftProduct
-- Decompile time: 5.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
local BattlepassGift = require(Components.Battlepass.BattlepassGift)
local useMediaQuery = require(Hooks.useMediaQuery)
local useNetworkCall = require(Hooks.useNetworkCall)
local useRef = React.useRef
local useState = React.useState
local useEffect = React.useEffect
local useCallback = React.useCallback
local createElement = React.createElement
local u50 = UDim2.fromScale(0.5, 0.95)
local u54 = UDim2.fromScale(0.2759, 0.475)
return function(a1) -- Line: 37
    -- upvalues: useMediaQuery (val), useRef (val), useState (val), useNetworkCall (val), useEffect (val)
    -- upvalues: ViewController (val), useCallback (val), Notification (val), createElement (val), BattlepassGift (val)
    -- upvalues: u50 (val), u54 (val)
    local u4 = not useMediaQuery("large")
    local u6 = useRef()
    local v1, u10 = useState(false)
    local u12, u13 = useState()
    local u17 = useNetworkCall("GiftProduct", true)
    useEffect(function(a1) -- Line: 44 -- upvalues: ViewController (upval), u13 (val), u10 (val), u6 (val)
        return ViewController:onViewChange(function(a1) -- Line: 45 -- upvalues: u13 (upval), u10 (upval), u6 (upval)
            local v1 = string.match(a1, "GiftProduct:(%d+)")
            if v1 then
                u13((tonumber(v1)))
                u10(true)
                return
            end
            u6.current = a1
            u10(false)
        end)
    end, {})
    local u22 = v1 and u12
    local v2 = useEffect
    local v3 = {u4, u22, a1.screen, a1.setIgnoreGuiInset}
    v2(function() -- Line: 58 -- upvalues: u4 (val), u22 (val), a1 (val)
        if u4 and u22 and a1.setIgnoreGuiInset then
            local IgnoreGuiInset = if not a1.screen then false else a1.screen.IgnoreGuiInset
            a1.setIgnoreGuiInset(true)
            return function() -- Line: 66 -- upvalues: a1 (upval), IgnoreGuiInset (val)
                a1.setIgnoreGuiInset(IgnoreGuiInset)
            end
        end
    end, v3)
    v3 = {u12}
    v2 = useCallback(function(a1) -- Line: 71 -- upvalues: u17 (val), u12 (val), Notification (upval) -- types: a1: userdata
        local v1, v2 = u17("gift", a1, u12)
        if not v1 then
            Notification.Create({Text = v2, Color = Color3.fromRGB(255, 0, 0)})
        end
    end, v3)
    local v4 = useCallback(function() -- Line: 80 -- upvalues: ViewController (upval), u6 (val)
        ViewController:setView(u6.current or "Hotbar")
    end, {})
    local v5 = {
        BackgroundTransparency = 1,
        Active = false,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v6 = {}
    local v7 = u22 and createElement(BattlepassGift, {Visible = true, Size = if not u4 then u54 else u50, onGift = v2, closed = v4}) or nil
    v6.gift = v7
    return createElement("Frame", v5, v6)
end