-- Script path: ReplicatedStorage.Content.Missions.PlsDefenseSimulator
-- Decompile time: 0.53 ms

local v1 = {id = "tower", skin = "Booth", tower = "Farm", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Pls Defense Simulator")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 2656976237})).objective({
    id = "fallen_simplicity_farm",
    amount = 2,
    description = "Triumph 2 Fallen matches on Simplicity with a Farm placed down",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Simplicity", tower = "Farm"},
})).objective({
    id = "farm_cash",
    amount = 800000,
    description = "Make 800,000 cash from Farm",
    type = "earn_cash_with_farm",
    filter = {},
})).objective(v1).reward(v1).reward(v1)