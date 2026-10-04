-- Script path: ReplicatedStorage.Content.Tower.Assassin.Stats-PVP
-- Decompile time: 1.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AssassinTooltips = require(script.AssassinTooltips)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 300,
                Range = 5.5,
                Cooldown = 0.6,
                Damage = 2,
                Detections = {},
                Attributes = {
                    SliceAngle = 280,
                    MaxSwings = 2,
                    Whirlwind = false,
                    WhirlwindRadius = 6,
                    WhirlwindDamageMultiplier = 1,
                    KnifeFan = false,
                    KnifeFanRadius = 10,
                    KnifeFanDamage = 25,
                    KnifeFanPierce = 3,
                    KnifeFanRange = 10,
                    KnifeFanDuration = 0.5,
                },
            },
            Upgrades = {
                {
                    Image = 111493227843909,
                    Title = "CQC Training",
                    Cost = 150,
                    Stats = {Cooldown = 0.6, Damage = 3, Range = 6.5},
                },
                {
                    Image = 92894447316956,
                    Title = "Advanced Hand to Hand Training",
                    Cost = 600,
                    Stats = {
                        Range = 6.5,
                        Cooldown = 0.6,
                        Damage = 8,
                        Attributes = {MaxSwings = 3, Whirlwind = true, WhirlwindDamageMultiplier = 0.75},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        (AssassinTooltips.whirlwind({unlocked = true, baseDamage = 8, damageMult = 0.75, range = 6})),
                    },
                },
                {
                    Image = 71356771597575,
                    Title = "Upgraded Blades",
                    Cost = 1700,
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 13,
                        Range = 6.5,
                        Attributes = {Whirlwind = true, WhirlwindDamageMultiplier = 1},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        (AssassinTooltips.whirlwind({
                            baseDamage = 14,
                            prevBaseDamage = 6,
                            damageMult = 1,
                            prevDamageMult = 0.75,
                            range = 6,
                        })),
                    },
                },
                {
                    Image = 88526006090438,
                    Title = "Black Ops",
                    Cost = 4750,
                    Stats = {
                        Range = 7,
                        Cooldown = 0.5,
                        Damage = 24,
                        MaxAmmo = 150,
                        Attributes = {Whirlwind = true, KnifeFan = true, WhirlwindDamageMultiplier = 1},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        AssassinTooltips.knives({
                            unlock = true,
                            damage = 25,
                            range = 10,
                            pierce = 3,
                            damageRequirement = 150,
                        }),
                        AssassinTooltips.whirlwind({
                            baseDamage = 25,
                            prevBaseDamage = 14,
                            damageMult = 1,
                            prevDamageMult = 1,
                            range = 7,
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
        SkinData = {},
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