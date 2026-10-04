-- Script path: ReplicatedStorage.Content.Missions.UnderworldDreg
-- Decompile time: 0.56 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Scout", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("The Underworld Dreg")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1894538651})).objective({
    id = "objective_1",
    amount = 5,
    description = "Triumph any map 5 times with a Scout placed down",
    type = "triumph_map_with_tower",
    filter = {tower = "Scout"},
})).objective({
    id = "objective_2",
    amount = 250000,
    description = "Deal 250,000 Damage with Scout",
    type = "damage_enemy_from_tower",
    filter = {tower = "Scout"},
})).objective(v1).reward(v1).reward(v1)