-- Script path: ReplicatedStorage.Content.Missions.UndeadSolider
-- Decompile time: 0.62 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Militant", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Undead Soldier")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1902866335})).objective({
    id = "objective_1",
    amount = 400000,
    description = "Deal 400,000 Damage with Militant",
    type = "damage_enemy_from_tower",
    filter = {tower = "Militant"},
})).objective({
    id = "objective_2",
    amount = 42000,
    description = "Fire 42,000 rounds with Militant",
    type = "ammo_used",
    filter = {tower = "Militant"},
})).objective(v1).reward(v1).reward(v1)