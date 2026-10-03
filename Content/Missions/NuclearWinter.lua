-- Script path: ReplicatedStorage.Content.Missions.NuclearWinter
-- Decompile time: 0.83 ms

local v1 = {id = "tower", skin = "Frost", tower = "Mortar", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Nuclear Winter")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 2677029710})).objective({
    id = "objective_1",
    amount = 500000,
    description = "Deal 500,000 damage with Mortar tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Mortar"},
})).objective({
    id = "objective_2",
    amount = 60000,
    description = "Deal 60,000 damage with a Mortar Tower in one match",
    resetOnFail = true,
    type = "largest_single_damage_enemy_using_tower",
    filter = {tower = "Mortar"},
})).objective({
    id = "objective_3",
    amount = 750,
    description = "Create 750 cluster bombs with Mortar",
    type = "mortar_cluster_bomb",
    filter = {},
})).objective(v1).reward(v1).reward(v1)