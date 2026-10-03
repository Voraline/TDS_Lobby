-- Script path: ReplicatedStorage.Content.Unit.Nightshade.Stats
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            Health = 400,
            Damage = 50,
            Cooldown = 3,
            Range = 30,
            Speed = 1,
            Attributes = {ConfuseLength = 1, ConfuseDebounce = 4},
            Detections = {
                [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.FlyingDetection] = true,
            },
        },
        Upgrades = {
            {
                Health = 800,
                Damage = 135,
                Cooldown = 2.75,
                Range = 35,
                Attributes = {ConfuseLength = 1.25},
            },
        },
    },
}