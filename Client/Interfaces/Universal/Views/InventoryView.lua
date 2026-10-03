-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.InventoryView
-- Decompile time: 41.48 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Prompt = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Prompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local useAvailableConsumables = require(ReplicatedStorage.Client.Interfaces.Hooks.useAvailableConsumables)
local useAvailableCosmetics = require(ReplicatedStorage.Client.Interfaces.Hooks.useAvailableCosmetics)
local useAvailableCrates = require(ReplicatedStorage.Client.Interfaces.Hooks.useAvailableCrates)
local useTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowers)
local useTowersAvailable = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowersAvailable)
local useViewEnabled = require(Hooks.useViewEnabled)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Inventory = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local ShopFocusStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.ShopFocusStore)
local ShopNavigation = require(ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopNavigation)
local Sift = require(ReplicatedStorage.Packages.Sift)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local arePaidRandomItemsRestricted = require(ReplicatedStorage.Client.Interfaces.Lobby.Utility.arePaidRandomItemsRestricted)
local useAvailableSkins = require(ReplicatedStorage.Client.Interfaces.Hooks.useAvailableSkins)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useConfetti = require(ReplicatedStorage.Client.Interfaces.Hooks.useConfetti)
local useCrateQueue = require(ReplicatedStorage.Client.Interfaces.Hooks.useCrateQueue)
local useLoadoutSlots = require(ReplicatedStorage.Client.Interfaces.Hooks.useLoadoutSlots)
local usePolicies = require(ReplicatedStorage.Client.Interfaces.Hooks.usePolicies)
local useProductInfoMap = require(ReplicatedStorage.Client.Interfaces.Hooks.useProductInfoMap)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useTowerPurchaseData = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowerPurchaseData)
local useViewEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEvent)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Maid = require(ReplicatedStorage.Shared.Modules.GuiLib.Utilities.Maid)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
local createElement = React.createElement
local useMemo = React.useMemo
local useEffect = React.useEffect
local useState = React.useState
local useCallback = React.useCallback
local useRef = React.useRef
local LocalPlayer = Players.LocalPlayer
local Inventory_2 = Network.Channel("Inventory")
local Shop = Network.Channel("Shop")
local Monetization = NewNetwork.Channel("Monetization")
local u238 = utf8.char(57346)
local u239 = false
local u240 = {}
u240[1] = {
    Amount = 40,
    Lifetime = 1,
    Force = 20,
    Radius = 5,
    Direction = Vector2.new(-0.9, 0),
}
local u246 = {}
u246[true] = {
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
u246[false] = {
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
u246.Items = {
    {
        active = false,
        filterName = Enum.ConsumableRarity.ToString(Enum.ConsumableRarity.Common),
    },
    {
        active = false,
        filterName = Enum.ConsumableRarity.ToString(Enum.ConsumableRarity.Uncommon),
    },
    {
        active = false,
        filterName = Enum.ConsumableRarity.ToString(Enum.ConsumableRarity.Rare),
    },
    {
        active = false,
        filterName = Enum.ConsumableRarity.ToString(Enum.ConsumableRarity.Epic),
    },
    {
        active = false,
        filterName = Enum.ConsumableRarity.ToString(Enum.ConsumableRarity.Legendary),
    },
}
local u369 = {Cosmetics = true, Items = true}
local u372 = {[Enum.TowerCategory.Evolved] = 4.5}

local function getTowerCategoryLayoutOrder(a1) -- Line: 183 -- upvalues: u372 (val)
    return u372[tostring(a1)] or tonumber(a1) or 0
end

local u377 = {
    Enum.CurrencyType.Free,
    Enum.CurrencyType.Gems,
    Enum.CurrencyType.Coins,
}

local function getPriceValueForCurrency(a1, a2) -- Line: 193
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

local function getTowerPurchaseSortPrice(a1) -- Line: 211 -- upvalues: u377 (val), getPriceValueForCurrency (val)
    local v1
    local Properties = a1.Properties and a1.Properties.Price
    for i, j in u377 do
        v1 = getPriceValueForCurrency(Properties, j)
        if v1 ~= nil then
            return v1
        end
    end
    return (1 / 0)
end

local function InventoryViewBody(a1) -- Line: 224
    -- upvalues: useSound (val), ViewController (val), useCallback (val), Notification (val), useState (val)
    -- upvalues: useTowerPurchaseData (val), useCache (val), useAvailableSkins (val), useCrateQueue (val)
    -- upvalues: useEffect (val), useMemo (val), Sift (val), useTowersAvailable (val), useTowers (val)
    -- upvalues: useAvailableCosmetics (val), useAvailableCrates (val), useAvailableConsumables (val)
    -- upvalues: useProductInfoMap (val), usePolicies (val), Icons (val), TowerExpUtil (val), u238 (val), Comma (val)
    -- upvalues: useLoadoutSlots (val), u246 (val), Enum (val), u372 (val), getTowerPurchaseSortPrice (val), u369 (val)
    -- upvalues: useViewEvent (val), useRef (val), useConfetti (val), u240 (val), Maid (val), MarketplaceService (val)
    -- upvalues: Inventory_2 (val), u239 (ref), Monetization (val), arePaidRandomItemsRestricted (val)
    -- upvalues: createElement (val), Inventory (val), LocalPlayer (val), Shop (val), SpotlightStore (val)
    -- upvalues: SharedGameConstants (val), ReplicatedStorage (val), ShopFocusStore (val), ShopNavigation (val)
    -- upvalues: React (val), Prompt (val)
    local u162, u171, u306, u315, u609
    local Skin = useSound("Skin")
    local GoldenPerks = useSound("GoldenPerks")
    local Unequip = useSound("Unequip")
    local Equip = useSound("Equip")
    local InventoryOpen = useSound("InventoryOpen")
    local u18 = a1.enabled == true

    local function setView(a1) -- Line: 235 -- upvalues: ViewController (upval) -- types: a1: string
        ViewController:setView(a1)
    end

    local u23 = useCallback(function(a1, a2) -- Line: 239 -- upvalues: Notification (upval) -- types: a1: string?, a2: string?
        Notification.Create({
            Text = a1 or "Purchase successful!",
            Color = Color3.fromRGB(0, 255, 50),
            Sound = a2 or "Purchase",
        })
    end, {})
    local Towers, Towers_2 = useState("Towers")
    local u30, u31 = useState(nil)
    local PvE, PvE_2 = useState("PvE")
    local u38, u39 = useState("")
    local v1, u43 = useState("")
    local u46, u47 = useState(nil)
    local u50, u51 = useState(nil)
    local u56, v2 = useTowerPurchaseData(u46, u18)
    local u60, u61 = useState(false)
    local u63 = PvE == "PvP"
    local u69, u70 = useCache("Inventory.Troops", {}, u18)
    local u75 = useCache("Inventory.Skins", {}, u18)
    local u82 = useAvailableSkins(u60 and u46, u18)
    local u84 = useCrateQueue()
    local v3 = {u60}
    useEffect(function() -- Line: 266 -- upvalues: u39 (val)
        u39("")
    end, v3)
    v3 = {u18}
    useEffect(function() -- Line: 270 -- upvalues: u18 (val), InventoryOpen (val)
        if u18 then
            InventoryOpen()
        end
    end, v3)
    v3 = {u69, u46}
    local u103 = useMemo(function() -- Line: 276 -- upvalues: u46 (val), u69 (val)
        return u46 and u69[u46] and u69[u46].GoldenPerks
    end, v3)
    local v4 = {u69}
    local v5 = useMemo(function() -- Line: 282 -- upvalues: u69 (val)
        local v1 = {}
        for i, j in u69 do
            if j.GoldenPerks then
                table.insert(v1, i)
            end
        end
        return v1
    end, v4)
    local v6 = {u75, u46}
    v3 = useMemo(function() -- Line: 292 -- upvalues: u75 (val), u46 (val)
        if u75 and u75[u46] then
            for i, j in u75[u46] do
                if j.Name == "Golden" then
                    return true
                end
            end
            return false
        end
        return false
    end, v6)
    local v7 = {u69}
    local u119 = useMemo(function() -- Line: 305 -- upvalues: Sift (upval), u69 (val)
        return Sift.Dictionary.keys(u69)
    end, v7)
    local u125 = useTowersAvailable(u63, u69, u18)
    local u127 = useTowers()
    local u130 = useAvailableCosmetics(u18)
    local v8, u134 = useState("Garry's Dance")
    local emotes_2, emotes = useState("emotes")
    local u143 = useAvailableCrates(u69, u75, u18)
    local u147 = useAvailableConsumables(u63, u18)
    local v9, v10 = useCache("Equipped.Consumables", {}, u18)
    local v11, v12 = useCache("Equipped.PVPConsumables", {}, u18)
    if not u63 then
        u162 = v9
    else
        u162 = v11
        if not u162 then
            u162 = v9
        end
    end
    if not u63 then
        u171 = v10
    else
        u171 = v12
        if not u171 then
            u171 = v10
        end
    end
    local v13, u179 = useState(u162[1] or nil)
    local u188 = useCache("Values.SpinTickets", 0, u18)
    local u193 = useCache("Values.TimescaleTickets", 0, u18)
    local u198 = useCache("Values.ReviveTickets", 0, u18)
    local v14, u202 = useState(nil)
    local v15, u205, u206 = useProductInfoMap()
    local u208, u209 = usePolicies()
    local v16 = {u188, u193, u198, v15, u208, u209}
    local u219 = useMemo(function() -- Line: 337
        -- upvalues: u208 (val), u209 (val), u188 (val), Icons (upval), u193 (val), u198 (val), u205 (val), u206 (val)
        local PriceInRobux, v1, v2
        local v3 = not u208 and u209.ArePaidRandomItemsRestricted ~= true
        local v4 = not u208
        if v4 then
            v4 = false
            if u209.ArePaidRandomItemsRestricted == true then
                v4 = u188 > 0
            end
        end
        local v5 = {
            ["Time Scale"] = {canPurchase = true, productId = 1826104510, icon = Icons.Timescale, owned = u193},
        }
        v5.Revive = {canPurchase = true, productId = 1823882486, icon = Icons.ReviveTickets, owned = u198}
        if v3 or v4 then
            v5.Spin = {productId = 1872969586, canPurchase = v3, icon = Icons.Spin, owned = u188}
        end
        local v6 = nil
        local v7 = nil
        for i, j in v5, v6, v7 do
            if j.canPurchase ~= false then
                v1, v2 = u205(j.productId, Enum.InfoType.Product)
                if not v2 then
                    u206(j.productId, Enum.InfoType.Product)
                end
                PriceInRobux = if not v2 then nil else v2.PriceInRobux
                j.price = PriceInRobux
                j.loading = v1 and not v2
            end
        end
        return v5
    end, v16)
    local v17 = {u46}
    local u232 = useMemo(function() -- Line: 390 -- upvalues: u46 (val), u125 (val)
        return u46 and u125[u46] or {}
    end, v17)
    local u237 = useCache("TowerExp", {}, u18)
    local v18 = {u232}
    local u242 = useMemo(function() -- Line: 394 -- upvalues: u232 (val)
        if workspace.Type.Value ~= "Lobby" then
            return false
        end
        local Properties = u232.Properties
        if not Properties then
            return false
        end
        return Properties.UpgradeUnlockTree ~= nil
    end, v18)
    local v19 = {u46, u232}
    local u248 = useMemo(function() -- Line: 406 -- upvalues: u46 (val), TowerExpUtil (upval)
        return u46 and TowerExpUtil.getBuyAllLevelsProductId(u46) or nil
    end, v19)
    local v20 = {u46, u232, u237}
    local u255 = useMemo(function() -- Line: 409 -- upvalues: u232 (val), u46 (val), u237 (val), TowerExpUtil (upval)
        local Properties = u232.Properties
        local Progression = Properties and Properties.Progression
        if u46 and Progression then
            local MaxLevel = Progression.MaxLevel
            local v1 = {TowerExp = u237}
            local v2 = TowerExpUtil.getLevel(v1, u46)
            local v3 = TowerExpUtil.getExp(v1, u46)
            local v4 = TowerExpUtil.getExpForLevel(u46, v2 + 1) or 1
            local v5 = math.max(v3 - (TowerExpUtil.getTotalExpForLevel(u46, v2) or 0), 0)
            if MaxLevel and MaxLevel <= v2 then
                v5 = v4
            end
            return {level = v2, exp = v5, maxExp = v4, maxLevel = MaxLevel}
        end
        return nil
    end, v20)
    local v21 = {u46, u255, u119, u242, u248}
    local u268 = useMemo(function() -- Line: 435 -- upvalues: u242 (val), u255 (val), u248 (val), u119 (val), u46 (val)
        if workspace.Type.Value == "Lobby" and not u242 then
            if not u255 then
                return false
            end
            local maxLevel = u255.maxLevel
            if not maxLevel then
                return false
            end
            if type(u248) == "number" and not (u248 <= 0) then
                local v1 = false
                if u255.level < maxLevel then
                    v1 = table.find(u119, u46) ~= nil
                end
                return v1
            end
            return false
        end
        return false
    end, v21)
    local v22 = {v15, u248}
    v20 = useMemo(function() -- Line: 461 -- upvalues: u248 (val), u205 (val), u206 (val), u238 (upval), Comma (upval)
        local v1 = u248
        if type(v1) == "number" and not (v1 <= 0) then
            local v2
            _, v2 = u205(v1, Enum.InfoType.Product)
            if v2 then
                return (("BUY ALL LEVELS %* %*"):format(u238, (Comma(v2.PriceInRobux))))
            end
            u206(v1, Enum.InfoType.Product)
            return "BUY ALL LEVELS"
        end
        return "BUY ALL LEVELS"
    end, v22)
    v21, v22 = useCache("Equipped.PVPTroops", {}, u18)
    local v23, v24 = useCache("Equipped.Troops", {}, u18)
    local v25 = useCache("Values.Coins", 0, u18)
    local v26 = useCache("Values.Gems", 0, u18)
    local u301 = useCache("Values.Level", 0, u18)
    if not u63 then
        u306 = v23
    else
        u306 = v21
        if not u306 then
            u306 = v23
        end
    end
    if not u63 then
        u315 = v24
    else
        u315 = v22
        if not u315 then
            u315 = v24
        end
    end
    local v27 = useLoadoutSlots()
    local u329, u330 = useState(u246[u60])
    local v28 = {u329}
    local u335 = useCallback(function() -- Line: 489 -- upvalues: u330 (val)
        u330(function(a1) -- Line: 490
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
    end, v28)
    local v29 = {u329, u125, u306, u119, u82}
    local u375 = useCallback(function(a1, a2) -- Line: 516
        -- upvalues: u329 (val), Enum (upval), u69 (val), u46 (val), u125 (val), u119 (val), u306 (val)
        local v1, v2, v3, v4, v5
        local v6 = {}
        local v7 = false
        local v8 = u329
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
                    if v6.Equipped and u69[u46] and u69[u46].Skin == i6 and not v8[i6] then
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
                if v6[Enum.TowerCategory.ToString(u125[i5.towerName].Properties.Category)] then
                    table.insert(v1, i5)
                end
                if v6.Owned and table.find(u119, i5.towerName) and not table.find(v1, i5.towerName) then
                    table.insert(v1, i5)
                end
                if v6.Equipped and table.find(u306, i5.towerName) and not table.find(v1, i5.towerName) then
                    table.insert(v1, i5)
                end
            end
            v2 = {layOutOrder = n.layOutOrder, towers = v1}
            v8[k] = v2
        end
        return v8
    end, v29)
    local v30 = {u125, u82}
    local u381 = useCallback(function(a1, a2, a3) -- Line: 604
        local v1, v2, v3
        if a2 == "" then
            return a1
        end
        if a3 then
            v2 = {}
            for m, i5 in a1 or {} do
                if string.find(string.lower(i5.DisplayName or m), string.lower(a2)) then
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
    end, v30)
    local v31 = {u143}
    local u394 = useCallback(function(a1, a2) -- Line: 638
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
    end, v31)
    local v32 = {u329, u125, u306, u119, u82}
    local u403 = useMemo(function() -- Line: 652 -- upvalues: Enum (upval), u372 (upval), u125 (val), getTowerPurchaseSortPrice (upval)
        local v1, v2, v3
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in Enum.TowerCategory, v5, v6 do
            v1 = tonumber(j)
            v2 = {}
            v3 = u372[tostring(j)] or tonumber(j) or 0
            v2.layOutOrder = v3
            v2.towers = {}
            v4[v1] = v2
        end
        v5 = nil
        v6 = nil
        for k, n in u125, v5, v6 do
            for m, i5 in v4 do
                if tonumber(n.Properties.Category) == m then
                    table.insert(i5.towers, {towerName = k, price = getTowerPurchaseSortPrice(n)})
                end
            end
        end
        return v4
    end, v32)
    local v33 = {PvE}
    v31 = useCallback(function() -- Line: 676 -- upvalues: PvE (val), PvE_2 (val)
        if PvE == "PvE" then
            PvE_2("PvP")
            return
        end
        PvE_2("PvE")
    end, v33)
    local v34 = {u403}
    local u431 = useMemo(function() -- Line: 684 -- upvalues: u375 (val), u403 (val)
        return u375(u403)
    end, v34)
    local v35 = {u431, u38}
    u431 = useMemo(function() -- Line: 687 -- upvalues: u381 (val), u431 (ref), u38 (val)
        return u381(u431, u38)
    end, v35)
    v35 = {u82}
    u82 = useMemo(function() -- Line: 691 -- upvalues: u375 (val), u82 (ref)
        return u375(u82, true)
    end, v35)
    v35 = {u82, u38}
    u82 = useMemo(function() -- Line: 694 -- upvalues: u381 (val), u82 (ref), u38 (val)
        return u381(u82, u38, true)
    end, v35)
    v35 = {u143, u38}
    v33 = useMemo(function() -- Line: 698 -- upvalues: u394 (val), u143 (val), u38 (val)
        return u394(u143, u38)
    end, v35)
    local v36 = {u143, u30}
    useEffect(function() -- Line: 702 -- upvalues: u30 (val), u143 (val), u31 (val)
        if u30 and not u143[u30] then
            u31(nil)
        end
    end, v36)
    v36 = {u147, u38, u329, u162}
    v34 = useMemo(function() -- Line: 708 -- upvalues: u329 (val), u147 (val), u38 (val), u162 (val), Enum (upval)
        local v1, v2
        local v3 = {}
        local v4 = false
        for i, j in u329 do
            if j.active and not j.divider then
                v3[j.filterName] = true
                v4 = true
            end
        end
        local v5 = {}
        local v6 = nil
        local v7 = nil
        for k, n in u147, v6, v7 do
            v1 = true
            if u38 ~= "" then
                v1 = string.find(string.lower(k), string.lower(u38))
            end
            if v1 then
                if v4 then
                    v2 = false
                    if v3.Owned and n.Owned then
                        v2 = true
                    end
                    if v3.Equipped and table.find(u162, k) then
                        v2 = true
                    end
                    if n.Rarity and v3[Enum.ConsumableRarity.ToString(n.Rarity)] then
                        v2 = true
                    end
                    if n.Category and v3[Enum.TowerCategory.ToString(n.Category)] then
                        v2 = true
                    end
                    if v2 then
                        v5[k] = n
                    end
                else
                    v5[k] = n
                end
            end
        end
        return v5
    end, v36)
    local v37 = {u130, u38}
    v35 = useMemo(function() -- Line: 763 -- upvalues: u38 (val), u130 (val)
        local title, v1, v2, v3
        if u38 == "" then
            return u130
        end
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in u130.inventory, v5, v6 do
            v1 = {}
            v4[i] = v1
            v2 = nil
            v3 = nil
            for k, n in j, v2, v3 do
                title = n.title or n.Name
                if string.find(string.lower(title), string.lower(u38)) then
                    v1[k] = n
                end
            end
        end
        return {equipped = u130.equipped, inventory = v4}
    end, v37)
    local v38 = {u60, Towers}
    useEffect(function() -- Line: 786 -- upvalues: u60 (val), u369 (upval), Towers (val), u246 (upval), u330 (val)
        local v1 = u60
        if u369[Towers] then
            v1 = u369[Towers]
        end
        if u246[Towers] then
            u330(table.clone(u246[Towers]))
            return
        end
        u330(table.clone(u246[v1]))
    end, v38)
    v38 = {u38}
    useEffect(function() -- Line: 801 -- upvalues: u60 (val), u306 (val), u431 (ref), u47 (val)
        if u60 then
            return
        end
        local v1 = u306[1]
        local towerName = nil
        local v2 = false
        if v1 then
            local v3, v4
            local v5 = nil
            local v6 = nil
            for i, j in u431, v5, v6 do
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
            u47(v1)
            return
        end
        u47(towerName)
    end, v38)
    useViewEvent("Inventory", "Select", function(a1, a2) -- Line: 836 -- upvalues: u51 (val), u61 (val), u31 (val), Towers_2 (val), u47 (val), u43 (val)
        if a1 == "Towers" then
            u51("Default")
            u61(false)
            u31(nil)
            u51(nil)
            Towers_2("Towers")
            u47(a2)
            u43(a2)
        end
    end, {})
    v36 = useCache("Equipped.Loadouts", {}, u18)
    v38, u609 = useState(false)
    local v39, u613 = useState(nil)
    local v40, u617 = useState(nil)
    local u620 = useRef(nil)
    local u623, u624 = useConfetti(u240)
    local u627 = useRef(nil)
    local v41 = {u623, u627}
    useEffect(function() -- Line: 860 -- upvalues: u623 (val), u627 (val)
        if u623.current and u627.current then
            u623.current.Parent = u627.current
            return
        end
    end, v41)
    useEffect(function() -- Line: 868 -- upvalues: Maid (upval), MarketplaceService (upval), u624 (val), u23 (val)
        local u2 = Maid.new()
        u2:Mark((MarketplaceService.PromptProductPurchaseFinished:Connect(function(a1, a2, a3) -- Line: 872 -- upvalues: u624 (upval), u23 (upval)
            if a3 then
                u624()
                u23()
            end
        end)))
        u2:Mark((MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(a1, a2, a3) -- Line: 881 -- upvalues: u624 (upval), u23 (upval)
            if a3 then
                u624()
                u23()
            end
        end)))
        return function() -- Line: 889 -- upvalues: u2 (val)
            u2:Destroy()
        end
    end, {})

    local function handleRestrictedCrateOpening(a1) -- Line: 901
        -- upvalues: Inventory_2 (upval), Notification (upval), ViewController (upval), u239 (upval), u84 (val)
        if a1.Status and a1.Type == "Crate" and a1.Item then
            local Item = a1.Item
            local v1, v2 = Inventory_2:InvokeServer("Open", "Crate", Item)
            if v2 then
                Notification.Error(v2)
                ViewController:setView("Inventory")
                u239 = false
                return
            end
            if v1.resultType == "skins" then
                for i, j in v1.results do
                    u84(v1.resultType, {Name = Item, Troop = j.tower, Skin = j.skin})
                end
            elseif v1.resultType == "consumables" then
                u84(v1.resultType, {Name = Item, Items = v1.results})
            end
            ViewController:setView("Shop")
            u239 = false
            return
        end
    end

    local v42 = {u84}
    local v43 = useCallback(function(a1) -- Line: 939 -- upvalues: handleRestrictedCrateOpening (val) -- types: a1: string
        handleRestrictedCrateOpening({Status = true, Type = "Crate", Item = a1})
    end, v42)
    useViewEvent("Inventory", "OpenRestrictedCrate", v43, {v43})
    local v44 = {v43}
    useEffect(function() -- Line: 951
        -- upvalues: Monetization (upval), arePaidRandomItemsRestricted (upval), handleRestrictedCrateOpening (val)
        return Monetization:onEvent("PurchaseConfirmation", function(a1) -- Line: 952 -- upvalues: arePaidRandomItemsRestricted (upval), handleRestrictedCrateOpening (upval)
            if arePaidRandomItemsRestricted() and a1.Status and a1.Type == "Crate" and a1.Item then
                handleRestrictedCrateOpening(a1)
            end
        end)
    end, v44)
    v44 = {level = u301, gems = v26, coins = v25, goldenTowersEquipped = v5}
    local v45 = {u56}
    v44.cantAfford = useCallback(function() -- Line: 972
        -- upvalues: u56 (val), Enum (upval), Monetization (upval), MarketplaceService (upval), LocalPlayer (upval)
        local v1
        for i, j in u56 do
            if j.Eligible then
                v1 = tonumber(j.Type)
                if v1 ~= Enum.CurrencyType.Robux then
                    v1 = Monetization:invokeServer("GetClosestProductCurrency", j.Type, j.Value)
                    if v1 then
                        MarketplaceService:PromptProductPurchase(LocalPlayer, v1.Id)
                    end
                end
            end
        end
    end, v45)
    v44.promptGift = useCallback(function(a1) -- Line: 986 -- upvalues: ViewController (upval)
        ViewController:setView((("GiftProduct:%*"):format(a1)))
    end)
    v44.openCrate = useCallback(function(a1) -- Line: 990
        -- upvalues: u239 (upval), ViewController (upval), Inventory_2 (upval), Notification (upval), u84 (val)
        if u239 then
            return
        end
        u239 = true
        ViewController:setView("Loading")
        warn("crate", a1)
        local v1, v2 = Inventory_2:InvokeServer("Open", "Crate", a1)
        if v2 then
            Notification.Error(v2)
            ViewController:setView("Inventory")
            u239 = false
            return
        end
        if v1.resultType == "skins" then
            for i, j in v1.results do
                u84(v1.resultType, {Name = a1, Troop = j.tower, Skin = j.skin})
            end
        elseif v1.resultType == "consumables" then
            u84(v1.resultType, {Name = a1, Items = v1.results})
        end
        ViewController:setView("Inventory")
        u239 = false
    end, {})
    v44.popUp = useCallback(function(a1) -- Line: 1028 -- upvalues: u620 (val), u617 (val)
        if a1 then
            u617(a1)
            u620.current = a1
            return
        end
        local current = u620.current
        if current then
            current.visible = false
            u617(table.clone(current))
        end
    end, {})
    v45 = {u46}
    v44.purchasePrompt = useCallback(function(a1) -- Line: 1043
        -- upvalues: u127 (val), Enum (upval), MarketplaceService (upval), LocalPlayer (upval), Icons (upval)
        -- upvalues: Comma (upval), ViewController (upval), Shop (upval), Notification (upval), u23 (val), u624 (val)
        -- upvalues: SpotlightStore (upval), u620 (val), u617 (val)
        local icon, v1, v2
        local selectedItem = a1.selectedItem
        if a1.type == "Tower" or a1.type == "Evolution" then
            v2 = u127[a1.selectedItem]
            selectedItem = v2 and v2.Properties and v2.Properties.DisplayName or a1.selectedItem
        end
        v2 = ("Are you sure you want to purchase \"%*\"?"):format(selectedItem)
        local priceData_2 = {}
        if a1 and a1.priceData then
            for i, j in if a1.priceData[1] == nil or typeof(a1.priceData[1]) ~= "table" then {a1.priceData} else a1.priceData do
                if j.Type == Enum.CurrencyType.Robux then
                    if a1.type == "Tower Skin" then
                        MarketplaceService:PromptProductPurchase(LocalPlayer, j.Id)
                        return
                    end
                    MarketplaceService:PromptGamePassPurchase(LocalPlayer, j.Id)
                    return
                end
            end
        end
        if #priceData_2 == 1 and priceData_2[1].Type == Enum.CurrencyType.Free then
            v2 = ("Are you sure you want to purchase \"%*\" for free?"):format(selectedItem)
        end
        local v3 = {
            [Enum.CurrencyType.Coins] = "PurchaseCoins",
            [Enum.CurrencyType.Gems] = "PurchaseGems",
        }
        local u98 = if #priceData_2 ~= 1 then nil else v3[priceData_2[1].Type]
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for k, n in priceData_2, v5, v6 do
            v1 = {}
            icon = a1.icon or Icons[Enum.CurrencyType.ToString(n.Type)]
            v1.icon = icon
            v1.value = Comma(n.Value)
            table.insert(v4, v1)
        end
        local v7 = a1
        if v7 then
            v7 = {title = "Confirm Purchase?", icon = Icons.Shop, description = v2, items = v4}
            v5 = {}
            v6 = ("%* %*"):format(a1.selectedItem, a1.type)
            v5[v6] = {
                text = "Purchase",
                layoutOrder = 1,
                color = a1.color,
                onClick = function() -- Line: 1108
                    -- upvalues: ViewController (upval), a1 (ref), u127 (upval), Shop (upval), Notification (upval)
                    -- upvalues: selectedItem (ref), u23 (upval), u98 (val), u624 (upval), SpotlightStore (upval)
                    local v1, v2, v3, v4
                    ViewController:setView("Loading")
                    if a1.type ~= "Evolution" then
                        v3, v4 = Shop:InvokeServer("Purchase", a1.type, a1.selectedItem)
                        v1 = v3
                        v2 = v4
                    else
                        v3 = nil
                        v4 = u127
                        local v5 = nil
                        for i, j in v4, v5 do
                            if j.Properties.EvolvedTo == a1.selectedItem then
                                v3 = i
                                break
                            end
                        end
                        if not v3 then
                            v1 = false
                            v2 = "Could not find base tower"
                        else
                            v4, v5 = Shop:InvokeServer("EvolveTower", v3)
                            v1 = v4
                            v2 = v5
                        end
                    end
                    if not v1 then
                        Notification.Error(v2 or ("Failed to purchase %*."):format(selectedItem))
                    end
                    ViewController:setView("Inventory")
                    if v1 then
                        u23(("Purchased %*!"):format(selectedItem), u98)
                        u624()
                    end
                    SpotlightStore.fire("PromptPurchase")
                    a1.cancelPurchase()
                end,
            }
            v6 = ("cancelPrompt %* %*"):format(a1.selectedItem, a1.type)
            v5[v6] = {
                text = "Cancel",
                layoutOrder = 2,
                color = Color3.fromRGB(32, 32, 32),
                onClick = function() -- Line: 1159 -- upvalues: SpotlightStore (upval), a1 (ref)
                    SpotlightStore.fire("CancelPurchase")
                    a1.cancelPurchase()
                end,
            }
            v7.actions = v5
        end
        if a1 then
            u617(v7)
            u620.current = v7
            return
        end
        a1 = u620.current
        a1.visible = false
        u617(table.clone(a1))
    end, v45)
    v44.pvp = u63
    v44.towerInventorySkins = u75
    v44.towersToDisplay = u306
    v44.numLoadoutsCanCreate = v27
    v44.loadoutsVisible = v38
    v44.loadoutsButtonClicked = useCallback(function() -- Line: 1186 -- upvalues: u609 (val)
        u609(true)
    end, {})
    v44.loadouts = v36
    v44.onCloseLoadouts = useCallback(function() -- Line: 1190 -- upvalues: u609 (val)
        u609(false)
    end, {})
    v45 = {u63}
    v44.createLoadout = useCallback(function(a1) -- Line: 1193 -- upvalues: ViewController (upval), Inventory_2 (upval), u63 (val), Notification (upval)
        ViewController:setView("Loading")
        local v1, v2 = Inventory_2:InvokeServer("Loadout", "Create", a1, u63)
        ViewController:setView("Inventory")
        if v1 == false and v2 then
            Notification.Error(v2)
        end
    end, v45)
    v45 = {u63}
    v44.onRenameLoadout = useCallback(function(a1, a2) -- Line: 1202 -- upvalues: ViewController (upval), Inventory_2 (upval), Notification (upval)
        ViewController:setView("Loading")
        local v1, v2 = Inventory_2:InvokeServer("Loadout", "Rename", a1, a2)
        ViewController:setView("Inventory")
        if v1 == false and v2 then
            Notification.Error(v2)
        end
    end, v45)
    v45 = {u63}
    v44.onOverrideLoadout = useCallback(function(a1) -- Line: 1212 -- upvalues: ViewController (upval), Inventory_2 (upval), u63 (val), Notification (upval)
        ViewController:setView("Loading")
        local v1, v2 = Inventory_2:InvokeServer("Loadout", "Update", a1, u63)
        ViewController:setView("Inventory")
        if v1 == false and v2 then
            Notification.Error(v2)
        end
    end, v45)
    v45 = {u315, u63}
    v44.onEquipLoadout = useCallback(function(a1, a2) -- Line: 1222 -- upvalues: Inventory_2 (upval), u63 (val)
        Inventory_2:FireServer("Loadout", "Override", a2, u63)
    end, v45)
    v44.cosmetics = v35
    v44.selectedCosmetic = v8
    v44.selectedCosmeticType = emotes_2
    v44.onSelectCosmetic = useCallback(function(a1, a2) -- Line: 1248 -- upvalues: u134 (val), emotes (val)
        u134(a1)
        emotes(a2)
    end, {})
    v44.onEquipCosmetic = useCallback(function(a1, a2, a3) -- Line: 1252 -- upvalues: ViewController (upval), Inventory_2 (upval)
        local v1 = a2:gsub("s$", "")
        if a3 and v1 == "totem" then
            a1 = "Default"
            a3 = false
        end
        if v1 ~= "emote" and v1 ~= "sticker" then
            Inventory_2:FireServer(if not a3 then "Equip" else "Unequip", v1, a1)
            return
        end
        ;(ViewController:getEmitter("EquipEmote")):Emit("Equip", a1, v1 == "sticker")
    end, {})
    v44.consumables = v34
    v44.equipedConsumables = u162
    v44.selectedConsumable = v13
    v45 = {u162, u171}
    v44.onEquipConsumable = useCallback(function(a1) -- Line: 1276 -- upvalues: SharedGameConstants (upval), u162 (val), u171 (val), Inventory_2 (upval)
        local MAX_CONSUMABLE_SLOTS = SharedGameConstants.MAX_CONSUMABLE_SLOTS
        local v1 = table.clone(u162)
        local v2 = table.find(u162, a1)
        if v2 then
            table.remove(v1, v2)
            u171(v1)
            Inventory_2:FireServer("Unequip", "Consumable", a1)
            return
        end
        while MAX_CONSUMABLE_SLOTS <= #v1 do
            table.remove(v1, 1)
        end
        table.insert(v1, a1)
        u171(v1)
        Inventory_2:FireServer("Equip", "Consumable", a1)
    end, v45)
    v44.onClickConsumable = useCallback(function(a1) -- Line: 1297 -- upvalues: u179 (val), u202 (val)
        u179(a1)
        u202(nil)
    end, {})
    v44.tickets = u219
    v44.selectedTicket = v14
    v44.showSpinTicketOdds = not u208 and u209.ArePaidRandomItemsRestricted == true
    v44.hideHotbar = v14 ~= nil
    v44.onClickTicket = useCallback(function(a1) -- Line: 1307 -- upvalues: u202 (val), u179 (val)
        u202(a1)
        u179(nil)
    end, {})
    v45 = {u219}
    v44.onPurchaseTicket = useCallback(function(a1) -- Line: 1311 -- upvalues: u219 (val), Monetization (upval)
        local v1 = u219[a1]
        if v1 and v1.productId then
            Monetization:fireServer("PromptPurchase", v1.productId)
        end
    end, v45)
    v44.onShowSpinTicketOdds = useCallback(function() -- Line: 1317 -- upvalues: ViewController (upval)
        (ViewController:getEmitter("SpinWheelChances")):Emit("Open", "Inventory")
        ViewController:setView("SpinWheelChances")
    end, {})
    v44.crates = v33
    v44.goToCrateShop = useCallback(function() -- Line: 1323 -- upvalues: ViewController (upval)
        (ViewController:getEmitter("Shop")):Emit("Select", "Crates")
        ViewController:setView("Shop")
    end, {})
    v44.selectedCrate = u30
    v44.showCrateOdds = true
    v44.selectCrate = useCallback(function(a1) -- Line: 1329 -- upvalues: u613 (val), u31 (val)
        u613(nil)
        u31(a1)
    end, {})

    function v44.onClickSpecialMode() -- Line: 1333
        -- upvalues: u301 (val), Notification (upval), ViewController (upval)
        if u301 < 25 then
            Notification.Error("You must be level 25 or higher to access Special Modes.")
            return
        end
        ;(ViewController:getEmitter("MatchmakingPrompt")):Emit("Show", "Special Modes", nil, "Difficulty")
    end

    v44.setSelectedPreviewItem = u613
    v44.selectedPreviewItem = v39
    v44.Visible = u18
    v44.filterList = u329
    v44.selectedTab = Towers
    v44.selectedScrollingFrame = v1
    v44.setSelectedScrollingFrame = u43

    function v44.onTabChange(a1) -- Line: 1350 -- upvalues: u31 (val), u202 (val), Towers_2 (val)
        u31(nil)
        u202(nil)
        Towers_2(a1)
    end

    function v44.onClose() -- Line: 1355
        -- upvalues: ViewController (upval), u61 (val), u39 (val), u31 (val), u51 (val), Towers_2 (val)
        ViewController:setView("Hotbar")
        u61(false)
        u39("")
        u31(nil)
        u51(nil)
        Towers_2("Towers")
    end

    v44.isGolden = v3
    v44.selectedTowerStats = u232
    v44.selectedTower = u46
    v44.selectedSkin = u50
    v44.towers = u431
    v44.towerSkins = u82
    v44.ownedTowers = u119
    v44.equipedTowers = u306
    v44.towerPurchaseData = u56
    v44.loadingTowerPurchaseData = v2
    v44.showResearchButton = u242
    v44.showBuyAllTowerLevelsButton = u268
    v44.buyAllTowerLevelsButtonText = v20
    v45 = {u46, u242}
    v44.onClickResearch = useCallback(function() -- Line: 1376 -- upvalues: u46 (val), u242 (val), ReplicatedStorage (upval)
        if u46 and u242 then
            require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController).openResearch(u46)
            return
        end
    end, v45)
    v45 = {u46, u268}
    v44.onClickBuyAllTowerLevels = useCallback(function() -- Line: 1385 -- upvalues: u46 (val), u268 (val), Shop (upval), Notification (upval)
        if u46 and u268 then
            local v1, v2 = Shop:InvokeServer("PromptBuyAllTowerLevels", u46)
            if not v1 then
                Notification.Error(v2 or "Failed to prompt tower level purchase.")
            end
            return
        end
    end, v45)
    v44.showTowerLevel = u255 ~= nil
    local level = u255 and u255.level
    v44.towerLevel = level
    local exp = u255 and u255.exp
    v44.towerExp = exp
    local maxExp = u255 and u255.maxExp
    v44.towerMaxExp = maxExp
    v44.skinsVisible = u60

    function v44.toggleEquipTowerSkin() -- Line: 1400
        -- upvalues: u46 (val), u50 (val), u69 (val), Unequip (val), Skin (val), u70 (val), Inventory_2 (upval)
        if not u46 or not u50 then
            return
        end
        local v1 = u69[u46]
        if not v1 then
            return
        end
        local v2 = v1.Skin == u50
        local v3 = u50
        if not v2 then
            Skin()
        else
            v3 = "Default"
            Unequip()
        end
        local v4 = table.clone(u69)
        local v5 = table.clone(v1)
        v5.Skin = v3
        v4[u46] = v5
        u70(v4)
        Inventory_2:FireServer("Equip", "Skin", u46, v3)
    end

    function v44.toggleEquipTower() -- Line: 1432
        -- upvalues: u46 (val), u306 (val), Equip (val), Unequip (val), u315 (val), Inventory_2 (upval), u63 (val)
        if not u46 then
            return
        end
        local v1 = table.clone(u306)
        local v2 = table.find(u306, u46)
        if not v2 then
            Unequip()
            table.insert(v1, u46)
        else
            Equip()
            table.remove(v1, v2)
        end
        u315(v1)
        Inventory_2:FireServer(if not v2 then "Equip" else "Unequip", if not u63 then "Tower" else "PVPTower", u46)
    end

    function v44.onClickSkins() -- Line: 1453 -- upvalues: u51 (val), u61 (val), u60 (val)
        u51("Default")
        u61(not u60)
    end

    function v44.onPreviewTowerSkin() -- Line: 1457
        -- upvalues: u46 (val), u50 (val), u82 (ref), ShopFocusStore (upval), ViewController (upval)
        if u46 and u50 then
            local v1 = u82[u50]
            local setShopFocusData = ShopFocusStore.setShopFocusData
            local v2 = {type = "skin", returnView = "Inventory", name = u46, skin = u50}
            v2.displayName = v1 and v1.DisplayName or u50
            v2.rarity = v1 and v1.Rarity
            v2.owned = v1 and v1.Owned
            setShopFocusData(v2)
            ViewController:setView("ShopFocus")
            return
        end
    end

    function v44.clickedSkin(a1) -- Line: 1474 -- upvalues: u51 (val)
        u51(a1)
    end

    v44.getMoreCurrency = useCallback(function(a1) -- Line: 1478 -- upvalues: ShopNavigation (upval), ViewController (upval) -- types: a1: string
        local v1 = ShopNavigation.getCurrencySection(a1)
        if not v1 then
            return
        end
        ;(ViewController:getEmitter("Shop")):Emit("Select", v1)
        ViewController:setView("Shop")
    end, {})
    v44.goldenEquipped = u103
    v45 = {u46, u103, u69}
    v44.onClickGolden = useCallback(function() -- Line: 1490
        -- upvalues: u46 (val), u69 (val), u70 (val), u103 (val), Unequip (val), GoldenPerks (val), Inventory_2 (upval)
        if not u46 then
            return
        end
        local v1 = table.clone(u69)
        v1[u46] = (table.clone(u69[u46]))
        local v2 = v1[u46]
        v2.GoldenPerks = not v1[u46].GoldenPerks
        u70(v1)
        if not u103 then
            GoldenPerks()
        else
            Unequip()
        end
        Inventory_2:FireServer(if not u103 then "Equip" else "Unequip", "Golden", u46)
    end, v45)
    v44.towerInventory = u69

    function v44.clickedTower(a1) -- Line: 1516 -- upvalues: u51 (val), u335 (val), u47 (val)
        u51("Default")
        u335()
        u47(a1)
    end

    function v44.filterItemChanged(a1, a2) -- Line: 1521 -- upvalues: u330 (val)
        u330(function(a1_2) -- Line: 1522 -- upvalues: a1 (val), a2 (val)
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
    end

    function v44.searchQueryChanged(a1) -- Line: 1537 -- upvalues: u39 (val)
        u39(a1)
    end

    v44.selectedInventoryLayout = PvE
    v44.toggleSelectedInventoryLayoutChange = v31
    v41 = createElement(Inventory, v44)
    local screen = a1.screen
    screen.IgnoreGuiInset = true
    screen.ClipToDeviceSafeArea = false
    return (React.createElement(React.Fragment, nil, {
        frameConfetti = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ref = u627}),
        v41,
        prompt = v40 and u18 and createElement(Prompt, v40),
    }))
end

return function(a1) -- Line: 1560 -- upvalues: useViewEnabled (val), createElement (val), InventoryViewBody (val), Sift (val)
    return createElement(InventoryViewBody, Sift.Dictionary.join(a1 or {}, {enabled = useViewEnabled("Inventory")}))
end