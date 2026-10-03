-- Script path: ReplicatedStorage.Shared.Data.Seasons.Templates.Halloween2024
-- Decompile time: 4.06 ms

local Parent = script.Parent.Parent
local Types = require(Parent.Types)
local Timezone = require(Parent.Timezone)
return Types({
    name = "Hexscape Event",
    icon = 15187217431,
    cover = 137497743923908,
    home = 0,
    battlepass = 2320022483,
    giftBattlepass = 2320022486,
    color = Color3.fromRGB(220, 60, 60),
    startsAt = Timezone("EST")(DateTime.fromUniversalTime(2024, 10, 23)),
    endsAt = Timezone("EST")(DateTime.fromUniversalTime(2024, 12, 2)),
    currency = {name = "CandyCorn", icon = 87115246230553},
    gameModeRewards = {
        Halloween2024 = {
            default = {maxReward = 500, chance = 0.3},
            difficulty = {
                Act1Easy = {maxReward = 48, chance = 0.3},
                Act1 = {maxReward = 100, chance = 0.3},
                Act2Easy = {maxReward = 110, chance = 0.3},
                Act2 = {maxReward = 250, chance = 0.3},
                Act3Easy = {maxReward = 200, chance = 0.3},
                Act3 = {maxReward = 400, chance = 0.1},
            },
        },
        Survival = {
            default = {maxReward = 40, chance = 0.3},
            difficulties = {
                Easy = {maxReward = 80, chance = 0.3},
                Normal = {maxReward = 160, chance = 0.3},
                Intermediate = {maxReward = 240, chance = 0.3},
                Fallen = {maxReward = 480, chance = 0.3},
            },
        },
        Hardcore = {default = {maxReward = 700, chance = 0.3}},
        PlsDonate = {
            default = {maxReward = 125, chance = 0.3},
            difficulties = {
                PlsDonate = {maxReward = 80, chance = 0.3},
                PlsDonateHard = {maxReward = 125, chance = 0.3},
            },
        },
    },
    tiers = {
        {
            name = "Rank 1",
            icon = 5870325711,
            product = 2320017747,
            experience = 30,
            rewards = {
                {type = "emote", name = "Scarecrow", premium = true},
                {type = "consumable", name = "Pumpkin Bomb", amount = 5},
            },
        },
        {
            name = "Rank 2",
            icon = 5870325711,
            product = 2320017750,
            experience = 80,
            rewards = {
                {type = "nametag", name = "GreenMist", premium = true},
                {type = "consumable", name = "Turkey Leg", amount = 5},
            },
        },
        {
            name = "Rank 3",
            icon = 5870325711,
            product = 2320017758,
            experience = 150,
            rewards = {
                {type = "consumable", name = "Pumpkin Bomb", amount = 8, premium = true},
                {type = "stat", stat = "Experience", amount = 50},
            },
        },
        {
            name = "Rank 4",
            icon = 5870325711,
            product = 2320017768,
            experience = 250,
            rewards = {
                {type = "sticker", name = "Angry Pumpkin", premium = true},
                {type = "stat", stat = "Coins", amount = 100},
            },
        },
        {
            name = "Rank 5",
            icon = 5870325711,
            product = 2320017770,
            experience = 370,
            rewards = {
                {type = "emote", name = "Quota Craze", premium = true},
                {type = "consumable", name = "Supply Drop", amount = 3},
            },
        },
        {
            name = "Rank 6",
            icon = 5870325711,
            product = 2320017773,
            experience = 520,
            rewards = {
                {type = "nametag", name = "DarkMist", premium = true},
                {type = "skin", tower = "Scout", skin = "King of Rock"},
            },
        },
        {
            name = "Rank 7",
            icon = 5870325711,
            product = 2320017777,
            experience = 700,
            rewards = {
                {type = "consumable", name = "Turkey Leg", amount = 8, premium = true},
                {type = "stat", stat = "TimescaleTickets", amount = 1},
            },
        },
        {
            name = "Rank 8",
            icon = 5870325711,
            product = 2320017780,
            experience = 910,
            rewards = {
                {type = "stat", stat = "TimescaleTickets", amount = 3, premium = true},
                {type = "stat", stat = "SpinTickets", amount = 1},
            },
        },
        {
            name = "Rank 9",
            icon = 5870325711,
            product = 2320017782,
            experience = 1150,
            rewards = {
                {type = "sticker", name = "Narrator", premium = true},
                {type = "stat", stat = "Experience", amount = 75},
            },
        },
        {
            name = "Rank 10",
            icon = 5870325711,
            product = 2320017784,
            experience = 1430,
            rewards = {
                {type = "crate", name = "High Grade", amount = 3, premium = true},
                {type = "stat", stat = "Coins", amount = 150},
            },
        },
        {
            name = "Rank 11",
            icon = 5870325711,
            product = 2320017785,
            experience = 1740,
            rewards = {
                {type = "nametag", name = "Curse", premium = true},
                {type = "consumable", name = "Napalm Strike", amount = 3},
            },
        },
        {
            name = "Rank 12",
            icon = 5870325711,
            product = 2320017787,
            experience = 2080,
            rewards = {
                {type = "consumable", name = "Sugar Rush", amount = 8, premium = true},
                {type = "skin", tower = "Soldier", skin = "Aerobics"},
            },
        },
        {
            name = "Rank 13",
            icon = 5870325711,
            product = 2320017788,
            experience = 2460,
            rewards = {
                {type = "sticker", name = "Umbra Laugh", premium = true},
                {type = "consumable", name = "Pumpkin Bomb", amount = 8},
            },
        },
        {
            name = "Rank 14",
            icon = 5870325711,
            product = 2320017789,
            experience = 2870,
            rewards = {
                {type = "consumable", name = "Blizzard Bomb", amount = 3, premium = true},
                {type = "nametag", name = "Bewitched"},
            },
        },
        {
            name = "Rank 15",
            icon = 5870325711,
            product = 2320017796,
            experience = 3320,
            rewards = {
                {type = "consumable", name = "Nuke", amount = 2, premium = true},
                {type = "stat", stat = "Experience", amount = 100},
            },
        },
        {
            name = "Rank 16",
            icon = 5870325711,
            product = 2320017798,
            experience = 3800,
            rewards = {
                {type = "stat", stat = "SpinTickets", amount = 3, premium = true},
                {type = "stat", stat = "Coins", amount = 200},
            },
        },
        {
            name = "Rank 17",
            icon = 5870325711,
            product = 2320017802,
            experience = 4320,
            rewards = {
                {type = "consumable", name = "Pumpkin Bomb", amount = 12, premium = true},
                {type = "consumable", name = "Cooldown Flag", amount = 3},
            },
        },
        {
            name = "Rank 18",
            icon = 5870325711,
            product = 2320017811,
            experience = 4870,
            rewards = {
                {type = "nametag", name = "Autumn", premium = true},
                {type = "skin", tower = "Shotgunner", skin = "Dance Fever"},
            },
        },
        {
            name = "Rank 19",
            icon = 5870325711,
            product = 2320017814,
            experience = 5460,
            rewards = {
                {type = "skin", tower = "Ranger", skin = "Frankenstein", premium = true},
                {type = "consumable", name = "Sugar Rush", amount = 8},
            },
        },
        {
            name = "Rank 20",
            icon = 5870325711,
            product = 2320017819,
            experience = 6090,
            rewards = {
                {type = "emote", name = "Scary Coffin", premium = true},
                {type = "stat", stat = "Experience", amount = 125},
            },
        },
        {
            name = "Rank 21",
            icon = 5870325711,
            product = 2320017824,
            experience = 6760,
            rewards = {
                {type = "consumable", name = "Turkey Leg", amount = 12, premium = true},
                {type = "stat", stat = "Coins", amount = 250},
            },
        },
        {
            name = "Rank 22",
            icon = 5870325711,
            product = 2320017825,
            experience = 7470,
            rewards = {
                {type = "stat", stat = "SpinTickets", amount = 3, premium = true},
                {type = "nametag", name = "Conserver"},
            },
        },
        {
            name = "Rank 23",
            icon = 5870325711,
            product = 2320017835,
            experience = 8210,
            rewards = {
                {type = "nametag", name = "The32", premium = true},
                {type = "skin", tower = "Militant", skin = "Wasteland"},
            },
        },
        {
            name = "Rank 24",
            icon = 5870325711,
            product = 2320017838,
            experience = 8990,
            rewards = {
                {type = "skin", tower = "Military Base", skin = "Wasteland", premium = true},
                {type = "stat", stat = "SpinTickets", amount = 3},
            },
        },
        {
            name = "Rank 25",
            icon = 5870325711,
            product = 2320017839,
            experience = 9810,
            rewards = {{type = "emote", name = "Moon Walk", premium = true}, {type = "emote", name = "The Worm"}},
        },
        {
            name = "Rank 26",
            icon = 5870325711,
            product = 2320017842,
            experience = 10670,
            rewards = {
                {type = "consumable", name = "Sugar Rush", amount = 12, premium = true},
                {type = "stat", stat = "Experience", amount = 150},
            },
        },
        {
            name = "Rank 27",
            icon = 5870325711,
            product = 2320017851,
            experience = 11570,
            rewards = {
                {type = "crate", name = "Premium", premium = true},
                {type = "stat", stat = "Coins", amount = 300},
            },
        },
        {
            name = "Rank 28",
            icon = 5870325711,
            product = 2320017854,
            experience = 12510,
            rewards = {
                {type = "skin", tower = "Minigunner", skin = "Road Rage", premium = true},
                {type = "consumable", name = "Damage Flag", amount = 3},
            },
        },
        {
            name = "Rank 29",
            icon = 5870325711,
            product = 2320017859,
            experience = 13490,
            rewards = {
                {type = "consumable", name = "Nuke", amount = 4, premium = true},
                {type = "skin", tower = "Commander", skin = "Wasteland"},
            },
        },
        {
            name = "Rank 30",
            icon = 5870325711,
            product = 2320017862,
            experience = 14510,
            rewards = {
                {type = "nametag", name = "CandyCorn", premium = true},
                {type = "stat", stat = "TimescaleTickets", amount = 3},
            },
        },
        {
            name = "Rank 31",
            icon = 5870325711,
            product = 2320017871,
            experience = 15580,
            rewards = {
                {type = "crate", name = "High Grade", amount = 3, premium = true},
                {type = "stat", stat = "Experience", amount = 175},
            },
        },
        {
            name = "Rank 32",
            icon = 5870325711,
            product = 2320017872,
            experience = 16690,
            rewards = {
                {type = "sticker", name = "The32", premium = true},
                {type = "stat", stat = "Coins", amount = 350},
            },
        },
        {
            name = "Rank 33",
            icon = 5870325711,
            product = 2320017882,
            experience = 17840,
            rewards = {
                {type = "emote", name = "Take The L", premium = true},
                {type = "nametag", name = "SugarRush"},
            },
        },
        {
            name = "Rank 34",
            icon = 5870325711,
            product = 2320017886,
            experience = 19030,
            rewards = {
                {type = "nametag", name = "Harrowing", premium = true},
                {type = "skin", tower = "Warden", skin = "Freddy"},
            },
        },
        {
            name = "Rank 35",
            icon = 5870325711,
            product = 2320017887,
            experience = 20260,
            rewards = {
                {type = "skin", tower = "Farm", skin = "Wasteland", premium = true},
                {type = "stat", stat = "SpinTickets", amount = 3},
            },
        },
        {
            name = "Rank 36",
            icon = 5870325711,
            product = 2320017893,
            experience = 21540,
            rewards = {
                {type = "stat", stat = "SpinTickets", amount = 5, premium = true},
                {type = "stat", stat = "Experience", amount = 200},
            },
        },
        {
            name = "Rank 37",
            icon = 5870325711,
            product = 2320017897,
            experience = 22860,
            rewards = {
                {type = "emote", name = "Bumper Cart", premium = true},
                {type = "stat", stat = "Coins", amount = 400},
            },
        },
        {
            name = "Rank 38",
            icon = 5870325711,
            product = 2320017902,
            experience = 24220,
            rewards = {
                {type = "sticker", name = "MJ Hehe", premium = true},
                {type = "emote", name = "Broomstick"},
            },
        },
        {
            name = "Rank 39",
            icon = 5870325711,
            product = 2320017906,
            experience = 25630,
            rewards = {
                {type = "crate", name = "High Grade", amount = 5, premium = true},
                {type = "consumable", name = "Nuke", amount = 2},
            },
        },
        {
            name = "Rank 40",
            icon = 5870325711,
            product = 2320017907,
            experience = 27080,
            rewards = {
                {type = "skin", tower = "DJ Booth", skin = "Garage Band", premium = true},
                {type = "skin", tower = "Accelerator", skin = "Disco"},
            },
        },
    },
})