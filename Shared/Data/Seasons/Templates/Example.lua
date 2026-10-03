-- Script path: ReplicatedStorage.Shared.Data.Seasons.Templates.Example
-- Decompile time: 0.34 ms

return require(script.Parent.Parent.Types)({
    name = "Season of example",
    icon = 1818,
    startsAt = DateTime.fromUniversalTime(2022, 9, 10),
    endsAt = DateTime.fromUniversalTime(2022, 9, 12),
    tiers = {
        {
            name = "Minigunner Plushie",
            experience = 100,
            rewards = {
                {type = "currency", currency = "gems", amount = 100},
                {type = "skin", tower = "Minigunner", skin = "Plushie"},
            },
        },
    },
    currency = {name = "things", icon = 12345},
})