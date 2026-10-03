-- Script path: ReplicatedStorage.Content.Missions.LoveLauncher
-- Decompile time: 0.61 ms

local v1 = {id = "tower", skin = "Lovestriker", tower = "Rocketeer", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Love Launcher")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 2916487374})).objective({
    id = "objective_1",
    amount = 600,
    description = "Fire 600 missiles with Rocketeer",
    type = "rocketeer_missile_fired",
    filter = {},
})).objective({
    id = "objective_2",
    amount = 800000,
    description = "Deal 800,000 damage with Rocketeer",
    type = "damage_enemy_from_tower",
    filter = {tower = "Rocketeer"},
})).objective(v1).reward(v1).reward(v1)