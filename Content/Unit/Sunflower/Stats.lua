-- Script path: ReplicatedStorage.Content.Unit.Sunflower.Stats
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            Health = 50,
            Damage = 6,
            Cooldown = 1.1,
            Range = 15,
            Speed = 2,
        },
        Upgrades = {
            {Health = 100, Damage = 10, Cooldown = 1.1, Range = 15},
            {
                Health = 200,
                Damage = 12,
                Cooldown = 1.1,
                Range = 17,
                Detections = {
                    [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
                },
            },
            {Health = 400, Damage = 28, Cooldown = 1, Range = 19.5},
            {Health = 800, Damage = 55, Cooldown = 0.8, Range = 22.5},
        },
    },
}