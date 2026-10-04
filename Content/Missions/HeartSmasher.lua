-- Script path: ReplicatedStorage.Content.Missions.HeartSmasher
-- Decompile time: 0.66 ms

local v1 = {id = "tower", skin = "Chocolatier", tower = "Sledger", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Heart Smasher")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 2916488480})).objective({
    id = "objective_1",
    amount = 500000,
    description = "Deal 500,000 damage with Sledger",
    type = "damage_enemy_from_tower",
    filter = {tower = "Sledger"},
})).objective({
    id = "objective_2",
    amount = 2,
    description = "Triumph 2 Molten matches with Sledger place down",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Molten", tower = "Sledger"},
})).objective({
    id = "objective_3",
    amount = 2,
    description = "Triumph 2 matches with 6 level 5 Sledgers placed down",
    type = "triumph_with_level_tower",
    filter = {amount = ">=6", level = 5, tower = "Sledger"},
})).objective(v1).reward(v1).reward(v1)