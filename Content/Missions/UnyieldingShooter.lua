-- Script path: ReplicatedStorage.Content.Missions.UnyieldingShooter
-- Decompile time: 0.58 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Minigunner", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Unyielding Shooter")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1894538249})).objective({
    id = "objective_1",
    amount = 2,
    description = "Triumph Fallen mode 2 times with Minigunner tower placed down",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", tower = "Minigunner"},
})).objective({
    id = "objective_2",
    amount = 800000,
    description = "Deal 800,000 Damage with Minigunner tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Minigunner"},
})).objective(v1).reward(v1).reward(v1)