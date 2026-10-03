-- Script path: ReplicatedStorage.Content.Missions.DotheWave
-- Decompile time: 0.61 ms

local v1 = {id = "tower", skin = "SuperFan", tower = "Militant", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Do The Wave!")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, missionSection = "adidas", productId = 3594835461})).objective({
    id = "objective_1",
    amount = 400000,
    description = "Deal 400,000 Damage with Militant",
    type = "damage_enemy_from_tower",
    filter = {tower = "Militant"},
})).objective({
    id = "objective_2",
    amount = 40000,
    description = "Fire 40,000 rounds with Militant",
    type = "ammo_used",
    filter = {tower = "Militant"},
})).objective(v1).reward(v1).reward(v1)