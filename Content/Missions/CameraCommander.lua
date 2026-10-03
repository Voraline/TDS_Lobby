-- Script path: ReplicatedStorage.Content.Missions.CameraCommander
-- Decompile time: 0.60 ms

local v1 = {id = "tower", skin = "Cybernetic", tower = "Crook Boss", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("You're Being Recorded")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1893635204})).objective({
    id = "objective_1",
    amount = 150000,
    description = "Deal 150,000 damage with the Crook Boss tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Crook Boss"},
})).objective({
    id = "objective_2",
    amount = 5,
    description = "Triumph any map 5 times with a Crook Boss placed down",
    type = "triumph_map_with_tower",
    filter = {tower = "Crook Boss"},
})).objective(v1).reward(v1).reward(v1)