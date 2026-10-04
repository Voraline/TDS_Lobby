-- Script path: ReplicatedStorage.Content.Missions.ColdTyrant
-- Decompile time: 0.49 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Commander", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("A Cold Tyrant")).cost({amount = 525, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1912786548})).objective({
    id = "support_caravan_uses",
    amount = 30,
    description = "Cast Support Caravan 30 times",
    type = "use_tower_ability",
    filter = {ability = "Support Caravan"},
})).objective({
    id = "fallen_commander_triumphs",
    amount = 3,
    description = "Triumph 3 Fallen matches with Commander placed down.",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", tower = "Commander"},
})).objective(v1).reward(v1).reward(v1)