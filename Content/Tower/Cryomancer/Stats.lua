-- Script path: ReplicatedStorage.Content.Tower.Cryomancer.Stats
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.2,
                MaxAmmo = 25,
                Damage = 0,
                Price = 250,
                Range = 11,
                Attributes = {
                    HitboxSpeed = 20,
                    MaxHits = 3,
                    ReloadTime = 2,
                    DebuffLength = 2,
                    SlowPercent = 7.5,
                    MaxSlow = 15,
                    DebuffDamage = 0,
                    TickRate = 1,
                    DefenseMelt = 5,
                    CanFreeze = false,
                    FreezeTime = 0.75,
                    TurningSpeed = 4,
                    Width = 1.25,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 200,
                    Image = 15686403377,
                    Title = "Frosty Gear",
                    Stats = {
                        MaxAmmo = 25,
                        Range = 13.5,
                        Attributes = {SlowPercent = 10, MaxSlow = 20, DebuffLength = 3},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Cryo Gun</b></font>",
                            Content = {
                                {Text = "Chill Slowness: 7.5% -> 10%"},
                                {Text = "❄️ Max Slowness: 15% -> 20%"},
                                {Text = "Debuff Duration: 2 -> 3"},
                            },
                        },
                    },
                },
                {
                    Cost = 935,
                    Image = 15686403176,
                    Title = "Freezing Tanks",
                    Stats = {
                        Range = 13.5,
                        MaxAmmo = 50,
                        DebuffLength = 4,
                        Attributes = {DebuffDamage = 3, DefenseMelt = 7},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Cryo Gun</b></font>",
                            Content = {
                                {Text = "Ammo: 25 -> 50"},
                                {Text = "Defense Melt: 5% -> 7%"},
                                {Text = "Chilled Enemies now take tick-based damage"},
                                {Text = "❄️ Tick Damage: 4"},
                            },
                        },
                    },
                },
                {
                    Cost = 2750,
                    Image = 15686403037,
                    Title = "Ice Commando",
                    Stats = {
                        Damage = 3,
                        Attributes = {
                            HitboxWidth = 1.75,
                            DebuffLength = 5,
                            DebuffDamage = 5,
                            SlowPercent = 12.5,
                            MaxHits = 4,
                            MaxSlow = 25,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Cryo Gun</b></font>",
                            Content = {
                                {Text = "Chill Slowness: 10% -> 12.5%"},
                                {Text = "❄️ Max Slowness: 20% -> 25%"},
                                {Text = "Larger Frost Beam (1.25 -> 1.75)"},
                                {Text = "Debuff Duration: 3 -> 5"},
                                {Text = "❄️ Tick Damage: 3 -> 5"},
                            },
                        },
                    },
                },
                {
                    Cost = 6250,
                    Image = 15686402849,
                    Title = "Winter's Fury",
                    Stats = {
                        Damage = 6,
                        Range = 15,
                        MaxAmmo = 70,
                        Attributes = {
                            MaxHits = 6,
                            MaxSlow = 25,
                            DebuffDamage = 10,
                            CanFreeze = true,
                            Width = 2.25,
                            ReloadTime = 1.25,
                            DefenseMelt = 10,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Cryo Gun</b></font>",
                            Content = {
                                {Text = "Ammo: 50 -> 70"},
                                {Text = "Even Larger Frost Beam (1.75 -> 2.25)"},
                                {Text = "❄️ Tick Damage: 5 -> 10"},
                                {Text = "Max Hits: 4 -> 6"},
                                {Text = "Reload Time: 2 -> 1.25"},
                                {Text = "Defense Melt: 7% -> 10%"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Chill and freeze hordes of enemies in a wave of frost.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Normal DPS"] = TowerDPS.Ammo,
            ["Chill DPS"] = TowerDPS.Debuff,
            ["Total DPS"] = TowerDPS.AmmoDamageOverTime,
        },
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.375, 0),
            Icon = 6883301271,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.6651914291880923, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        SkinData = {["Krampus Slayer"] = {Icon = 4056868908, Rarity = Enum.SkinRarity.Event}},
        Category = Enum.TowerCategory.Exclusive,
    },
}