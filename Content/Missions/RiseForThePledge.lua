-- Script path: ReplicatedStorage.Content.Missions.RiseForThePledge
-- Decompile time: 0.76 ms

local v1 = {id = "tower", tower = "Firework Technician", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("🇺🇸 Rise for the Pledge!")).cost({amount = 650, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", disabled = true, productId = 3321971891})).objective({
    id = "objective_1",
    amount = 2,
    description = "Triumph 2 Matches on Forest Camp",
    order = 1,
    type = "triumph_map",
    filter = {map = "Forest Camp"},
})).objective({
    id = "objective_2",
    amount = 2,
    description = "Triumph 2 Matches on Tropical Isles",
    order = 2,
    type = "triumph_map",
    filter = {map = "Tropical Isles"},
})).objective({
    id = "objective_3",
    amount = 2,
    description = "Triumph 2 Matches on Moon Base",
    order = 3,
    type = "triumph_map",
    filter = {map = "Moon Base"},
})).objective(v1).objective(v1).reward(v1).reward(v1)