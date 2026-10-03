-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Stories.ShopRevamp.story
-- Decompile time: 11.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Default = require(ReplicatedStorage.Shared.Data.Shop.Templates.Default)
local Parent = require(script.Parent.Parent)
local ShopSortUtils = require(ReplicatedStorage.Shared.Modules.ShopSortUtils)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local createElement = React.createElement
local useMemo = React.useMemo
local u49 = {300, 500, 750, 1000, 1500, 3000, 5000, 15000, 50000}
local u59 = {
    emote = {300, 500, 650, 750, 800, 1000, 1200, 1250, 1500, 2000, 2500, 5000},
    nametag = {500, 1000, 2000, 5000},
    sticker = {200, 400, 800, 1500},
}
local v1 = {
    coins = {minimum = 300, maximum = 50000},
    gems = {minimum = 100, maximum = 1000},
    robux = {minimum = 50, maximum = 200},
}
local u87 = {crate = v1}
u87.emote = {coins = {minimum = 300, maximum = 5000}}
u87.nametag = {coins = {minimum = 500, maximum = 5000}}
u87.skin = v1
u87.sticker = {coins = {minimum = 200, maximum = 1500}}
u87.tower = v1
local u94 = {}
local v2 = {
    name = "Basic",
    description = "A common skincrate used to unbox very basic skins.",
    icon = "rbxassetid://113280843508206",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Common,
    cost = {value = 500, currency = Enum.CurrencyType.Coins},
}
local v3 = {
    name = "Beach26",
    displayName = "Beach",
    description = "I don't like the sand...",
    icon = "rbxassetid://100652254678254",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Event,
    cost = {value = 4500, currency = Enum.CurrencyType.Coins},
}
local v4 = {
    name = "Christmas 2025",
    description = "Merry Christmas 2025!",
    icon = "rbxassetid://108259951104934",
    category = Enum.CrateCategory.Event,
    cost = {value = 199, id = 3483496487, currency = Enum.CurrencyType.Robux},
}
local v5 = {
    name = "Coin Crate",
    description = "description goes here",
    icon = "rbxassetid://131238075963256",
    category = Enum.CrateCategory.Default,
    cost = {value = 101, id = 3254385585, currency = Enum.CurrencyType.Robux},
}
local v6 = {
    name = "Cold Front",
    description = "Special delivery from the Arctic! (Skins by MidnightKrystal)",
    icon = "rbxassetid://93047047131191",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Rare,
    cost = {value = 3000, currency = Enum.CurrencyType.Coins},
}
local v7 = {
    name = "Deluxe",
    description = "A deluxe skincrate used to unbox the highest quality skins.",
    icon = "rbxassetid://97649681045394",
    category = Enum.CrateCategory.Robux,
    rarity = Enum.Rarity.Legendary,
    cost = {value = 200, id = 1110639180, currency = Enum.CurrencyType.Robux},
}
local v8 = {
    name = "Ducky",
    description = "Quack! Duck skins introduced in the 2022 'Duck Hunting' season.",
    icon = "rbxassetid://131674089256191",
    category = Enum.CrateCategory.Default,
    cost = {value = 3000, currency = Enum.CurrencyType.Coins},
}
local v9 = {
    name = "Golden",
    description = "Special skins for: Minigunner, Cowboy, Crook Boss, Pyro, Scout, Soldier, Demoman.",
    icon = "rbxassetid://120721443149165",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Golden,
    cost = {value = 50000, currency = Enum.CurrencyType.Coins},
}
local v10 = {
    name = "High Grade",
    description = "A high-grade consumable crate, HANDLE WITH CAUTION!",
    icon = "rbxassetid://103153842896752",
    category = Enum.CrateCategory.Consumables,
    cost = {value = 50, id = 1826105274, currency = Enum.CurrencyType.Robux},
}
local v11 = {
    name = "Low Grade",
    description = "A low-grade consumable crate, perfect for restocking your inventory!",
    icon = "rbxassetid://98556517737333",
    category = Enum.CrateCategory.Consumables,
    cost = {value = 300, currency = Enum.CurrencyType.Coins},
}
local v12 = {
    name = "Lunar",
    description = "Lunar New Year Skins!",
    icon = "rbxassetid://116614829554878",
    category = Enum.CrateCategory.Default,
    cost = {value = 5000, currency = Enum.CurrencyType.Coins},
}
local v13 = {
    name = "Mid Grade",
    description = "A mid-grade consumable crate, for those who need a little more punch!",
    icon = "rbxassetid://90205718290985",
    category = Enum.CrateCategory.Consumables,
    cost = {value = 750, currency = Enum.CurrencyType.Coins},
}
local v14 = {
    name = "Patriotic",
    description = "What's a kilometer?",
    icon = "rbxassetid://70986816701531",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Event,
    cost = {value = 4500, currency = Enum.CurrencyType.Coins},
}
local v15 = {
    name = "Phantom",
    description = "The world's deadliest mercenaries are available for hire!.. for a hefty price!",
    icon = "rbxassetid://128403122630957",
    category = Enum.CrateCategory.Robux,
    rarity = Enum.Rarity.Legendary,
    cost = {value = 200, id = 1708992019, currency = Enum.CurrencyType.Robux},
}
local v16 = {
    name = "Pirate",
    description = "🏴‍☠️ Arghhhhhhh! ",
    icon = "rbxassetid://72711417337288",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Rare,
    cost = {value = 3500, currency = Enum.CurrencyType.Coins},
}
local v17 = {
    name = "Premium",
    description = "A premium skincrate used to unbox more complex skins.",
    icon = "rbxassetid://98824537463509",
    category = Enum.CrateCategory.Robux,
    rarity = Enum.Rarity.Uncommon,
    cost = {id = 785567507, currency = Enum.CurrencyType.Robux},
}
u94[1] = v2
u94[2] = v3
u94[3] = v4
u94[4] = v5
u94[5] = v6
u94[6] = v7
u94[7] = v8
u94[8] = v9
u94[9] = v10
u94[10] = v11
u94[11] = v12
u94[12] = v13
u94[13] = v14
u94[14] = v15
u94[15] = v16
u94[16] = v17
v2 = {
    name = "Scuba Ops",
    description = "Dive deep and double check your oxygen levels!",
    icon = "rbxassetid://71674076269696",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Event,
    cost = {value = 4500, currency = Enum.CurrencyType.Coins},
}
v3 = {
    name = "Shamrock",
    description = "Happy St. Patrick's Day! May the luck of the Irish be with you!",
    icon = "rbxassetid://100932242343325",
    category = Enum.CrateCategory.Event,
    cost = {value = 5000, currency = Enum.CurrencyType.Coins},
}
v4 = {
    name = "Showtime",
    description = "It's showtime!",
    icon = "rbxassetid://90341129892212",
    category = Enum.CrateCategory.Default,
    cost = {value = 199, id = 3483496245, currency = Enum.CurrencyType.Robux},
}
v5 = {
    name = "Toy",
    description = "Who knew cheap plastic and toy blasters could be so deadly?",
    icon = "rbxassetid://84261293876259",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Uncommon,
    cost = {value = 850, currency = Enum.CurrencyType.Coins},
}
v6 = {
    name = "UglyCrate",
    description = "april fools!",
    icon = "rbxassetid://89279656352817",
    category = Enum.CrateCategory.Default,
    cost = {value = 1, currency = Enum.CurrencyType.Coins},
}
v7 = {
    name = "Valentines 2026",
    description = "Love to all! <3",
    icon = "rbxassetid://128953224115448",
    category = Enum.CrateCategory.Event,
    cost = {value = 4500, currency = Enum.CurrencyType.Coins},
}
v8 = {
    name = "Vigilante",
    description = "Bring justice to Cyber City!",
    icon = "rbxassetid://71368689473799",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Rare,
    cost = {value = 3500, currency = Enum.CurrencyType.Coins},
}
v9 = {
    name = "Void",
    description = "Event skins for those who live in Hardcore mode. Unbox tactical looks for your roster!",
    icon = "rbxassetid://93473890908656",
    category = Enum.CrateCategory.Default,
    rarity = Enum.Rarity.Rare,
    cost = {value = 1000, currency = Enum.CurrencyType.Gems},
}
u94[17] = v2
u94[18] = v3
u94[19] = v4
u94[20] = v5
u94[21] = v6
u94[22] = v7
u94[23] = v8
u94[24] = v9
local u265 = {
    {tower = "Soldier", skin = "Valentines", rarity = "1", locked = true},
    {tower = "Ace Pilot", skin = "Navy", rarity = "3", locked = true},
    {tower = "Commander", skin = "Maid", rarity = "4"},
    {tower = "Pyromancer", skin = "Hazmat", rarity = "1"},
    {tower = "DJ Booth", skin = "Neon Rave", rarity = "3"},
    {tower = "Demoman", skin = "Fortress", rarity = "2"},
    {tower = "Soldier", skin = "Red", rarity = "1"},
    {tower = "Minigunner", skin = "Trucker", rarity = "4"},
    {tower = "Medic", skin = "Plague Doctor", rarity = "4"},
    {tower = "Engineer", skin = "Heartbreak", rarity = "4"},
    {tower = "Electroshocker", skin = "Hazmat", rarity = "1"},
    {tower = "Militant", skin = "Classic", rarity = "2"},
    {tower = "Farm", skin = "Pumpkin", rarity = "3"},
    {tower = "Freezer", skin = "Mint Choco", rarity = "2"},
    {tower = "Ranger", skin = "Wraith", rarity = "4"},
    {tower = "Crook Boss", skin = "Mafia", rarity = "3"},
    {tower = "Paintballer", skin = "Party", rarity = "1"},
    {tower = "Trapper", skin = "Classic", rarity = "2"},
    {tower = "Accelerator", skin = "Mage", rarity = "4"},
    {tower = "Gatling Gun", skin = "Toy", rarity = "3"},
    {tower = "EvolvedOperator", skin = "Pirate", rarity = "1"},
}
local u287 = {}
v4 = {tower = "Scout", rarity = "1", category = Enum.TowerCategory.Starter}
v5 = {tower = "Sniper", rarity = "1", category = Enum.TowerCategory.Starter}
v6 = {tower = "Demoman", rarity = "1", category = Enum.TowerCategory.Starter}
v7 = {tower = "Soldier", rarity = "1", category = Enum.TowerCategory.Starter}
v8 = {tower = "Paintballer", rarity = "1", category = Enum.TowerCategory.Starter}
v9 = {tower = "Militant", rarity = "2", category = Enum.TowerCategory.Intermediate}
v10 = {tower = "Farm", rarity = "2", category = Enum.TowerCategory.Intermediate}
v11 = {tower = "Freezer", rarity = "2", category = Enum.TowerCategory.Intermediate}
v12 = {tower = "Shotgunner", rarity = "2", category = Enum.TowerCategory.Intermediate}
v13 = {tower = "Pyromancer", rarity = "2", category = Enum.TowerCategory.Intermediate}
v14 = {tower = "Ranger", rarity = "3", category = Enum.TowerCategory.Advanced}
v15 = {tower = "Minigunner", rarity = "3", category = Enum.TowerCategory.Advanced}
v16 = {tower = "Mortar", rarity = "3", category = Enum.TowerCategory.Advanced}
v17 = {tower = "Electroshocker", rarity = "3", category = Enum.TowerCategory.Advanced}
local v18 = {tower = "Commander", rarity = "3", category = Enum.TowerCategory.Advanced}
local v19 = {
    tower = "Saboteur",
    rarity = "4",
    gamepassId = 1804464267,
    locked = true,
    unlockRequirement = "Polluted Wasteland II",
    category = Enum.TowerCategory.Exclusive,
}
u287[1] = v4
u287[2] = v5
u287[3] = v6
u287[4] = v7
u287[5] = v8
u287[6] = v9
u287[7] = v10
u287[8] = v11
u287[9] = v12
u287[10] = v13
u287[11] = v14
u287[12] = v15
u287[13] = v16
u287[14] = v17
u287[15] = v18
u287[16] = v19
local u336 = {
    "Smug",
    "Thriller",
    "Classic Party",
    "Footwork",
    "Hotline",
    "Gang Dance",
    "Beggin",
    "Boston Breakdance",
    "Mannrobics",
    "Garry's Dance",
    "Headless",
    "Kazotsky Kick",
    "Distraction",
    "Spring Time",
    "Russian",
    "Cat Dance",
    "Fresh",
    "Floss",
    "Jig",
    "Victory",
}
local u357 = {
    {name = "Doge Sticker", rarity = "4"},
    {name = "Noob Sticker", rarity = "2"},
    {name = "Sunset Sticker", rarity = "3"},
    {name = "Rich Sticker", rarity = "4"},
    {name = "EvilHacker Sticker", rarity = "3"},
    {name = "Inverted Sticker", rarity = "3"},
    {name = "Orange Sticker", rarity = "1"},
    {name = "Purple Sticker", rarity = "2"},
    {name = "Mirror Sticker", rarity = "2"},
    {name = "SparkleTime Sticker", rarity = "4"},
    {name = "Frost Sticker", rarity = "3"},
    {name = "Fire Sticker", rarity = "3"},
    {name = "Wave Sticker", rarity = "1"},
    {name = "Golden Sticker", rarity = "4"},
    {name = "Pizza Sticker", rarity = "1"},
    {name = "Party Sticker", rarity = "2"},
    {name = "Skull Sticker", rarity = "3"},
    {name = "Smile Sticker", rarity = "1"},
    {name = "Crown Sticker", rarity = "4"},
    {name = "Bolt Sticker", rarity = "2"},
}
local u378 = {
    {name = "Doge", rarity = "4"},
    {name = "Noob", rarity = "2"},
    {name = "Sunset", rarity = "3"},
    {name = "Rich", rarity = "4"},
    {name = "EvilHacker", rarity = "3"},
    {name = "Inverted", rarity = "3"},
    {name = "Orange", rarity = "1"},
    {name = "Purple", rarity = "2"},
    {name = "Mirror", rarity = "2"},
    {name = "SparkleTime", rarity = "4"},
    {name = "Frost", rarity = "3"},
    {name = "Inferno", rarity = "3"},
    {name = "Champion", rarity = "4"},
    {name = "Vintage", rarity = "2"},
    {name = "Arcade", rarity = "1"},
    {name = "Glitched", rarity = "4"},
    {name = "Toxic", rarity = "3"},
    {name = "Royal", rarity = "4"},
    {name = "Mirror II", rarity = "2"},
    {name = "Classic", rarity = "1"},
}
local u399 = {
    [568632682] = 1000,
    [1061465012] = 2500,
    [568632947] = 5000,
    [568633322] = 10000,
    [1110608972] = 100,
    [1110609257] = 500,
    [1110609419] = 1500,
    [1110609533] = 2500,
}
local u416 = {
    ["gamepass:1804464267"] = {forSale = true, price = 499},
    ["product:3483496487"] = {price = 199},
    ["product:3254385585"] = {price = 101},
    ["product:1110639180"] = {price = 200},
    ["product:1826105274"] = {price = 50},
    ["product:1708992019"] = {price = 200},
    ["product:785567507"] = {price = 60},
    ["product:3483496245"] = {price = 199},
}
v9 = {
    Compact = UILabs.Boolean(false),
    CostRangeTreatment = UILabs.Boolean(true),
    PersonalizeItems = UILabs.Boolean(true),
    PlayerPosition = UILabs.Slider(0, 0, 1, 0.05),
}

local function buildShopTemplate() -- Line: 426 -- upvalues: table (val), Default (val), u399 (val)
    local hydrateComponents
    local v1 = table.deepClone(Default)

    function hydrateComponents(a1) -- Line: 429 -- upvalues: u399 (upval), hydrateComponents (val)
        local props
        local v1 = nil
        local v2 = nil
        for i, j in a1 or {}, v1, v2 do
            props = j.props
            if props and props.rewardStat then
                props.rewardAmount = u399[props.productId]
            end
            if j.children then
                hydrateComponents(j.children)
            end
        end
    end

    for i, j in v1 do
        hydrateComponents(j.components)
    end
    return v1
end

local function getStoryCoinCost(a1, a2) -- Line: 449 -- upvalues: u59 (val), u49 (val) -- types: a1: string, a2: number
    local v1 = u59[a1] or u49
    return {currency = "Coins", value = v1[(a2 - 1) % #v1 + 1]}
end

local function addStoryItems(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 457
    -- upvalues: ShopSortUtils (val)
    local v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    local v5 = a8
    for i, j in a3, v3, v4 do
        if v5 and v5 < i then
            break
        end
        v1 = v6(j, i)
        if v7 then
            v1 = ShopSortUtils.personalizeItem(v1, v8, v9)
        end
        table.insert(v2, v1)
    end
    table.sort(v2, ShopSortUtils.compareItems)
    for k, n in v2 do
        v10[("%*_%*"):format(v11, k)] = n
    end
end

local function buildShopItems(a1, a2, a3) -- Line: 486
    -- upvalues: u87 (val), addStoryItems (val), u59 (val), u49 (val), u265 (val), u336 (val), u357 (val), u378 (val)
    -- upvalues: u287 (val), u416 (val), ShopSortUtils (val), u94 (val)
    local v1 = {}
    local u5 = if not a3 then {} else u87
    local v2 = {}
    local v3 = {type = "tower", tower = "Gladiator", rarity = "4"}
    local tower = u59.tower or u49
    v3.cost = {currency = "Coins", value = tower[3 % #tower + 1]}
    v2[1] = v3
    v2[2] = {
        type = "tower",
        tower = "EvolvedEnforcer",
        rarity = "4",
        evolvesFrom = "Shotgunner",
        evolutionLevel = 20,
        cost = {currency = "Coins", value = 15000},
        costs = {{currency = "Coins", value = 15000}, {currency = "Gems", value = 4750}},
    }
    addStoryItems(v1, "featured", v2, function(a1) -- Line: 522
        return table.clone(a1)
    end, a1, a2, u5)
    addStoryItems(v1, "featured_square", {
        {
            type = "skin",
            tower = u265[1].tower,
            skin = u265[1].skin,
            rarity = u265[1].rarity,
            locked = u265[1].locked,
        },
        {type = "emote", rarity = "1", name = u336[1]},
        {type = "sticker", name = u357[1].name, rarity = u357[1].rarity},
        {type = "nametag", name = u378[1].name, rarity = u378[1].rarity},
        {
            type = "skin",
            tower = u265[2].tower,
            skin = u265[2].skin,
            rarity = u265[2].rarity,
            locked = u265[2].locked,
        },
    }, function(a1, a2) -- Line: 544 -- upvalues: u59 (upval), u49 (upval)
        local v1 = table.clone(a1)
        local type = v1.type
        local v2 = a2 * 2 - 1
        local v3 = u59[type] or u49
        v1.cost = {currency = "Coins", value = v3[(v2 - 1) % #v3 + 1]}
        return v1
    end, a1, a2, u5)
    addStoryItems(v1, "towers", u287, function(a1, a2) -- Line: 550 -- upvalues: u59 (upval), u49 (upval), u416 (upval), ShopSortUtils (upval), u5 (val)
        local v1
        local v2 = {
            type = "tower",
            tower = a1.tower,
            category = a1.category,
            rarity = a1.rarity,
        }
        if not a1.gamepassId then
            local tower = u59.tower or u49
            v1 = {currency = "Coins", value = tower[(a2 - 1) % #tower + 1]}
        else
            v1 = nil
        end
        v2.cost = v1
        v2.gamepassId = a1.gamepassId
        v2.locked = a1.locked
        v2.unlockRequirement = a1.unlockRequirement
        if a1.gamepassId then
            v1 = u416[("gamepass:%*"):format(a1.gamepassId)]
            v2.personalizationPosition = ShopSortUtils.getItemPosition({type = "tower", cost = {currency = "Robux", value = v1 and v1.price}}, u5)
        end
        return v2
    end, a1, a2, u5)
    addStoryItems(v1, "skins", u265, function(a1, a2) -- Line: 574 -- upvalues: u59 (upval), u49 (upval)
        local v1 = {type = "skin", tower = a1.tower, skin = a1.skin, rarity = a1.rarity}
        local skin = u59.skin or u49
        v1.cost = {currency = "Coins", value = skin[(a2 - 1) % #skin + 1]}
        v1.locked = a1.locked or false
        return v1
    end, a1, a2, u5, 15)
    addStoryItems(v1, "crates", u94, function(a1) -- Line: 585
        local v1 = table.clone(a1)
        v1.type = "crate"
        return v1
    end, a1, a2, u5)
    addStoryItems(v1, "emotes", u336, function(a1, a2) -- Line: 591 -- upvalues: u59 (upval), u49 (upval)
        local v1 = {type = "emote", rarity = "1", name = a1}
        local emote = u59.emote or u49
        v1.cost = {currency = "Coins", value = emote[(a2 - 1) % #emote + 1]}
        return v1
    end, a1, a2, u5, 15)
    addStoryItems(v1, "stickers", u357, function(a1, a2) -- Line: 600 -- upvalues: u59 (upval), u49 (upval)
        local v1 = {type = "sticker", name = a1.name, rarity = a1.rarity}
        local sticker = u59.sticker or u49
        v1.cost = {currency = "Coins", value = sticker[(a2 - 1) % #sticker + 1]}
        return v1
    end, a1, a2, u5, 15)
    addStoryItems(v1, "tags", u378, function(a1, a2) -- Line: 609 -- upvalues: u59 (upval), u49 (upval)
        local v1 = {type = "nametag", name = a1.name, rarity = a1.rarity}
        local nametag = u59.nametag or u49
        v1.cost = {currency = "Coins", value = nametag[(a2 - 1) % #nametag + 1]}
        return v1
    end, a1, a2, u5, 15)
    return v1
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = v9,
    story = function(a1) -- Line: 621
        -- upvalues: useMemo (val), buildShopTemplate (val), buildShopItems (val), createElement (val), Parent (val)
        -- upvalues: u416 (val)
        local v1 = useMemo(buildShopTemplate, {})
        local v2 = useMemo
        local v3 = {
            a1.controls.CostRangeTreatment,
            a1.controls.PersonalizeItems,
            a1.controls.PlayerPosition,
        }
        v2 = v2(function() -- Line: 623 -- upvalues: buildShopItems (upval), a1 (val)
            return (buildShopItems(a1.controls.PlayerPosition, a1.controls.PersonalizeItems, a1.controls.CostRangeTreatment))
        end, v3)
        return createElement(Parent, {
            compact = a1.controls.Compact,
            onClose = function() end,
            onUnlockRequirementClick = function() end,
            createPurchaseHandler = function() -- Line: 639
                return function() end
            end,
            template = v1,
            items = v2,
            marketplaceData = u416,
            state = {coins = 25000, gems = 1200},
        })
    end,
}