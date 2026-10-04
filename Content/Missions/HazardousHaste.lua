-- Script path: ReplicatedStorage.Content.Missions.HazardousHaste
-- Decompile time: 0.67 ms

local v1 = {id = "tower", skin = "Nuclear", tower = "Accelerator", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Hazardous Haste")).cost({amount = 1000, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1893635956})).objective({
    id = "accelerator_damage",
    amount = 750000,
    description = "Deal 750,000 damage with Accelerator tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Accelerator"},
})).objective({
    id = "accelerator_single_match_damage",
    amount = 75000,
    description = "Deal 75,000 damage with an Accelerator tower in one match",
    resetOnFail = true,
    type = "damage_enemy_from_tower",
    filter = {tower = "Accelerator"},
})).objective({
    id = "hardcore_accelerator",
    amount = 1,
    description = "Triumph Hardcore with Accelerator placed down",
    type = "quest_tower_match_used",
    filter = {difficulty = "Easy", mode = "Hardcore", result = "Triumph", tower = "Accelerator"},
})).objective(v1).reward(v1).reward(v1)