-- Script path: ReplicatedStorage.Content.Missions.ForbiddenMagic
-- Decompile time: 0.63 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Necromancer", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Forbidden Magic")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1912786652})).objective({
    id = "objective_1",
    amount = 750,
    description = "Defeat 750 enemies with the Necromancer tower",
    type = "kill_enemies_with_tower",
    filter = {tower = "Necromancer"},
})).objective({
    id = "objective_2",
    amount = 2,
    description = "Triumph Fallen mode in Necropolis 2 times with Necromancer placed down",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Necropolis", tower = "Necromancer"},
})).objective(v1).reward(v1).reward(v1)