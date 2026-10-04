-- Script path: ReplicatedStorage.Content.Tower.Archer.Stats
-- Decompile time: 2.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 78487255054043,
                    Title = "Eagle Eye",
                    Cost = 250,
                    Stats = {
                        Cooldown = 1.4,
                        Range = 20,
                        Damage = 5,
                        Extras = {},
                        Attributes = {
                            BurnDamage = 0,
                            MaxHits = 2,
                            EnemyBuff = 0,
                            MaxStun = 0,
                            BurnTick = 0,
                            MinStun = 0,
                            BurnTime = 0,
                            MaxHitsType = {
                                [Enum.ArrowType.Shock] = 4,
                                [Enum.ArrowType.Explosive] = 1,
                            },
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                },
                {
                    Image = 118177062176518,
                    Title = "Deadshot",
                    Cost = 550,
                    Stats = {
                        Cooldown = 1.4,
                        Range = 20,
                        Damage = 8,
                        Extras = {},
                        Attributes = {
                            BurnDamage = 0,
                            MaxHits = 2,
                            EnemyBuff = 0,
                            MaxStun = 0,
                            BurnTick = 0,
                            MinStun = 0,
                            BurnTime = 0,
                            MaxHitsType = {
                                [Enum.ArrowType.Shock] = 4,
                                [Enum.ArrowType.Explosive] = 1,
                            },
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                },
                {
                    Image = 83003777730604,
                    Title = "Flame-tipped Arrows",
                    Cost = 1250,
                    Stats = {
                        Cooldown = 1.4,
                        Range = 21,
                        Damage = 10,
                        Extras = {},
                        Attributes = {
                            BurnDamage = 3,
                            MaxHits = 3,
                            EnemyBuff = 0,
                            MaxStun = 0,
                            BurnTick = 1,
                            MinStun = 0,
                            BurnTime = 2,
                            MaxHitsType = {
                                [Enum.ArrowType.Shock] = 4,
                                [Enum.ArrowType.Explosive] = 1,
                            },
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(238, 137, 11)\"><b>Flame Arrows</b></font>",
                            Header = "Flame Arrow",
                            Content = {
                                {Text = "Burn Damage: 3"},
                                {Text = "Burn Duration: 2 Seconds"},
                                {Text = "Burn Tick Rate: 1"},
                            },
                        },
                    },
                },
                {
                    Image = 115104563492355,
                    Title = "Powder Keg Arrows",
                    Cost = 3000,
                    Stats = {
                        Cooldown = 1.2,
                        Range = 21,
                        Damage = 16,
                        Extras = {},
                        Attributes = {
                            BurnDamage = 5,
                            ExplosiveDamage = 25,
                            ExplosiveRadius = 2,
                            MaxHits = 4,
                            BurnTick = 1,
                            BurnTime = 4,
                            MaxHitsType = {
                                [Enum.ArrowType.Shock] = 3,
                                [Enum.ArrowType.Explosive] = 1,
                            },
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(40, 94, 133)\"><b>Explosive Arrows</b></font>",
                            Header = "Explosive Arrow",
                            Content = {
                                {Text = "Explosion Damage: 25"},
                                {Text = "Explosion Radius: 2"},
                                {Text = "Max Hits: 1"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(238, 137, 11)\"><b>Flame Arrows</b></font>",
                            Header = "Flame Arrow",
                            Content = {
                                {Text = "Burn Damage: 3 -> 5"},
                                {Text = "Burn Duration: 2 -> 4 Seconds"},
                                {Text = "Burn Tick Rate: 1"},
                                {Text = "Max Hits: 3 -> 4"},
                            },
                        },
                    },
                },
                {
                    Image = 73857609172576,
                    Title = "Shot of the Century",
                    Cost = 8500,
                    Stats = {
                        Cooldown = 1,
                        Range = 24,
                        Damage = 40,
                        Extras = {},
                        Attributes = {
                            BurnDamage = 14,
                            ExplosiveDamage = 45,
                            ExplosiveRadius = 2.5,
                            MaxHits = 8,
                            MaxStun = 0.15,
                            BurnTick = 1,
                            MinStun = 0.15,
                            BurnTime = 4,
                            MaxHitsType = {
                                [Enum.ArrowType.Shock] = 4,
                                [Enum.ArrowType.Explosive] = 1,
                            },
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(182, 49, 32)\"><b>Shock Arrows</b></font>",
                            Header = "Shock Arrow",
                            Content = {{Text = "Max Hits: 4"}, {Text = "Stun Time: 0.15s"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(182, 49, 32)\"><b>Explosive Arrows</b></font>",
                            Header = "Explosive Arrow",
                            Content = {
                                {Text = "Explosion Damage: 20 -> 45"},
                                {Text = "Explosion Radius: 2 -> 2.5"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(238, 137, 11)\"><b>Flame Arrows</b></font>",
                            Header = "Flame Arrow",
                            Content = {
                                {Text = "Burn Damage: 5 -> 14"},
                                {Text = "Burn Duration: 4 -> 5 Seconds"},
                                {Text = "Burn Tick Rate: 1"},
                                {Text = "Max Hits: 4 -> 8"},
                            },
                        },
                    },
                },
            },
            Defaults = {
                Price = 600,
                Range = 16.5,
                Cooldown = 1.6,
                Damage = 5,
                Limit = 15,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
                Attributes = {
                    BurnDamage = 0,
                    ExplosiveDamage = 34,
                    ExplosiveRadius = 5,
                    MaxHits = 2,
                    EnemyBuff = 0,
                    MaxStun = 0,
                    BurnTick = 0,
                    MinStun = 0,
                    BurnTime = 0,
                    MaxHitsType = {[Enum.ArrowType.Shock] = 4, [Enum.ArrowType.Explosive] = 2},
                },
            },
        },
    },
    Properties = {
        Description = "Shoot a piercing arrow that bounces towards nearby enemies. Pick between Fire, Stun, & EXP arrows.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            Default = {
                Calculate = TowerDPS.Default,
                Option = {
                    Name = "ArrowType",
                    Value = {
                        Enum.ArrowType.Normal,
                        Enum.ArrowType.Flame,
                        Enum.ArrowType.Shock,
                        Enum.ArrowType.Explosive,
                    },
                },
            },
            ["Burn DPS"] = {
                Calculate = TowerDPS.Burn,
                Option = {Name = "ArrowType", Value = Enum.ArrowType.Flame},
            },
            ["Splash DPS"] = {
                Calculate = TowerDPS.Splash,
                Option = {Name = "ArrowType", Value = Enum.ArrowType.Explosive},
            },
            ["Fire Total DPS"] = {
                Calculate = TowerDPS.DamageOverTime,
                Option = {Name = "ArrowType", Value = Enum.ArrowType.Flame},
            },
            ["Explosive Total DPS"] = {
                Calculate = TowerDPS.NormalAndSplash,
                Option = {Name = "ArrowType", Value = Enum.ArrowType.Explosive},
            },
        },
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Huntsman = {Icon = 4134096662, Rarity = Enum.SkinRarity.Common},
            Spooky = {Icon = 4592593126, Rarity = Enum.SkinRarity.Event},
            Valentines = {Icon = 4592593282, Rarity = Enum.SkinRarity.Event},
            Elf = {Icon = 137617556082869, Rarity = Enum.SkinRarity.Common},
            ["Ice Soul"] = {Icon = 122866551548543, Rarity = Enum.SkinRarity.Common},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883275629,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}