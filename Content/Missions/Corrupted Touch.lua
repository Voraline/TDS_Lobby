-- Script path: ReplicatedStorage.Content.Missions.Corrupted Touch
-- Decompile time: 1.13 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Hacker", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Corrupted Touch")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 3303907205})).objective({
    id = "hacker_damage",
    amount = 400000,
    description = "Deal 400,000 damage with Hacker",
    type = "damage_enemy_from_tower",
    filter = {tower = "Hacker"},
})).objective({
    id = "hacker_units",
    amount = 500,
    description = "Create 500 units with Hacker",
    type = "create_hacked_enemies_with_tower",
    filter = {tower = "Hacker"},
})).objective({
    id = "fallen_cyber_city_hacker",
    amount = 1,
    description = "Triumph Fallen mode with Hacker on Cyber City",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Cyber City", tower = "Hacker"},
})).objective({
    id = "hacker_single_match_damage",
    amount = 80000,
    description = "Deal 80,000 damage with a Hacker Tower in one match",
    resetOnFail = true,
    type = "largest_single_damage_enemy_using_tower",
    filter = {tower = "Hacker"},
})).objective(v1).reward(v1).reward(v1).reward(v1)