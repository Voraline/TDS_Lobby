-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.newReactInventory.story
-- Decompile time: 18.33 ms

game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Prompt = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Prompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
local useAvailableConsumables = require(ReplicatedStorage.Client.Interfaces.Hooks.useAvailableConsumables)
local useAvailableCosmetics = require(ReplicatedStorage.Client.Interfaces.Hooks.useAvailableCosmetics)
local useLoadoutSlots = require(ReplicatedStorage.Client.Interfaces.Hooks.useLoadoutSlots)
local Parent = require(script.Parent)
local useAvailableCrates = require(Hooks.useAvailableCrates)
local useAvailableSkins = require(Hooks.useAvailableSkins)
local useTowerPurchaseData = require(Hooks.useTowerPurchaseData)
local useTowersAvailable = require(Hooks.useTowersAvailable)
local useMemo = React.useMemo
local useState = React.useState
local useEffect = React.useEffect
local createElement = React.createElement
local useCallback = React.useCallback
local u95 = {}
u95[true] = {
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Common),
    },
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Uncommon),
    },
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Rare),
    },
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Legendary),
    },
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Golden),
    },
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Ultimate),
    },
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Exclusive),
    },
    {
        active = false,
        filterName = Enum.SkinRarity.ToString(Enum.SkinRarity.Event),
    },
}
u95[false] = {
    {filterName = "Owned", active = false},
    {filterName = "Equipped", active = false},
    {divider = true},
    {
        active = false,
        filterName = Enum.TowerCategory.ToString(Enum.TowerCategory.Starter),
    },
    {
        active = false,
        filterName = Enum.TowerCategory.ToString(Enum.TowerCategory.Intermediate),
    },
    {
        active = false,
        filterName = Enum.TowerCategory.ToString(Enum.TowerCategory.Advanced),
    },
    {
        active = false,
        filterName = Enum.TowerCategory.ToString(Enum.TowerCategory.Hardcore),
    },
    {
        active = false,
        filterName = Enum.TowerCategory.ToString(Enum.TowerCategory.Evolved),
    },
    {
        active = false,
        filterName = Enum.TowerCategory.ToString(Enum.TowerCategory.Exclusive),
    },
}
local u187 = {Cosmetics = true, Items = true}
local u190 = {[Enum.TowerCategory.Evolved] = 4.5}

local function getTowerCategoryLayoutOrder(a1) -- Line: 115 -- upvalues: u190 (val)
    return u190[tostring(a1)] or tonumber(a1) or 0
end

local u195 = {
    Enum.CurrencyType.Free,
    Enum.CurrencyType.Gems,
    Enum.CurrencyType.Coins,
}

local function getPriceValueForCurrency(a1, a2) -- Line: 125
    if not a1 then
        return nil
    end
    if a1.Type == a2 then
        return a1.Value or 0
    end
    for i, j in a1 do
        if typeof(j) == "table" and j.Type == a2 then
            return j.Value or 0
        end
    end
    return nil
end

local function getTowerPurchaseSortPrice(a1) -- Line: 143 -- upvalues: u195 (val), getPriceValueForCurrency (val)
    local v1
    local Properties = a1.Properties and a1.Properties.Price
    for i, j in u195 do
        v1 = getPriceValueForCurrency(Properties, j)
        if v1 ~= nil then
            return v1
        end
    end
    return (1 / 0)
end

local u204 = {}
local u205 = {Scout = {Skin = "Default"}, ["Elf Camp"] = {Skin = "Default"}, ["Spotlight Tech"] = {Skin = "Default"}}
local u209 = {Scout = 175, ["Elf Camp"] = 60}

local function render() -- Line: 173
    -- upvalues: useState (val), useTowerPurchaseData (val), u205 (val), useAvailableSkins (val)
    -- upvalues: useTowersAvailable (val), useAvailableCosmetics (val), useAvailableCrates (val), u204 (val)
    -- upvalues: useAvailableConsumables (val), useMemo (val), u209 (val), TowerExpUtil (val), useLoadoutSlots (val)
    -- upvalues: u95 (val), useCallback (val), Enum (val), u190 (val), getTowerPurchaseSortPrice (val), useEffect (val)
    -- upvalues: u187 (val), React (val), createElement (val), Parent (val), Icons (val), Comma (val)
    -- upvalues: SharedGameConstants (val), Prompt (val)
    local u154, u163, u380, u384
    local Crates, Crates_2 = useState("Crates")
    local Lunar_2, Lunar = useState("Lunar")
    local PvE, PvE_2 = useState("PvE")
    local u14, u15 = useState("")
    local v1, v2 = useState("")
    local u22, u23 = useState(nil)
    local u26, u27 = useState(nil)
    local v3, v4 = useTowerPurchaseData(u22)
    local u34, u35 = useState(false)
    local u47 = useState({
        "Scout",
        "Assassin",
        "Medic",
        "Sniper",
        "Engineer",
        "Minigunner",
        "Mercenary Base",
        "Elf Camp",
        "Spotlight Tech",
    })
    local u50 = PvE == "PvP"
    local u51 = u205
    local u56 = useAvailableSkins(u34 and u22)
    local u61 = useTowersAvailable(u50, u51)
    local u63 = useAvailableCosmetics()
    local v5, u67 = useState("Fish Spin")
    local emotes_2, emotes = useState("emotes")
    local u75 = useAvailableCrates(u51, u204)
    local u78 = useAvailableConsumables(u50)
    local v6, v7 = useState({"Nuke"})
    local v8, v9 = useState({"Lockdown Shutters"})
    local v10 = u50 and v8 or v6
    local v11, u108 = useState(v10[1] or nil)
    local v12 = {u22}
    local u121 = useMemo(function() -- Line: 220 -- upvalues: u22 (val), u61 (val)
        return u22 and u61[u22] or {}
    end, v12)
    local v13 = {u121}
    local v14 = useMemo(function() -- Line: 223 -- upvalues: u121 (val)
        local Properties = u121.Properties
        if not Properties then
            return false
        end
        local v1 = false
        if Properties.EvolvesFrom ~= nil then
            v1 = Properties.EvolutionLevel ~= nil
        end
        return v1
    end, v13)
    local v15 = {u22, u121}
    v12 = useMemo(function() -- Line: 231 -- upvalues: u121 (val), u22 (val), u209 (upval), TowerExpUtil (upval)
        local Properties = u121.Properties
        local Progression = Properties and Properties.Progression
        if u22 and Progression then
            local v1 = {TowerExp = u209}
            local v2 = TowerExpUtil.getLevel(v1, u22)
            local v3 = TowerExpUtil.getExp(v1, u22)
            local v4 = TowerExpUtil.getExpForLevel(u22, v2 + 1) or 1
            local v5 = math.max(v3 - (TowerExpUtil.getTotalExpForLevel(u22, v2) or 0), 0)
            if Progression.MaxLevel and Progression.MaxLevel <= v2 then
                v5 = v4
            end
            return {level = v2, exp = v5, maxExp = v4}
        end
        return nil
    end, v15)
    local v16 = {u121}
    v13 = useMemo(function() -- Line: 256 -- upvalues: u22 (val), u61 (val)
        return u22 and u61[u22].Skins.Golden ~= nil
    end, v16)
    v15, v16 = useState({})
    local v17, v18 = useState({"Scout", "Minigunner", "Mercenary Base", "Medic"})
    if not u50 then
        u154 = v17
    else
        u154 = v15
        if not u154 then
            u154 = v17
        end
    end
    if not u50 then
        u163 = v18
    else
        u163 = v16
        if not u163 then
            u163 = v18
        end
    end
    local v19 = useLoadoutSlots()
    local u177, u178 = useState(u95[u34])
    local v20 = {u177}
    local u183 = useCallback(function() -- Line: 276 -- upvalues: u178 (val)
        u178(function(a1) -- Line: 277
            local v1 = {}
            local v2 = false
            local v3 = nil
            local v4 = nil
            for i, j in a1, v3, v4 do
                if j.active then
                    v2 = true
                end
                if not j.divider then
                    table.insert(v1, {active = false, filterName = j.filterName})
                else
                    table.insert(v1, j)
                end
            end
            if not v2 then
                return a1
            end
            return v1
        end)
    end, v20)
    local v21 = {u177, u61, u154, u47, u56}
    local u228 = useCallback(function(a1, a2) -- Line: 303
        -- upvalues: u177 (val), Enum (upval), u51 (val), u22 (val), u61 (val), u47 (val), u154 (val)
        local v1, v2, v3, v4, v5
        local v6 = {}
        local v7 = false
        local v8 = u177
        local v9 = nil
        for i, j in v8, nil, v9 do
            if j.active and not j.divider then
                v6[j.filterName] = true
                v7 = true
            end
        end
        if a2 then
            v8 = {}
            v9 = nil
            v5 = nil
            for i6, i7 in a1 or {}, v9, v5 do
                v1 = Enum.SkinRarity.ToString(i7.Rarity)
                i7.layOutOrder = -i7.Rarity
                if i6 == "Default" then
                    i7.layOutOrder = -100
                end
                if v7 then
                    if v6[v1] then
                        v8[i6] = i7
                    end
                    if v6.Owned and i7.Owned and not v8[i6] then
                        v8[i6] = i7
                    end
                    if v6.Equipped and u51[u22] and u51[u22].Skin == i6 and not v8[i6] then
                        v8[i6] = i7
                    end
                else
                    v8[i6] = i7
                end
            end
            return v8
        end
        if not v7 then
            return a1
        end
        v8 = {}
        v9 = nil
        v5 = nil
        for k, n in a1, v9, v5 do
            v1 = {}
            v3 = nil
            v4 = nil
            for m, i5 in n.towers, v3, v4 do
                if v6[Enum.TowerCategory.ToString(u61[i5.towerName].Properties.Category)] then
                    table.insert(v1, i5)
                end
                if v6.Owned and table.find(u47, i5.towerName) and not table.find(v1, i5.towerName) then
                    table.insert(v1, i5)
                end
                if v6.Equipped and table.find(u154, i5.towerName) and not table.find(v1, i5.towerName) then
                    table.insert(v1, i5)
                end
            end
            v2 = {layOutOrder = n.layOutOrder, towers = v1}
            v8[k] = v2
        end
        return v8
    end, v21)
    local v22 = {u61, u56}
    local u234 = useCallback(function(a1, a2, a3) -- Line: 391
        local v1, v2, v3
        if a2 == "" then
            return a1
        end
        if a3 then
            v2 = {}
            for m, i5 in a1 or {} do
                if string.find(string.lower(m), string.lower(a2)) then
                    v2[m] = i5
                end
            end
            return v2
        end
        v2 = {}
        local v4 = nil
        local v5 = nil
        for i, j in a1, v4, v5 do
            v3 = {}
            for k, n in j.towers do
                if string.find(string.lower(n.towerName), string.lower(v6)) then
                    table.insert(v3, n)
                end
            end
            v1 = {layOutOrder = j.layOutOrder, towers = v3}
            v2[i] = v1
        end
        return v2
    end, v22)
    local v23 = {u75}
    local u247 = useCallback(function(a1, a2) -- Line: 424
        if a2 == "" then
            return a1
        end
        local v1 = {}
        for i, j in a1 do
            if string.find(string.lower(i), string.lower(a2)) then
                v1[i] = j
            end
        end
        return v1
    end, v23)
    local v24 = {u177, u61, u154, u47, u56}
    local u256 = useMemo(function() -- Line: 438 -- upvalues: Enum (upval), u190 (upval), u61 (val), getTowerPurchaseSortPrice (upval)
        local v1, v2, v3
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in Enum.TowerCategory, v5, v6 do
            v1 = tonumber(j)
            v2 = {}
            v3 = u190[tostring(j)] or tonumber(j) or 0
            v2.layOutOrder = v3
            v2.towers = {}
            v4[v1] = v2
        end
        v5 = nil
        v6 = nil
        for k, n in u61, v5, v6 do
            for m, i5 in v4 do
                if tonumber(n.Properties.Category) == m then
                    table.insert(i5.towers, {towerName = k, price = getTowerPurchaseSortPrice(n)})
                end
            end
        end
        return v4
    end, v24)
    local v25 = {PvE}
    v23 = useCallback(function() -- Line: 462 -- upvalues: PvE (val), PvE_2 (val)
        if PvE == "PvE" then
            PvE_2("PvP")
            return
        end
        PvE_2("PvE")
    end, v25)
    local v26 = {u256}
    local u284 = useMemo(function() -- Line: 470 -- upvalues: u228 (val), u256 (val)
        return u228(u256)
    end, v26)
    local v27 = {u284, u14}
    u284 = useMemo(function() -- Line: 473 -- upvalues: u234 (val), u284 (ref), u14 (val)
        return u234(u284, u14)
    end, v27)
    v27 = {u56}
    u56 = useMemo(function() -- Line: 477 -- upvalues: u228 (val), u56 (ref)
        return u228(u56, true)
    end, v27)
    v27 = {u56, u14}
    u56 = useMemo(function() -- Line: 480 -- upvalues: u234 (val), u56 (ref), u14 (val)
        return u234(u56, u14, true)
    end, v27)
    v27 = {u75, u14}
    v25 = useMemo(function() -- Line: 484 -- upvalues: u247 (val), u75 (val), u14 (val)
        return u247(u75, u14)
    end, v27)
    local v28 = {u78, u14}
    v26 = useMemo(function() -- Line: 488 -- upvalues: u14 (val), u78 (val)
        if u14 == "" then
            return u78
        end
        local v1 = {}
        for i, j in u78 do
            if string.find(string.lower(i), string.lower(u14)) then
                v1[i] = j
            end
        end
        return v1
    end, v28)
    local v29 = {u63, u14}
    v27 = useMemo(function() -- Line: 502 -- upvalues: u14 (val), u63 (val)
        local title, v1, v2, v3
        if u14 == "" then
            return u63
        end
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in u63.inventory, v5, v6 do
            v1 = {}
            v4[i] = v1
            v2 = nil
            v3 = nil
            for k, n in j, v2, v3 do
                title = n.title or n.Name
                if string.find(string.lower(title), string.lower(u14)) then
                    v1[k] = n
                end
            end
        end
        return {equipped = u63.equipped, inventory = v4}
    end, v29)
    local v30 = {u34, Crates}
    useEffect(function() -- Line: 525 -- upvalues: u34 (val), u187 (upval), Crates (val), u178 (val), u95 (upval)
        local v1 = u34
        if u187[Crates] then
            v1 = u187[Crates]
        end
        u178(table.clone(u95[v1]))
    end, v30)
    v30 = {u14}
    useEffect(function() -- Line: 535 -- upvalues: u34 (val), u154 (val), u284 (ref), u23 (val)
        if u34 then
            return
        end
        local v1 = u154[1]
        local towerName = nil
        local v2 = false
        if v1 then
            local v3, v4
            local v5 = nil
            local v6 = nil
            for i, j in u284, v5, v6 do
                v4 = nil
                v3 = nil
                for k, n in j.towers, v4, v3 do
                    if not towerName then
                        towerName = n.towerName
                    end
                    if n.towerName == v1 then
                        v2 = true
                        break
                    end
                end
                if v2 then
                    break
                end
            end
        end
        if v2 then
            u23(v1)
            return
        end
        u23(towerName)
    end, v30)
    v28, u380 = useState({})
    v30, u384 = useState(false)
    local v31, u388 = useState(nil)
    local v32, u392 = useState(nil)
    local u396 = React.useRef(nil)
    local v33 = {
        goldenEquipped = false,
        coins = 69420,
        gems = 100,
        level = 5,
        popUp = useCallback(function(a1) -- Line: 586 -- upvalues: u396 (val), u392 (val)
            if a1 then
                u392(a1)
                u396.current = a1
                return
            end
            local current = u396.current
            current.visible = false
            u392(table.clone(current))
        end, {}),
        purchasePrompt = useCallback(function(a1) -- Line: 598 -- upvalues: Enum (upval), Icons (upval), Comma (upval), u396 (val), u392 (val)
            local icon, v1
            local v2 = ("Are you sure you want to purchase \"%*\"?"):format(a1.selectedItem)
            local priceData_2 = {}
            if a1 and a1.priceData then
                for i, j in if a1.priceData[1] == nil or typeof(a1.priceData[1]) ~= "table" then {a1.priceData} else a1.priceData do
                    if j.Type == Enum.CurrencyType.Robux then
                        return
                    end
                end
            end
            if #priceData_2 == 1 and priceData_2[1].Type == Enum.CurrencyType.Free then
                v2 = ("Are you sure you want to purchase \"%*\" for free?"):format(a1.selectedItem)
            end
            local v3 = {}
            local v4 = nil
            local v5 = nil
            for k, n in priceData_2, v4, v5 do
                v1 = {}
                icon = a1.icon or Icons[Enum.CurrencyType.ToString(n.Type)]
                v1.icon = icon
                v1.value = Comma(n.Value)
                table.insert(v3, v1)
            end
            local v6 = a1
            if v6 then
                v6 = {
                    title = "Confirm Purchase?",
                    icon = Icons.Shop,
                    description = v2,
                    items = v3,
                }
                v6.actions = {
                    {
                        text = "Purchase",
                        holdTime = 1.5,
                        color = a1.color,
                        onClick = function() -- Line: 641 -- upvalues: a1 (ref)
                            warn("wow:3")
                            a1.purchaseItem()
                        end,
                    },
                    {
                        text = "Cancel",
                        color = Color3.fromRGB(32, 32, 32),
                        onClick = function() -- Line: 651 -- upvalues: a1 (ref)
                            a1.cancelPurchase()
                        end,
                    },
                }
            end
            if a1 then
                u392(v6)
                u396.current = v6
                return
            end
            a1 = u396.current
            a1.visible = false
            u392(table.clone(a1))
        end, {}),
        Visible = true,
        pvp = u50,
        towersToDisplay = u154,
        numLoadoutsCanCreate = v19,
        loadoutsVisible = v30,
        loadoutsButtonClicked = useCallback(function() -- Line: 675 -- upvalues: u384 (val)
            u384(true)
        end, {}),
        loadouts = v28,
        onCloseLoadouts = useCallback(function() -- Line: 679 -- upvalues: u384 (val)
            u384(false)
        end, {}),
        createLoadout = useCallback(function(a1) -- Line: 682 -- upvalues: u380 (val), u154 (val)
            u380(function(a1_2) -- Line: 683 -- upvalues: a1 (val), u154 (upval)
                local v1 = table.clone(a1_2)
                table.insert(v1, {Name = a1, Towers = u154})
                return v1
            end)
        end, {}),
        onRenameLoadout = useCallback(function(a1, a2) -- Line: 694 -- upvalues: u380 (val)
            u380(function(a1_2) -- Line: 695 -- upvalues: a1 (val), a2 (val)
                local v1 = table.clone(a1_2)
                local v2 = v1[a1]
                v2.Name = a2
                return v1
            end)
        end, {}),
    }
    local v34 = {u163, u50}
    v33.onEquipLoadout = useCallback(function(a1) -- Line: 701 -- upvalues: u50 (val), u163 (val), SharedGameConstants (upval)
        if u50 then
            u163(function(a1_2) -- Line: 703 -- upvalues: SharedGameConstants (upval), a1 (val)
                local v1 = {}
                local MAX_PVP_TOWER_SLOTS = SharedGameConstants.MAX_PVP_TOWER_SLOTS
                for i = 1, MAX_PVP_TOWER_SLOTS do
                    if not a1.Towers[i] then
                        break
                    end
                    v1[i] = a1.Towers[i]
                end
                return v1
            end)
            return
        end
        u163(table.clone(a1.Towers))
    end, v34)
    v33.crates = v25
    v33.selectedCrate = Lunar_2
    v33.selectCrate = useCallback(function(a1) -- Line: 721 -- upvalues: u388 (val), Lunar (val)
        u388(nil)
        Lunar(a1)
    end, {})
    v33.setSelectedPreviewItem = u388
    v33.selectedPreviewItem = v31
    v33.filterList = u177
    v33.selectedTab = Crates
    v33.selectedScrollingFrame = v1
    v33.setSelectedScrollingFrame = v2
    v33.onTabChange = useCallback(function(a1) -- Line: 732 -- upvalues: Lunar (val), Crates_2 (val)
        Lunar(nil)
        Crates_2(a1)
    end, {})
    v33.onClose = useCallback(function() -- Line: 736
        print("Closed")
    end, {})
    v33.isGolden = v13
    v33.selectedTowerStats = u121
    v33.selectedTower = u22
    v33.selectedSkin = u26
    v33.towers = u284
    v33.towerSkins = u56
    v33.ownedTowers = u47
    v33.equipedTowers = u154
    v33.towerPurchaseData = v3
    v33.loadingTowerPurchaseData = v4
    v33.showResearchButton = v14
    v33.showTowerLevel = v12 ~= nil
    v33.towerLevel = v12 and v12.level
    v33.towerExp = v12 and v12.exp
    v33.towerMaxExp = v12 and v12.maxExp
    v33.skinsVisible = u34
    v33.cosmetics = v27
    v33.selectedCosmetic = v5
    v33.selectedCosmeticType = emotes_2
    v33.onSelectCosmetic = useCallback(function(a1, a2) -- Line: 758 -- upvalues: u67 (val), emotes (val)
        u67(a1)
        emotes(a2)
    end, {})
    v33.consumables = v26
    v33.equipedConsumables = v10
    v33.selectedConsumable = v11
    v33.onEquipConsumable = useCallback(function(a1) end, {})
    v33.onClickConsumable = useCallback(function(a1) -- Line: 767 -- upvalues: u108 (val)
        u108(a1)
    end, {})
    v34 = {u34}
    v33.onClickSkins = useCallback(function() -- Line: 771 -- upvalues: u27 (val), u35 (val), u34 (val)
        u27("Default")
        u35(not u34)
    end, v34)

    function v33.onPreviewTowerSkin() -- Line: 775
        print("Preview tower skin")
    end

    v33.clickedSkin = useCallback(function(a1) -- Line: 778 -- upvalues: u27 (val)
        u27(a1)
    end, {})
    v34 = {u22}
    v33.onClickGolden = useCallback(function() -- Line: 781
        print("works in view not the story")
    end, v34)
    v33.towerInventory = u51
    v34 = {u26}
    v33.clickedTower = useCallback(function(a1) -- Line: 785 -- upvalues: u26 (val), u27 (val), u183 (val), u23 (val)
        if u26 ~= "Default" then
            u27("Default")
        end
        u183()
        u23(a1)
    end, v34)
    v33.filterItemChanged = useCallback(function(a1, a2) -- Line: 793 -- upvalues: u178 (val)
        u178(function(a1_2) -- Line: 794 -- upvalues: a1 (val), a2 (val)
            local v1 = {}
            for i, j in a1_2 do
                if j.filterName ~= a1 then
                    table.insert(v1, j)
                else
                    table.insert(v1, {filterName = j.filterName, active = a2})
                end
            end
            return v1
        end)
    end, {})
    v33.searchQueryChanged = useCallback(function(a1) -- Line: 809 -- upvalues: u15 (val)
        u15(a1)
    end, {})
    v33.selectedInventoryLayout = PvE
    v33.toggleSelectedInventoryLayoutChange = v23
    return (React.createElement(React.Fragment, nil, {createElement(Parent, v33), prompt = v32 and createElement(Prompt, v32)}))
end

return function(a1) -- Line: 822 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render, {})))
    return function() -- Line: 826 -- upvalues: u4 (val)
        u4:unmount()
    end
end