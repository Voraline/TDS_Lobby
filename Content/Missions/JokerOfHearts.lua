-- Script path: ReplicatedStorage.Content.Missions.JokerOfHearts
-- Decompile time: 0.62 ms

local v1 = {id = "tower", skin = "Heartbreak", tower = "Jester", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Joker of Hearts")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 2916488117})).objective({
    id = "objective_1",
    amount = 3000,
    description = "Burn 3000 enemies with Jester",
    type = "burn_enemy",
    filter = {tower = "Jester"},
})).objective({
    id = "objective_2",
    amount = 10000,
    description = "Chill 10000 enemies with Jester",
    type = "frost_enemy",
    filter = {tower = "Jester"},
})).objective({
    id = "objective_3",
    amount = 75000,
    description = "Poison 75000 enemies with Jester",
    type = "posion_enemy",
    filter = {tower = "Jester"},
})).objective(v1).reward(v1).reward(v1)