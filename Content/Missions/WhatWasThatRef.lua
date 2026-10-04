-- Script path: ReplicatedStorage.Content.Missions.WhatWasThatRef
-- Decompile time: 0.56 ms

local v1 = {id = "tower", skin = "Crew", tower = "Assassin", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("What was that Ref?!")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, missionSection = "adidas", productId = 3594835830})).objective({
    id = "objective_1",
    amount = 1250,
    description = "Defeat 1,250 enemies with Assassin",
    type = "kill_enemies_with_tower",
    filter = {tower = "Assassin"},
})).objective({
    id = "objective_2",
    amount = 400000,
    description = "Deal 400,000 damage with Assassin",
    type = "damage_enemy_from_tower",
    filter = {tower = "Assassin"},
})).objective(v1).reward(v1).reward(v1)