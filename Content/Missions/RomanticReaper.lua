-- Script path: ReplicatedStorage.Content.Missions.RomanticReaper
-- Decompile time: 0.71 ms

local v1 = {id = "tower", skin = "Heartbreak", tower = "Executioner", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Romantic Reaper")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 2916486889})).objective({
    id = "objective_1",
    amount = 750000,
    description = "Deal 750,000 Damage with Executioner",
    type = "damage_enemy_from_tower",
    filter = {tower = "Executioner"},
})).objective({
    id = "objective_2",
    amount = 1,
    description = "Triumph 1 match of Badlands II with Executioner",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Badlands", map = "Badlands II", tower = "Executioner"},
})).objective({
    id = "objective_3",
    amount = 2000,
    description = "Get 2,000 kills with Executioner",
    type = "kill_enemies_with_tower",
    filter = {tower = "Executioner"},
})).objective(v1).reward(v1).reward(v1)