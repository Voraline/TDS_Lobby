-- Script path: ReplicatedStorage.Client.Interfaces.Game.ViewHelpers.withTimescaleButtonLogic
-- Decompile time: 4.15 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Purchasables = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Purchasables)
local React = require(ReplicatedStorage.Shared.UI.React)
local TimeScaleHelper = require(ReplicatedStorage.Shared.Data.SharedData.TimeScaleHelper)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local TicketsManager = Network.Channel("TicketsManager")
local LocalPlayer = Players.LocalPlayer
return function(a1) -- Line: 21
    -- upvalues: useGameStateValue (val), TimeScaleHelper (val), useCache (val), React (val), ViewController (val)
    -- upvalues: Purchasables (val), MarketplaceService (val), LocalPlayer (val), TicketsManager (val)
    return function(a1_2) -- Line: 22
        -- upvalues: useGameStateValue (upval), TimeScaleHelper (upval), useCache (upval), React (upval)
        -- upvalues: ViewController (upval), Purchasables (upval), MarketplaceService (upval), LocalPlayer (upval)
        -- upvalues: TicketsManager (upval), a1 (val)
        local PlayerCount = useGameStateValue("PlayerCount")
        local TimeScale = useGameStateValue("TimeScale")
        local TimeScaleLocked = useGameStateValue("TimeScaleLocked")
        local TimeScaleDisabled = useGameStateValue("TimeScaleDisabled")
        local NewGameModes = useGameStateValue("NewGameModes")
        local u20 = TimeScaleHelper.getTimeScaleState(TimeScaleLocked, TimeScale)
        local u24 = useCache("Values.TimescaleTickets", 0)
        local useCallback = React.useCallback
        local v1 = {u20, u24, a1_2.onClick}
        local v2 = useCallback(function() -- Line: 32
            -- upvalues: a1_2 (val), u20 (val), ViewController (upval), u24 (val), Purchasables (upval)
            -- upvalues: MarketplaceService (upval), LocalPlayer (upval), TicketsManager (upval)
            if a1_2.onClick then
                a1_2.onClick()
            end
            if u20 ~= "locked" then
                TicketsManager:FireServer("CycleTimeScale")
                return
            end
            ViewController:prompt({
                Override = true,
                Subject = "Unlock Time Scale",
                Icon = "rbxassetid://17447507910",
                Description = ("Do you want to unlock the time scale for 1 Timescale Ticket? You have %* tickets left."):format(u24),
                Buttons = {
                    {
                        Text = if u24 ~= 0 then "Confirm" else "Get More",
                        Color = Color3.fromRGB(10, 220, 80),
                        Clicked = function() -- Line: 47
                            -- upvalues: ViewController (upval), u24 (upval), Purchasables (upval)
                            -- upvalues: MarketplaceService (upval), LocalPlayer (upval), TicketsManager (upval)
                            ViewController:closePrompt()
                            if u24 == 0 then
                                MarketplaceService:PromptProductPurchase(LocalPlayer, Purchasables.Currency.TimescaleTickets[1].ProductId)
                                return
                            end
                            local v1, v2 = TicketsManager:InvokeServer("UnlockTimeScale")
                            if v1 then
                                ViewController:notify("Time scale unlocked!")
                                return
                            end
                            ViewController:notifyError(v2 or "Unknown error")
                        end,
                    },
                    {
                        Text = "Cancel",
                        Color = Color3.fromRGB(39, 39, 39),
                        Clicked = function() -- Line: 69 -- upvalues: ViewController (upval)
                            ViewController:closePrompt()
                        end,
                    },
                },
            })
        end, v1)
        local v3 = table.clone(a1_2)
        v3.onClick = v2
        v3.state = u20
        v3.speed = TimeScale
        return TimeScaleHelper.isEnabled(PlayerCount, NewGameModes, TimeScaleDisabled) and React.createElement(a1, v3, a1_2.children)
    end
end