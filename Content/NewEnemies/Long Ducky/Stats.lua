-- Script path: ReplicatedStorage.Content.NewEnemies.Long Ducky.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Description = "Long Ducky uses their long neck to attack and swipe at enemies. Born a little strange, Long Ducky stands out from the flock but was the favorite of Mother Ducky. The other ducks love playing games by climbing up Long Ducky's neck and hanging from their head like a flagpole. When you pull Long Ducky's head back and let it go, it makes a sound just like a sprung doorstop.",
    Speed = 3.25,
    MaxHealth = 1500,
    RewardThreshold = 0.2,
    Defense = 0,
    StunTime = 6,
    UnitDamage = 1500,
    AttackDelay = 8,
    AttackRange = 7.5,
    HealthPerDifficulty = {Hard = 1400, Easy = 700},
    Reward = {Hard = 1400, Easy = 1400},
    Attributes = {(require(ReplicatedStorage.Shared.Modules.Enum)).Modifier.StunImmune},
}