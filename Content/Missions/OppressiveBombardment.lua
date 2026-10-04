-- Script path: ReplicatedStorage.Content.Missions.OppressiveBombardment
-- Decompile time: 0.62 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Mortar", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Oppressive Bombardment")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1902866587})).objective({
    id = "objective_1",
    amount = 2000,
    description = "Defeat 2,000 enemies with the Mortar tower",
    type = "kill_enemies_with_tower",
    filter = {tower = "Mortar"},
})).objective({
    id = "objective_2",
    amount = 500,
    description = "Create 500 cluster bombs with Mortar",
    type = "mortar_cluster_bomb",
    filter = {},
})).objective({
    id = "objective_3",
    amount = 400000,
    description = "Deal 400,000 damage with Mortar tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Mortar"},
})).objective(v1).reward(v1).reward(v1)