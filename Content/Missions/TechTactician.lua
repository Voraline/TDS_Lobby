-- Script path: ReplicatedStorage.Content.Missions.TechTactician
-- Decompile time: 0.59 ms

local v1 = {id = "tower", skin = "Phantom", tower = "Commander", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Tech Tactician")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true})).objective({
    id = "call_to_arms_uses",
    amount = 40,
    description = "Use Call to Arms 40 times",
    type = "use_tower_ability",
    filter = {ability = "Call Of Arms"},
})).objective({
    id = "fallen_commander_triumphs",
    amount = 4,
    description = "Triumph Fallen Mode 4 times with Commander used",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", tower = "Commander"},
})).objective(v1).reward(v1).reward(v1)