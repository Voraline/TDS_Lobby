-- Script path: ReplicatedStorage.Content.Tower.EvolvedOperator.Stats
-- Decompile time: 2.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Tags = require(ReplicatedStorage.Shared.Modules.StatusEffects.Tags)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 300,
                Range = 14,
                Cooldown = 0.12,
                Damage = 1,
                Limit = 16,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {
                    Burst = 6,
                    BurstCool = 1.4,
                    CoordinationRange = 0,
                    CoordinationDamage = 0,
                    SharedOptics = false,
                },
            },
            Upgrades = {
                {
                    Title = "Tactical Gear",
                    Cost = 325,
                    Image = 70928079601135,
                    Stats = {
                        Damage = 2,
                        Cooldown = 0.12,
                        Range = 14,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {Burst = 6, BurstCool = 1.4, CoordinationRange = 0, CoordinationDamage = 0},
                    },
                },
                {
                    Title = "Convergent Forces",
                    Cost = 700,
                    Image = 114583008682832,
                    Stats = {
                        Damage = 3,
                        Cooldown = 0.12,
                        Range = 15.5,
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        Attributes = {Burst = 6, BurstCool = 1, CoordinationRange = 4, CoordinationDamage = 10},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock Coordination",
                            Content = {
                                {
                                    Text = "Operator gains and applies bonus damage for each nearby Operator with Coordination unlocked.",
                                },
                                {Text = "Coordination Radius: 4"},
                                {Text = "Coordination Damage: 10% per Operator"},
                            },
                        },
                        {
                            ButtonText = "Upgraded Burst",
                            Content = {{Text = "Burst Cooldown: 1.4s → 1s"}},
                        },
                    },
                },
                {
                    Title = "Cyber-Enforcer",
                    Cost = 1250,
                    Image = 104986848983674,
                    Stats = {
                        Damage = 4,
                        Cooldown = 0.1,
                        Range = 15.5,
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        Attributes = {Burst = 9, BurstCool = 1, CoordinationRange = 4, CoordinationDamage = 10},
                    },
                    Tooltips = {{ButtonText = "Upgraded Burst", Content = {{Text = "Burst Count: 6 → 9"}}}},
                },
                {
                    Title = "Threat Detection Sentinel",
                    Cost = 1950,
                    Image = 76868080888172,
                    Stats = {
                        Damage = 6,
                        Cooldown = 0.1,
                        Range = 15.5,
                        Attributes = {Burst = 9, BurstCool = 1, CoordinationRange = 5.5, CoordinationDamage = 10},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Coordination",
                            Content = {{Text = "Coordination Radius: 4 → 5.5"}},
                        },
                    },
                },
                {
                    Title = "Synchronized Vision",
                    Cost = 3500,
                    Image = 83041543058774,
                    Stats = {
                        Damage = 6,
                        Cooldown = 0.16,
                        Range = 16,
                        Attributes = {
                            Burst = 1000,
                            BurstCool = 0,
                            CoordinationRange = 5.5,
                            CoordinationDamage = 10,
                            SharedOptics = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock Smart Optics",
                            Content = {
                                {Text = "Target spotted. Now everyone sees it."},
                                {
                                    Text = "Operator can target enemies inside the ranges of other Lvl 4+ Operators connected through attack range chains.",
                                },
                            },
                        },
                        {
                            ButtonText = "Automatic Fire",
                            Content = {{Text = "Operator switches from burst fire to automatic fire."}},
                        },
                    },
                },
                {
                    Title = "1000-THR E.M.",
                    Cost = 7000,
                    Image = 119843960971904,
                    Stats = {
                        Damage = 10,
                        Cooldown = 0.16,
                        Range = 17,
                        Attributes = {
                            Burst = 1,
                            BurstCool = 0,
                            CoordinationRange = 5.5,
                            CoordinationDamage = 10,
                            SharedOptics = true,
                        },
                    },
                    Tooltips = {},
                },
            },
        },
    },
    Properties = {
        Description = "Eyes up, it's all yours. An early-game specialist that boosts other Operators in range and can see into others' sightlines when upgraded.",
        Height = 0,
        BoundarySize = 1.25,
        BoundingSize = Vector3.new(0, 0, 0),
        DisplayName = "Operator",
        EvolvesFrom = "Scout",
        EvolutionLevel = 20,
        BuyAllLevelsProductId = 3603641874,
        DPS_Display = {DPS = TowerDPS.CoordinationBurst},
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {Pirate = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon}},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        RangeRings = {
            {
                Key = "Coordination",
                Attribute = "CoordinationRange",
                DisableFill = true,
                FillTransparency = 0.72,
                LineOffset = 0.55,
                LineSize = Vector3.new(1.100000023841858, 0, 0.14000000059604645),
                LineTransparency = 0,
                PlacementUpgrade = 1,
                PlacementFallback = 6.5,
                ShowOnPlacement = false,
                ShowWhenInvalid = true,
                ZIndex = 4,
                BlockedStatusTag = Tags.TowerDisabled,
                Color = Color3.fromRGB(0, 240, 255),
            },
        },
        RangeProviderRings = {
            {
                Key = "SharedOptics",
                Attribute = "SharedOptics",
                MinUpgrade = 4,
                ProviderTower = "EvolvedOperator",
                ProviderAttribute = "SharedOptics",
                ProviderMinUpgrade = 4,
                ProviderChain = true,
                ProviderProximityUseSelectedRange = true,
                ProviderProximityUseProviderRange = true,
                DisableFill = true,
                LineTransparency = 0.75,
                StatusEffect = Enum.StatusEffect.SharedOptics,
                BlockedStatusTag = Tags.TowerDisabled,
                ProviderStatusEffect = Enum.StatusEffect.SharedOptics,
                BlockedProviderStatusTag = Tags.TowerDisabled,
            },
        },
        Category = Enum.TowerCategory.Evolved,
        Price = {
            {Value = 15000, Type = Enum.CurrencyType.Coins},
            {Value = 4500, Type = Enum.CurrencyType.Gems},
        },
        Progression = {MaxLevel = 20, BaseExp = 75, GrowthRate = 1.075},
        UpgradeUnlockTree = {
            DefaultUnlockedThrough = 4,
            Nodes = {
                Upgrade5 = {
                    DisplayName = "Synchronized Vision",
                    Level = 5,
                    RequiredTowerLevel = 10,
                    Coordinate = {q = 5, r = 0},
                },
                Upgrade6 = {
                    DisplayName = "1000-THR E.M.",
                    Level = 6,
                    RequiredTowerLevel = 20,
                    PreviousNode = "Upgrade5",
                    Coordinate = {q = 6, r = 0},
                },
            },
        },
    },
}