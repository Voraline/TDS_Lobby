-- Script path: ReplicatedStorage.Content.Missions.TheLittleMedic
-- Decompile time: 0.70 ms

local v1 = {id = "nametag", tag = "Mermaid", type = "nametag"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("The Little Medic")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 3372180525})).objective({
    id = "objective_1",
    amount = 4000,
    description = "Heal 4,000 base health with Medic",
    type = "medic_heal_base_health",
})).objective({
    id = "objective_2",
    amount = 125,
    description = "Cast Medic's Ubercharge Ability 125 Times",
    type = "use_tower_ability",
    filter = {ability = "Ubercharge"},
})).objective({
    id = "objective_3",
    amount = 2,
    description = "Triumph 2 Fallen matches on Abyssal Trench with Medic",
    type = "triumph_map_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", map = "Abyssal Trench", tower = "Medic"},
})).objective(v1).reward(v1).reward(v1).reward(v1)