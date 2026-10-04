-- Script path: ReplicatedStorage.Content.Tower.EvolvedJuggernaut.Stats
-- Decompile time: 2.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 1,
                Price = 10000,
                Range = 17.5,
                Cooldown = 0.14,
                Damage = 10,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {RevTime = 2, SlowTime = 1},
            },
            Upgrades = {
                {
                    Title = "Combat Tactics",
                    Cost = 2800,
                    Image = 123365136014760,
                    Stats = {Damage = 10, Cooldown = 0.12, Range = 17.5},
                },
                {
                    Title = "32nd Spec-Ops",
                    Cost = 7000,
                    Image = 93721065871366,
                    Stats = {
                        Damage = 15,
                        Cooldown = 0.12,
                        Range = 20,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {RevTime = 1.8},
                    },
                    Tooltips = {{ButtonText = "Upgrade Rev Time", Content = {{Text = "Rev Time: 2s > 1.8s"}}}},
                },
                {
                    Title = "Re-routed Funds",
                    Cost = 17200,
                    Image = 96118655853436,
                    Stats = {Damage = 30, Cooldown = 0.12, Range = 22},
                },
                {
                    {
                        Title = "Fortifier",
                        Cost = 35000,
                        Image = 111732653007157,
                        Stats = {
                            Damage = 65,
                            Cooldown = 0.15,
                            Range = 22,
                            Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                            Attributes = {RevTime = 1.2, FortifyRadius = 13, FortifyReduction = 0.35},
                        },
                        Tooltips = {
                            {
                                ButtonText = "Unlock Fortify Zone",
                                Content = {
                                    {Text = "\"Don't quit now! We were just getting warmed up.\""},
                                    {
                                        Text = "Juggernaut unlocks a secondary range in which towers receive reduced stun and debuff times!",
                                    },
                                    {Text = "Fortify Radius: 13"},
                                    {Text = "Fortify Debuff Time Reduction: 35%"},
                                },
                            },
                            {
                                ButtonText = "Upgrade Rev Time",
                                Content = {{Text = "Rev Time: 1.8s > 1.2s"}},
                            },
                        },
                    },
                    {
                        Title = "Experimental Weaponry",
                        Cost = 40000,
                        Image = 110879981278605,
                        Stats = {
                            Damage = 40,
                            Cooldown = 0.1,
                            Range = 22,
                            Detections = {[Enum.StatusEffect.LeadDetection] = true},
                            Attributes = {BossDamageMultiplier = 1.4},
                        },
                        Tooltips = {
                            {
                                ButtonText = "Unlock Experimental Weaponry",
                                Content = {
                                    {Text = "\"Fine. I'll do it myself.\""},
                                    {
                                        Text = "Juggernaut equips an experimental multi-barrel minigun, with special rounds that deal extra damage to boss enemies.",
                                    },
                                    {Text = "Boss Damage Multiplier: 1.4x"},
                                },
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Defensive Maneuvers",
                        Cost = 60000,
                        Image = 95544278655808,
                        Stats = {
                            Damage = 120,
                            Cooldown = 0.15,
                            Range = 26,
                            Attributes = {FortifyRadius = 14, FortifyReduction = 0.4},
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Fortify Zone",
                                Content = {
                                    {Text = "Fortify Radius: 13 → 14"},
                                    {Text = "Fortify Debuff Time Reduction: 35% → 40%"},
                                },
                            },
                        },
                    },
                    {
                        Title = "Bigger Guns",
                        Cost = 95000,
                        Image = 88574561737643,
                        Stats = {
                            Damage = 85,
                            Cooldown = 0.1,
                            Range = 26,
                            Attributes = {BossDamageMultiplier = 1.4},
                        },
                    },
                },
                {
                    {
                        Title = "Flak Jacket",
                        Cost = 95000,
                        Image = 98941243657730,
                        Stats = {
                            Damage = 150,
                            Cooldown = 0.12,
                            Range = 26,
                            Attributes = {RevTime = 1, FortifyRadius = 14, FortifyReduction = 0.4},
                        },
                        Tooltips = {{ButtonText = "Upgrade Rev Time", Content = {{Text = "Rev Time: 1.2s > 1s"}}}},
                    },
                    {
                        Title = "Titanium Armor",
                        Cost = 130000,
                        Image = 126158680785346,
                        Stats = {
                            Damage = 140,
                            Cooldown = 0.1,
                            Range = 26,
                            Attributes = {BossDamageMultiplier = 1.4},
                        },
                    },
                },
                {
                    {
                        Title = "Hammerhead",
                        Cost = 175000,
                        Image = 106308635701035,
                        Stats = {
                            Damage = 215,
                            Cooldown = 0.12,
                            Range = 26,
                            Detections = {
                                [Enum.StatusEffect.HiddenDetection] = true,
                                [Enum.StatusEffect.FlyingDetection] = true,
                            },
                            Attributes = {FortifyRadius = 16, FortifyReduction = 0.5},
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Fortify Zone",
                                Content = {
                                    {Text = "Fortify Radius: 14 → 16"},
                                    {Text = "Fortify Debuff Time Reduction: 40% → 50%"},
                                },
                            },
                        },
                    },
                    {
                        Title = "Thresher",
                        Cost = 230000,
                        Image = 101185222776747,
                        Stats = {
                            Damage = 165,
                            Cooldown = 0.09,
                            Range = 26,
                            Attributes = {RevTime = 1.6, BossDamageMultiplier = 1.5},
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Rev Time",
                                Content = {{Text = "Rev Time: 1.8s → 1.6s"}},
                            },
                            {
                                ButtonText = "Upgrade Experimental Weaponry",
                                Content = {{Text = "Boss Damage Multiplier: 1.4x → 1.5x"}},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "We're only just getting started... An absolute unit of a tower with unmatched firepower, supportive capabilities, and boss destruction.",
        Height = 0,
        BoundarySize = 2.5,
        BoundingSize = Vector3.new(0, 0, 0),
        DisplayName = "Juggernaut",
        EvolvesFrom = "Minigunner",
        EvolutionLevel = 20,
        BuyAllLevelsProductId = 3602482978,
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Evolved,
        Price = {
            {Value = 15000, Type = Enum.CurrencyType.Coins},
            {Value = 6000, Type = Enum.CurrencyType.Gems},
        },
        Progression = {MaxLevel = 20, BaseExp = 75, GrowthRate = 1.075},
        UpgradeUnlockTree = {
            DefaultUnlockedThrough = 4,
            Nodes = {
                Upgrade5A = {
                    DisplayName = "Defensive Maneuvers",
                    Level = 5,
                    Path = 1,
                    RequiredTowerLevel = 3,
                    Coordinate = {q = 5, r = -1},
                },
                Upgrade5B = {
                    DisplayName = "Bigger Guns",
                    Level = 5,
                    Path = 2,
                    RequiredTowerLevel = 6,
                    Coordinate = {q = 4, r = 1},
                },
                Upgrade6A = {
                    DisplayName = "Flak Jacket",
                    Level = 6,
                    Path = 1,
                    RequiredTowerLevel = 9,
                    PreviousNode = "Upgrade5A",
                    Coordinate = {q = 6, r = -1},
                },
                Upgrade6B = {
                    DisplayName = "Titanium Armor",
                    Level = 6,
                    Path = 2,
                    RequiredTowerLevel = 12,
                    PreviousNode = "Upgrade5B",
                    Coordinate = {q = 5, r = 1},
                },
                Upgrade7A = {
                    DisplayName = "Hammerhead",
                    Level = 7,
                    Path = 1,
                    RequiredTowerLevel = 16,
                    PreviousNode = "Upgrade6A",
                    Coordinate = {q = 7, r = -1},
                },
                Upgrade7B = {
                    DisplayName = "Thresher",
                    Level = 7,
                    Path = 2,
                    RequiredTowerLevel = 20,
                    PreviousNode = "Upgrade6B",
                    Coordinate = {q = 6, r = 1},
                },
            },
        },
    },
}