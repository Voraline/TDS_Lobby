-- Script path: ReplicatedStorage.Content.NewEnemies.Null Guardian Clone.Stats
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Null Guardian Clone is a manifestation of chaotic energy, born from fragments of the Guardian's own memories. Each clone is a snapshot of who he was moments before made into physical form. Each time the Guardian uses his abilities, his memory is sacrificed, slowly forgetting his own history and becoming more reliant on the Nil Zone to remember who he once was.",
    Speed = 3,
    Health = 20000,
    DeathTime = 5,
    Enraged = false,
    HealthPerDifficulty = {Act2Easy = 1250, Act2 = 20000},
    NullAura = {CooldownDebuff = 30, Range = 12},
    Attributes = {},
}