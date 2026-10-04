-- Script path: ReplicatedStorage.Content.Unit.Ivy.Stats
-- Decompile time: 0.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            Health = 100,
            Damage = 8,
            Cooldown = 2,
            Range = 14,
            Speed = 1,
            Attributes = {
                ExplosionRadius = 3,
                SlowPerc = 5,
                PoisonLen = 4.5,
                PoisonDmg = 1,
                PoisonTick = 0.75,
                ProjSpeed = 20,
            },
            Detections = {
                [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.LeadDetection] = true,
            },
        },
        Upgrades = {
            {
                Health = 200,
                Damage = 12,
                Cooldown = 1.8,
                Range = 15.5,
                Attributes = {
                    ExplosionRadius = 4,
                    SlowPerc = 7.5,
                    PoisonLen = 4.5,
                    PoisonDmg = 2,
                    PoisonTick = 0.75,
                },
            },
            {
                Health = 400,
                Damage = 25,
                Cooldown = 1.8,
                Range = 17,
                Attributes = {
                    ExplosionRadius = 4.5,
                    SlowPerc = 7.5,
                    PoisonLen = 4.5,
                    PoisonDmg = 4,
                    PoisonTick = 0.6,
                },
            },
            {
                Health = 800,
                Damage = 45,
                Cooldown = 1.5,
                Range = 18.5,
                Attributes = {
                    ExplosionRadius = 4.5,
                    SlowPerc = 12.5,
                    PoisonLen = 5.2,
                    PoisonDmg = 5,
                    PoisonTick = 0.65,
                },
            },
        },
    },
}