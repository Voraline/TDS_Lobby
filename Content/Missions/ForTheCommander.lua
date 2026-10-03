-- Script path: ReplicatedStorage.Content.Missions.ForTheCommander
-- Decompile time: 0.80 ms

local v1 = {id = "tower", skin = "Star Spartan", tower = "Militant", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("For the Commander!")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1930402700})).objective({
    id = "militant_kills",
    amount = 2500,
    description = "Get 2,500 Kills with Militant",
    type = "kill_enemies_with_tower",
    filter = {tower = "Militant"},
})).objective({
    id = "militant_damage",
    amount = 400000,
    description = "Deal 400,000 Damage with Militant",
    type = "damage_enemy_from_tower",
    filter = {tower = "Militant"},
})).objective({
    id = "fallen_militant_triumphs",
    amount = 2,
    description = "Triumph 2 Fallen matches with Militant placed down",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", tower = "Militant"},
})).objective({
    id = "militant_ammo",
    amount = 40000,
    description = "Fire 40,000 rounds with Militant",
    type = "ammo_used",
    filter = {tower = "Militant"},
})).objective(v1).reward(v1).reward(v1)