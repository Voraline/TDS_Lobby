-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory
-- Decompile time: 95.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ArcheTitle = require(script.ArcheTitle)
local Button = require(script.Button)
local CatgoryFrame = require(script.CatgoryFrame)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local ConsumablePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.ConsumablePreview)
local CosmeticPreview = require(script.CosmeticPreview)
local CrateDisplayName = require(ReplicatedStorage.Client.Interfaces.CrateDisplayName)
local CratePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.CratePreview)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local DescriptionHolder = require(script.DescriptionHolder)
local DisplayPannel = require(script.DisplayPannel)
local DisplayTitle = require(script.DisplayTitle)
local EmptyCrates = require(script.EmptyCrates)
local ExtraButton = require(script.ExtraButton)
local FilterButton = require(script.FilterButton)
local FilterList = require(script.FilterList)
local GridComponent = require(script.GridComponent)
local HotbarFrameHolder = require(script.HotbarFrameHolder)
local HudCurrency = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudCurrency)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local InventoryItem = require(script.InventoryItem)
local ItemScrollingFrame = require(script.ItemScrollingFrame)
local Level = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Level)
local CustomSkinRarityComponent = require(script.Parent.CustomSkinRarityComponent)
local Loadouts = require(script.Loadouts)
local NavButton = require(script.NavButton)
local Navigation = require(script.Navigation)
local PVPTowerInventoryHotbar = require(ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryHotbar)
local RarityColors = require(ReplicatedStorage.Shared.Modules.RarityColors)
local RemainingAmount = require(script.RemainingAmount)
local SearchBar = require(script.SearchBar)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local TabButton = require(script.TabButton)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local TowerDisplayName = require(ReplicatedStorage.Shared.Modules.TowerDisplayName)
local TowerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TowerPreview)
local TowerStats = require(script.TowerStats)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local WindowFrame = require(script.WindowFrame)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local otherItemsFrame = require(script.otherItemsFrame)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useAspectRatio = require(ReplicatedStorage.Client.Interfaces.Hooks.useAspectRatio)
require(ReplicatedStorage.Client.Interfaces.Hooks.useAvailableCosmetics)
local useGameType = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameType)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local usePreferredInput = require(ReplicatedStorage.Client.Interfaces.Hooks.usePreferredInput)
local createElement = React.createElement
local useMemo = React.useMemo
local memo = React.memo
local u263 = utf8.char(57346)
local u264 = {Towers = true, Crates = false, Cosmetics = false, Items = true}
local u269 = {}
u269.Crates = UDim2.fromScale(1, 1)
local u274 = {}
u274.Crates = UDim2.fromScale(0.2493, 0.666667)
local u279 = {}
u279.Crates = UDim2.fromScale(0.135, 0.5)
local u284 = {}
u284.Crates = UDim2.fromScale(0.272, 0.5)
local u289 = {}
u289[Enum.CurrencyType.Coins] = (Color3.fromRGB(80, 255, 86))
u289[Enum.CurrencyType.Robux] = (Color3.fromRGB(60, 255, 73))
u289[Enum.CurrencyType.Gems] = (Color3.fromRGB(219, 16, 255))
local u311 = {}
u311[Enum.CrateCategory.Default] = Enum.SkinRarity.Common
u311[Enum.CrateCategory.Robux] = Enum.SkinRarity.Uncommon
u311[Enum.CrateCategory.Consumables] = Enum.SkinRarity.Utility
local u324 = {
    [Enum.CrateCategory.Default] = 1,
    [Enum.CrateCategory.Robux] = 2,
    [Enum.CrateCategory.Consumables] = 3,
}

local function getInventoryCrateCategory(a1) -- Line: 211 -- upvalues: Enum (val)
    if a1 == Enum.CrateCategory.Robux then
        return Enum.CrateCategory.Robux
    end
    if a1 == Enum.CrateCategory.Consumables then
        return Enum.CrateCategory.Consumables
    end
    return Enum.CrateCategory.Default
end

local u335 = {
    emotes = 1,
    totems = 3,
    tags = 2,
    flairs = 4,
    stickers = 5,
}

local function doesntContain(a1, a2) -- Line: 231
    return not string.find(a1:lower(), a2:lower(), 1, true)
end

local function getTowerDisplayName(a1) -- Line: 235 -- upvalues: TowerDisplayName (val)
    if not a1 then
        return ""
    end
    return TowerDisplayName.fromAsset(a1, nil)
end

local function getTowerSkinDisplayName(a1, a2) -- Line: 243 -- upvalues: Troops (val)
    if not a2 then
        return ""
    end
    local v1 = a1 and Troops(a1)
    local Properties = v1 and v1.Properties
    local SkinData = Properties and Properties.SkinData and Properties.SkinData[a2]
    return SkinData and SkinData.DisplayName or a2
end

return memo(function(a1) -- Line: 255
    -- upvalues: React (val), usePreferredInput (val), useAspectRatio (val), useGameType (val), useMediaQuery (val)
    -- upvalues: useMemo (val), table (val), createElement (val), CatgoryFrame (val), Enum (val), Button (val)
    -- upvalues: Icons (val), u263 (val), u289 (val), InventoryItem (val), GridComponent (val), TowerDisplayName (val)
    -- upvalues: SharedGameConstants (val), PVPTowerInventoryHotbar (val), Comma (val), u324 (val), math (val)
    -- upvalues: u311 (val), RarityColors (val), CrateDisplayName (val), Troops (val), u335 (val), Tooltip (val)
    -- upvalues: Loadouts (val), HudCurrency (val), Navigation (val), NavButton (val), IconButton (val)
    -- upvalues: FilterList (val), u264 (val), HotbarFrameHolder (val), ExtraButton (val)
    -- upvalues: CustomSkinRarityComponent (val), Level (val), DisplayPannel (val), DisplayTitle (val), ArcheTitle (val)
    -- upvalues: DescriptionHolder (val), TowerPreview (val), TowerStats (val), CosmeticPreview (val)
    -- upvalues: RemainingAmount (val), ConsumablePreview (val), ImageLabel (val), CratePreview (val)
    -- upvalues: otherItemsFrame (val), ItemScrollingFrame (val), WindowFrame (val), u269 (val), EmptyCrates (val)
    -- upvalues: FilterButton (val), u284 (val), SearchBar (val), u274 (val), u279 (val), TabButton (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23
    local u8758, u8759 = React.useState(false)
    local v24, v25 = React.useBinding(Vector2.new(0, 0))
    local v26 = usePreferredInput()
    local v27 = useAspectRatio()
    local v28 = v26 == Enum.PreferredInput.Touch
    local v29 = useGameType() == "Game"
    local u8764 = v28
    if u8764 then
        u8764 = not useMediaQuery("medium")
    end
    local v30, u8766 = React.useState(nil)
    local PreviewText = ""
    local v31 = Color3.new(1, 1, 1)
    local v32 = 0
    local v33 = {}
    local v34 = {}
    local v35 = {}
    local v36 = {}
    local v37 = {}
    local v38 = {}
    local v39 = useMemo
    local v40 = {a1.towers}
    local u57 = v39(function() -- Line: 280 -- upvalues: a1 (val), table (upval)
        local v1
        local v2 = {}
        for i, j in a1.towers do
            v1 = table.clone(j)
            table.sort(v1.towers, function(a1, a2) -- Line: 286
                if a1.price == a2.price then
                    return a1.towerName < a2.towerName
                end
                return a1.price < a2.price
            end)
            v2[i] = v1
        end
        return v2
    end, v40)
    local v41 = {u57}
    local v42 = useMemo(function() -- Line: 300 -- upvalues: u57 (val), table (upval)
        local v1 = {}
        for i, j in u57 do
            table.insert(v1, {catg = i, towerData = j})
        end
        table.sort(v1, function(a1, a2) -- Line: 307
            local v1 = a1.towerData.layOutOrder or 0
            local v2 = a2.towerData.layOutOrder or 0
            if v1 == v2 then
                return (tostring(a1.catg)) < tostring(a2.catg)
            end
            return v1 < v2
        end)
        return v1
    end, v41)
    v34.catg = createElement(CatgoryFrame, {
        layOutOrder = -100,
        title = ("%* Skins"):format(a1.selectedTowerStats and next(a1.selectedTowerStats) and a1.selectedTowerStats.Properties and a1.selectedTowerStats.Properties.DisplayName or a1.selectedTower),
    })
    v41 = true
    local towerSkins = a1.towerSkins or {}
    local v43 = {}
    local v44 = nil
    local v45 = nil
    for i, j in towerSkins, v44, v45 do
        v1 = nil
        v2 = nil
        for k, n in a1.filterList, v1, v2 do
            if n.active then
                v41 = false
            end
            if n.active and (Enum.SkinRarity.ToString(j.Rarity)) == n.filterName then
                v43[i] = j
            end
        end
    end
    local v46 = {}
    v45 = nil
    local v47 = nil
    for m, i5 in v41 and towerSkins or v43, v45, v47 do
        v1 = i5.Equipped or false
        v2 = i5.Owned or false
        if a1.selectedSkin == m then
            if not v29 and a1.onPreviewTowerSkin then
                v38.PREVIEW = createElement(Button, {
                    textSize = 22,
                    text = "PREVIEW",
                    layoutOrder = -99,
                    color = Color3.fromRGB(255, 158, 32),
                    onClick = a1.onPreviewTowerSkin,
                })
            end
            if not i5.Price then
                if i5.Price and v29 then
                    v38.LOCKED = createElement(Button, {
                        textSize = 22,
                        text = "LOCKED",
                        layoutOrder = -100,
                        color = Color3.fromRGB(108, 108, 108),
                        icon = Icons.Locked,
                        onClick = function() end,
                    })
                end
            elseif not v29 then
                local GiftId = i5.Price.GiftId
                if GiftId then
                    v38[GiftId] = (createElement(Button, {
                        textSize = 22,
                        text = "GIFT",
                        layoutOrder = 0,
                        icon = Icons.Gift,
                        color = Color3.fromRGB(255, 158, 32),
                        onClick = function() -- Line: 377 -- upvalues: a1 (val), GiftId (val)
                            a1.promptGift(GiftId)
                        end,
                    }))
                end
                if not v2 then
                    v38[i5.Price.Id] = (createElement(Button, {
                        textSize = 22,
                        layoutOrder = -100,
                        text = ("%* %*"):format(u263, i5.Price.Value),
                        color = Color3.fromRGB(80, 255, 86),
                        onClick = function() -- Line: 389 -- upvalues: a1 (val), i5 (val), Icons (upval), Enum (upval), u289 (upval)
                            local purchasePrompt = a1.purchasePrompt
                            local v1 = {
                                type = "Tower Skin",
                                selectedItem = a1.selectedSkin,
                                priceData = i5.Price,
                                icon = Icons[Enum.CurrencyType.ToString(i5.Price.Type)],
                            }
                            local v2 = u289[i5.Price.Type] or Color3.fromRGB(80, 255, 86)
                            v1.color = v2

                            function v1.purchaseItem() end

                            function v1.cancelPurchase() -- Line: 397 -- upvalues: a1 (upval)
                                a1.popUp(nil)
                            end

                            purchasePrompt(v1)
                        end,
                    }))
                end
            elseif i5.Price and v29 then
                v38.LOCKED = createElement(Button, {
                    textSize = 22,
                    text = "LOCKED",
                    layoutOrder = -100,
                    color = Color3.fromRGB(108, 108, 108),
                    icon = Icons.Locked,
                    onClick = function() end,
                })
            end
            if not v2 then
                if not i5.Price then
                    if not i5.Crate or v29 then
                        v38.LOCKED = createElement(Button, {
                            textSize = 22,
                            text = "LOCKED",
                            layoutOrder = -100,
                            color = Color3.fromRGB(108, 108, 108),
                            icon = Icons.Locked,
                            onClick = function() end,
                        })
                    else
                        v38.GO_TO_CRATE = createElement(Button, {
                            textSize = 22,
                            text = "CRATE",
                            layoutOrder = -100,
                            color = Color3.fromRGB(0, 221, 255),
                            icon = Icons.Crates,
                            onClick = function() -- Line: 444 -- upvalues: a1 (val), i5 (val)
                                a1.onTabChange("Crates")
                                a1.selectCrate(i5.Crate)
                            end,
                        })
                    end
                end
            elseif m ~= "Default" or not v1 then
                v3 = createElement
                v5 = {textSize = 22, layoutOrder = -100, text = if not v1 then "EQUIP" else "UNEQUIP"}
                v6 = v1 and Color3.fromRGB(158, 158, 158) or Color3.fromRGB(80, 255, 86)
                v5.color = v6

                function v5.onClick() -- Line: 430 -- upvalues: a1 (val)
                    a1.toggleEquipTowerSkin()
                end

                v38.OWNED = v3(Button, v5)
            else
                v38.LOCKED_DEFAULT = createElement(Button, {
                    textSize = 22,
                    text = "LOCKED",
                    icon = Icons.Locked,
                    color = Color3.fromRGB(158, 158, 158),
                })
            end
        end
        v3 = i5.DisplayName or m
        v4 = createElement
        v6 = {
            disableSpotlight = true,
            layOutOrder = i5.layOutOrder,
            towerName = a1.selectedTower,
            skin = m,
            forcedText = v3,
            owned = v2,
            equiped = v1,
            selected = a1.selectedSkin == m,
            onClick = function() -- Line: 476 -- upvalues: a1 (val), m (val)
                a1.clickedSkin(m)
            end,
            greenColor = v1,
        }
        v46[v3] = (v4(InventoryItem, v6))
    end
    v34.skinGrid = createElement(GridComponent, {
        layoutOrder = 1,
        forceBottomPadding = true,
        bottomPaddingAdd = 130,
        scaleMult = if not u8764 then 1 else 1.2,
    }, v46)
    v45 = nil
    v47 = nil
    for i6, i7 in v42, v45, v47 do
        v1 = i7.catg
        v2 = i7.towerData
        if next(v2.towers) then
            v32 = v32 + 1
            v33[v1] = (createElement(CatgoryFrame, {layOutOrder = v32, title = Enum.TowerCategory.ToString(v1), catg = v1}))
            v3 = {}
            v5 = nil
            v6 = nil
            for i8, i9 in v2.towers, v5, v6 do
                v32 = v32 + 1
                v9 = a1.ownedTowers and table.find(a1.ownedTowers, i9.towerName)
                v10 = a1.towerInventory[i9.towerName] and a1.towerInventory[i9.towerName].Skin or "Default"
                v11 = i9.towerName
                v12 = createElement
                v14 = {layOutOrder = v32, towerName = i9.towerName}
                v16 = i9.towerName
                v14.forcedText = if v16 then TowerDisplayName.fromAsset(v16, nil) else ""
                v14.skin = v10
                v14.owned = v9
                v15 = a1.equipedTowers and table.find(a1.equipedTowers, i9.towerName)
                v14.equiped = v15
                v14.selected = a1.selectedTower == i9.towerName

                function v14.onClick() -- Line: 525 -- upvalues: a1 (val), i9 (val)
                    a1.clickedTower(i9.towerName)
                end

                v3[v11] = (v12(InventoryItem, v14))
            end
            v4 = v1 .. "scrolling"
            v33[v4] = (createElement(GridComponent, {layoutOrder = v32, scaleMult = if not u8764 then 1 else 1.5}, v3))
        end
    end
    v44 = ""
    local Description = ""
    local ownedTowers = a1.ownedTowers and next(a1.ownedTowers) and table.find(a1.ownedTowers, a1.selectedTower)
    local equipedTowers = a1.equipedTowers and next(a1.equipedTowers) and table.find(a1.equipedTowers, a1.selectedTower)
    local v48 = a1.showResearchButton == true
    v1 = a1.showBuyAllTowerLevelsButton == true
    v2 = v48 or v1
    v3 = v2 and {left = UDim.new(0, 18), right = UDim.new(0, 18)} or nil
    v4 = if not v2 then 22 else 18
    if a1.equipedTowers and a1.selectedTab == "Towers" then
        local goldenTowersEquipped
        v6 = a1.pvp and SharedGameConstants.MAX_PVP_TOWER_SLOTS or SharedGameConstants.MAX_TOWER_SLOTS
        for i10 = 1, v6 do
            local u215 = a1.equipedTowers[i10]
            v10 = "tower" .. i10
            v11 = createElement
            v13 = {
                Container = false,
                showPrice = false,
                dontSpotlight = true,
                isTower = true,
                LayoutOrder = i10,
                Size = UDim2.fromScale(1, 1),
                name = u215,
                towerInventory = a1.towerInventory,
                picked = a1.selectedTower == u215,
                clicked = function() -- Line: 572 -- upvalues: a1 (val), u215 (val)
                    a1.clickedTower(u215)
                    a1.setSelectedScrollingFrame(u215)
                end,
                level = a1.level,
                levelLock = SharedGameConstants.TOWER_SLOT_LEVELS[i10],
            }
            goldenTowersEquipped = a1.goldenTowersEquipped and table.find(a1.goldenTowersEquipped, u215) ~= nil
            v13.isGolden = goldenTowersEquipped
            v37[v10] = (v11(PVPTowerInventoryHotbar, v13))
        end
    end
    if ownedTowers then
        v36.RESEARCH = v48 and createElement(Button, {
            textSize = 18,
            text = "RESEARCH",
            layoutOrder = 0,
            color = Color3.fromRGB(255, 174, 33),
            padding = v3,
            onClick = a1.onClickResearch,
        })
        v36.BUY_ALL_LEVELS = not v48 and v1 and createElement(Button, {
            textSize = 16,
            layoutOrder = 0,
            text = a1.buyAllTowerLevelsButtonText or "BUY ALL LEVELS",
            color = Color3.fromRGB(80, 255, 86),
            padding = v3,
            onClick = a1.onClickBuyAllTowerLevels,
        })
        v5 = createElement
        v7 = {layoutOrder = -2, textSize = v4}
        v7.text = if not equipedTowers then "EQUIP" else "UNEQUIP"
        v8 = equipedTowers and Color3.fromRGB(158, 158, 158) or Color3.fromRGB(80, 255, 86)
        v7.color = v8
        v7.spotLight = if equipedTowers then nil else "DisplayAction"
        v7.padding = v3

        function v7.onClick() -- Line: 620 -- upvalues: a1 (val)
            a1.toggleEquipTower()
        end

        v36.OWNED = v5(Button, v7)
        v36.SKINS = createElement(Button, {
            text = "SKINS",
            layoutOrder = -1,
            textSize = v4,
            color = Color3.fromRGB(15, 223, 255),
            padding = v3,
            onClick = function() -- Line: 632 -- upvalues: a1 (val)
                a1.onClickSkins()
            end,
        })
    end
    if a1.loadingTowerPurchaseData and not ownedTowers then
        v36.LOADING = createElement(Button, {
            textSize = 22,
            text = "",
            loading = true,
            layoutOrder = -1,
            color = Color3.fromRGB(108, 108, 108),
            icon = Icons.Loading,
        })
    end
    v5 = false
    local selectedTowerStats = a1.selectedTowerStats and next(a1.selectedTowerStats) and a1.selectedTowerStats.Properties and a1.selectedTowerStats.Properties.EvolutionLevel ~= nil
    if not ownedTowers then
        if not a1.towerPurchaseData or not next(a1.towerPurchaseData) or a1.loadingTowerPurchaseData or v29 then
            if not a1.loadingTowerPurchaseData then
                v36[1] = (createElement(Button, {
                    textSize = 22,
                    text = "UNAVAILABLE",
                    layoutOrder = 1,
                    color = Color3.fromRGB(108, 108, 108),
                    icon = Icons.Locked,
                }))
            end
        elseif not selectedTowerStats then
            local MapLocked, coins, gems_2
            v8 = nil
            v9 = nil
            for i11, i12 in a1.towerPurchaseData, v8, v9 do
                local u859 = true
                if i12.Type == Enum.CurrencyType.Gems then
                    gems_2 = a1.gems
                    u859 = i12.Value <= gems_2
                elseif i12.Type == Enum.CurrencyType.Coins then
                    coins = a1.coins
                    u859 = i12.Value <= coins
                end
                local u872 = Color3.fromRGB(108, 108, 108)
                local Locked = Icons[Enum.CurrencyType.ToString(i12.Type)]
                if not i12.Eligible then
                    u944 = "LOCKED"
                else
                    local u944 = Comma(i12.Value)
                end
                if not i12.Eligible then
                    Locked = Icons.Locked
                else
                    u872 = u289[i12.Type] or u872
                end
                if not i12.Eligible and a1.selectedTowerStats and a1.selectedTowerStats.Properties then
                    PreviewText = a1.selectedTowerStats.Properties.Price.PreviewText
                    v31 = Color3.fromRGB(36, 36, 36)
                    MapLocked = a1.selectedTowerStats.Properties.Price.MapLocked
                    if MapLocked then
                        v5 = true
                        PreviewText = ("%*"):format((string.format("Beat <font color=\"rgb(255,174,33)\">%q</font> to buy this tower.", MapLocked)))
                    end
                end
                if i12.Type == Enum.CurrencyType.Robux then
                    Locked = nil
                    u944 = ("%* %*"):format(u263, u944)
                end
                v16 = u872 == Color3.fromRGB(80, 255, 86)
                v17 = createElement
                v19 = {
                    textSize = 22,
                    text = u944,
                    color = u872,
                    spotLight = if not v16 then nil else "DisplayAction",
                    onClick = function() -- Line: 857 -- upvalues: u859 (ref), u944 (ref), a1 (val), i12 (val), Locked (ref), u872 (ref)
                        if u859 and u944 ~= "LOCKED" then
                            a1.purchasePrompt({
                                type = "Tower",
                                selectedItem = a1.selectedTower,
                                priceData = i12,
                                icon = Locked,
                                color = u872,
                                purchaseItem = function() end,
                                cancelPurchase = function() -- Line: 869 -- upvalues: a1 (upval)
                                    a1.popUp(nil)
                                end,
                            })
                            return
                        end
                        a1.cantAfford()
                    end,
                    icon = Locked,
                    layoutOrder = i11,
                }
                v36[i11] = (v17(Button, v19))
            end
        else
            local gems
            v7 = true
            local u828 = true
            local u830 = {}
            v11 = nil
            v12 = nil
            for i13, i14 in a1.towerPurchaseData, v11, v12 do
                v15 = false
                if i14.Value ~= nil then
                    v15 = true
                    if i14.Type ~= Enum.CurrencyType.Coins then
                        v15 = i14.Type == Enum.CurrencyType.Gems
                    end
                end
                if v15 then
                    table.insert(u830, i14)
                    if not i14.Eligible then
                        v7 = false
                    end
                    gems = if i14.Type ~= Enum.CurrencyType.Gems then a1.coins else a1.gems
                    if gems < i14.Value then
                        u828 = false
                    end
                end
            end
            if v7 then
                v10 = u830[1]
                v11 = v10 and Icons[Enum.CurrencyType.ToString(v10.Type)]
                v12 = {}
                v13 = #u830
                for i15 = 2, v13 do
                    v16 = u830[i15]
                    v17 = Icons[Enum.CurrencyType.ToString(v16.Type)]
                    v18 = i15 * 3
                    v19 = ("separator_%*"):format(i15)
                    v12[v19] = (createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        Text = "+",
                        TextSize = 22,
                        AutomaticSize = Enum.AutomaticSize.X,
                        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                        LayoutOrder = v18 - 2,
                        TextColor3 = Color3.new(1, 1, 1),
                    }, {
                        uIStroke = createElement("UIStroke", {
                            Thickness = 2,
                            Transparency = 0.5,
                            LineJoinMode = Enum.LineJoinMode.Bevel,
                        }),
                    }))
                    v19 = ("icon_%*"):format(i15)
                    v12[v19] = (createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Image = if typeof(v17) ~= "number" then v17 else ("rbxassetid://%*"):format(v17),
                        LayoutOrder = v18 - 1,
                        Size = UDim2.fromScale(0.8, 0.8),
                    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}))
                    v19 = ("value_%*"):format(i15)
                    v12[v19] = (createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextSize = 22,
                        AutomaticSize = Enum.AutomaticSize.X,
                        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                        LayoutOrder = v18,
                        Text = Comma(v16.Value),
                        TextColor3 = Color3.new(1, 1, 1),
                    }, {
                        uIStroke = createElement("UIStroke", {
                            Thickness = 2,
                            Transparency = 0.5,
                            LineJoinMode = Enum.LineJoinMode.Bevel,
                        }),
                    }))
                end
                local u724 = if not u828 then Color3.fromRGB(108, 108, 108) else Color3.fromRGB(80, 255, 86)
                v14 = createElement
                v16 = {
                    textSize = 22,
                    layoutOrder = 1,
                    text = if not v10 then "EVOLVE" else Comma(v10.Value),
                    color = u724,
                    icon = v11,
                    padding = {left = UDim.new(0, 34), right = UDim.new(0, 34)},
                    onClick = function() -- Line: 787 -- upvalues: u828 (ref), a1 (val), u830 (val), u724 (val)
                        if not u828 then
                            a1.cantAfford()
                            return
                        end
                        a1.purchasePrompt({
                            type = "Evolution",
                            selectedItem = a1.selectedTower,
                            priceData = u830,
                            color = u724,
                            purchaseItem = function() end,
                            cancelPurchase = function() -- Line: 800 -- upvalues: a1 (upval)
                                a1.popUp(nil)
                            end,
                        })
                    end,
                }
                v36.EVOLVE = v14(Button, v16, v12)
            else
                PreviewText = ("Reach %* Level %* to unlock %*."):format(
                    a1.selectedTowerStats.Properties.EvolvesFrom or "base tower",
                    a1.selectedTowerStats.Properties.EvolutionLevel,
                    a1.selectedTowerStats.Properties.DisplayName or a1.selectedTower
                )
                v31 = Color3.fromRGB(36, 36, 36)
                v36.LOCKED = createElement(Button, {
                    textSize = 22,
                    text = "LOCKED",
                    layoutOrder = 1,
                    color = Color3.fromRGB(108, 108, 108),
                    icon = Icons.Locked,
                })
            end
        end
    end
    if next(a1.selectedTowerStats) then
        v44 = Enum.TowerRole.ToString(a1.selectedTowerStats.Properties.Role)
        Description = a1.selectedTowerStats.Properties.Description
        local Defaults = a1.selectedTowerStats.Stats.Default.Defaults
        if a1.goldenEquipped then
            Defaults = a1.selectedTowerStats.Stats.Golden.Defaults
        end
        v9 = nil
        v10 = nil
        for i16, i17 in Defaults, v9, v10 do
            if i16 == "Price" then
                i16 = "Cash"
            end
            if Icons[i16] then
                v13 = {
                    Cash = 1,
                    Limit = 2,
                    Damage = 3,
                    Cooldown = 4,
                    Range = 5,
                    SpawnTime = 6,
                }
                if i17 ~= 0 then
                    v14 = v13[i16]
                    v35[v14] = {
                        title = tostring(i17),
                        image = Icons[i16],
                        sizeMult = if i16 ~= "Cash" then 1 else 1.2,
                    }
                end
            end
        end
    end
    local u1171 = a1.crates[a1.selectedCrate]
    v8 = useMemo
    v10 = {u1171, a1.openCrate, a1.selectedCrate}
    v8 = v8(function() -- Line: 929 -- upvalues: u1171 (val), createElement (upval), Button (upval), Icons (upval), a1 (val)
        local v1 = {}
        if u1171 and u1171.Owned and 0 < u1171.Owned then
            v1.OPEN = createElement(Button, {
                textSize = 22,
                text = "OPEN",
                layoutOrder = -10,
                color = Color3.fromRGB(0, 217, 255),
                icon = Icons.Crates,
                onClick = function() -- Line: 938 -- upvalues: a1 (upval)
                    a1.openCrate(a1.selectedCrate)
                end,
            })
        end
        return v1
    end, v10)
    v9 = useMemo
    v11 = {a1.crates}
    v9 = v9(function() -- Line: 948
        -- upvalues: a1 (val), Enum (upval), table (upval), u324 (upval), math (upval), u311 (upval)
        -- upvalues: createElement (upval), CatgoryFrame (upval), RarityColors (upval), CrateDisplayName (upval)
        -- upvalues: InventoryItem (upval), GridComponent (upval), u8764 (val)
        local Category, Owned, Robux, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
        local v13 = {}
        local v14 = 0
        local v15 = {}
        local v16 = nil
        local v17 = nil
        for i, j in a1.crates, v16, v17 do
            Category = j.Category
            Robux = if Category ~= Enum.CrateCategory.Robux then if Category ~= Enum.CrateCategory.Consumables then Enum.CrateCategory.Default else Enum.CrateCategory.Consumables else Enum.CrateCategory.Robux
            if not v15[Robux] then
                v15[Robux] = {}
            end
            v15[Robux][i] = j
        end
        local v18 = {}
        for k in v15 do
            table.insert(v18, k)
        end
        table.sort(v18, function(a1, a2) -- Line: 967 -- upvalues: u324 (upval), math (upval)
            local huge = u324[a1] or math.huge
            local huge_2 = u324[a2] or math.huge
            return huge < huge_2
        end)
        v17 = nil
        local v19 = nil
        for n, m in v18, v17, v19 do
            v12 = v15[m]
            v1 = u311[m] or "1"
            v14 = v14 + 1
            v2 = tostring(m)
            v13[v2] = (createElement(CatgoryFrame, {
                layOutOrder = v14,
                title = Enum.CrateCategory.ToString(m),
                color = RarityColors[v1],
            }))
            v2 = {}
            v3 = {}
            for i5 in v12 do
                table.insert(v3, i5)
            end
            table.sort(v3, function(a1, a2) -- Line: 991
                return a1 < a2
            end)
            v5 = nil
            v6 = nil
            for i6, i7 in v3, v5, v6 do
                v8 = v12[i7]
                v9 = CrateDisplayName.text(i7, v8)
                v14 = v14 + 1
                v10 = createElement
                v11 = {
                    type = "crate",
                    equiped = false,
                    selected = false,
                    noAspect = true,
                    forcedText = v9,
                    previewName = i7,
                    forcedRarity = v1,
                    layOutOrder = v14,
                }
                Owned = v8.Owned and 0 < v8.Owned
                v11.owned = Owned
                v11.ownedAmount = v8.Owned

                function v11.onClick() -- Line: 1011 -- upvalues: a1 (upval), i7 (val)
                    a1.selectCrate(i7)
                end

                v2[i7] = (v10(InventoryItem, v11))
            end
            v14 = v14 + 1
            v4 = (tostring(m)) .. "items"
            v5 = createElement
            v7 = {
                layoutOrder = v14,
                CellPadding = function(a1) -- Line: 1021
                    return UDim2.fromOffset(30 * a1, 30 * a1)
                end,
                CellSize = function(a1) -- Line: 1024
                    return UDim2.fromOffset(190 * a1, 220 * a1)
                end,
                scaleMult = if not u8764 then 1 else 1.2,
            }
            v13[v4] = (v5(GridComponent, v7, v2))
        end
        return v13
    end, v11)
    v10 = useMemo
    v12 = {
        a1.crates,
        a1.selectedTab,
        a1.selectedCrate,
        a1.selectedPreviewItem,
        a1.showCrateOdds,
        a1.towerInventorySkins,
    }
    v10 = v10(function() -- Line: 1034
        -- upvalues: a1 (val), table (upval), math (upval), createElement (upval), InventoryItem (upval), Troops (upval)
        -- upvalues: TowerDisplayName (upval), u8766 (val), GridComponent (upval), u8764 (val)
        local v1 = {}
        if a1.selectedTab == "Crates"
            and a1.selectedCrate ~= nil
            and a1.crates ~= nil
            and a1.crates[a1.selectedCrate] then
            local v2, v3, v4, v5, v6, v7, v8
            local v9 = {}
            local v10 = a1.crates[a1.selectedCrate]
            if v10.Type == "consumables" then
                local name, rarity
                v4 = {}
                v6 = nil
                v7 = nil
                for i, j in v10.Contents.Items, v6, v7 do
                    if v10.Weights then
                        for k, n in v10.Weights.entries do
                            if n.value.name == j then
                                rarity = n.value.rarity
                                table.insert(v4, {
                                    name = j,
                                    rarity = rarity,
                                    weightAmount = n.weight / v10.Weights.maxWeight or 0,
                                    weight = n.weight,
                                })
                                break
                            end
                        end
                    end
                end
                table.sort(v4, function(a1, a2) -- Line: 1069
                    return a1.weightAmount < a2.weightAmount
                end)
                v5 = math.getDisplayPercentages(v4, function(a1) -- Line: 1075
                    return a1.weight
                end)
                v7 = nil
                v8 = nil
                for m, i5 in v4, v7, v8 do
                    name = i5.name
                    v2 = createElement
                    v3 = {
                        type = "consumable",
                        owned = true,
                        equiped = false,
                        selected = false,
                        greenColor = false,
                        noAspect = true,
                        cantAnimate = true,
                        layOutOrder = m,
                        forcedText = i5.name,
                        forcedRarity = i5.rarity,
                        onClick = function() end,
                        weightAmount = if not a1.showCrateOdds then nil else v5[m],
                    }
                    v9[name] = (v2(InventoryItem, v3))
                end
            end
            if v10.Type == "skins" then
                local Properties, SkinData, canUse, maxWeight, skin, tower, tower_2, v11, v12, v13, v14, v15, v16, v17, v18, v19, weight
                v4 = {}
                v6 = nil
                v7 = nil
                for i6, i7 in v10.Contents, v6, v7 do
                    v11 = nil
                    v2 = nil
                    for i8, i9 in i7, v11, v2 do
                        weight = 0
                        v14 = false
                        v15 = Troops(i9).Properties.SkinData[i6]
                        if v10.Weights then
                            for i10, i11 in v10.Weights.entries do
                                if i11.value.tower == i9 and i11.value.skin == i6 then
                                    weight = i11.weight
                                    v14 = true
                                    break
                                end
                            end
                        end
                        maxWeight = 1
                        if v10.Weights then
                            maxWeight = v10.Weights.maxWeight
                        end
                        v16 = false
                        if a1.towerInventorySkins then
                            v18 = nil
                            v19 = nil
                            for i12, i13 in a1.towerInventorySkins, v18, v19 do
                                for i14, i15 in i13 do
                                    if i15 == i9 then
                                        v16 = true
                                    end
                                end
                            end
                        end
                        v17 = if not (maxWeight > 0) then 0 else weight / maxWeight
                        table.insert(v4, {
                            tower = i9,
                            skin = i6,
                            weightAmount = v17,
                            weight = weight,
                            canUse = v14,
                            rarity = v15 and v15.Rarity,
                            owns = v16,
                        })
                    end
                end
                table.sort(v4, function(a1, a2) -- Line: 1153
                    local rarity = a1.rarity and a1.rarity or 0
                    local rarity_2 = a2.rarity and a2.rarity or 0
                    if a1.weightAmount ~= a2.weightAmount then
                        return a2.weightAmount < a1.weightAmount
                    end
                    if rarity == rarity_2 then
                        return false
                    end
                    local v1 = tonumber(rarity)
                    return tonumber(rarity_2) < v1
                end)
                v5 = math.getDisplayPercentages(v4, function(a1) -- Line: 1168
                    return a1.weight
                end)
                v7 = nil
                v8 = nil
                for i16, i17 in v4, v7, v8 do
                    tower = i17.tower
                    if tower then
                        u156 = TowerDisplayName.fromAsset(tower, nil)
                    else
                        local u156 = ""
                    end
                    tower_2 = i17.tower
                    skin = i17.skin
                    if skin then
                        v13 = tower_2 and Troops(tower_2)
                        Properties = v13 and v13.Properties
                        SkinData = Properties and Properties.SkinData and Properties.SkinData[skin]
                        if not SkinData then
                            DisplayName = skin
                        else
                            DisplayName = SkinData.DisplayName
                            if not DisplayName then
                                DisplayName = skin
                            end
                        end
                    else
                        local DisplayName = ""
                    end
                    v12 = i17.skin .. i17.tower
                    v3 = createElement
                    v14 = {
                        equiped = false,
                        disableSpotlight = true,
                        noAspect = true,
                        cantAnimate = true,
                        layOutOrder = i16,
                        towerName = i17.tower,
                        skin = i17.skin,
                    }
                    canUse = i17.canUse or i17.owns
                    v14.owned = canUse
                    v14.selected = a1.selectedPreviewItem == ("%*,%*"):format(i17.skin, i17.tower)

                    function v14.onClick() end

                    v14.greenColor = a1.owns or false

                    function v14.onEnter() -- Line: 1191
                        -- upvalues: u8766 (upval), i17 (val), DisplayName (val), u156 (val)
                        u8766({Name = i17.tower, Header = DisplayName, Subject = u156})
                    end

                    function v14.onLeave() -- Line: 1199 -- upvalues: u8766 (upval)
                        u8766(nil)
                    end

                    v14.weightAmount = if not a1.showCrateOdds then nil else v5[i16]
                    v9[v12] = (v3(InventoryItem, v14))
                end
            end
            v4 = createElement
            v6 = {
                layoutOrder = 1,
                bottomPadding = true,
                CellPadding = function(a1) -- Line: 1212
                    return UDim2.fromOffset(40 * a1, 40 * a1)
                end,
                CellSize = function(a1) -- Line: 1215
                    return UDim2.fromOffset(158.33333333333334 * a1, 183.33333333333334 * a1)
                end,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                scaleMult = if not u8764 then 1 else 1.2,
            }
            v1.crateItems = v4(GridComponent, v6, v9)
        end
        return v1
    end, v12)
    v11 = useMemo
    v13 = {a1.equipedConsumables, a1.selectedTab, a1.selectedConsumable}
    v11 = v11(function() -- Line: 1234
        -- upvalues: a1 (val), SharedGameConstants (upval), createElement (upval), PVPTowerInventoryHotbar (upval)
        local v1, v2, v3, v4
        local v5 = {}
        if a1.selectedTab ~= "Items" then
            return {}
        end
        local MAX_CONSUMABLE_SLOTS = SharedGameConstants.MAX_CONSUMABLE_SLOTS
        for i = 1, MAX_CONSUMABLE_SLOTS do
            local u13 = a1.equipedConsumables[i]
            v1 = "consumable" .. i
            v2 = createElement
            v3 = {
                Container = false,
                showPrice = false,
                isTower = false,
                showConsumables = true,
                dontSpotlight = true,
                LayoutOrder = i,
                Size = UDim2.fromScale(1, 1),
                name = u13,
            }
            v4 = u13 and a1.selectedConsumable == u13
            v3.picked = v4

            function v3.clicked() -- Line: 1251 -- upvalues: a1 (upval), u13 (val)
                a1.onClickConsumable(u13)
            end

            v5[v1] = (v2(PVPTowerInventoryHotbar, v3))
        end
        return v5
    end, v13)
    v12 = useMemo
    v14 = {a1.selectedConsumable, a1.consumables, a1.equipedConsumables}
    local u1309 = v12(function() -- Line: 1263 -- upvalues: a1 (val)
        if not a1.selectedConsumable then
            return nil
        end
        if not a1.consumables[a1.selectedConsumable] then
            return
        end
        return a1.consumables[a1.selectedConsumable]
    end, v14)
    v13 = useMemo
    v15 = {a1.selectedConsumable, u1309, a1.equipedConsumables}
    v13 = v13(function() -- Line: 1276 -- upvalues: u1309 (val), a1 (val), table (upval), createElement (upval), Button (upval)
        local v1 = {}
        if u1309 then
            local equipedConsumables = a1.equipedConsumables and table.find(a1.equipedConsumables, a1.selectedConsumable)
            local v2 = createElement
            local v3 = {
                textSize = 22,
                layoutOrder = -1,
                text = if not equipedConsumables then "EQUIP" else "UNEQUIP",
            }
            local v4 = equipedConsumables and Color3.fromRGB(158, 158, 158) or Color3.fromRGB(80, 255, 86)
            v3.color = v4

            function v3.onClick() -- Line: 1288 -- upvalues: a1 (upval)
                a1.onEquipConsumable(a1.selectedConsumable)
            end

            v1.toggle = v2(Button, v3)
        end
        return v1
    end, v15)
    v14 = useMemo
    v16 = {a1.consumables, a1.selectedConsumable, a1.equipedConsumables, a1.pvp}
    local u1324 = v14(function() -- Line: 1297
        -- upvalues: a1 (val), table (upval), createElement (upval), InventoryItem (upval), CatgoryFrame (upval)
        -- upvalues: Enum (upval), GridComponent (upval), u8764 (val)
        local equipedConsumables, v1, v2, v3, v4, v5
        local v6 = {}
        local v7 = {}
        local pvp = a1.pvp
        local v8 = nil
        local v9 = nil
        for i, j in a1.consumables, v8, v9 do
            if not v7[j.Rarity] then
                v7[j.Rarity] = {}
            end
            equipedConsumables = a1.equipedConsumables and table.find(a1.equipedConsumables, i)
            v5 = tonumber(j.Rarity)
            v1 = v7[j.Rarity]
            v2 = createElement
            v3 = {
                type = "consumable",
                forcedText = i,
                forcedRarity = j.Rarity,
                owned = if not pvp then 0 < j.owned else true,
                ownedAmount = if not pvp then j.owned or 0 else nil,
                equiped = equipedConsumables,
                selected = a1.selectedConsumable == i,
                onClick = function() -- Line: 1320 -- upvalues: a1 (upval), i (val)
                    a1.onClickConsumable(i)
                end,
                greenColor = equipedConsumables,
            }
            v1[i] = (v2(InventoryItem, v3))
            if not v6[j.Rarity] then
                v6[j.Rarity] = (createElement(CatgoryFrame, {
                    layOutOrder = v5 * 2 - 1,
                    title = ("%*"):format((Enum.ConsumableRarity.ToString(j.Rarity))),
                }))
            end
        end
        v8 = nil
        v9 = nil
        for k, n in v7, v8, v9 do
            v4 = k .. "grid"
            v5 = createElement
            v2 = {layoutOrder = tonumber(k) * 2, scaleMult = if not u8764 then 1 else 1.2}
            v6[v4] = (v5(GridComponent, v2, n))
        end
        return v6
    end, v16)
    v15 = useMemo
    v17 = {a1.tickets, a1.selectedTicket}
    local u1330 = v15(function() -- Line: 1347
        -- upvalues: a1 (val), createElement (upval), InventoryItem (upval), Enum (upval), CatgoryFrame (upval)
        -- upvalues: GridComponent (upval), u8764 (val)
        local v1, v2
        local v3 = {}
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in a1.tickets, v5, v6 do
            v1 = createElement
            v2 = {
                type = "ticket",
                equiped = false,
                forcedText = i,
                forcedIcon = j.icon,
                forcedRarity = Enum.SkinRarity.Utility,
                owned = 0 < j.owned,
                ownedAmount = j.owned,
                selected = a1.selectedTicket == i,
                onClick = function() -- Line: 1361 -- upvalues: a1 (upval), i (val)
                    a1.onClickTicket(i)
                end,
            }
            v4[i] = (v1(InventoryItem, v2))
        end
        if next(v4) then
            v3.ticketsHeader = createElement(CatgoryFrame, {layOutOrder = -1, title = "Tickets"})
            v3.ticketsGrid = createElement(GridComponent, {layoutOrder = 0, scaleMult = if not u8764 then 1 else 1.2}, v4)
        end
        return v3
    end, v17)
    v16 = useMemo
    v18 = {a1.selectedTicket, a1.tickets}
    local u1336 = v16(function() -- Line: 1382 -- upvalues: a1 (val)
        if a1.selectedTicket then
            return a1.tickets[a1.selectedTicket]
        end
        return nil
    end, v18)
    v17 = useMemo
    v19 = {a1.selectedTicket, u1336, a1.showSpinTicketOdds, a1.onShowSpinTicketOdds}
    v17 = v17(function() -- Line: 1389
        -- upvalues: a1 (val), u1336 (val), u263 (upval), Comma (upval), createElement (upval), Button (upval)
        local v1 = {}
        local selectedTicket = a1.selectedTicket
        if u1336 and selectedTicket then
            local v2 = if u1336.price then ("%* %*"):format(u263, (Comma(u1336.price))) else if not u1336.loading then ("%* ..."):format(u263) else "Loading..."
            if u1336.canPurchase ~= false then
                v1.purchase = createElement(Button, {
                    textSize = 22,
                    layoutOrder = -1,
                    text = v2,
                    color = Color3.fromRGB(80, 255, 86),
                    onClick = function() -- Line: 1405 -- upvalues: a1 (upval), selectedTicket (val)
                        a1.onPurchaseTicket(selectedTicket)
                    end,
                })
            end
            if selectedTicket == "Spin" and a1.showSpinTicketOdds then
                v1.odds = createElement(Button, {
                    textSize = 20,
                    text = "Show Odds",
                    layoutOrder = 0,
                    color = Color3.fromRGB(0, 217, 255),
                    onClick = a1.onShowSpinTicketOdds,
                })
            end
        end
        return v1
    end, v19)
    local v49 = {u1324, u1330}
    v18 = useMemo(function() -- Line: 1430 -- upvalues: u1324 (val), u1330 (val)
        local v1 = {}
        for i, j in u1324 do
            v1[i] = j
        end
        for k, n in u1330 do
            v1[k] = n
        end
        return v1
    end, v49)
    v19 = useMemo
    local v50 = {a1.cosmetics, a1.selectedCosmetic, a1.selectedCosmeticType}
    v19 = v19(function() -- Line: 1441
        -- upvalues: a1 (val), table (upval), u335 (upval), createElement (upval), CatgoryFrame (upval)
        -- upvalues: InventoryItem (upval), GridComponent (upval), u8764 (val)
        local Name, data, data_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local v11 = {}
        local v12 = 0
        local v13 = {}
        for i, j in a1.cosmetics.inventory do
            table.insert(v13, {cat = i, data = j})
        end
        table.sort(v13, function(a1, a2) -- Line: 1452 -- upvalues: u335 (upval)
            return u335[a1.cat] < u335[a2.cat]
        end)
        local v14 = nil
        local v15 = nil
        for k, n in v13, v14, v15 do
            local cat = n.cat
            data = n.data
            v12 = v12 + 1
            v1 = {}
            v2 = {}
            for m, i5 in data do
                table.insert(v2, {key = m, data = i5})
            end
            v3 = cat .. "_catg"
            v4 = false
            if #v2 > 0 then
                v4 = createElement(CatgoryFrame, {layOutOrder = v12, title = (cat:sub(1, 1):upper()) .. cat:sub(2)})
            end
            v11[v3] = v4
            table.sort(v2, function(a1, a2) -- Line: 1475
                local Rarity = a1.data.Rarity or a1.data.rarity
                local Rarity_2 = a2.data.Rarity or a2.data.rarity
                if Rarity and Rarity_2 then
                    return Rarity_2 < Rarity
                end
                return false
            end)
            v4 = nil
            v5 = nil
            for i6, i7 in v2, v4, v5 do
                data_2 = i7.data
                local key = i7.key
                Name = data_2.Name or data_2.title or key
                v7 = false
                if a1.cosmetics.equipped[cat] then
                    if a1.cosmetics.equipped[cat] == key then
                        v7 = true
                    end
                    if type(a1.cosmetics.equipped[cat]) == "table"
                        and table.find(a1.cosmetics.equipped[cat], key) then
                        v7 = true
                    end
                end
                v8 = createElement
                v9 = {
                    owned = true,
                    noAspect = true,
                    type = cat,
                    cosmeticType = cat,
                    forcedText = Name,
                    previewName = key,
                    forcedRarity = cat ~= "tags" and data_2.Rarity or "1",
                    equiped = v7,
                    layOutOrder = i6,
                }
                v10 = false
                if a1.selectedCosmetic == key then
                    v10 = a1.selectedCosmeticType == cat
                end
                v9.selected = v10

                function v9.onClick() -- Line: 1512 -- upvalues: a1 (upval), key (val), cat (val)
                    a1.onSelectCosmetic(key, cat)
                end

                v9.greenColor = v7
                v1[key] = (v8(InventoryItem, v9))
            end
            v12 = v12 + 1
            v3 = cat .. "_grid"
            v4 = false
            if #v2 > 0 then
                v4 = createElement
                v6 = {
                    layoutOrder = v12,
                    CellSize = function(a1) -- Line: 1525
                        return UDim2.fromOffset(150 * a1, 190 * a1)
                    end,
                    CellPadding = function(a1) -- Line: 1528
                        return UDim2.fromOffset(15 * a1, 30 * a1)
                    end,
                    scaleMult = if not u8764 then 1 else 1.3,
                }
                v4 = v4(GridComponent, v6, v1)
            end
            v11[v3] = v4
        end
        return v11
    end, v50)
    v49 = useMemo
    local v51 = {a1.selectedCosmetic, a1.cosmetics, a1.selectedCosmeticType}
    local u1364 = v49(function() -- Line: 1539 -- upvalues: a1 (val)
        if not a1.selectedCosmetic then
            return nil
        end
        local v1 = a1.cosmetics.inventory[a1.selectedCosmeticType][a1.selectedCosmetic]
        if not v1 then
            for i, j in a1.cosmetics.inventory[a1.selectedCosmeticType] do
                if i ~= a1.selectedCosmetic and j.Name ~= a1.selectedCosmetic and j.title ~= a1.selectedCosmetic then
                    continue
                end
                return j
            end
        end
        return v1
    end, v51)
    v50 = useMemo
    local v52 = {u1364, a1.cosmetics, a1.selectedCosmeticType}
    v50 = v50(function() -- Line: 1562
        -- upvalues: u1364 (val), a1 (val), table (upval), createElement (upval), Button (upval), Icons (upval)
        local v1 = {}
        if u1364 then
            local selectedCosmetic = a1.selectedCosmetic
            if not selectedCosmetic then
                selectedCosmetic = u1364.Name
                if not selectedCosmetic then
                    selectedCosmetic = u1364.title
                end
            end
            local selectedCosmeticType = a1.selectedCosmeticType
            local u20 = false
            if a1.cosmetics.equipped[selectedCosmeticType] then
                if a1.cosmetics.equipped[selectedCosmeticType] == selectedCosmetic then
                    u20 = true
                end
                if type(a1.cosmetics.equipped[selectedCosmeticType]) == "table"
                    and table.find(a1.cosmetics.equipped[selectedCosmeticType], selectedCosmetic) then
                    u20 = true
                end
            end
            if selectedCosmeticType == "stickers" or selectedCosmeticType == "emotes" then
                u20 = false
            end
            if not table.find({"totems", "tags"}, selectedCosmeticType)
                or selectedCosmetic ~= "Default"
                or not u20 then
                local v2 = createElement
                local v3 = {textSize = 22, layoutOrder = -1, text = if not u20 then "EQUIP" else "UNEQUIP"}
                local v4 = u20 and Color3.fromRGB(158, 158, 158) or Color3.fromRGB(80, 255, 86)
                v3.color = v4

                function v3.onClick() -- Line: 1607
                    -- upvalues: a1 (upval), selectedCosmetic (val), selectedCosmeticType (val), u20 (ref)
                    a1.onEquipCosmetic(selectedCosmetic, selectedCosmeticType, u20)
                end

                v1.toggle = v2(Button, v3)
            else
                v1.LOCKED_DEFAULT = createElement(Button, {
                    textSize = 22,
                    text = "LOCKED",
                    icon = Icons.Locked,
                    color = Color3.fromRGB(158, 158, 158),
                })
            end
        end
        return v1
    end, v52)
    local goldenEquipped = a1.goldenEquipped
    v52 = ownedTowers
    if v52 then
        v52 = false
        if a1.showTowerLevel == true then
            v52 = not a1.skinsVisible
        end
    end
    local v53 = createElement
    local Fragment = React.Fragment
    local v54 = {
        tooltip = v30 and a1.Visible and createElement(Tooltip, {Name = v30.Name, Header = v30.Header, Subject = v30.Subject}),
    }
    local loadoutsVisible = a1.loadoutsVisible and a1.Visible and createElement(Loadouts, {
        loadouts = a1.loadouts,
        towerInventory = a1.equipedTowers,
        onEquipLoadout = a1.onEquipLoadout,
        onRenameLoadout = a1.onRenameLoadout,
        onOverrideLoadout = a1.onOverrideLoadout,
        onClose = function() -- Line: 1634 -- upvalues: a1 (val)
            a1.onCloseLoadouts()
        end,
        towersToDisplay = a1.towersToDisplay,
        numLoadoutsCanCreate = a1.numLoadoutsCanCreate,
        createLoadout = function(a1_2) -- Line: 1639 -- upvalues: a1 (val)
            a1.createLoadout(a1_2)
        end,
        level = a1.level,
    })
    v54.loadouts = loadoutsVisible
    local Visible_2 = a1.Visible
    if Visible_2 then
        v20 = createElement
        v21 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0)}
        v22 = u8764 and UDim2.new(1, -5, 0, 5) or UDim2.new(1, -100, 0, 30)
        v21.Position = v22
        v22 = u8764 and UDim2.fromScale(0.2, 0.15) or UDim2.fromScale(0.1, 0.1)
        v21.Size = v22
        v21.Visible = not v29
        Visible_2 = v20("Frame", v21, {
            uIListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0.08, 0),
            }),
            coinsLabel = createElement(HudCurrency, {
                name = "Coins",
                LayoutOrder = 0,
                getExtra = true,
                currency = a1.coins,
                Size = UDim2.fromScale(0, 0.8),
                AutomaticSize = Enum.AutomaticSize.X,
                AnchorPoint = Vector2.new(0.5, 0.5),
                icon = Icons.Coins,
                onExtraClick = function() -- Line: 1669 -- upvalues: a1 (val)
                    a1.getMoreCurrency("Coins")
                end,
            }),
            gemsLabel = createElement(HudCurrency, {
                name = "Gems",
                LayoutOrder = 1,
                getExtra = true,
                currency = a1.gems,
                Size = UDim2.fromScale(0, 0.8),
                AutomaticSize = Enum.AutomaticSize.X,
                AnchorPoint = Vector2.new(0.5, 0.5),
                icon = Icons.Gems,
                onExtraClick = function() -- Line: 1683 -- upvalues: a1 (val)
                    a1.getMoreCurrency("Gems")
                end,
                textColor = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(244, 201, 246)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 100, 234))),
                }),
                textStrokeColor = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 36, 94)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 38, 99))),
                }),
            }),
        })
    end
    v54.currencyHolder = Visible_2
    v20 = createElement
    v21 = {}
    v22 = u8764 and UDim2.fromScale(0.04, 0.5) or UDim2.fromScale(0.5, 0.08)
    v21.position = v22
    v21.anchorPoint = Vector2.new(0.5, 0.5)
    v21.flipped = not not u8764
    v21.Visible = a1.Visible
    v21.size = u8764 and UDim2.fromScale(1, 0.3) or nil
    v21.paddingX = u8764 and 18
    v21.scaleMult = if not u8764 then 1 else 1.2
    v22 = {
        TowersButton = createElement(NavButton, {
            title = "Towers",
            layoutOrder = 1,
            icon = Icons.TowersInventory,
            enabled = a1.selectedTab == "Towers",
            onClick = a1.onTabChange,
            buttonSize = if not u8764 then 1 else 1.1,
        }),
    }
    v22.CrateButton = not v29 and createElement(NavButton, {
        title = "Crates",
        layoutOrder = 1,
        icon = Icons.Crates,
        enabled = a1.selectedTab == "Crates",
        onClick = a1.onTabChange,
        buttonSize = if not u8764 then 1 else 1.1,
    })
    v22.CosmeticsButton = createElement(NavButton, {
        title = "Cosmetics",
        layoutOrder = 2,
        icon = Icons.Stickers,
        enabled = a1.selectedTab == "Cosmetics",
        onClick = a1.onTabChange,
        buttonSize = if not u8764 then 1 else 1.1,
    })
    v22.ConsumablesButton = createElement(NavButton, {
        title = "Items",
        layoutOrder = 2,
        icon = Icons.ConsumablesInventory,
        enabled = a1.selectedTab == "Items",
        onClick = a1.onTabChange,
        buttonSize = if not u8764 then 1 else 1.1,
    })
    local v55 = createElement
    local v56 = IconButton
    local v57 = {
        LayoutOrder = 3,
        Color = Color3.fromRGB(255, 45, 70),
        Clicked = a1.onClose,
        Size = UDim2.fromScale(0.135, 0.135),
    }
    local v58 = {}
    local v59 = createElement
    local v60 = {AspectRatio = 1, AspectType = Enum.AspectType.ScaleWithParentSize}
    v58.aspectRatio = v59("UIAspectRatioConstraint", v60)
    v22.CloseButton = v55(v56, v57, v58)
    v54.Navigation = v20(Navigation, v21, v22)
    v20 = createElement
    v21 = {}
    local Visible_3 = u8758 and a1.Visible
    v21.enabled = Visible_3
    v21.list = a1.filterList

    function v21.clickedOutside() -- Line: 1758 -- upvalues: u8759 (val)
        u8759(false)
    end

    function v21.filterItemChanged(a1_2, a2) -- Line: 1761 -- upvalues: a1 (val)
        a1.filterItemChanged(a1_2, a2)
    end

    v54.filterInventory = v20(FilterList, v21)
    v20 = createElement
    v21 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5)}
    v21.Position = UDim2.fromScale(if not u8764 then 0.5 else 0.55, if not u8764 then 0.536671 else 0.55)
    v21.Size = UDim2.fromScale(0.512, if not u8764 then 0.75 else 0.95)
    v21.Visible = a1.Visible
    v22 = {uiScale = createElement("UIScale", {Scale = v27})}
    local skinsVisible = a1.skinsVisible
    if skinsVisible then
        skinsVisible = false
        if a1.selectedTab == "Towers" then
            skinsVisible = createElement(Button, {
                textSize = 30,
                text = "Return",
                position = UDim2.fromScale(0.28, 0.93),
                anchorPoint = Vector2.new(0.5, 0.5),
                size = UDim2.fromScale(0, 0.08),
                color = Color3.fromRGB(169, 169, 169),
                onClick = function() -- Line: 1786 -- upvalues: a1 (val)
                    a1.onClickSkins()
                end,
            })
        end
    end
    v22.returnSkinsButton = skinsVisible
    v55 = createElement
    v57 = {
        AspectRatio = 1.75,
        AspectType = Enum.AspectType.ScaleWithParentSize,
        DominantAxis = Enum.DominantAxis.Height,
    }
    v22.aspectRatio = v55("UIAspectRatioConstraint", v57)
    v55 = u264[a1.selectedTab]
    if v55 then
        v55 = not a1.hideHotbar
        if v55 then
            v55 = createElement
            v57 = {
                position = v24:map(function(a1) -- Line: 1800
                    return UDim2.new(0.78, 0, 0.68, a1.Y)
                end),
                anchorPoint = Vector2.new(0.5, 0.5),
            }
            v57.size = UDim2.fromScale(1, if not u8764 then 0.1 else 0.13)
            v55 = v55(HotbarFrameHolder, v57, {
                hotbarItems = createElement(
                    React.Fragment,
                    nil,
                    not (a1.selectedTab ~= "Towers") and v37 or not (a1.selectedTab ~= "Items") and v11 or {}
                ),
            })
        end
    end
    v22.hotbar = v55
    v55 = createElement
    v57 = {BackgroundTransparency = 1, ZIndex = 999}
    v57.AnchorPoint = Vector2.new(1, 1)
    v57.Position = UDim2.fromScale(1, 1.03)
    v57.Size = UDim2.fromScale(0.4, 0.4)
    v58 = false
    if a1.selectedTower ~= nil then
        v58 = a1.selectedTab == "Towers"
    end
    v57.Visible = v58
    v58 = {}
    v59 = not ownedTowers
    if v59 then
        v59 = createElement
        v60 = {
            text = "Skins",
            imageTransparency = 0,
            icon = "rbxassetid://140385753065544",
            onClick = function() -- Line: 1827 -- upvalues: a1 (val)
                a1.onClickSkins()
            end,
        }
        v23 = if a1.skinsVisible then ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(4, 42, 48)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 27, 49))),
        }) else ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 223, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(23, 143, 255))),
        })
        v60.color = v23
        v60.selected = a1.skinsVisible
        v60.iconSize = UDim2.fromScale(0.3, 1)
        v59 = v59(ExtraButton, v60)
    end
    v58.skinButton = v59
    local isGolden = a1.isGolden
    if isGolden then
        isGolden = not a1.skinsVisible
        if isGolden then
            v59 = createElement
            v60 = {
                text = "Golden",
                onClick = function() -- Line: 1848 -- upvalues: a1 (val)
                    a1.onClickGolden()
                end,
            }
            v23 = goldenEquipped and ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 183, 28)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 230, 42))),
            }) or ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(59, 59, 59)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
            })
            v60.color = v23
            v23 = ownedTowers and UDim2.fromScale(0.117901, -0.35) or UDim2.fromScale(0.35, -0.2)
            v60.position = v23
            v60.icon = Icons.GoldenPerks
            v23 = goldenEquipped and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(80, 80, 80)
            v60.imageColor = v23
            isGolden = v59(ExtraButton, v60, {
                glowEffect = goldenEquipped and createElement(CustomSkinRarityComponent, {Rarity = Enum.SkinRarity.GoldenButton}),
            })
        end
    end
    v58.goldenButton = isGolden
    v58.towerLevel = v52 and createElement(Level, {
        anchorPoint = Vector2.new(0.5, 0.5),
        position = UDim2.fromScale(0.45, -0.2),
        size = UDim2.fromScale(1, 0.22),
        level = a1.towerLevel or 0,
        exp = a1.towerExp or 0,
        maxExp = a1.towerMaxExp or 1,
    })
    v22.Buttons = v55("Frame", v57, v58)
    v55 = createElement
    v57 = {}
    local skinsVisible_2 = a1.skinsVisible and a1.selectedTab == "Towers"
    v57.Visible = skinsVisible_2
    v58 = {}
    v59 = createElement
    v60 = {}
    local DisplayName_3 = a1.towerSkins[a1.selectedSkin] and a1.towerSkins[a1.selectedSkin].DisplayName or a1.selectedSkin or ""
    v60.title = DisplayName_3
    v58.towerTitle = v59(DisplayTitle, v60)
    v59 = createElement
    v60 = {}
    v23 = a1.towerSkins[a1.selectedSkin] and Enum.SkinRarity.ToString(a1.towerSkins[a1.selectedSkin].Rarity) or ""
    v60.title = v23
    local v61 = RarityColors
    v60.color = v61[a1.towerSkins[a1.selectedSkin] and a1.towerSkins[a1.selectedSkin].Rarity or "1"]
    v58.ArcheTitle = v59(ArcheTitle, v60)
    local skinsVisible_3 = a1.skinsVisible and createElement(DescriptionHolder, {description = "", buttons = v38, setDescriptionSize = v25}, {})
    v58.descriptionHolder = skinsVisible_3
    local selectedTower = a1.selectedTower and createElement(TowerPreview, {
        controllable = true,
        animate = true,
        icon = false,
        shadow = false,
        worldModel = true,
        ZIndex = -10,
        inventory = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.4),
        Size = UDim2.fromScale(1, 1),
        tower = a1.selectedTower,
        skin = a1.selectedSkin,
    })
    v58.towerViewport = selectedTower
    v22.SkinsDisplay = v55(DisplayPannel, v57, v58)
    v55 = createElement
    v57 = {}
    v58 = false
    if a1.selectedTower ~= nil then
        v58 = false
        if a1.skinsVisible == false then
            v58 = a1.selectedTab == "Towers"
        end
    end
    v57.Visible = v58
    v58 = {}
    v59 = v5
    if v59 then
        v59 = createElement
        v60 = {
            text = "Play",
            zIndex = 99999999,
            imageTransparency = 0,
            textSize = 28,
            glow = true,
            onClick = function() -- Line: 1929 -- upvalues: a1 (val)
                a1.onClickSpecialMode()
            end,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.fromScale(0.5, 0.4),
        }
        v23 = 25 <= a1.level and Color3.fromRGB(255, 153, 20) or Color3.fromRGB(100, 100, 100)
        v60.color = v23
        v60.icon = Icons.Maps
        v60.size = UDim2.fromScale(0.2, 0.08)
        v59 = v59(Button, v60)
    end
    v58.specialModeButton = v59
    v59 = false
    if PreviewText == "" then
        v59 = createElement(TowerStats, {stats = v35})
    end
    v58.towerStats = v59
    v59 = createElement
    v60 = {}
    local DisplayName_4 = a1.selectedTowerStats and next(a1.selectedTowerStats) and a1.selectedTowerStats.Properties and a1.selectedTowerStats.Properties.DisplayName or a1.selectedTower or ""
    v60.title = DisplayName_4
    v58.towerTitle = v59(DisplayTitle, v60)
    v60 = {title = v44}
    v58.ArcheTitle = createElement(ArcheTitle, v60)
    local selectedTower_2 = a1.selectedTower
    if selectedTower_2 then
        v59 = createElement
        v60 = {
            animate = true,
            icon = false,
            shadow = false,
            worldModel = true,
            ZIndex = -10,
            inventory = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.4),
            Size = UDim2.fromScale(1, 1),
            tower = a1.selectedTower,
        }
        v60.skin = a1.towerInventory[a1.selectedTower] and a1.towerInventory[a1.selectedTower].Skin or "Default"
        v60.ImageColor3 = v31
        selectedTower_2 = v59(TowerPreview, v60)
    end
    v58.towerViewport = selectedTower_2
    v59 = false
    if PreviewText ~= "" then
        v59 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://99387764037728",
            ZIndex = 123121,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageColor3 = Color3.new(),
            Position = UDim2.fromScale(0.5, 0.34),
            Size = UDim2.fromScale(1, 0.7),
            SliceCenter = Rect.new(0, 0, 128, 128),
        })
    end
    v58.gradientPreview = v59
    v59 = createElement
    v60 = {BackgroundTransparency = 1, TextScaled = true, RichText = true, ZIndex = 123123}
    v60.AnchorPoint = Vector2.new(0.5, 0.5)
    v60.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
    v23 = v5 and UDim2.fromScale(0.5, 0.24) or UDim2.fromScale(0.5, 0.34)
    v60.Position = v23
    v60.Size = UDim2.fromScale(0.8, 0.2)
    v60.Text = PreviewText and not (PreviewText == "") and not (PreviewText:lower() == "label") and PreviewText or ""
    v60.TextColor3 = Color3.new(1, 1, 1)
    v58.PreviewText = v59("TextLabel", v60, {uIStroke = React.createElement("UIStroke", {Thickness = 3, Transparency = 0.1})})
    local selectedTower_3 = a1.selectedTower
    if selectedTower_3 then
        selectedTower_3 = false
        if a1.skinsVisible == false then
            selectedTower_3 = false
            if a1.selectedTab == "Towers" then
                selectedTower_3 = createElement(DescriptionHolder, {description = Description, buttons = v36, setDescriptionSize = v25}, {})
            end
        end
    end
    v58.descriptionHolder = selectedTower_3
    v22.TowersDisplay = v55(DisplayPannel, v57, v58)
    v55 = createElement
    v57 = {}
    v58 = false
    if a1.selectedCosmetic ~= nil then
        v58 = a1.selectedTab == "Cosmetics"
    end
    v57.Visible = v58
    v58 = {}
    v59 = createElement
    v60 = {}
    local Name = if not u1364 then a1.selectedCosmetic or "" else u1364.Name or u1364.title or a1.selectedCosmetic or ""
    v60.title = Name
    v58.Title = v59(DisplayTitle, v60)
    v59 = createElement
    v60 = {title = u1364 and Enum.SkinRarity.ToString(u1364.Rarity) or ""}
    v61 = RarityColors
    v60.color = v61[u1364 and u1364.Rarity or "1"]
    v58.ArcheTitle = v59(ArcheTitle, v60)
    local selectedCosmetic = a1.selectedCosmetic and createElement(CosmeticPreview, {
        icon = true,
        name = a1.selectedCosmetic,
        type = a1.selectedCosmeticType,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(0.7, 0.7),
    })
    v58.itemViewport = selectedCosmetic
    local selectedCosmetic_2 = a1.selectedCosmetic
    if selectedCosmetic_2 then
        selectedCosmetic_2 = false
        if a1.selectedTab == "Cosmetics" then
            selectedCosmetic_2 = createElement(DescriptionHolder, {
                description = if not u1364 then "" else u1364.Description or u1364.description or "",
                buttons = v50,
                setDescriptionSize = v25,
            }, {})
        end
    end
    v58.descriptionHolder = selectedCosmetic_2
    v22.selectedCosmeticsFrame = v55(DisplayPannel, v57, v58)
    v55 = createElement
    v57 = {}
    v58 = false
    if a1.selectedConsumable ~= nil then
        v58 = false
        if a1.selectedTicket == nil then
            v58 = a1.selectedTab == "Items"
        end
    end
    v57.Visible = v58
    v58 = {}
    v58.Title = createElement(DisplayTitle, {title = a1.selectedConsumable or ""})
    v59 = createElement
    v60 = {title = u1309 and Enum.ConsumableRarity.ToString(u1309.Rarity) or ""}
    v61 = RarityColors
    v60.color = v61[u1309 and u1309.Rarity or "1"]
    v58.ArcheTitle = v59(ArcheTitle, v60)
    v59 = not a1.pvp and createElement(RemainingAmount, {amount = u1309 and u1309.owned or 0, position = UDim2.fromScale(0.1, 0.125)})
    v58.RemainingAmount = v59
    local selectedConsumable = a1.selectedConsumable and createElement(ConsumablePreview, {
        icon = true,
        name = a1.selectedConsumable,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(0.7, 0.7),
    })
    v58.itemViewport = selectedConsumable
    local selectedConsumable_2 = a1.selectedConsumable
    if selectedConsumable_2 then
        selectedConsumable_2 = false
        if a1.selectedTab == "Items" then
            v59 = createElement
            v60 = {}
            local Description_3 = u1309 and u1309.Description
            v60.description = Description_3
            v60.buttons = v13
            v60.setDescriptionSize = v25
            selectedConsumable_2 = v59(DescriptionHolder, v60, {})
        end
    end
    v58.descriptionHolder = selectedConsumable_2
    v22.selectedConsumableFrame = v55(DisplayPannel, v57, v58)
    v55 = createElement
    v57 = {}
    v58 = false
    if a1.selectedTicket ~= nil then
        v58 = a1.selectedTab == "Items"
    end
    v57.Visible = v58
    v58 = {}
    v58.Title = createElement(DisplayTitle, {title = a1.selectedTicket or ""})
    v58.ArcheTitle = createElement(ArcheTitle, {title = "Ticket", color = RarityColors[Enum.SkinRarity.Utility]})
    v58.RemainingAmount = createElement(RemainingAmount, {amount = u1336 and u1336.owned or 0, position = UDim2.fromScale(0.1, 0.125)})
    v59 = u1336 and createElement(ImageLabel, {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.35),
        Size = UDim2.fromScale(0.5, 0.5),
        Image = u1336.icon,
        ScaleType = Enum.ScaleType.Fit,
    })
    v58.itemViewport = v59
    local selectedTicket = a1.selectedTicket
    if selectedTicket then
        selectedTicket = false
        if a1.selectedTab == "Items" then
            selectedTicket = createElement(DescriptionHolder, {
                description = if not u1336 then "Purchase x3 Tickets" else if u1336.canPurchase ~= false then "Purchase x3 Tickets" else "View spin wheel odds",
                buttons = v17,
                setDescriptionSize = v25,
            }, {})
        end
    end
    v58.descriptionHolder = selectedTicket
    v22.selectedTicketFrame = v55(DisplayPannel, v57, v58)
    v55 = createElement
    v57 = {}
    v58 = false
    if a1.selectedCrate ~= nil then
        v58 = a1.selectedTab == "Crates"
    end
    v57.Visible = v58
    v58 = {}
    v58.Title = createElement(DisplayTitle, {
        title = a1.selectedCrate and CrateDisplayName.withSuffix(a1.selectedCrate, u1171) or "",
    })
    v58.RemainingAmount = createElement(RemainingAmount, {amount = u1171 and u1171.Owned or 0, position = UDim2.fromScale(0.1, 0.09)})
    local selectedCrate = a1.selectedCrate and not a1.selectedPreviewItem and createElement(CratePreview, {
        icon = false,
        name = a1.selectedCrate,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(0.8, 0.8),
    })
    v58.itemViewport = selectedCrate
    local selectedPreviewItem = a1.selectedPreviewItem and a1.selectedCrate and createElement(TowerPreview, {
        animate = true,
        icon = false,
        shadow = false,
        worldModel = true,
        ZIndex = -10,
        inventory = true,
        controllable = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.4),
        Size = UDim2.fromScale(1, 1),
        tower = a1.selectedPreviewItem:split(",")[2],
        skin = a1.selectedPreviewItem:split(",")[1],
    })
    v58.itemPreview = selectedPreviewItem
    local selectedCrate_2 = a1.selectedCrate and u1171 and createElement(DescriptionHolder, {description = u1171.Description, buttons = v8, setDescriptionSize = v25}, {})
    v58.descriptionHolder = selectedCrate_2
    v22.selectedCrateFrame = v55(DisplayPannel, v57, v58)
    v55 = createElement
    v57 = {}
    v58 = false
    if a1.selectedCrate ~= nil then
        v58 = a1.selectedTab == "Crates"
    end
    v57.Visible = v58

    function v57.onReturn() -- Line: 2184 -- upvalues: a1 (val)
        if a1.selectedSkin ~= "Default" and a1.selectedSkin then
            a1.selectCrate(nil)
            a1.onTabChange("Towers")
        end
        a1.selectCrate(nil)
    end

    v22.selectedCrateItemsScrollingFrame = v55(otherItemsFrame, v57, {scrollingFrame = createElement(ItemScrollingFrame, {children = v10})})
    v55 = createElement
    v57 = {size = u269[a1.selectedTab]}
    v57.Visible = a1.selectedCrate == nil
    v58 = {}
    v59 = {}
    local v62 = createElement
    v23 = {}
    v61 = false
    if a1.selectedTab == "Towers" then
        v61 = not a1.skinsVisible
    end
    v23.Visible = v61
    v23.children = v33
    v23.selected = a1.selectedScrollingFrame
    v59.towersInventoryFrame = v62(ItemScrollingFrame, v23)
    v62 = createElement
    v23 = {}
    local skinsVisible_4 = false
    if a1.selectedTab == "Towers" then
        skinsVisible_4 = a1.skinsVisible
    end
    v23.Visible = skinsVisible_4
    v23.children = v34
    v59.towersSkinsFrame = v62(ItemScrollingFrame, v23)
    v62 = createElement
    v23 = {}
    v61 = false
    if a1.selectedTab == "Crates" then
        v61 = not a1.selectedCrate and next(a1.crates) ~= nil
    end
    v23.Visible = v61
    v23.children = v9
    v59.cratesFrame = v62(ItemScrollingFrame, v23)
    v59.emptyCrates = if a1.selectedTab ~= "Crates" or a1.selectedCrate or next(a1.crates) ~= nil then nil else createElement(EmptyCrates, {onGoToShop = a1.goToCrateShop})
    v59.consumablesFrame = createElement(ItemScrollingFrame, {Visible = a1.selectedTab == "Items", children = v18})
    v59.cosmeticsFrame = createElement(ItemScrollingFrame, {Visible = a1.selectedTab == "Cosmetics", children = v19})
    v58.otherChildren = v59
    v59 = false
    if a1.selectedTab ~= "Crates" then
        v59 = createElement(FilterButton, {
            onClick = function() -- Line: 2240 -- upvalues: u8759 (val), u8758 (val)
                u8759(not u8758)
            end,
            position = u284[a1.selectedTab],
        })
    end
    v58.filter = v59
    v59 = false
    if a1.selectedTab == "Towers" then
        v59 = not a1.skinsVisible
        if v59 then
            v59 = not a1.pvp
            if v59 then
                v59 = createElement
                v60 = {
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundColor3 = Color3.fromRGB(250, 172, 15),
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
                    Position = UDim2.fromScale(0.98, 0.5),
                    Size = UDim2.fromScale(0.23691, 0.667),
                    Text = "",
                    TextColor3 = Color3.new(),
                    TextScaled = true,
                }

                v60[React.Event.Activated] = function() -- Line: 2258 -- upvalues: a1 (val)
                    a1.loadoutsButtonClicked()
                end

                v59 = v59("TextButton", v60, {
                    imageLabel = createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://116281318083906",
                        ImageTransparency = 0.52,
                        Rotation = 90,
                        AnchorPoint = Vector2.new(0, 0.5),
                        ImageColor3 = Color3.new(),
                        Position = UDim2.new(0, 8, 0.5, 0),
                        Size = UDim2.fromScale(0.181865, 0.75),
                    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}),
                    textLabel = createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Text = "Loadouts",
                        TextScaled = true,
                        TextTransparency = 0.52,
                        AnchorPoint = Vector2.new(0, 0.5),
                        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                        Position = UDim2.fromScale(0.246101, 0.5),
                        Size = UDim2.fromScale(0.603377, 0.6),
                        TextColor3 = Color3.new(),
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)}),
                    uIStroke = createElement("UIStroke", {
                        Thickness = 2,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Color = Color3.new(1, 1, 1),
                    }, {
                        uIGradient = createElement("UIGradient", {
                            Rotation = 90,
                            Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 206, 28)),
                                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 131, 42))),
                            }),
                        }),
                    }),
                    uIListLayout = createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        Padding = UDim.new(0.03, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                    }),
                })
            end
        end
    end
    v58.Loadouts = v59
    v59 = createElement
    v60 = {
        onSearch = function(a1_2) -- Line: 2321 -- upvalues: a1 (val)
            a1.searchQueryChanged(a1_2)
        end,
    }
    v23 = u274[a1.selectedTab] or UDim2.fromScale(0.444372, 0.666667)
    v60.size = v23
    v60.position = u279[a1.selectedTab]
    v58.searchBar = v59(SearchBar, v60)
    if a1.selectedTab == "Towers" then
        v59 = not a1.skinsVisible and createElement(TabButton, {
            YSize = 50,
            text = a1.selectedInventoryLayout,
            icon = if a1.selectedInventoryLayout ~= "PvE" then 74856832184629 else 89647050840867,
            onClick = function() -- Line: 2335 -- upvalues: a1 (val)
                a1.toggleSelectedInventoryLayoutChange()
            end,
        })
    else
        v59 = false
        if a1.selectedTab == "Items" then
            v59 = not a1.skinsVisible and createElement(TabButton, {
                YSize = 50,
                text = a1.selectedInventoryLayout,
                icon = if a1.selectedInventoryLayout ~= "PvE" then 74856832184629 else 89647050840867,
                onClick = function() -- Line: 2335 -- upvalues: a1 (val)
                    a1.toggleSelectedInventoryLayoutChange()
                end,
            })
        end
    end
    v58.PVPSwithButton = v59
    v22.windowFrame = v55(WindowFrame, v57, v58)
    v54.Holder = v20("Frame", v21, v22)
    return v53(Fragment, nil, v54)
end)