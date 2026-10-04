-- Script path: ReplicatedStorage.Content.Missions.BackFromSlaying
-- Decompile time: 0.54 ms

local v1 = {id = "tower", skin = "Slayer", tower = "Shotgunner", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Back From Infernal")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1893634677})).objective({
    id = "objective_1",
    amount = 100000,
    description = "Deal 100,000 Damage with Shotgunner tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Shotgunner"},
})).objective({
    id = "objective_2",
    amount = 3,
    description = "Defeat Molten Warlord 3 times with Shotgunner tower used",
    type = "kill_enemies_with_tower_and_enemy",
    filter = {enemy = "Molten Warlord", tower = "Shotgunner"},
})).objective(v1).reward(v1).reward(v1)