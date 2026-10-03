-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Voidling.Stats
-- Decompile time: 0.23 ms

return {
    DisplayName = "Heavy Voidling",
    Description = "Heavy Voidlings were created by Void Cultists as a means of remedying their pacifism. In their mind, stealing an unsuspecting Swift and cramming them into a suit of armor may have been questionable at best, but it was for protecting those who embraced the Void. The Cultists felt this was entirely reasonable, however the Swift inside the suit felt differently. The Cultists have noted the Swift’s complaints and will take them into careful consideration at the next ceremony. They have not yet held the next ceremony.",
    Scale = 1.65,
    Speed = 6.5,
    MaxHealth = 40000,
    HealthPerDifficulty = {Hard = 40000, Easy = 40000},
    Reward = {Hard = 16000, Easy = 20000},
    Attributes = {},
    LaneSwitch = {Cooldown = 15, Duration = 3, Offset = {Min = -2, Max = 2}},
    Attack = {
        StunTime = 2.5,
        UnitDamage = 150,
        Cooldown = 12,
        InitialCooldown = 10,
        Range = 10,
        Radius = 10,
        Duration = 1.2,
        Windup = 0.75,
        DebuffAmount = 0,
        DebuffDuration = 0,
    },
}