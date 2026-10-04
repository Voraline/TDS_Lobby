-- Script path: ReplicatedStorage.Content.Missions.EagleScreech
-- Decompile time: 0.87 ms

local v1 = {id = "tower", skin = "Base 1776", tower = "Military Base", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("🦅 Eagle Screech")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 3321973621})).objective({
    id = "objective_1",
    amount = 100,
    description = "Summon 100 Tanks with Military Base",
    type = "spawn_tank_unit",
    filter = {tower = "Military Base"},
})).objective({
    id = "objective_2",
    amount = 1,
    description = "Triumph on Wrecked Battlefield",
    progressType = "SET_VALUE",
    type = "triumph_map",
    filter = {map = "Wrecked Battlefield"},
})).objective({
    id = "objective_3",
    amount = 1,
    description = "Triumph 1 Molten match with Military Base",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Molten", tower = "Military Base"},
})).objective({
    id = "objective_4",
    amount = 1,
    description = "Triumph on Wrecked Battlefield II",
    progressType = "SET_VALUE",
    type = "triumph_map",
    filter = {map = "Wrecked Battlefield II"},
})).objective(v1).reward(v1).reward(v1)