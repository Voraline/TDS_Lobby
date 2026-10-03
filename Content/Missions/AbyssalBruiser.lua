-- Script path: ReplicatedStorage.Content.Missions.AbyssalBruiser
-- Decompile time: 0.76 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Brawler", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Abyssal Bruiser")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1902865759})).objective({
    id = "brawler_knockbacks",
    amount = 400,
    description = "Knockback Enemies 400 Times with Brawler",
    type = "knockback_enemy",
    filter = {tower = "Brawler"},
})).objective({
    id = "frost_brawler_triumphs",
    amount = 3,
    description = "Triumph 3 Frost matches with 10 Brawlers placed down",
    type = "quest_tower_match_used",
    filter = {difficulty = "Frost", result = "Triumph", tower = "Brawler", towerCount = ">=10"},
})).objective({
    id = "fallen_winter_abyss_brawler",
    amount = 2,
    description = "Triumph 2 Fallen matches on the map Winter Abyss with Brawler placed down",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Winter Abyss", tower = "Brawler"},
})).objective(v1).reward(v1).reward(v1)