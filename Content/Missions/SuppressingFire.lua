-- Script path: ReplicatedStorage.Content.Missions.SuppressingFire
-- Decompile time: 0.62 ms

local v1 = {id = "tower", skin = "Phantom", tower = "Minigunner", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Suppressing Fire")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true})).objective({
    id = "objective_1",
    amount = 200000,
    description = "Deal 200,000 damage with the Minigunner tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Minigunner"},
})).objective({
    id = "objective_2",
    amount = 2000,
    description = "Defeat 2,000 enemies with the Minigunner tower",
    type = "kill_enemies_with_tower",
    filter = {tower = "Minigunner"},
})).objective(v1).reward(v1).reward(v1)