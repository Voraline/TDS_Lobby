-- Script path: ReplicatedStorage.Content.Unit.Ice Turret.Stats
-- Decompile time: 0.33 ms

return {
    Default = {
        Defaults = {
            Speed = 3,
            Health = 1000,
            Damage = 10,
            Range = 10,
            Cooldown = 0.45,
            Lifespan = 45,
            DamageMultiplier = 1.5,
            NoHealth = true,
            IgnoreCollisionDamage = true,
            Detections = {},
            Attributes = {
                FrostDebuff = {
                    Duration = 5,
                    Damage = 0,
                    DefenseMelt = 0,
                    CanFreeze = true,
                    MaxSlow = 15,
                    FreezeTime = 2,
                    SlowPercent = 2.5,
                    TickRate = 0.2,
                },
            },
        },
        Upgrades = {
            {
                Cooldown = 0.35,
                Damage = 20,
                Range = 12.5,
                Attributes = {
                    FrostDebuff = {
                        Duration = 5,
                        Damage = 0,
                        DefenseMelt = 0,
                        CanFreeze = true,
                        MaxSlow = 15,
                        FreezeTime = 2,
                        SlowPercent = 5,
                        TickRate = 0.2,
                    },
                },
            },
            {
                Cooldown = 0.3,
                Damage = 28,
                Range = 15,
                Attributes = {
                    FrostDebuff = {
                        Duration = 5,
                        Damage = 0,
                        DefenseMelt = 0,
                        CanFreeze = true,
                        MaxSlow = 20,
                        FreezeTime = 2,
                        SlowPercent = 5,
                        TickRate = 0.2,
                    },
                },
            },
        },
    },
}