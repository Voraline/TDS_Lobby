-- Script path: ReplicatedStorage.Content.Tower.Harvester.Stats
-- Decompile time: 1.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 2000,
                Damage = 20,
                Cooldown = 1.4,
                Range = 20,
                Limit = 5,
                Attributes = {
                    ProjectileSpeed = 50,
                    MaxHits = 1,
                    ThornsRange = 12,
                    ThornsDamage = 2,
                    ThornsDuration = 8,
                    TickRate = 0.25,
                    ThornsSlowness = 15,
                    ThornsGrowthTime = 0.3,
                    SummoningTime = 1.23,
                },
                Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                Abilities = {
                    {
                        Name = "Thorns",
                        Description = "Summon thorns onto the track that deal damage over time and slow enemies passing through them!",
                        Price = 0,
                        Level = 0,
                        Icon = 72581350140943,
                        Debounce = 40,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Sharper Thorns",
                    Image = 84794687219284,
                    Cost = 625,
                    Stats = {
                        Damage = 20,
                        Cooldown = 1.2,
                        Range = 20,
                        Attributes = {
                            ThornsRange = 12,
                            ThornsDamage = 4,
                            ThornsDuration = 8,
                            TickRate = 0.25,
                            ThornsSlowness = 15,
                            SummoningTime = 1.23,
                            MaxHits = 1,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Thorns Summoning",
                            Header = "Active Ability",
                            Content = {{Text = "Damage per tick: 2 → 4"}},
                        },
                    },
                },
                {
                    Title = "Early Harvest",
                    Image = 128833693887182,
                    Cost = 1500,
                    Stats = {
                        Damage = 35,
                        Cooldown = 1.2,
                        Range = 20,
                        Attributes = {
                            ThornsRange = 14,
                            ThornsDamage = 4,
                            ThornsDuration = 11,
                            TickRate = 0.25,
                            ThornsSlowness = 20,
                            MaxHits = 1,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Thorns Summoning",
                            Header = "Active Ability",
                            Content = {
                                {Text = "Duration: 8s → 11s"},
                                {Text = "Slowness: 15% → 20%"},
                                {Text = "Thorns Range: 12 → 14"},
                            },
                        },
                    },
                },
                {
                    Title = "Nature's Vengence",
                    Image = 140040939003373,
                    Cost = 4000,
                    Stats = {
                        Damage = 65,
                        Cooldown = 1.2,
                        Range = 20,
                        Attributes = {
                            ThornsRange = 14,
                            ThornsDamage = 8,
                            ThornsDuration = 11,
                            TickRate = 0.2,
                            ThornsSlowness = 20,
                            MaxHits = 1,
                        },
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Thorns Summoning",
                            Header = "Active Ability",
                            Content = {
                                {Text = "Damage Per Tick: 4 → 8"},
                                {Text = "Tick Rate: 0.25 → 0.2"},
                                {Text = "Thorns Range: 14 → 16"},
                            },
                        },
                    },
                },
                {
                    Title = "Cold-Hearted Scarecrow",
                    Image = 83141210249578,
                    Cost = 8750,
                    Stats = {
                        Damage = 90,
                        Cooldown = 0.75,
                        Range = 25,
                        Attributes = {
                            ThornsRange = 17,
                            ThornsDamage = 9,
                            ThornsDuration = 12,
                            TickRate = 0.2,
                            ThornsSlowness = 20,
                            MaxHits = 1,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Thorns Summoning",
                            Header = "Active Ability",
                            Content = {
                                {Text = "Damage Per Tick: 8 → 9"},
                                {Text = "Thorns Range: 16 → 17"},
                                {Text = "Thorns Duration: 11s → 12s"},
                            },
                        },
                    },
                },
                {
                    Title = "Harvesting Season",
                    Image = 117691212648454,
                    Cost = 24300,
                    Stats = {
                        Damage = 420,
                        Cooldown = 1.75,
                        Range = 30,
                        Attributes = {
                            ProjectileSpeed = 75,
                            MaxHits = 1,
                            ThornsRange = 18,
                            ThornsDamage = 14,
                            ThornsDuration = 15,
                            TickRate = 0.2,
                            ThornsSlowness = 30,
                            SummoningTime = 1.37,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Spectral Bolts",
                            Content = {{Text = "Projectile Speed: 50 → 75"}},
                        },
                        {
                            ButtonText = "Upgrade Thorns Summoning",
                            Header = "Active Ability",
                            Content = {
                                {Text = "Damage per tick: 9 → 14"},
                                {Text = "Slowness: 20% → 30%"},
                                {Text = "Duration: 12s → 15s"},
                                {Text = "Thorns Range: 17 → 18"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A haunted scarecrow that fires spectral bolts and can summon thorns to slow enemies.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            DPS = TowerDPS.Default,
            ["Thorns DPS"] = TowerDPS.Debuff,
            ["Total DPS"] = TowerDPS.DamageOverTime,
        },
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Wasteland = {Icon = 74677227259405, Rarity = Enum.SkinRarity.Event},
            Lunar = {Icon = 137379745720939, Rarity = Enum.SkinRarity.Legendary},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 87684607767207,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.490658503988659, 0),
            CameraOffset = CFrame.new(0, 0, 0),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}