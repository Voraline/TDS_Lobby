-- Script path: ReplicatedStorage.Content.Missions.RaftWars
-- Decompile time: 0.74 ms

local v1 = {id = "nametag", tag = "Bubbles", type = "nametag"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Raft Wars")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 3372181604})).objective({
    id = "objective_1",
    amount = 1,
    description = "Triumph a Fallen match on Tropical Isles with a Turret placed down.",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Tropical Isles", tower = "Turret"},
})).objective({
    id = "objective_2",
    amount = 1,
    description = "Triumph on any map with 3 fully upgraded Turrets",
    type = "triumph_with_level_tower",
    filter = {amount = 3, level = 5, tower = "Turret"},
})).objective({
    id = "objective_3",
    amount = 800000,
    description = "Deal 800,000 damage with Turret",
    type = "damage_enemy_from_tower",
    filter = {tower = "Turret"},
})).objective({
    id = "objective_4",
    amount = 1,
    description = "Triumph a Fallen match on Lighthaos with a Turret placed down.",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Lighthaos", tower = "Turret"},
})).objective(v1).reward(v1).reward(v1).reward(v1)