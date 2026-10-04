-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Hotbar.Views.Currency
-- Decompile time: 11.58 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = script.Parent.Parent.Parent
local Controllers = Parent.Controllers
local Shared = ReplicatedStorage.Shared
local Shared_2 = ReplicatedStorage.Client.Interfaces.Stores.Shared
local Comma = require(Shared.UI.Comma)
local CurrencyBar = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.CurrencyBar)
local HotbarCurrencyStore = require(Shared_2.HotbarCurrencyStore)
local Icons = require(Parent.Icons)
local PlayerController = require(Controllers.PlayerController)
local PlayerStatsStore = require(Shared_2.PlayerStatsStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ScreenStore = require(Shared_2.ScreenStore)
local ViewController = require(Controllers.ViewController)
local ViewStateStore = require(Shared_2.ViewStateStore)
local createElement = React.createElement
local useEffect = React.useEffect
local u69 = false

local function asNumber(a1) -- Line: 45
    if type(a1) == "number" then
        return a1
    end
    return 0
end

local function getDefaultPosition(a1) -- Line: 49 -- types: a1: boolean
    return UDim2.new(0.5, 0, 0, if not a1 then -26 else -30)
end

local function setupHotbarCurrencyBindings() -- Line: 53
    -- upvalues: u69 (ref), Players (val), HotbarCurrencyStore (val)
    if u69 then
        return
    end
    u69 = true
    local LocalPlayer = Players.LocalPlayer
    HotbarCurrencyStore.setBatteries(LocalPlayer:GetAttribute("Batteries"))
    ;(LocalPlayer:GetAttributeChangedSignal("Batteries")):Connect(function() -- Line: 61 -- upvalues: HotbarCurrencyStore (upval), LocalPlayer (val)
        HotbarCurrencyStore.setBatteries(LocalPlayer:GetAttribute("Batteries"))
    end)
    local Type = workspace:FindFirstChild("Type")
    local v1 = false
    if Type ~= nil then
        v1 = Type:IsA("ValueBase") and Type.Value == "Lobby"
    end
    if not v1 then
        HotbarCurrencyStore.setSpinWheelShown(false)
        return
    end
    HotbarCurrencyStore.setSpinWheelShown(LocalPlayer:GetAttribute("DailySpinShown") == true)
    ;(LocalPlayer:GetAttributeChangedSignal("DailySpinShown")):Connect(function() -- Line: 78 -- upvalues: HotbarCurrencyStore (upval), LocalPlayer (val)
        HotbarCurrencyStore.setSpinWheelShown(LocalPlayer:GetAttribute("DailySpinShown") == true)
    end)
end

local function CurrencyContainer(a1) -- Line: 86
    -- upvalues: ReactCharm (val), HotbarCurrencyStore (val), PlayerStatsStore (val), ScreenStore (val)
    -- upvalues: ViewStateStore (val), ViewController (val), useEffect (val), createElement (val), CurrencyBar (val)
    -- upvalues: Comma (val), Icons (val)
    local v1, v2, v3, v4, v5
    local v6 = ReactCharm.useSignalState(HotbarCurrencyStore.getState)
    local v7 = ReactCharm.useSignalState(PlayerStatsStore.getState)
    local u15 = ReactCharm.useSignalState(ScreenStore.getState)
    local v8 = ReactCharm.useSignalState(ViewStateStore.getState).currentView == "Shop"
    local v9 = v6.spinWheelShown == true
    local v10 = not v8 and v9
    local u33 = v8 or v9
    local batteries = v6.batteries
    local gems = v7.gems
    local v11 = if type(gems) ~= "number" then 0 else gems
    local coins = v7.coins
    local revivetickets = v7.revivetickets
    local spintickets = v7.spintickets
    local timescaletickets = v7.timescaletickets
    local gemsVisible = a1.gemsVisible
    if gemsVisible == nil then
        local level = v7.level
        local v12 = if type(level) ~= "number" then 0 else level
        v5 = true
        if not (v12 >= 50) then
            v5 = v11 > 0
        end
        gemsVisible = v5
    end

    local function gotoPage(a1_2) -- Line: 109 -- upvalues: a1 (val), ViewController (upval) -- types: a1_2: string?
        if a1.disableShop then
            return
        end
        ViewController:getEmitter("Shop"):Emit("Select", a1_2 or "Credits")
        ViewController:setView("Shop")
    end

    v5 = useEffect
    local v13 = {a1.host, u33}
    v5(function() -- Line: 119 -- upvalues: a1 (val), u33 (val)
        a1.host.Visible = u33
    end, v13)
    v5 = useEffect
    v13 = {a1.disableShop, a1.host, u15.isMobile}
    v5(function() -- Line: 123 -- upvalues: a1 (val), u15 (val)
        if a1.disableShop then
            return
        end
        a1.host.Position = UDim2.new(0.5, 0, 0, if not u15.isMobile then -26 else -30)
    end, v13)
    return createElement(CurrencyBar, {
        isMobile = u15.isMobile,
        items = {
            {
                key = "gems",
                layoutOrder = 1,
                amount = Comma(v11),
                baseValue = v11,
                hideBuyButton = a1.hideBuyIcons,
                icon = Icons.Gems,
                onClicked = function() -- Line: 141 -- upvalues: a1 (val), ViewController (upval)
                    if a1.disableShop then
                        return
                    end
                    ViewController:getEmitter("Shop"):Emit("Select", "Credits")
                    ViewController:setView("Shop")
                end,
                onlyShowOnChange = a1.onlyShowOnChange,
                visible = not v10 and gemsVisible,
            },
            {
                key = "coins",
                layoutOrder = 2,
                amount = Comma(if type(coins) ~= "number" then 0 else coins),
                baseValue = v1,
                hideBuyButton = a1.hideBuyIcons,
                icon = Icons.Coins,
                onClicked = function() -- Line: 154 -- upvalues: a1 (val), ViewController (upval)
                    if a1.disableShop then
                        return
                    end
                    ViewController:getEmitter("Shop"):Emit("Select", "Credits")
                    ViewController:setView("Shop")
                end,
                onlyShowOnChange = a1.onlyShowOnChange,
                visible = not v10 and not a1.hideCoins,
            },
            {
                key = "battery",
                layoutOrder = 3,
                onlyShowOnChange = true,
                amount = Comma(if type(batteries) ~= "number" then 0 else batteries),
                baseValue = batteries,
                hideBuyButton = a1.hideBuyIcons,
                icon = Icons.Battery,
                onClicked = function() -- Line: 167 -- upvalues: a1 (val), ViewController (upval)
                    if a1.disableShop then
                        return
                    end
                    ViewController:getEmitter("Shop"):Emit("Select", "Credits")
                    ViewController:setView("Shop")
                end,
                visible = batteries ~= nil,
            },
            {
                key = "timescale",
                layoutOrder = 5,
                amount = Comma(if type(timescaletickets) ~= "number" then 0 else timescaletickets),
                baseValue = v4,
                hideBuyButton = a1.hideBuyIcons,
                icon = Icons.Timescale,
                onClicked = function() -- Line: 180 -- upvalues: a1 (val), ViewController (upval)
                    if a1.disableShop then
                        return
                    end
                    ViewController:getEmitter("Shop"):Emit("Select", "Tickets")
                    ViewController:setView("Shop")
                end,
                onlyShowOnChange = a1.onlyShowOnChange,
                visible = not v10 and v4 > 0,
            },
            {
                key = "spin",
                layoutOrder = 6,
                amount = Comma(if type(spintickets) ~= "number" then 0 else spintickets),
                baseValue = v3,
                hideBuyButton = a1.hideBuyIcons,
                icon = Icons.Spin,
                onClicked = function() -- Line: 193 -- upvalues: a1 (val), ViewController (upval)
                    if a1.disableShop then
                        return
                    end
                    ViewController:getEmitter("Shop"):Emit("Select", "Tickets")
                    ViewController:setView("Shop")
                end,
                onlyShowOnChange = a1.onlyShowOnChange,
                visible = v10 or v3 > 0,
            },
            {
                key = "revive",
                layoutOrder = 7,
                amount = Comma(if type(revivetickets) ~= "number" then 0 else revivetickets),
                baseValue = v2,
                hideBuyButton = a1.hideBuyIcons,
                icon = Icons.ReviveTickets,
                onClicked = function() -- Line: 206 -- upvalues: a1 (val), ViewController (upval)
                    if a1.disableShop then
                        return
                    end
                    ViewController:getEmitter("Shop"):Emit("Select", "Tickets")
                    ViewController:setView("Shop")
                end,
                onlyShowOnChange = a1.onlyShowOnChange,
                visible = not v10 and v2 > 0,
            },
        },
    })
end

return function(a1) -- Line: 216
    -- upvalues: PlayerController (val), setupHotbarCurrencyBindings (val), ScreenStore (val), HotbarCurrencyStore (val)
    -- upvalues: ReactRoblox (val)
    PlayerController:init()
    setupHotbarCurrencyBindings()
    local Frame = Instance.new("Frame")
    Frame.AnchorPoint = Vector2.new(0.5, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1
    Frame.Position = UDim2.new(0.5, 0, 0, if not (ScreenStore.getIsMobile()) then -26 else -30)
    Frame.Size = UDim2.fromOffset(100, 40)
    Frame.Visible = HotbarCurrencyStore.getSpinWheelShown()
    local u51 = ReactRoblox.createRoot(Frame)
    Frame.Destroying:Once(function() -- Line: 241 -- upvalues: u51 (val)
        u51:unmount()
    end)
    return Frame
end