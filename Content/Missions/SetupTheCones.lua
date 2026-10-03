-- Script path: ReplicatedStorage.Content.Missions.SetupTheCones
-- Decompile time: 0.62 ms

local v1 = {id = "tower", skin = "Crew", tower = "Trapper", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Setup the Cones!")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, missionSection = "adidas", productId = 3594835623})).objective({
    id = "objective_1",
    amount = 250000,
    description = "Deal 250,000 damage with Trapper",
    type = "damage_enemy_from_tower",
    filter = {tower = "Trapper"},
})).objective({
    id = "objective_2",
    amount = 1000,
    description = "Burn 1000 enemies with Trapper",
    type = "burn_enemy",
    filter = {tower = "Trapper"},
})).objective(v1).reward(v1).reward(v1)