-- Script path: ReplicatedStorage.Content.NewEnemies.Voidling.Stats
-- Decompile time: 0.20 ms

return {
    Description = "Voidlings are the army’s standard issue. They are an Odd crammed into a set of armor and set loose into the world. When possible, they will throw themselves across the field and continue their path towards the enemy without any regard to their safety. They simply go where they are told and will do everything they can to get there.",
    Scale = 1.35,
    Speed = 6,
    MaxHealth = 300,
    LaneSwitch = {
        Gravity = -1,
        Velocity = 3.5,
        DtMultiplier = 5.2,
        Delay = 0.15,
        Cooldown = NumberRange.new(8, 12),
        Offset = NumberRange.new(-2, 2),
    },
    HealthPerDifficulty = {Hard = 2800, Easy = 2500, NilZone2 = 3000},
    Reward = {Hard = 750, Easy = 1000, NilZone2 = 1000},
}