-- Script path: ReplicatedStorage.Content.Missions.DarkHarvest
-- Decompile time: 0.76 ms

local v1 = {id = "tower", skin = "Wasteland", tower = "Harvester", type = "tower"}
return ((((((((require((game:GetService("ReplicatedStorage")).Shared.Tome)).create()).name("Dark Harvest")).cost({amount = 825, currency = "coins"})).withMetadata({expirationPolicy = "REMOVE", disabled = true, productId = 2567515198})).objective({
    id = "thorns_uses",
    amount = 120,
    description = "Use Thorns 120 times",
    type = "use_tower_ability",
    filter = {ability = "Thorns"},
})).objective({
    id = "harvester_kills",
    amount = 800,
    description = "Get 800 Kills with Harvester",
    type = "kill_enemies_with_tower",
    filter = {tower = "Harvester"},
})).objective({
    id = "harvester_damage",
    amount = 40000,
    description = "Deal 40,000 Damage with Harvester",
    type = "damage_enemy_from_tower",
    filter = {tower = "Harvester"},
})).objective(v1).reward(v1).reward(v1)