-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.SpinWheelChances
-- Decompile time: 5.55 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u17 = require("../Components/SpinWheelChances/Disclosure")
local React = require(ReplicatedStorage.Shared.UI.React)
local u25 = require("../Components/SpinWheelChances/ShopPanel")
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local usePolicies = require(ReplicatedStorage.Client.Interfaces.Hooks.usePolicies)
local useTagged = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagged)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local useViewEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEvent)
local createElement = React.createElement
local memo = React.memo
local LocalPlayer = Players.LocalPlayer

local function getShownRewardKeys() -- Line: 23 -- upvalues: LocalPlayer (val), HttpService (val)
    local Attribute = LocalPlayer:GetAttribute("DailySpinShownRewardKeys")
    if typeof(Attribute) ~= "string" then
        return nil
    end
    local success, result = pcall(function() -- Line: 29 -- upvalues: HttpService (upval), Attribute (val)
        return HttpService:JSONDecode(Attribute)
    end)
    if success and typeof(result) == "table" then
        return result
    end
    return nil
end

return memo(function(a1) -- Line: 40
    -- upvalues: usePolicies (val), useFFlag (val), useTagged (val), React (val), useViewEnabled (val)
    -- upvalues: getShownRewardKeys (val), useViewEvent (val), LocalPlayer (val), createElement (val), u17 (val)
    -- upvalues: u25 (val)
    if a1.setDisplayOrder then
        a1.setDisplayOrder(2001)
    end
    local v1, v2 = usePolicies()
    local v3 = useFFlag("daily.disabled", false)
    local v4 = useFFlag("daily.spin", true)
    local ChancesFrame = useTagged("ChancesFrame")
    local ChancesModel = useTagged("ChancesModel")
    local u25_2 = React.useRef({})
    local SpinWheelChances_2, SpinWheelChances = useViewEnabled("SpinWheelChances")
    local v5, u34 = React.useState(getShownRewardKeys)
    local Shop = React.useRef("Shop")
    local u42 = not v1
    if u42 then
        u42 = v2.ArePaidRandomItemsRestricted == true
    end
    useViewEvent("SpinWheelChances", "Open", function(a1) -- Line: 57 -- upvalues: Shop (val) -- types: a1: string?
        Shop.current = a1 or "Shop"
    end, {})
    local v6 = {u42, ChancesModel}
    React.useLayoutEffect(function() -- Line: 61 -- upvalues: ChancesModel (val), u25_2 (val), u42 (val)
        local v1
        for i, j in ChancesModel do
            u25_2.current[j] = true
        end
        local v2 = nil
        local v3 = nil
        for k in u25_2.current, v2, v3 do
            v1 = if not u42 then nil else workspace
            k.Parent = v1
        end
    end, v6)
    React.useEffect(function() -- Line: 71 -- upvalues: LocalPlayer (upval), u34 (val), getShownRewardKeys (upval)
        local u8 = (LocalPlayer:GetAttributeChangedSignal("DailySpinShownRewardKeys")):Connect(function() -- Line: 74 -- upvalues: u34 (upval), getShownRewardKeys (upval)
            u34((getShownRewardKeys()))
        end)
        u34((getShownRewardKeys()))
        return function() -- Line: 80 -- upvalues: u8 (val)
            u8:Disconnect()
        end
    end, {})
    if workspace.Type.Value == "Lobby" and not v3 and v4 and u42 then
        local v7
        local v8 = {}
        for i, j in ChancesFrame do
            if j:IsA("BasePart") then
                v7 = ("ChancesFrame_%*"):format(i)
                v8[v7] = (createElement(u17, {part = j, shownRewardKeys = v5}))
            end
        end
        if SpinWheelChances_2 then
            v8.ShopPanel = createElement(u25, {
                OnClose = function() -- Line: 106 -- upvalues: SpinWheelChances (val), Shop (val)
                    SpinWheelChances(Shop.current or "Shop")
                end,
            })
        end
        return createElement(React.Fragment, {}, v8)
    end
    return nil
end)