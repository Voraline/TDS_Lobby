-- Script path: ReplicatedStorage.Shared.Data.Shop.Templates.Default
-- Decompile time: 6.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)

local function makeItem(a1) -- Line: 6 -- types: a1: string
    return {props = {item = {type = a1}}}
end

local function makeItems(a1, a2) -- Line: 16 -- upvalues: makeItem (val) -- types: a1: string, a2: number
    local v1 = {}
    for i = 1, a2 do
        table.insert(v1, (makeItem(a1)))
    end
    return v1
end

local function makeFeaturedSquareItems() -- Line: 26
    local v1 = {}
    for i = 1, 5 do
        table.insert(v1, {
            type = "FeaturedSquare",
            props = {itemTypes = {"skin", "emote", "sticker", "nametag"}, item = {type = "skin"}},
        })
    end
    return v1
end

return {
    {
        title = "Featured",
        icon = 6053791066,
        components = {
            {
                type = "Section",
                props = {
                    itemsPerRow = 2,
                    productSize = Enum.ShopProductSize.Featured_Duo,
                    rowSize = UDim2.fromScale(1, 0.23),
                },
                children = {
                    {
                        type = "FeaturedHero",
                        props = {
                            new = false,
                            description = "",
                            icon = 92926376116191,
                            background = 84049518526175,
                            gamepassId = 25711202,
                            giftId = 2916535764,
                            iconSize = UDim2.fromScale(1.7, 1.7),
                            iconPosition = UDim2.fromScale(0.375, 0.35),
                            backgroundColor = Color3.fromRGB(143, 96, 96),
                            glowColor = Color3.fromRGB(146, 32, 32),
                            item = {type = "tower", name = "Executioner"},
                        },
                    },
                    {
                        type = "FeaturedHero",
                        props = {
                            description = "",
                            new = false,
                            icon = 11877226300,
                            background = 11865720970,
                            gamepassId = 40385775,
                            giftId = 2835822543,
                            iconSize = UDim2.fromScale(1.3, 1.3),
                            iconPosition = UDim2.fromScale(0.35, 0.55),
                            backgroundColor = Color3.fromRGB(167, 125, 177),
                            glowColor = Color3.fromRGB(181, 126, 205),
                            item = {type = "tower", name = "Engineer"},
                        },
                    },
                },
            },
            {type = "Subsection", props = {title = "Daily Items", refreshes = 1440}},
            {
                type = "Section",
                props = {
                    dataName = "Featured Square",
                    refreshes = 1440,
                    productSize = Enum.ShopProductSize.Square,
                    rowSize = UDim2.fromScale(1, 0.175),
                },
                children = makeFeaturedSquareItems(),
            },
        },
    },
    {
        title = "Passes",
        icon = Icons.GamepassesNav,
        components = {
            {
                type = "Section",
                props = {
                    dataName = "Gamepasses",
                    itemsPerRow = 2,
                    productSize = Enum.ShopProductSize.Featured_Duo,
                },
                children = {
                    {
                        props = {
                            name = "V.I.P.",
                            subText = "Gamepass Unlocks...",
                            gamepassId = 10518590,
                            icon = 8763724302,
                            iconSize = UDim2.fromScale(2, 1),
                            iconPosition = UDim2.fromScale(0, 0.7),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "V.I.P. Plus!",
                            subText = "Subscription Unlocks...",
                            subscriptionId = "EXP-5914385580085215338",
                            icon = 131287184459635,
                            iconSize = UDim2.fromScale(1.2, 1),
                            iconPosition = UDim2.fromScale(-0.1, 0.7),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                },
            },
            {
                type = "Section",
                props = {
                    dataName = "Gamepasses",
                    itemsPerRow = 3,
                    collapsedRowLimit = 2,
                    productSize = Enum.ShopProductSize.Featured_Thirds,
                    rowSize = UDim2.fromScale(1, 0.19),
                },
                children = {
                    {
                        props = {
                            name = "Admin Mode",
                            subText = "Gamepass",
                            gamepassId = 1002808617,
                            giftId = 2835822526,
                            ownershipAttribute = "SandboxAccess",
                            icon = 131287184459635,
                            iconSize = UDim2.fromScale(1.75, 1.25),
                            iconPosition = UDim2.fromScale(0.7, 0.65),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Custom Music",
                            subText = "Gamepass",
                            gamepassId = 7104817,
                            icon = 8763723294,
                            iconSize = UDim2.fromScale(1.5, 1),
                            iconPosition = UDim2.fromScale(1.025, 0.55),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Meme Emotes",
                            subText = "Gamepass",
                            gamepassId = 11467931,
                            icon = 8763723780,
                            iconSize = UDim2.fromScale(1.25, 1.25),
                            iconPosition = UDim2.fromScale(0.9, 0.6),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Resize Your Player",
                            subText = "Gamepass",
                            gamepassId = 65949871,
                            icon = 10402583868,
                            iconSize = UDim2.fromScale(1, 1),
                            iconPosition = UDim2.fromScale(0, 0.6),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Vigilante Bundle",
                            subText = "Bundle",
                            gamepassId = 193944933,
                            icon = 13850425697,
                            iconSize = UDim2.fromScale(0.95, 0.95),
                            iconPosition = UDim2.fromScale(0.075, 0.65),
                            iconAnchorPoint = Vector2.new(0, 0.6),
                        },
                    },
                    {
                        props = {
                            name = "Pirate Skin Bundle",
                            subText = "Bundle",
                            gamepassId = 224102025,
                            icon = 14325628886,
                            iconSize = UDim2.fromScale(0.95, 0.95),
                            iconPosition = UDim2.fromScale(0.075, 0.65),
                            iconAnchorPoint = Vector2.new(0, 0.6),
                        },
                    },
                    {
                        props = {
                            name = "Swarmer",
                            subText = "Tower",
                            gamepassId = 8868555,
                            giftId = 3276321010,
                            icon = 84052298973244,
                            ownershipItem = {type = "tower", tower = "Swarmer"},
                            iconSize = UDim2.fromScale(1.2, 1.2),
                            iconPosition = UDim2.fromScale(0.65, 0.6),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Archer",
                            subText = "Tower",
                            gamepassId = 8928263,
                            giftId = 3360883385,
                            icon = 130336326987818,
                            ownershipItem = {type = "tower", tower = "Archer"},
                            iconSize = UDim2.fromScale(1.2, 1.2),
                            iconPosition = UDim2.fromScale(-0.225, 0.5),
                            iconAnchorPoint = Vector2.new(0, 0.4),
                        },
                    },
                    {
                        props = {
                            name = "Gatling Gun",
                            subText = "Tower",
                            gamepassId = 924927232,
                            giftId = 2916539873,
                            icon = 72478710972484,
                            ownershipItem = {type = "tower", tower = "Gatling Gun"},
                            iconSize = UDim2.fromScale(1.1, 1.1),
                            iconPosition = UDim2.fromScale(0.5, 0.6),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Mercenary Base",
                            subText = "Tower",
                            gamepassId = 786591818,
                            giftId = 2916540715,
                            icon = 17207139656,
                            ownershipItem = {type = "tower", tower = "Mercenary Base"},
                            iconSize = UDim2.fromScale(1.2, 1.2),
                            iconPosition = UDim2.fromScale(0, 0.7),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Crook Boss",
                            subText = "Tower",
                            gamepassId = 6757455,
                            giftId = 2916538520,
                            icon = 6781785487,
                            ownershipItem = {type = "tower", tower = "Crook Boss"},
                            iconSize = UDim2.fromScale(1.1, 1.1),
                            iconPosition = UDim2.fromScale(0.1, 0.6),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Turret",
                            subText = "Tower",
                            gamepassId = 6935538,
                            giftId = 2917033180,
                            icon = 95258093050929,
                            ownershipItem = {type = "tower", tower = "Turret"},
                            iconSize = UDim2.fromScale(1.1, 1.1),
                            iconPosition = UDim2.fromScale(0.1, 0.55),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Mortar",
                            subText = "Tower",
                            gamepassId = 7838041,
                            giftId = 2917069686,
                            icon = 6781784058,
                            ownershipItem = {type = "tower", tower = "Mortar"},
                            iconSize = UDim2.fromScale(1, 1),
                            iconPosition = UDim2.fromScale(0.2, 0.5),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Pursuit",
                            subText = "Tower",
                            gamepassId = 9735384,
                            giftId = 2916541947,
                            icon = 110733648372214,
                            ownershipItem = {type = "tower", tower = "Pursuit"},
                            iconSize = UDim2.fromScale(1.1, 1.1),
                            iconPosition = UDim2.fromScale(0.1, 0.55),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Warden",
                            subText = "Tower",
                            gamepassId = 99570026,
                            giftId = 2916539325,
                            icon = 11401184517,
                            ownershipItem = {type = "tower", tower = "Warden"},
                            iconSize = UDim2.fromScale(1.4, 1.4),
                            iconPosition = UDim2.fromScale(0, 0.4),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Cowboy",
                            subText = "Tower",
                            gamepassId = 90119024,
                            giftId = 2917161474,
                            icon = 11840360338,
                            ownershipItem = {type = "tower", tower = "Cowboy"},
                            iconSize = UDim2.fromScale(1.1, 1.1),
                            iconPosition = UDim2.fromScale(0.1, 0.5),
                            iconAnchorPoint = Vector2.new(0, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Engineer",
                            subText = "Tower",
                            gamepassId = 40385775,
                            giftId = 2835822543,
                            icon = 11877226300,
                            ownershipItem = {type = "tower", tower = "Engineer"},
                            iconSize = UDim2.fromScale(1.25, 1.25),
                            iconPosition = UDim2.fromScale(0.65, 0.55),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Biologist",
                            subText = "Tower",
                            gamepassId = 1160816963,
                            giftId = 3266847035,
                            icon = 85195190047860,
                            ownershipItem = {type = "tower", tower = "Biologist"},
                            iconSize = UDim2.fromScale(1.2, 1.2),
                            iconPosition = UDim2.fromScale(0.65, 0.55),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Hacker",
                            subText = "Tower",
                            gamepassId = 1252103819,
                            giftId = 3303921845,
                            icon = 108360622436676,
                            ownershipItem = {type = "tower", tower = "Hacker"},
                            iconSize = UDim2.fromScale(1.15, 1.15),
                            iconPosition = UDim2.fromScale(0.35, 0.6),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Saboteur",
                            subText = "Tower",
                            gamepassId = 1804464267,
                            giftId = 3579057463,
                            icon = 75814933347247,
                            ownershipItem = {type = "tower", tower = "Saboteur"},
                            iconSize = UDim2.fromScale(1.25, 1.25),
                            iconPosition = UDim2.fromScale(0.65, 0.675),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Warlock",
                            subText = "Tower",
                            gamepassId = 1558344290,
                            giftId = 3443635598,
                            icon = 115970405669303,
                            ownershipItem = {type = "tower", tower = "Warlock"},
                            iconSize = UDim2.fromScale(1.35, 1.35),
                            iconPosition = UDim2.fromScale(0.65, 0.55),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                    {
                        props = {
                            name = "Sledger",
                            subText = "Tower",
                            gamepassId = 13534631,
                            giftId = 2835822537,
                            icon = 126582691992445,
                            ownershipItem = {type = "tower", tower = "Sledger"},
                            iconSize = UDim2.fromScale(1.1, 1.1),
                            iconPosition = UDim2.fromScale(0.5, 0.5),
                            iconAnchorPoint = Vector2.new(0.5, 0.5),
                        },
                    },
                },
            },
        },
    },
    {title = "Towers", icon = Icons.TowersInventory, components = makeItems("tower", 100)},
    {
        title = "Skins",
        icon = 126871456310341,
        refreshes = 1440,
        layout = {collapsedRowLimit = 2},
        components = makeItems("skin", 15),
    },
    {
        title = "Crates",
        icon = Icons.Crates,
        layout = {collapsedRowLimit = 2, rowSize = UDim2.fromScale(1, 0.17)},
        components = makeItems("crate", 100),
    },
    {
        title = "Cosmetics",
        refreshes = 1440,
        icon = Icons.Stickers,
        components = {
            {type = "Subsection", props = {title = "Emotes", collapsedRowLimit = 2}},
            {
                type = "Section",
                props = {dataName = "Emotes", collapsedRowLimit = 2},
                children = makeItems("emote", 15),
            },
            {type = "Subsection", props = {title = "Stickers", collapsedRowLimit = 2}},
            {
                type = "Section",
                props = {
                    dataName = "Stickers",
                    collapsedRowLimit = 2,
                    productSize = Enum.ShopProductSize.Square,
                },
                children = makeItems("sticker", 15),
            },
            {type = "Subsection", props = {title = "Tags", collapsedRowLimit = 2}},
            {
                type = "Section",
                props = {
                    dataName = "Tags",
                    collapsedRowLimit = 2,
                    productSize = Enum.ShopProductSize.Square,
                },
                children = makeItems("nametag", 15),
            },
        },
    },
    {
        title = "Currency",
        icon = 72563573733202,
        components = {
            {type = "Subsection", props = {title = "Tickets"}},
            {
                type = "Section",
                props = {
                    dataName = "Tickets",
                    itemsPerRow = 3,
                    productSize = Enum.ShopProductSize.Featured_Thirds,
                },
                children = {
                    {
                        props = {
                            name = "Timescale Tickets",
                            subText = "x3 Tickets",
                            productId = 1826104510,
                            giftId = 3579366800,
                            icon = 17447507910,
                        },
                    },
                    {
                        props = {
                            name = "Spin Tickets",
                            subText = "x3 Tickets",
                            productId = 1872969586,
                            giftId = 3579367223,
                            icon = 18493073533,
                        },
                    },
                    {
                        props = {
                            name = "Revive Tickets",
                            subText = "x3 Tickets",
                            productId = 1823882486,
                            giftId = 3579367062,
                            icon = 18557179994,
                        },
                    },
                },
            },
            {type = "Subsection", props = {title = "Coins"}},
            {
                type = "Section",
                props = {dataName = "Coins", itemsPerRow = 3, rowSize = UDim2.fromScale(1, 0.2)},
                children = {
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Coins",
                            subText = "Coin Stack",
                            productId = 568632682,
                            giftId = 2835813983,
                            icon = 136376921558828,
                            currencyIcon = Icons.Coins,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Coins",
                            subText = "Coin Bundle",
                            productId = 1061465012,
                            giftId = 2835814004,
                            icon = 92864052697497,
                            currencyIcon = Icons.Coins,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Vertical,
                        props = {
                            rewardStat = "Coins",
                            subText = "Deluxe Coins",
                            rowSpan = 2,
                            productId = 3709052780,
                            giftId = 3709055405,
                            icon = 95689462392615,
                            productFlairText = "30% EXTRA",
                            currencyIcon = Icons.Coins,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Coins",
                            subText = "Sack o' Coins",
                            productId = 568632947,
                            giftId = 2835813975,
                            icon = 103242787777931,
                            currencyIcon = Icons.Coins,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Coins",
                            subText = "Mega Coins",
                            productId = 568633322,
                            giftId = 2835813988,
                            icon = 92523260529252,
                            productFlairText = "20% EXTRA",
                            currencyIcon = Icons.Coins,
                        },
                    },
                },
            },
            {type = "Subsection", props = {title = "Gems"}},
            {
                type = "Section",
                props = {dataName = "Gems", itemsPerRow = 3, rowSize = UDim2.fromScale(1, 0.2)},
                children = {
                    {
                        type = Enum.ShopProductSize.Currency_Vertical,
                        props = {
                            rewardStat = "Gems",
                            subText = "Deluxe Gems",
                            rowSpan = 2,
                            productId = 3709055079,
                            giftId = 3709055436,
                            icon = 112885199126586,
                            productFlairText = "30% EXTRA",
                            currencyIcon = Icons.Gems,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Gems",
                            subText = "Gem Pack",
                            productId = 1110608972,
                            giftId = 2835813994,
                            icon = 124345185371849,
                            currencyIcon = Icons.Gems,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Gems",
                            subText = "Gem Bundle",
                            productId = 1110609257,
                            giftId = 2835813979,
                            icon = 133788824035215,
                            currencyIcon = Icons.Gems,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Gems",
                            subText = "Sack o' Gems",
                            productId = 1110609419,
                            giftId = 2835814000,
                            icon = 93587489118635,
                            currencyIcon = Icons.Gems,
                        },
                    },
                    {
                        type = Enum.ShopProductSize.Currency_Horizontal,
                        props = {
                            rewardStat = "Gems",
                            subText = "Mega Gems",
                            productId = 1110609533,
                            giftId = 2835814012,
                            icon = 80750720797102,
                            productFlairText = "20% EXTRA",
                            currencyIcon = Icons.Gems,
                        },
                    },
                },
            },
        },
    },
}