-- Script path: ReplicatedStorage.Shared.Data.Seasons.Templates.Halloween2023
-- Decompile time: 1.10 ms

local Parent = script.Parent.Parent
local Types = require(Parent.Types)
local Timezone = require(Parent.Timezone)
return Types({
    name = "Lunar Overture",
    icon = 15187217431,
    cover = 15187179194,
    home = 0,
    color = Color3.fromRGB(220, 60, 60),
    startsAt = Timezone("EST")(DateTime.fromUniversalTime(2023, 10, 25)),
    endsAt = Timezone("EST")(DateTime.fromUniversalTime(2023, 12, 20)),
    nextPartAt = Timezone("EST")(DateTime.fromUniversalTime(2023, 10, 31, 17, 0, 0)),
    currency = {name = "Pumpkins", icon = 1042505821},
    tiers = {
        {
            name = "250 Coins",
            icon = 5870325711,
            product = 1676739367,
            experience = 100,
            rewards = {{type = "stat", stat = "Coins", amount = 250}},
        },
        {
            name = "Masquerade Scout",
            product = 1676739499,
            experience = 200,
            rewards = {{type = "skin", tower = "Scout", skin = "Masquerade"}},
        },
        {
            name = "Davinchi Sniper",
            product = 1676739683,
            experience = 500,
            rewards = {{type = "skin", tower = "Sniper", skin = "Davinchi"}},
        },
        {
            name = "Premium Crate",
            product = 1676739784,
            experience = 900,
            rewards = {{type = "crate", name = "Premium", amount = 1}},
        },
        {
            name = "Davinchi Militant",
            product = 1676739976,
            experience = 1100,
            rewards = {{type = "skin", tower = "Militant", skin = "Davinchi"}},
        },
        {
            name = "Spooky Dance",
            icon = 15185655854,
            product = 1676740163,
            experience = 1300,
            rewards = {{type = "emote", name = "Spooky"}},
        },
        {
            name = "Masquerade Cowboy",
            product = 1676740350,
            experience = 1600,
            rewards = {{type = "skin", tower = "Cowboy", skin = "Masquerade"}},
        },
        {
            name = "Popcorn Emote",
            icon = 15187800572,
            product = 1347858629,
            experience = 2000,
            rewards = {{type = "emote", name = "Popcorn"}},
        },
        {
            name = "Frankenstein Electroshocker",
            product = 1676740555,
            experience = 2500,
            coming = true,
            rewards = {{type = "skin", tower = "Electroshocker", skin = "Frankenstein"}},
        },
        {
            name = "Masquerade Warden",
            product = 1676740660,
            experience = 3000,
            coming = true,
            rewards = {{type = "skin", tower = "Warden", skin = "Masquerade"}},
        },
        {
            name = "Crossbow Turret",
            product = 1676740780,
            experience = 3400,
            coming = true,
            rewards = {{type = "skin", tower = "Turret", skin = "Crossbow"}},
        },
        {
            name = "Masquerade Medic",
            product = 1676740877,
            experience = 3800,
            coming = true,
            rewards = {{type = "skin", tower = "Medic", skin = "Masquerade"}},
        },
        {
            name = "Binary Nametag",
            product = 1676741010,
            experience = 4100,
            coming = true,
            rewards = {{type = "nametag", name = "Binary"}},
        },
        {
            name = "Grave Digger Engineer",
            product = 1676741206,
            experience = 4500,
            coming = true,
            rewards = {{type = "skin", tower = "Engineer", skin = "Grave Digger"}},
        },
        {
            name = "The Z Step",
            icon = 15185655720,
            product = 1676741324,
            experience = 4800,
            coming = true,
            rewards = {{type = "emote", name = "The Z Step"}},
        },
        {
            name = "Masquerade DJ",
            product = 1676741500,
            experience = 5200,
            coming = true,
            rewards = {{type = "skin", tower = "DJ Booth", skin = "Masquerade"}},
        },
    },
})