-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Stories.ShopProduct.story
-- Decompile time: 3.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local ShopProduct = require(script.Parent.Parent.Components.ShopProduct)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {
        evolved = false,
        featuredHero = false,
        gamepassAvailable = true,
        locked = false,
        mapLocked = false,
    },
    story = function(a1) -- Line: 19 -- upvalues: Enum (val), createElement (val), ShopProduct (val)
        local v1, v2
        local evolved = a1.controls.evolved
        local featuredHero = a1.controls.featuredHero
        local gamepassAvailable = a1.controls.gamepassAvailable and not evolved
        local mapLocked = a1.controls.mapLocked
        local v3 = {value = 7500, currency = Enum.CurrencyType.Coins}
        local v4 = {
            type = "tower",
            tower = if not evolved then if gamepassAvailable then if not mapLocked then "Pursuit" else "Saboteur" else "Accelerator" else "EvolvedOperator",
        }
        v4.evolvesFrom = if not evolved then nil else "Scout"
        v4.evolutionLevel = if not evolved then nil else 20
        v4.locked = a1.controls.locked
        v4.lockedMessage = if not mapLocked then if not gamepassAvailable then "REACH LEVEL 50 TO UNLOCK TOWER!" else "REACH LEVEL 100 TO UNLOCK TOWER!" else nil
        v4.unlockRequirement = if not mapLocked then nil else "Polluted Wasteland II"
        local v5 = {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
            Size = UDim2.fromScale(1, 1),
        }
        local v6 = {}
        local v7 = {
            ItemType = "tower",
            price = "7,500",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Rarity = Enum.TowerCategory.Advanced,
        }
        local v8 = if not featuredHero then UDim2.fromOffset(240, 356) else UDim2.fromOffset(480, 250)
        v7.Size = v8
        v7.componentType = if not featuredHero then nil else "FeaturedHero"
        v7.cost = if evolved then nil else if not a1.controls.locked then v3 else nil
        v7.costs = if evolved then {
            {value = 2500, currency = Enum.CurrencyType.Gems},
            {value = 25000, currency = Enum.CurrencyType.Coins},
        } else if a1.controls.locked then nil else {v3}
        v7.gamepassId = if not gamepassAvailable then nil else if not mapLocked then 9735384 else 1804464267
        v7.gamepassPrice = if not gamepassAvailable then nil else if not mapLocked then 1500 else 499
        v7.item = v4
        v7.locked = a1.controls.locked
        v7.lockedMessage = if not mapLocked then v4.lockedMessage else "Beat \"Polluted Wasteland II\" to buy this tower."
        v7.onUnlockRequirementClick = if not mapLocked then nil else function() end
        v7.productName = v1

        function v7.purchase() end

        v7.subText = if not evolved then "Advanced" else "Evolved"
        v7.unlockRequirement = v2
        v6.Product = createElement(ShopProduct, v7)
        return createElement("Frame", v5, v6)
    end,
}