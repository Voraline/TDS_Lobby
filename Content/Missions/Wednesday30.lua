-- Script path: ReplicatedStorage.Content.Missions.Wednesday30
-- Decompile time: 0.80 ms

local v1 = {id = "tower", skin = "Jason", tower = "Slasher", type = "tower"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Wednesday the 30th")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 2567509563})).objective({
    id = "bleed_stacks",
    amount = 2000,
    description = "Apply 2,000 stacks of bleed",
    type = "bleed_stack",
    filter = {tower = "Slasher"},
})).objective({
    id = "slasher_kills",
    amount = 1000,
    description = "Get 1,000 Kills with Slasher",
    type = "kill_enemies_with_tower",
    filter = {tower = "Slasher"},
})).objective({
    id = "fallen_level_4_slashers",
    amount = 1,
    description = "Complete a Fallen match with 8 Level 4 Slasher Towers",
    type = "quest_tower_match_fully_upgraded",
    filter = {
        difficulty = "Fallen",
        level = 4,
        result = "Triumph",
        tower = "Slasher",
        towerCount = ">=8",
    },
})).objective({
    id = "slasher_damage",
    amount = 300000,
    description = "Deal 300,000 Damage with Slasher",
    type = "damage_enemy_from_tower",
    filter = {tower = "Slasher"},
})).objective(v1).reward(v1).reward(v1)