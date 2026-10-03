-- Script path: ReplicatedStorage.Content.Tower.Spotlight Tech.Stats
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.325,
                Damage = 4,
                Limit = 1,
                Price = 3225,
                Range = 30,
                Attributes = {SpotlightRadius = 2},
                Detections = {[Enum.StatusEffect.FlyingDetection] = true, ["StunImmune"] = true},
            },
            Upgrades = {
                {
                    Title = "Backstage Crew",
                    Image = 131910648185483,
                    Cost = 1865,
                    Stats = {
                        Damage = 4,
                        Cooldown = 0.325,
                        Range = 30,
                        Detections = {[Enum.StatusEffect.LeadDetection] = true},
                        Attributes = {
                            SpotlightRadius = 3.5,
                            FireStats = {BurnTime = 2, BurnTick = 0.25, BurnDamage = 1},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Spotlight</b></font>",
                            Content = {
                                {Text = "Spotlight Radius: 2 > 3.5"},
                                {Text = "Burn Damage: 1"},
                                {Text = "Burn Time: 2s"},
                                {Text = "Burn Tick: 0.25s"},
                            },
                        },
                    },
                },
                {
                    Title = "Non OSHA Compliant",
                    Image = 83428900433369,
                    Cost = 4820,
                    Stats = {
                        Damage = 8,
                        Cooldown = 0.325,
                        Range = 35,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            ["HiddenExposed"] = true,
                        },
                        Attributes = {
                            SpotlightRadius = 4.5,
                            FireStats = {BurnTime = 2, BurnTick = 0.25, BurnDamage = 2},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocks <font color=\"rgb(255,185,0)\"><b>Hidden Reveal</b></font>",
                            Content = {
                                {
                                    Text = "Spotlight Technician now reveals hidden enemies that are in its radius.",
                                },
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Spotlight</b></font>",
                            Content = {{Text = "Spotlight Radius: 3.5 > 4.5"}, {Text = "Burn Damage: 1 > 2"}},
                        },
                    },
                },
                {
                    Title = "Backstage Crew",
                    Image = 120016900424836,
                    Cost = 12560,
                    Stats = {
                        Damage = 10,
                        Cooldown = 0.2,
                        Range = 35,
                        Detections = {},
                        Attributes = {FireStats = {BurnTime = 4, BurnTick = 0.25, BurnDamage = 5}},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Spotlight</b></font>",
                            Content = {{Text = "Burn Damage: 2 > 5"}, {Text = "Burn Time: 2s > 4s"}},
                        },
                    },
                },
                {
                    Title = "Certified Spotlight Operator",
                    Image = 120615607474754,
                    Cost = 19320,
                    Stats = {
                        Damage = 14,
                        Cooldown = 0.2,
                        Range = 40,
                        MaxAmmo = 1800,
                        Detections = {},
                        Attributes = {
                            SpotlightRadius = 5.5,
                            FireStats = {BurnTime = 6, BurnTick = 0.25, BurnDamage = 10},
                            ConfuseStats = {Length = 2.5, Debounce = 7.5},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Spotlight</b></font>",
                            Content = {
                                {Text = "Spotlight Radius: 4.5 > 5.5"},
                                {Text = "Burn Damage: 5 > 10"},
                                {Text = "Burn Time: 4s > 6s"},
                                {Text = "Triggers confusion after 1800 damage"},
                                {Text = "Confusion Duration: 2.5s"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A cliff tower with great range that deals damage over time with burn, applies confusion, and helps to combat hidden enemies.",
        Height = 0,
        BoundarySize = 2.25,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Normal DPS"] = TowerDPS.Default,
            ["Burn DPS"] = TowerDPS.Burn,
            ["Total DPS"] = TowerDPS.DamageOverTime,
        },
        Role = Enum.TowerRole.Support,
        Class = Enum.TowerType.Cliff,
        SkinData = {Pirate = {Icon = 0, Rarity = Enum.SkinRarity.Rare}},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 104725482455139,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}