-- Script path: ReplicatedStorage.Content.Missions.KorbloxBeatdown
-- Decompile time: 0.78 ms

local v1 = {id = "tower", skin = "Korblox", tower = "Warden", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Korblox Beatdown")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 3238792676})).objective({
    id = "objective_1",
    amount = 1,
    description = "Triumph in Molten mode on Wrecked Battlefield II with Warden",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Molten", map = "Wrecked Battlefield II", tower = "Warden"},
})).objective({
    id = "objective_2",
    amount = 1,
    description = "Triumph in the Hunt Event with Warden",
    type = "triumph_map_with_tower_on_map",
    filter = {map = "Huevous Hunt V2", tower = "Warden"},
})).objective({
    id = "objective_3",
    amount = 1000,
    description = "Get 1,000 kills with Warden",
    type = "kill_enemies_with_tower",
    filter = {tower = "Warden"},
})).objective({
    id = "objective_4",
    amount = 1,
    description = "Triumph in the Hunt Event with Warden",
    type = "triumph_map_with_tower_on_map",
    filter = {map = "Huevous Hunt V2", tower = "Warden"},
})).objective(v1).reward(v1).reward(v1)