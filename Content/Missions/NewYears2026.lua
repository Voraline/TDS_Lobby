-- Script path: ReplicatedStorage.Content.Missions.NewYears2026
-- Decompile time: 0.95 ms

local v1 = {id = "tower", skin = "2026", tower = "Firework Technician", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Goodbye 2025!")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 3494492837})).objective({
    id = "objective_1",
    amount = 1,
    description = "Triumph a match on Coral Deep on Fallen",
    progressType = "SET_VALUE",
    type = "triumph_map_on_difficulty",
    filter = {difficulty = "Fallen", map = "Coral Deep"},
})).objective({
    id = "objective_2",
    amount = 1,
    description = "Triumph a match on Midnight Issue on Fallen",
    progressType = "SET_VALUE",
    type = "triumph_map_on_difficulty",
    filter = {difficulty = "Fallen", map = "Midnight Issue"},
})).objective({
    id = "objective_3",
    amount = 1,
    description = "Triumph a match on Northern Lights on Frost",
    progressType = "SET_VALUE",
    type = "triumph_map_on_difficulty",
    filter = {difficulty = "Frost", map = "Northern Lights"},
})).objective({id = "objective_4", amount = 1000000, description = "Deal 1,000,000 Damage", type = "damage_enemy"})).objective(v1).reward(v1).reward(v1)