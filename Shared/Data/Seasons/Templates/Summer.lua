-- Script path: ReplicatedStorage.Shared.Data.Seasons.Templates.Summer
-- Decompile time: 0.55 ms

local Parent = script.Parent.Parent
local Types = require(Parent.Types)
local Timezone = require(Parent.Timezone)
return Types({
    name = "End of Summer",
    icon = 10488005975,
    cover = 9995261127,
    home = 500458286,
    disabled = true,
    startsAt = Timezone("EST")(DateTime.fromUniversalTime(2022, 9, 29)),
    endsAt = Timezone("EST")(DateTime.fromUniversalTime(2022, 10, 7)),
    currency = {name = "Shells", icon = 10480254046},
    tiers = {
        {
            name = "Beach Scout",
            icon = 10488006471,
            product = 1112720371,
            experience = 100,
            rewards = {{type = "skin", tower = "Scout", skin = "Beach"}},
        },
        {
            name = "Beach Militant",
            icon = 10488004920,
            product = 1112720426,
            experience = 200,
            rewards = {{type = "skin", tower = "Militant", skin = "Beach"}},
        },
        {
            name = "BBQ Pyromancer",
            icon = 10488003451,
            product = 1112720501,
            experience = 400,
            rewards = {{type = "skin", tower = "Pyromancer", skin = "Beach"}},
        },
        {
            name = "Beach Minigunner",
            icon = 10488005975,
            product = 1112720708,
            experience = 1000,
            rewards = {{type = "skin", tower = "Minigunner", skin = "Beach"}},
        },
        {
            name = "Lifeguard Commander",
            icon = 10488007217,
            product = 1112720521,
            experience = 2000,
            rewards = {{type = "skin", tower = "Commander", skin = "Lifeguard"}},
        },
    },
})