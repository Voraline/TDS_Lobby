-- Script path: ReplicatedStorage.Content.Missions.TDSCommandos
-- Decompile time: 0.85 ms

local v1 = {id = "tower", skin = "Trooper", tower = "Commando", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("T.D.S. Commandos")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 2660658950})).objective({
    id = "objective_1",
    amount = 800000,
    description = "Deal 800,000 damage with Commando",
    type = "damage_enemy_from_tower",
    filter = {tower = "Commando"},
})).objective({
    id = "objective_2",
    amount = 500,
    description = "Cast 500 missiles from Commando",
    type = "cast_missile_from_tower",
    filter = {tower = "Commando"},
})).objective({
    id = "objective_3",
    amount = 2,
    description = "Triumph 2 Fallen Matches on Cyber City with Commando placed down.",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Cyber City", tower = "Commando"},
})).objective(v1).reward(v1).reward(v1)