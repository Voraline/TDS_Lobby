-- Script path: ReplicatedStorage.Content.Tower.Snowballer.Stats
-- Decompile time: 1.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Damage = 3,
                Cooldown = 1.5,
                Range = 15,
                Price = 300,
                Attributes = {
                    ThrowDelay = 0.1,
                    DebuffLength = 3,
                    SlowPercent = 10,
                    MaxSlow = 20,
                    CanFreeze = false,
                    FreezeTime = 0,
                    ExplosionRadius = 5,
                    MaxHits = 2,
                    ProjectileSpeed = 20,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Title = "Snow Day",
                    Image = 15686418975,
                    Cost = 50,
                    Stats = {
                        Damage = 3,
                        Cooldown = 1.35,
                        Range = 17.5,
                        Attributes = {SlowPercent = 10, MaxSlow = 20},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
                {
                    Title = "Frigid Temperatures",
                    Image = 15686418835,
                    Cost = 320,
                    Stats = {
                        Damage = 6,
                        Cooldown = 1.35,
                        Range = 17.5,
                        Attributes = {SlowPercent = 15, MaxSlow = 30, DebuffLength = 3},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Max Slowness: 15% -> 20%", "Chill Slowness: 10% -> 15%"},
                    },
                },
                {
                    Title = "Snowball Cannon",
                    Image = 15686418748,
                    Cost = 3000,
                    Stats = {
                        Damage = 28,
                        Cooldown = 1.25,
                        Range = 20,
                        Attributes = {
                            ThrowDelay = 0,
                            ExplosionRadius = 5,
                            CanFreeze = true,
                            FreezeTime = 0.6,
                            MaxHits = 3,
                            SlowPercent = 15,
                            MaxSlow = 30,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Freeze at Max Chill", "Freeze Time: 0.6 Seconds"},
                    },
                },
            },
        },
        Golden = {
            Defaults = {
                Damage = 6,
                Cooldown = 0.5,
                Range = 14,
                Price = 67,
                Limit = 67,
                Attributes = {
                    ThrowDelay = 0.1,
                    DebuffLength = 100,
                    SlowPercent = 67,
                    MaxSlow = 67,
                    CanFreeze = true,
                    FreezeTime = 8,
                    ExplosionRadius = 3,
                    MaxHits = 2,
                    ProjectileSpeed = 20,
                },
                Detections = {
                    FreezeImmune = true,
                    StunImmune = true,
                    [Enum.StatusEffect.HiddenDetection] = true,
                    [Enum.StatusEffect.LeadDetection] = true,
                    [Enum.StatusEffect.FlyingDetection] = true,
                },
            },
            Upgrades = {
                {
                    Title = "Lord Exo Slayer",
                    Image = 139027030887404,
                    Cost = 320,
                    Stats = {
                        Damage = 17,
                        Cooldown = 0.35,
                        Range = 14,
                        Attributes = {SlowPercent = 67, MaxSlow = 67},
                        Detections = {},
                        Extras = {"Canonically killed Lord Exo"},
                    },
                },
                {
                    Title = "QA Leaker",
                    Image = 136854065383009,
                    Cost = 2222,
                    Stats = {
                        Damage = 67,
                        Cooldown = 0.2,
                        Range = 15,
                        Attributes = {SlowPercent = 67, MaxSlow = 67, DebuffLength = 100, ExplosionRadius = 8},
                        Detections = {},
                        Extras = {"Leaked Solar Eclipse and Mercenary tower", "Stop datamining pls"},
                    },
                },
                {
                    Title = "Spectin destroyer",
                    Image = 16911190427,
                    Cost = 1000000,
                    Stats = {
                        Damage = 3267,
                        Cooldown = 0.1,
                        Range = 19,
                        Limit = 21432,
                        Attributes = {
                            ThrowDelay = 0,
                            ExplosionRadius = 15,
                            FreezeTime = 8,
                            MaxHits = 4,
                            SlowPercent = 67,
                        },
                        Detections = {},
                        Extras = {"Ez destroys two x and spectin"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A jolly snowball fighter who prefers to fight in the best way they know how!",
        Height = 0,
        BoundarySize = 1.25,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        SkinData = {Golden = {Icon = 134919544987374, Rarity = Enum_2.SkinRarity.Golden}},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 114134096038917,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}