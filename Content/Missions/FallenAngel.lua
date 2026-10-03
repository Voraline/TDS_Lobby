-- Script path: ReplicatedStorage.Content.Missions.FallenAngel
-- Decompile time: 0.64 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Medic", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Fallen Angel")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1914326855})).objective({
    id = "objective_1",
    amount = 100,
    description = "Cast Ubercharge 100 Times",
    type = "use_tower_ability",
    filter = {ability = "Ubercharge"},
})).objective({
    id = "objective_2",
    amount = 3,
    description = "Triumph 3 maps with 4 Level 5 Medics (Fully upgraded Medics)",
    type = "triumph_with_level_tower",
    filter = {amount = ">=4", level = 5, tower = "Medic"},
})).objective(v1).reward(v1).reward(v1)