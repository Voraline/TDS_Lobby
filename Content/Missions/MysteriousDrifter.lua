-- Script path: ReplicatedStorage.Content.Missions.MysteriousDrifter
-- Decompile time: 0.54 ms

local v1 = {id = "tower", skin = "Badlands", tower = "Ranger", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("A Mysterious Drifter")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1893636527})).objective({
    id = "objective_1",
    amount = 1000,
    description = "Defeat 1,000 enemies with the Ranger tower",
    type = "kill_enemies_with_tower",
    filter = {tower = "Ranger"},
})).objective({
    id = "objective_2",
    amount = 1000000,
    description = "Deal 1,000,000 damage in the Badlands",
    type = "damage_enemy_on_map",
    filter = {map = "Badlands II"},
})).objective(v1).reward(v1).reward(v1)