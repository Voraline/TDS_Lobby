-- Script path: ReplicatedStorage.Content.Missions.EnemyOfRedcliff
-- Decompile time: 0.86 ms

local v1 = {id = "tower", skin = "Korblox", tower = "Electroshocker", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Enemy of Redcliff")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 3236702677})).objective({
    id = "objective_1",
    amount = 2500,
    description = "Stun 2500 enemies with Electroshocker",
    type = "shock_enemy",
    filter = {tower = "Electroshocker"},
})).objective({
    id = "objective_2",
    amount = 1,
    description = "Triumph in the Hunt Event with Electroshocker",
    type = "triumph_map_with_tower_on_map",
    filter = {map = "Huevous Hunt V2", tower = "Electroshocker"},
})).objective({
    id = "objective_3",
    amount = 600000,
    description = "Deal 600,000 damage with Electroshocker",
    type = "damage_enemy_from_tower",
    filter = {tower = "Electroshocker"},
})).objective({
    id = "objective_4",
    amount = 1,
    description = "Triumph in a game of Fallen with 4 level 5 Electroshockers",
    type = "triumph_with_level_tower_on_difficulty",
    filter = {amount = ">=4", difficulty = "Fallen", level = 5, tower = "Electroshocker"},
})).objective(v1).reward(v1).reward(v1)