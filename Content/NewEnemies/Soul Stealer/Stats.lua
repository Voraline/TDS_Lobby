-- Script path: ReplicatedStorage.Content.NewEnemies.Soul Stealer.Stats
-- Decompile time: 0.33 ms

return {
    Description = "The Soul Stealer is one of the highest ranking in the Void Army, and is considered by Void Caster to be invaluable. She created the Soul Stealer to manage the growth of her army, and will only send it out when she feels victory could be achieved. They manage the souls who roam the Void, as well as claim them from whatever realms their rifts begin to tear into. They lack personality and are more like a drone who serves a specific task and does so without fanfare. It is considered ‘lame’, but it does not seem to care.",
    Scale = 2.4,
    Speed = 1.65,
    MaxHealth = 200000,
    RewardThreshold = 0.25,
    CloakTime = 12,
    AttackCooldown = 1,
    AwardBadgeOnDeath = {id = 3436460691164478, modes = {mode = "Hardcore", difficulty = "Hard"}},
    HealthPerDifficulty = {Hard = 375000, Easy = 160000},
    Reward = {Hard = 100000, Easy = 100000},
    Moveset = {
        CurseTower = {
            Range = 50,
            Cooldown = 9,
            MaxTowersDisabled = 20,
            SpawnPools = {{{enemy = "Soul", amount = 1}}},
            Modifiers = {},
        },
        Summon = {
            Cooldown = 30,
            SpawnPools = {{{enemy = "Void Eye", amount = 1}, {enemy = "Soul", amount = 3}}},
            Modifiers = {{Chance = 100}},
        },
    },
}