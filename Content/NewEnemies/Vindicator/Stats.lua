-- Script path: ReplicatedStorage.Content.NewEnemies.Vindicator.Stats
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Description = "The Vindicators are the trusted Do-Gooders of the Void. They act as enforcement and will not tolerate insubordination. Before the battle alongside Lord Exo, Vindicators would often patrol the ranks of Void Caster’s army to keep order and offer swift judgement upon those who step out of line. They don’t particularly have a high tolerance for nonsense or tomfoolery. Sometimes, a little dilly dallying they will overlook. If one is being a bit too silly for their liking, they will drop their hammer atop them to keep them still. It’s of no concern if the creature survives or not.",
    Scale = 2.8,
    Speed = 2.1,
    MaxHealth = 80000,
    Shield = 40000,
    Defense = 150,
    HammerTravelTime = 1.95,
    AwardBadgeOnDeath = {id = 989020802395867, modes = {mode = "Hardcore", difficulty = "Hard"}},
    ShieldPerDifficulty = {Hard = 25000, Easy = 15000},
    HealthPerDifficulty = {Hard = 65000, Easy = 50000},
    Reward = {Hard = 30000, Easy = 25000},
    Attributes = {Enum_2.Modifier.StunImmune, Enum_2.Modifier.Blessed},
    SoundEmitter = {
        RollOffMaxDistance = 300,
        RollOffMinDistance = 20,
        Volume = 0.5,
        RollOffMode = Enum.RollOffMode.LinearSquare,
    },
    Sounds = {
        throw = {id = 85655323544149},
        hit = {id = 100784648933643},
        catch = {id = 126966163254393},
        throw_loop = {id = 136695051230137, looped = true},
    },
    Attack = {
        ProjectileGravity = -2,
        ProjectileSpeedMultiplier = 8,
        StunTime = 0,
        UnitDamage = 100,
        Cooldown = 12,
        InitialCooldown = 10,
        Range = 30,
        RicochetRange = 5,
        DebuffAmount = 100,
        DebuffDuration = 12,
        MaxHits = 6,
    },
}