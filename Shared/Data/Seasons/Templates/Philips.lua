-- Script path: ReplicatedStorage.Shared.Data.Seasons.Templates.Philips
-- Decompile time: 0.87 ms

local Parent = script.Parent.Parent
local Types = require(Parent.Types)
local Timezone = require(Parent.Timezone)
return Types({
    name = "Philips x TDS",
    icon = 11102072158,
    cover = 11125940374,
    home = 0,
    color = Color3.fromRGB(0, 159, 238),
    startsAt = Timezone("EST")(DateTime.fromUniversalTime(2022, 10, 13)),
    endsAt = Timezone("EST")(DateTime.fromUniversalTime(2022, 12, 1)),
    nextPartAt = Timezone("EST")(DateTime.fromUniversalTime(2022, 11, 10)),
    currency = {name = "Razors", icon = 11116765422},
    tiers = {
        {
            name = "Intern Scout",
            icon = 11102071590,
            product = 1320221258,
            experience = 150,
            rewards = {{type = "skin", tower = "Scout", skin = "Intern"}},
        },
        {
            name = "Grand Theft Soldier",
            icon = 11102072158,
            product = 1320221325,
            experience = 300,
            rewards = {{type = "skin", tower = "Soldier", skin = "Grand Theft"}},
        },
        {
            name = "Lumberjack Militant",
            icon = 11102072779,
            product = 1320221371,
            experience = 500,
            rewards = {{type = "skin", tower = "Militant", skin = "Lumberjack"}},
        },
        {
            name = "Agent Cowboy",
            icon = 11102073276,
            product = 1320221409,
            experience = 800,
            rewards = {{type = "skin", tower = "Cowboy", skin = "Agent"}},
        },
        {
            name = "Dallas Mustache",
            icon = 11507036032,
            product = 1335766056,
            experience = 1000,
            coming = true,
            rewards = {{type = "badge", badgeId = 2129294958}},
        },
        {
            name = "Baseball Warden",
            icon = 11522554434,
            product = 1335766198,
            experience = 1250,
            coming = true,
            rewards = {{type = "skin", tower = "Warden", skin = "Baseball"}},
        },
        {
            name = "Mage Pyro",
            icon = 11522553915,
            product = 1335766288,
            experience = 1600,
            coming = true,
            rewards = {{type = "skin", tower = "Pyromancer", skin = "Mage"}},
        },
        {
            name = "Crypto Farm",
            icon = 11522553185,
            product = 1335766359,
            experience = 2200,
            coming = true,
            rewards = {{type = "skin", tower = "Farm", skin = "Crypto"}},
        },
        {
            name = "Mechanic Engineer",
            icon = 11522552635,
            product = 1335766469,
            experience = 3000,
            coming = true,
            rewards = {{type = "skin", tower = "Engineer", skin = "Mechanic"}},
        },
    },
})