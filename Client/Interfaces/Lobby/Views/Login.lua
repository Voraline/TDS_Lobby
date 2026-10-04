-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Login
-- Decompile time: 8.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local LoginStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.LoginStore)
local LoginWindow = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Login.LoginWindow)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
local SharedDailyRewards = require(ReplicatedStorage.Shared.Modules.SharedDailyRewards)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local createElement = React.createElement
local u90 = NewNetwork.Channel("DailySpin", {functions = {"RedeemReward"}})
local u91 = {}
u91.Coins = {Icons.CoinsTiny, Icons.CoinsSmall, Icons.CoinsChest, Icons.CoinsChestBig}
u91.Gems = {Icons.GemsTiny, Icons.GemsSmall, Icons.GemsChest, Icons.GemsChestBig}
u91.Experience = Icons.Experience
u91.Timescale = Icons.Timescale
u91.Spin = Icons.Spin

local function mapCurrencyIcon(a1, a2) -- Line: 32 -- upvalues: u91 (val) -- types: a1: string, a2: number
    local v1 = u91[a1]
    if not v1 then
        return
    end
    if v1 and typeof(v1) == "table" then
        local v2 = v1[1]
        if typeof(a2) == "number" then
            if a2 >= 1000 then
                return v1[4]
            end
            if a2 >= 100 then
                return v1[3]
            end
            if a2 >= 10 then
                v2 = v1[2]
            end
        end
        return v2
    end
    return v1
end

local function getRewardData(a1) -- Line: 57 -- upvalues: u91 (val), Asset (val)
    local Icon, Name
    local v1 = nil
    local type = a1.type
    local value = a1.value
    if type ~= "Currency" then
        local v2
        if type == "Consumable" then
            v2 = Asset("Consumables", value[1])
            Name = v2.Name
            Icon = v2.Icon
            return {icon = Icon, name = Name, amount = v1}
        end
        if type == "Crate" then
            v2 = Asset("NewCrates", value[1])
            Name = if not v2.DisplayName then value[1] else if v2.DisplayName == "" then value[1] else v2.DisplayName
            Icon = v2.Icon
            return {icon = Icon, name = Name, amount = v1}
        end
        warn((("Unknown daily reward type: %*"):format(type)))
        return
    end
    Name = value[1]
    v1 = value[2]
    local v3 = u91[Name]
    if not v3 then
        Icon = nil
    elseif not v3 or typeof(v3) ~= "table" then
        Icon = v3
    else
        local v4 = v3[1]
        if typeof(v1) == "number" then
            if v1 >= 1000 then
                v4 = v3[4]
            elseif v1 >= 100 then
                v4 = v3[3]
            elseif v1 >= 10 then
                v4 = v3[2]
            end
        end
        Icon = v4
    end
    return {icon = Icon, name = Name, amount = v1}
end

return function() -- Line: 92
    -- upvalues: useCharmSelector (val), LoginStore (val), useViewEnabled (val), useFFlag (val)
    -- upvalues: SharedDailyRewards (val), math (val), getRewardData (val), createElement (val), LoginWindow (val)
    -- upvalues: Notification (val), u90 (val), ViewController (val)
    local v1, v2, v3
    local v4 = useCharmSelector(LoginStore.getState, function(a1) -- Line: 93
        return a1
    end)
    local Login_2, Login = useViewEnabled("Login")
    local u113 = not useFFlag("daily.disabled", false, {enabled = Login_2})
    local v5 = SharedDailyRewards.GetDailyRewards((useFFlag("daily.rewards", SharedDailyRewards.DailyRewards, {enabled = Login_2})))
    local u115 = v4.day or 1
    local v6 = v4.claimed or 0
    local v7 = #v5
    local u120 = v6 < u115
    local v8 = math.ceil(math.wrap(u115, v7) / 7)
    local v9 = (math.ceil(u115 / v7) - 1) * v7
    local v10 = {}
    local v11 = nil
    local v12 = nil
    for i, j in v5, v11, v12 do
        v1 = v9 + i
        v2 = math.ceil(i / 7)
        v3 = getRewardData(j)
        if v3 then
            if not v10[v2] then
                v10[v2] = {}
            end
            table.insert(v10[v2], {
                day = v1,
                claimed = v1 <= v6,
                icon = v3.icon,
                amount = v3.amount,
                rewardWeek = v2,
                rewardDay = v1,
            })
        end
    end
    return createElement(LoginWindow, {
        Visible = Login_2,
        claimable = u120 and u113,
        rewards = v10,
        day = u115,
        week = v8,
        clicked = function() -- Line: 145
            -- upvalues: u120 (val), u113 (val), Notification (upval), u90 (upval), LoginStore (upval), u115 (val)
            -- upvalues: ViewController (upval), Login (val)
            if not u120 then
                Login("Hotbar")
                return
            end
            if not u113 then
                Notification.Error("Daily rewards are currently disabled, please try again later!")
            end
            local v1, v2 = u90:invokeServer("RedeemReward")
            if not v1 then
                Notification.Error(v2 or "An error occured while claiming your reward, please try again later!")
                return
            end
            LoginStore.setClaimed(u115)
            Notification.Create({Text = ("You've claimed your day %* reward!"):format(u115)})
            task.delay(2, function() -- Line: 161 -- upvalues: ViewController (upval), Login (upval)
                if ViewController:getCurrentView() == "Login" then
                    Login("Hotbar")
                end
            end)
        end,
    })
end