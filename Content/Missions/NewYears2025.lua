-- Script path: ReplicatedStorage.Content.Missions.NewYears2025
-- Decompile time: 0.70 ms

local v1 = {id = "tower", tower = "Firework Technician", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Happy New Years!")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 2677030196})).objective({
    id = "objective_1",
    amount = 2,
    description = "Triumph 2 matches of Intermediate",
    type = "triumph_gamemode_by_difficulty",
    filter = {difficulty = "Intermediate"},
})).objective({id = "objective_2", amount = 500000, description = "Deal 500,000 Damage", type = "damage_enemy"})).objective({
    id = "objective_3",
    amount = 2,
    description = "Triumph 2 matches of Molten",
    type = "triumph_gamemode_by_difficulty",
    filter = {difficulty = "Molten"},
})).objective({id = "objective_4", amount = 1000000, description = "Deal 1,000,000 Damage", type = "damage_enemy"})).objective(v1).reward(v1).reward(v1)