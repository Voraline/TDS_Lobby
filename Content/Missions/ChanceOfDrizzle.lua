-- Script path: ReplicatedStorage.Content.Missions.ChanceOfDrizzle
-- Decompile time: 0.62 ms

local v1 = {id = "tower", skin = "Railgunner", tower = "Ranger", type = "tower"}
return (((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Chance of Drizzle")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "RETAIN", permanent = true, productId = 1893635430})).objective({
    id = "ranger_damage",
    amount = 250000,
    description = "Deal 250,000 damage with Ranger tower",
    type = "damage_enemy_from_tower",
    filter = {tower = "Ranger"},
})).objective({
    id = "ranger_cash_from_kills",
    amount = 50000,
    description = "Earn 50,000 cash getting kills with the Ranger",
    type = "earn_cash_with_kills_from_tower",
    filter = {tower = "Ranger"},
})).objective(v1).reward(v1).reward(v1)