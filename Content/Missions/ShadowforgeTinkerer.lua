-- Script path: ReplicatedStorage.Content.Missions.ShadowforgeTinkerer
-- Decompile time: 0.62 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Engineer", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Shadowforge Tinkerer")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1912786319})).objective({
    id = "engineer_sentries",
    amount = 250,
    description = "Create 250 Turrets with Engineer",
    type = "spawn_engineer_sentry",
    filter = {},
})).objective({
    id = "engineer_damage",
    amount = 750000,
    description = "Deal 750,000 damage with Engineer tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Engineer"},
})).objective({
    id = "fallen_rocket_arena_engineer",
    amount = 2,
    description = "Triumph 2 Fallen matches on the map Rocket Arena with Engineer placed down",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Rocket Arena", tower = "Engineer"},
})).objective(v1).reward(v1).reward(v1)