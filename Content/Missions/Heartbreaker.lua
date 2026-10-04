-- Script path: ReplicatedStorage.Content.Missions.Heartbreaker
-- Decompile time: 0.54 ms

local v1 = {id = "tower", skin = "Lovestriker", tower = "Brawler", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Heartbreaker")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 2916488682})).objective({
    id = "objective_1",
    amount = 1000,
    description = "Get 1,000 kills with Brawler",
    type = "kill_enemies_with_tower",
    filter = {tower = "Brawler"},
})).objective({
    id = "objective_2",
    amount = 2,
    description = "Triumph 2 matches with 10 Brawlers placed down",
    type = "triumph_any_map_with_tower_with_count",
    filter = {amount = 10, tower = "Brawler"},
})).objective(v1).reward(v1).reward(v1)