-- Script path: ReplicatedStorage.Content.Tower.Assassin.Stats
-- Decompile time: 1.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AssassinTooltips = require(script.AssassinTooltips)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 300,
                Range = 6,
                Cooldown = 0.6,
                Damage = 3,
                Detections = {},
                Attributes = {
                    SliceAngle = 280,
                    MaxSwings = 2,
                    Whirlwind = false,
                    WhirlwindRadius = 6,
                    WhirlwindDamageMultiplier = 1,
                    KnifeFan = false,
                    KnifeFanRadius = 10,
                    KnifeFanDamage = 60,
                    KnifeFanPierce = 3,
                    KnifeFanRange = 10,
                    KnifeFanDuration = 0.5,
                },
            },
            Upgrades = {
                {
                    Image = 111493227843909,
                    Title = "CQC Training",
                    Cost = 450,
                    Stats = {Cooldown = 0.5, Damage = 6, Range = 6},
                },
                {
                    Image = 92894447316956,
                    Title = "Umbral Tempest",
                    Cost = 625,
                    Stats = {
                        Range = 6,
                        Cooldown = 0.5,
                        Damage = 9,
                        Attributes = {MaxSwings = 3, Whirlwind = true, WhirlwindDamageMultiplier = 1},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                    },
                    Tooltips = {
                        (AssassinTooltips.whirlwind({unlocked = true, baseDamage = 9, damageMult = 1, range = 6})),
                    },
                },
                {
                    Image = 71356771597575,
                    Title = "Ascended Shadow",
                    Cost = 2000,
                    Stats = {
                        Cooldown = 0.35,
                        Damage = 16,
                        Range = 6,
                        Attributes = {Whirlwind = true, WhirlwindDamageMultiplier = 1},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        (AssassinTooltips.whirlwind({
                            baseDamage = 16,
                            prevBaseDamage = 9,
                            damageMult = 1,
                            prevDamageMult = 1,
                            prevRange = 6,
                            range = 6.5,
                        })),
                    },
                },
                {
                    Image = 88526006090438,
                    Title = "Death Arms Ninja",
                    Cost = 6800,
                    Stats = {
                        Range = 6.5,
                        Cooldown = 0.35,
                        Damage = 35,
                        MaxAmmo = 500,
                        Attributes = {
                            Whirlwind = true,
                            KnifeFan = true,
                            WhirlwindDamageMultiplier = 1,
                            WhirlwindRadius = 6.5,
                        },
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        AssassinTooltips.knives({
                            unlock = true,
                            damage = 60,
                            range = 10,
                            pierce = 3,
                            damageRequirement = 500,
                        }),
                        AssassinTooltips.whirlwind({
                            baseDamage = 35,
                            prevBaseDamage = 14,
                            damageMult = 1,
                            prevDamageMult = 1.5,
                            range = 6.5,
                        }),
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Silent but deadly. Clear out enemies with fatal stabs, whirlwind slashes, and throwing knives!",
        BoundarySize = 1,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Whirlwind},
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        Price = {Value = 800, Type = Enum.CurrencyType.Coins},
        SkinData = {
            ["Saber Tooth Tiger"] = {Icon = 113919822910484, Rarity = Enum.SkinRarity.Uncommon},
            Actor = {Icon = 113885593873689, Rarity = Enum.SkinRarity.Common},
            SciBunny = {Icon = 112640675140633, Rarity = Enum.SkinRarity.Rare},
            Crew = {Icon = 113919822910484, Rarity = Enum.SkinRarity.Exclusive},
            Pumpkin = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 84825021113385,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}