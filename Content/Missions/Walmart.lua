-- Script path: ReplicatedStorage.Content.Missions.Walmart
-- Decompile time: 0.59 ms

local v1 = {id = "tower", skin = "Discovered", tower = "Farm", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Place Farm. Live Better")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true})).objective({
    id = "objective_1",
    amount = 400000,
    description = "Make 400,000 cash with Farm",
    type = "earn_cash_with_farm",
    filter = {},
})).objective({
    id = "objective_2",
    amount = 1,
    description = "Triumph on Retro Zone with 6 fully upgraded Farms.",
    type = "quest_tower_match_fully_upgraded",
    filter = {
        level = 5,
        map = "Retro Zone",
        result = "Triumph",
        tower = "Farm",
        towerCount = ">=6",
    },
})).objective(v1).reward(v1).reward(v1)