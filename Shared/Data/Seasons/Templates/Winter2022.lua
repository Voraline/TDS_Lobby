-- Script path: ReplicatedStorage.Shared.Data.Seasons.Templates.Winter2022
-- Decompile time: 0.70 ms

local Parent = script.Parent.Parent
local Types = require(Parent.Types)
local Timezone = require(Parent.Timezone)
return Types({
    name = "Violent Night",
    icon = 11840361682,
    cover = 11840360804,
    home = 0,
    color = Color3.fromRGB(220, 60, 60),
    startsAt = Timezone("EST")(DateTime.fromUniversalTime(2022, 10, 13)),
    endsAt = Timezone("EST")(DateTime.fromUniversalTime(2023, 1, 15)),
    currency = {name = "Candy Canes", icon = 11859133258},
    tiers = {
        {
            name = "Holiday Scout",
            icon = 11840362292,
            product = 1347858032,
            experience = 150,
            rewards = {{type = "skin", tower = "Scout", skin = "Holiday"}},
        },
        {
            name = "Holiday Soldier",
            icon = 11840362543,
            product = 1347858152,
            experience = 300,
            rewards = {{type = "skin", tower = "Soldier", skin = "Holiday"}},
        },
        {
            name = "Holiday Shotgunner",
            icon = 11860207716,
            product = 1347858252,
            experience = 500,
            rewards = {{type = "skin", tower = "Shotgunner", skin = "Holiday"}},
        },
        {
            name = "Holiday Crook Boss",
            icon = 11840361997,
            product = 1347858358,
            experience = 900,
            rewards = {{type = "skin", tower = "Crook Boss", skin = "Holiday"}},
        },
        {
            name = "Holiday Cowboy",
            icon = 11865349684,
            product = 1347858462,
            experience = 1100,
            rewards = {{type = "skin", tower = "Cowboy", skin = "Holiday"}},
        },
        {
            name = "Holiday Minigunner",
            icon = 11860207394,
            product = 1347858629,
            experience = 1500,
            rewards = {{type = "skin", tower = "Minigunner", skin = "Holiday"}},
        },
        {
            name = "Holiday Commander",
            icon = 11840361682,
            product = 1347858742,
            experience = 2000,
            rewards = {{type = "skin", tower = "Commander", skin = "Holiday"}},
        },
        {
            name = "Holiday Engineer",
            icon = 11865348913,
            product = 1347858820,
            experience = 2500,
            rewards = {{type = "skin", tower = "Engineer", skin = "Holiday"}},
        },
    },
})