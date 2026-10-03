-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Stories.PreviewInfo.story
-- Decompile time: 6.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local CrateContents = require(script.Parent.Parent.CrateContents)
local CrateData = require(ReplicatedStorage.Shared.Modules.CrateData)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local LevelPreviewNavigation = require(script.Parent.Parent.PreviewInfo.LevelPreviewNavigation)
local PreviewInfo = require(script.Parent.Parent.PreviewInfo)
local RestrictedCrateView = require(script.Parent.Parent.Components.RestrictedCrateView)
local TowerPreviewPanel = require(script.Parent.Parent.TowerPreviewPanel)
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
local useState = React.useState
local u229 = {maxLevel = 6, branchLevel = 4, pathCount = 2}
local u230 = {maxLevel = 0, pathCount = 0}
local u231 = {
    [0] = "Base Level",
    "Hat Trick",
    "Mafia Expansion",
    "High Roller",
    {"LV. 10 Bounty Hunter", "Underworld Backup"},
    {"LV. 50 Flashy Business", "B.P. Operations"},
    {"LV. 999 BOSS", "Golden Syndicate"},
}
local u232 = {{path = 1, title = "LV. 10 Bounty Hunter"}, {path = 2, title = "Underworld Backup"}}
local Consumables = Content("Consumables")
local v1 = {}
local v2 = nil
local v3 = nil
for i, j in CrateData, v2, v3 do
    if j.Contents or j.Consumables then
        table.insert(v1, i)
    end
end
table.sort(v1)
local v4 = {"Tower / Hacker", "Skin / Minigunner / Blue", "Emote / Transcendence"}
for k, n in v1 do
    table.insert(v4, (("Crate / %*"):format(n)))
end
v2 = {
    Item = UILabs.Choose(v4),
    RestrictedRandomItems = UILabs.Boolean(false),
    CombinedPrice = UILabs.Boolean(true),
    GamepassAvailable = UILabs.Boolean(true),
    Locked = UILabs.Boolean(false),
    ShowDescription = UILabs.Boolean(true),
    ZoomInScalar = UILabs.Slider(1, 0, 1, 0.05),
}

local function getSelectedCrateName(a1) -- Line: 114 -- types: a1: string
    if a1:sub(1, 8) ~= "Crate / " then
        return nil
    end
    return a1:sub(9)
end

local function createRestrictedCrateItems(a1) -- Line: 122 -- upvalues: Asset (val), Consumables (val)
    local v1, v2
    local v3 = {}
    if not a1.Consumables then
        local v4, v5, v6
        local Contents = a1.Contents or {}
        local v7 = nil
        v1 = nil
        for i, j in Contents, v7, v1 do
            v2 = nil
            v6 = nil
            for k, n in j, v2, v6 do
                v4 = Asset("Troops", n)
                v5 = v4 and v4.Properties.SkinData[i]
                if v5 then
                    table.insert(v3, {
                        type = "skin",
                        name = i,
                        tower = n,
                        skin = i,
                        rarity = v5.Rarity,
                    })
                end
            end
        end
    else
        local v8
        local Items = a1.Consumables.Items
        if not Items then
            local Rarity_2
            for m, i5 in Consumables:GetChildren() do
                v2 = Asset("Consumables", i5.Name)
                Rarity_2 = v2 and v2.Rarity
                v8 = Rarity_2 and v9.Consumables.Rarities[Rarity_2]
                if v2 and v8 and v8 > 0 then
                    table.insert(v3, {type = "consumable", name = i5.Name, rarity = Rarity_2})
                end
            end
        else
            local Rarity
            v1 = nil
            local v10 = nil
            for i6, i7 in Items, v1, v10 do
                v2 = Asset("Consumables", i7)
                Rarity = v2 and v2.Rarity
                v8 = Rarity and v9.Consumables.Rarities[Rarity]
                if v2 and v8 and v8 > 0 then
                    table.insert(v3, {type = "consumable", name = i7, rarity = Rarity})
                end
            end
        end
    end
    table.sort(v3, function(a1, a2) -- Line: 174
        if a1.name ~= a2.name then
            return a1.name < a2.name
        end
        return (a1.tower or "") < (a2.tower or "")
    end)
    return v3
end

local function createCrateItemData(a1, a2) -- Line: 185 -- upvalues: CrateData (val) -- types: a1: string, a2: boolean
    local v1 = CrateData[a1]
    assert(v1, (("Missing PreviewInfo story crate: %*"):format(a1)))
    local Price = v1.Price
    return {
        type = "crate",
        owned = false,
        name = a1,
        displayName = a1,
        description = if not a2 then nil else v1.Description,
        cost = if not Price then nil else {currency = Price.Type, value = Price.Value, id = Price.Id},
        purchase = function() end,
    }
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = v2,
    story = function(a1) -- Line: 207
        -- upvalues: useState (val), LevelPreviewNavigation (val), React (val), useEffect (val), useMemo (val)
        -- upvalues: CrateData (val), createRestrictedCrateItems (val), createCrateItemData (val), Enum (val)
        -- upvalues: u231 (val), createElement (val), PreviewInfo (val), u229 (val), u232 (val), u230 (val)
        -- upvalues: TowerPreviewPanel (val), CrateContents (val), RestrictedCrateView (val)
        local v1
        local Item = a1.controls.Item
        local u12 = if Item:sub(1, 8) == "Crate / " then Item:sub(9) else nil
        local v2 = Item == "Tower / Hacker"
        local v3 = Item == "Skin / Minigunner / Blue"
        local v4 = v2 or v3
        local u26, u27 = useState(LevelPreviewNavigation.createInitialState)
        local v5, u36 = React.useBinding(a1.controls.ZoomInScalar)
        local v6 = {Item}
        useEffect(function() -- Line: 216 -- upvalues: u27 (val), LevelPreviewNavigation (upval)
            u27(LevelPreviewNavigation.createInitialState())
        end, v6)
        local v7 = useEffect
        v6 = {a1.controls.ZoomInScalar, u36}
        v7(function() -- Line: 220 -- upvalues: u36 (val), a1 (val)
            u36(a1.controls.ZoomInScalar)
        end, v6)
        v7 = useMemo
        v6 = {a1.controls.RestrictedRandomItems, u12}
        v7 = v7(function() -- Line: 224 -- upvalues: u12 (val), a1 (val), CrateData (upval), createRestrictedCrateItems (upval)
            if u12 and a1.controls.RestrictedRandomItems then
                local v1 = CrateData[u12]
                if not v1 then
                    return nil
                end
                return {name = u12, items = createRestrictedCrateItems(v1)}
            end
            return nil
        end, v6)
        local v8 = if u12 then createCrateItemData(u12, a1.controls.ShowDescription) else if Item == "Emote / Transcendence" then {
            type = "emote",
            name = "Transcendence",
            displayName = "Transcendence",
            owned = false,
            description = if not a1.controls.ShowDescription then nil else "Rise above the battlefield with this looping emote.",
            rarity = Enum.Rarity.Exclusive,
            cost = {value = 500, currency = Enum.CurrencyType.Gems},
            purchase = function() end,
        } else if not v3 then {
            type = "tower",
            name = "Hacker",
            displayName = "Hacker",
            lockedMessage = "REACH LEVEL 50 TO UNLOCK TOWER!",
            owned = false,
            description = if not a1.controls.ShowDescription then nil else "Unlock the tower instantly with this gamepass.",
            gamepassId = if not a1.controls.GamepassAvailable then nil else 1252103819,
            rarity = Enum.Rarity.Exclusive,
            cost = {value = 15000, currency = Enum.CurrencyType.Coins},
            costs = if not a1.controls.CombinedPrice then nil else {
                {value = 15000, currency = Enum.CurrencyType.Coins},
                {value = 5500, currency = Enum.CurrencyType.Gems},
            },
            locked = a1.controls.Locked,
            purchase = function() end,
        } else {
            type = "skin",
            name = "Minigunner",
            skin = "Blue",
            displayName = "Blue",
            owned = false,
            cost = {value = 2500, currency = Enum.CurrencyType.Gems},
            purchase = function() end,
        }
        v6 = u231[u26.level]
        if type(v6) == "table" then
            local path = u26.path or u26.lastPath or 1
            v6 = v6[path]
        end
        local v9 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
        local v10 = {}
        local v11 = {
            itemData = v8,
            levelName = v6 or "Base Level",
            onClose = function() end,
            onNextLevel = function() -- Line: 318 -- upvalues: u27 (val), LevelPreviewNavigation (upval), u26 (val), u229 (upval)
                u27(LevelPreviewNavigation.next(u26, u229))
            end,
            onPathSelected = function(a1) -- Line: 321 -- upvalues: u27 (val), LevelPreviewNavigation (upval), u26 (val), u229 (upval)
                u27(LevelPreviewNavigation.selectPath(u26, u229, a1))
            end,
            onPreviousLevel = function() -- Line: 326 -- upvalues: u27 (val), LevelPreviewNavigation (upval), u26 (val), u229 (upval)
                u27(LevelPreviewNavigation.previous(u26, u229))
            end,
            pathOptions = if not v4 then {} else u232,
            previewConfig = if not v4 then u230 else u229,
            previewState = u26,
            purchasePrompt = function() end,
        }
        v10.PreviewInfo = createElement(PreviewInfo, v11)
        if not v4 then
            v1 = nil
        else
            v11 = {level = u26.level}
            local path_2 = u26.path or u26.lastPath
            v11.path = path_2
            v11.skinName = if not v3 then nil else "Blue"
            v11.towerName = if not v3 then "Hacker" else "Minigunner"
            v11.zoomInScalar = v5
            v1 = createElement(TowerPreviewPanel, v11)
        end
        v10.TowerPreviewPanel = v1
        v10.CrateContents = if not u12 then nil else createElement(CrateContents, {crateName = u12})
        v10.RestrictedCrateView = if not v7 then nil else createElement(RestrictedCrateView, {crate = v7})
        return createElement("Frame", v9, v10)
    end,
}