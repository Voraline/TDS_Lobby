-- Script path: ReplicatedStorage.Content.Missions.DarkRadiance
-- Decompile time: 0.80 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Accelerator", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Dark Radiance")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1902865545})).objective({
    id = "accelerator_overcharge",
    amount = 120000,
    description = "Use 120,000 overcharge with Accelerator",
    type = "overcharge_accelerator",
    filter = {},
})).objective({
    id = "accelerator_kills",
    amount = 5000,
    description = "Get 5,000 Kills with Accelerator",
    type = "kill_enemies_with_tower",
    filter = {tower = "Accelerator"},
})).objective({
    id = "fallen_accelerator_triumphs",
    amount = 2,
    description = "Triumph 2 Fallen matches with Accelerator placed down",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", tower = "Accelerator"},
})).objective(v1).reward(v1).reward(v1)