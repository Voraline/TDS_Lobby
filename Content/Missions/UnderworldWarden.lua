-- Script path: ReplicatedStorage.Content.Missions.UnderworldWarden
-- Decompile time: 0.65 ms

local v1 = {id = "tower", skin = "Fallen", tower = "Warden", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Underworld Warden")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1912786443})).objective({
    id = "objective_1",
    amount = 150,
    description = "Defeat 150 hidden enemies with Warden",
    type = "kill_enemy_with_hidden",
    filter = {tower = "Warden"},
})).objective({
    id = "objective_2",
    amount = 1200,
    description = "Stun enemies 1200 times using Warden",
    type = "shock_enemy",
    filter = {tower = "Warden"},
})).objective({
    id = "objective_3",
    amount = 2,
    description = "Complete Pizza Party with Warden placed down 2 times",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "PizzaParty", map = "Pizza Party", tower = "Warden"},
})).objective(v1).reward(v1).reward(v1)