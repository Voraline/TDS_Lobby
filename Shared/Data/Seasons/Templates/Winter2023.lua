-- Script path: ReplicatedStorage.Shared.Data.Seasons.Templates.Winter2023
-- Decompile time: 0.97 ms

local Parent = script.Parent.Parent
local Types = require(Parent.Types)
local Timezone = require(Parent.Timezone)
return Types({
    name = "Krampus' Revenge",
    icon = 15695113608,
    cover = 15695044073,
    home = 0,
    color = Color3.fromRGB(220, 60, 60),
    startsAt = Timezone("EST")(DateTime.fromUniversalTime(2023, 12, 21, 12, 0, 0)),
    endsAt = Timezone("EST")(DateTime.fromUniversalTime(2024, 1, 31)),
    currency = {name = "Cookies", icon = 15642832622},
    tiers = {
        {
            name = "Valhalla Scout",
            product = 1710088687,
            experience = 100,
            rewards = {{type = "skin", tower = "Scout", skin = "Valhalla"}},
        },
        {
            name = "Xmas Lights Tag",
            product = 1710088759,
            experience = 200,
            rewards = {{type = "nametag", name = "XmasLights"}},
        },
        {
            name = "Beast Slayer Soldier",
            product = 1710088816,
            experience = 500,
            rewards = {{type = "skin", tower = "Soldier", skin = "Beast Slayer"}},
        },
        {
            name = "Jolly Crate",
            product = 1710088896,
            experience = 900,
            rewards = {{type = "crate", name = "Jolly", amount = 1}},
        },
        {
            name = "Snowflakes Tag",
            product = 1710088999,
            experience = 1100,
            rewards = {{type = "nametag", name = "Snowflakes"}},
        },
        {
            name = "Dwarf Pyromancer",
            product = 1710089088,
            experience = 1300,
            rewards = {{type = "skin", tower = "Pyromancer", skin = "Dwarf"}},
        },
        {
            name = "Jolly Crate",
            product = 1710089171,
            experience = 1600,
            rewards = {{type = "crate", name = "Jolly", amount = 1}},
        },
        {
            name = "Cryptid Freezer",
            product = 1710089261,
            experience = 2000,
            rewards = {{type = "skin", tower = "Freezer", skin = "Cryptid"}},
        },
        {
            name = "Phantom Crate",
            product = 1710089346,
            experience = 2500,
            rewards = {{type = "crate", name = "Phantom", amount = 1}},
        },
        {
            name = "Defender Mortar",
            product = 1710089521,
            experience = 3000,
            rewards = {{type = "skin", tower = "Mortar", skin = "Defender"}},
        },
        {
            name = "Warlord Minigunner",
            product = 1710089630,
            experience = 3400,
            rewards = {{type = "skin", tower = "Minigunner", skin = "Warlord"}},
        },
        {
            name = "Beast Slayer Ranger",
            product = 1710089709,
            experience = 3800,
            rewards = {{type = "skin", tower = "Ranger", skin = "Beast Slayer"}},
        },
        {
            name = "Phantom Crate",
            product = 1710089772,
            experience = 4100,
            rewards = {{type = "crate", name = "Phantom", amount = 1}},
        },
        {
            name = "Legend Accelerator",
            product = 1710089835,
            experience = 4500,
            rewards = {{type = "skin", tower = "Accelerator", skin = "Legend"}},
        },
        {
            name = "Gift Emote",
            icon = 15690408370,
            product = 1710175560,
            experience = 5000,
            rewards = {{type = "emote", name = "Gift"}},
        },
    },
})