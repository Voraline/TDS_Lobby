-- Script path: ReplicatedStorage.Content.Missions.DuckyWentGeorgia
-- Decompile time: 0.86 ms

local v1 = {id = "nametag", tag = "DuckyBath", type = "nametag"}
return (((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("The Ducky went down to Georgia")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 3272686149})).objective({
    id = "objective_1",
    amount = 75000,
    description = "Generate 75,000 Cash with DJ's Ability",
    type = "dj_cash_income",
    filter = {},
})).objective({
    id = "objective_2",
    amount = 60000,
    description = "Deal 60,000 damage with DJ Booth",
    type = "dj_deal_damage",
    filter = {},
})).objective({
    id = "objective_3",
    amount = 1,
    description = "Finish a match with 15 Towers in the DJ Booth's range",
    type = "triumph_with_dj_with_towers_in_range",
    filter = {count = ">=15"},
})).objective({
    id = "objective_4",
    amount = 2,
    description = "Triumph in 2 Fallen matches with DJ Booth",
    type = "triumph_with_tower_on_difficulty",
    filter = {difficulty = "Fallen", tower = "DJ Booth"},
})).objective(v1).reward(v1).reward(v1).reward(v1)