-- Script path: ReplicatedStorage.Content.Missions.CondemnedVigilante
-- Decompile time: 0.95 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Cowboy", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Condemned Vigilante")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1902866143})).objective({
    id = "objective_1",
    amount = 60000,
    description = "With Cowboy Collect 60,000 Cash",
    type = "earn_cash_with_cowboy",
    filter = {},
})).objective({
    id = "objective_2",
    amount = 250000,
    description = "Deal 250,000 Damage with Cowboy",
    type = "damage_enemy_from_tower",
    filter = {tower = "Cowboy"},
})).objective({
    id = "objective_3",
    amount = 1,
    description = "Triumph Badlands with Cowboy placed on the map",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Badlands", map = "Badlands II", tower = "Cowboy"},
})).objective(v1).reward(v1).reward(v1)