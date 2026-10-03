-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PurchasePrompt.story
-- Decompile time: 1.16 ms

local Shared = game:GetService("ReplicatedStorage").Shared
local Modules = Shared.Modules
local UI = Shared.UI
local Enum = require(Modules.Enum)
local PurchasePrompt = require(script.Parent.PurchasePrompt)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {combinedCost = false, canPreview = false, singleRobux = false},
    story = function(a1) -- Line: 20 -- upvalues: createElement (val), PurchasePrompt (val), React (val), Enum (val)
        return createElement(PurchasePrompt, {
            render = function(a1_2) -- Line: 22 -- upvalues: createElement (upval), React (upval), a1 (val), Enum (upval)
                local v1 = createElement
                local v2 = {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(85, 178, 255),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromOffset(200, 50),
                    Text = "click meee",
                    TextColor3 = Color3.new(1, 1, 1),
                    TextSize = 18,
                }

                v2[React.Event.Activated] = function() -- Line: 31 -- upvalues: a1_2 (val), a1 (upval), Enum (upval)
                    a1_2({
                        selectedItem = "Pursuit",
                        displayName = "Pursuit",
                        type = "Tower",
                        priceData = if a1.controls.singleRobux then {Value = 1500, Id = 9735384, Type = Enum.CurrencyType.Robux} else if not a1.controls.combinedCost then {
                            {Value = 15000, Type = Enum.CurrencyType.Coins},
                            {Value = 1500, Id = 9735384, Type = Enum.CurrencyType.Robux},
                        } else {
                            {Value = 15000, Type = Enum.CurrencyType.Coins},
                            {Value = 4500, Type = Enum.CurrencyType.Gems},
                        },
                        priceDataMode = if a1.controls.combinedCost then "Combined" else if not a1.controls.singleRobux then "Options" else "Combined",
                        canPreview = a1.controls.canPreview,
                        onPurchase = function() end,
                    })
                end

                return v1("TextButton", v2, {corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)})})
            end,
        })
    end,
}