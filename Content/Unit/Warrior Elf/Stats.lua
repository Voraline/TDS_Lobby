-- Script path: ReplicatedStorage.Content.Unit.Warrior Elf.Stats
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Default = {
        Defaults = {
            DisplayName = "Guardian Elf",
            Health = 50,
            Speed = 8,
            Range = 7,
            Cooldown = 0.5,
            Damage = 18,
            Defense = 0,
            Detections = {
                [(require(ReplicatedStorage.Shared.Modules.Enum)).StatusEffect.HiddenDetection] = true,
            },
            Attributes = {},
        },
        Upgrades = {{Health = 75, Damage = 28, Cooldown = 0.5, Defense = 30}},
    },
}