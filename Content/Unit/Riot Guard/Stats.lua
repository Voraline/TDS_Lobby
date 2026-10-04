-- Script path: ReplicatedStorage.Content.Unit.Riot Guard.Stats
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            Health = 800,
            Damage = 50,
            Range = 4,
            Cooldown = 1.5,
            Speed = 2.5,
            Defense = 10,
            Lifespan = 75,
            Detections = {
                [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
            },
            Attributes = {
                MaxHits = 10,
                StandByTime = 3,
                MaxSpeed = 7,
                ChargeTime = 4,
                KnockbackForce = 15,
            },
        },
        Upgrades = {
            {
                Health = 2000,
                Damage = 50,
                Cooldown = 1,
                Defense = 15,
                Lifespan = 75,
                Attributes = {ChargeTime = 3, KnockbackForce = 25},
            },
        },
    },
}