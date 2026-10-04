-- Script path: ReplicatedStorage.Content.Missions.FrozenImpact
-- Decompile time: 0.66 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Sledger", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Frozen Impact")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1912786757})).objective({
    id = "objective_1",
    amount = 1200,
    description = "Freeze 1200 Enemies with Sledger",
    type = "frost_enemy",
    filter = {tower = "Sledger"},
})).objective({
    id = "objective_2",
    amount = 300,
    description = "Hit 3 enemies at once 300 times",
    type = "sledger_multi_hit",
    filter = {hitCount = ">=3"},
})).objective({
    id = "objective_3",
    amount = 400000,
    description = "Deal 400,000 damage with Sledger tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Sledger"},
})).objective(v1).reward(v1).reward(v1)