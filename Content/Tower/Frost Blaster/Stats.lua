-- Script path: ReplicatedStorage.Content.Tower.Frost Blaster.Stats
-- Decompile time: 1.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 850,
                Range = 12,
                Cooldown = 0.8,
                Damage = 4,
                Limit = 12,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
                Attributes = {
                    MaxHits = 2,
                    ProjectileSpeed = 60,
                    DebuffLength = 0.2,
                    FreezeTime = 0.2,
                    SlowPercent = 15,
                    MaxSlow = 15,
                    DebuffDamage = 0,
                    TickRate = 0.25,
                    DefenseMelt = 0,
                    CanFreeze = true,
                },
            },
            Upgrades = {
                {
                    Image = 15686412605,
                    Title = "Endurance",
                    Cost = 350,
                    Stats = {
                        Cooldown = 0.6,
                        Range = 15,
                        Damage = 4,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {DebuffLength = 0.3, FreezeTime = 0.3},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Freeze</b></font>",
                            Content = {
                                {Text = "🧊 Freeze Time: 0.2s -> 0.3s"},
                                {Text = "🧊 Chill Time: 0.2s -> 0.3s"},
                            },
                        },
                    },
                },
                {
                    Image = 15686412501,
                    Title = "Piercing Cold",
                    Cost = 1500,
                    Stats = {
                        Damage = 8,
                        Range = 15,
                        Attributes = {MaxHits = 3, SlowPercent = 25, MaxSlow = 25, DefenseMelt = 15},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Freeze</b></font>",
                            Content = {
                                {Text = "Slowdown Per Hit: 15% -> 25%"},
                                {Text = "Max Hits: 2 -> 3"},
                                {Text = "Now melts defense. 15% per hit"},
                            },
                        },
                    },
                },
                {
                    Image = 15686412400,
                    Title = "Subzero Hero",
                    Cost = 3800,
                    Stats = {Damage = 12, Cooldown = 0.45, Range = 17.5, Extras = {}},
                },
                {
                    Image = 15686412306,
                    Title = "Hyper Icer Rifle",
                    Cost = 9500,
                    Stats = {
                        Damage = 53,
                        Range = 22.5,
                        Cooldown = 0.9,
                        Attributes = {
                            DebuffLength = 0.6,
                            FreezeTime = 0.6,
                            ProjectileSpeed = 90,
                            MaxHits = 4,
                            DefenseMelt = 35,
                        },
                        Extras = {
                            "🧊 Freeze Time: 0.3s -> 0.6s",
                            "🧊 Chill Time: 0.3s -> 0.6s",
                            "Faster projectile speed",
                            "Now melts 35% defense per hit",
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Freeze</b></font>",
                            Content = {
                                {Text = "🧊 Freeze Time: 0.3s -> 0.6s"},
                                {Text = "🧊 Chill Time: 0.3s -> 0.6s"},
                                {Text = "Projectile Speed: 60 -> 90"},
                                {Text = "Defense Melt: 15% -> 35%"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Pierce multiple enemies with an ice rifle, freezing them in place!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883288730,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.792526803190927, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}