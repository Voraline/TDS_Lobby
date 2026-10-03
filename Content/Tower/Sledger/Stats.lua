-- Script path: ReplicatedStorage.Content.Tower.Sledger.Stats
-- Decompile time: 1.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 6,
                Price = 950,
                Range = 7,
                Cooldown = 1.2,
                Damage = 10,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
                Attributes = {
                    FreezeBonus = false,
                    MaxHits = 3,
                    HitboxAngle = 60,
                    DebuffLength = 4,
                    SlowPercent = 15,
                    MaxSlow = 30,
                    DebuffDamage = 0,
                    TickRate = 0.25,
                    DefenseMelt = 0,
                    CanFreeze = false,
                    FreezeTime = 0,
                    Aftershock = false,
                },
            },
            Upgrades = {
                {
                    Title = "Heavier Swings",
                    Image = 127760357589893,
                    Cost = 400,
                    Stats = {Damage = 14, Attributes = {MaxHits = 3, FreezeTime = 1.5, SlowPercent = 15}},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Max Hits</b></font>",
                            Content = {{Text = "Max Hits: 3 -> 4"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {{Text = "Slow Debuff: 10% -> 15%"}},
                        },
                    },
                },
                {
                    Title = "Better Sledge",
                    Image = 129569296351035,
                    Cost = 1650,
                    Stats = {
                        Cooldown = 1.2,
                        Range = 7,
                        Damage = 28,
                        Attributes = {MaxHits = 4},
                        Detections = {[Enum.StatusEffect.LeadDetection] = true},
                        Extra = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Max Hits</b></font>",
                            Content = {{Text = "Max Hits: 4 -> 5"}},
                        },
                    },
                },
                {
                    Title = "Freezing Point",
                    Image = 90580826193030,
                    Cost = 3200,
                    Stats = {
                        Damage = 55,
                        Range = 7,
                        Attributes = {CanFreeze = true, MaxSlow = 35, SlowPercent = 35, FreezeTime = 0.85},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {
                                {Text = "Slow Debuff: 15% -> 35%"},
                                {Text = "Max Slow Debuff: 30% -> 35%"},
                                {Text = "🧊 Freeze enemies on max chill (0.85s)"},
                            },
                        },
                    },
                },
                {
                    Title = "Ice Breaker",
                    Image = 87639607914634,
                    Cost = 8250,
                    Stats = {
                        Damage = 105,
                        Range = 7.5,
                        Cooldown = 1.2,
                        Attributes = {
                            FreezeBonus = true,
                            MaxHits = 4,
                            MaxSlow = 35,
                            SlowPercent = 35,
                            DebuffLength = 5,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock Ice Breaker",
                            Header = "Passive Ability",
                            Content = {{Text = "Deal x2 damage to frozen and chilled enemies."}},
                        },
                    },
                },
                {
                    Title = "Arctic Aftershocks",
                    Image = 92990655062231,
                    Cost = 16000,
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 150,
                        Range = 7.5,
                        Attributes = {
                            MaxHits = 7,
                            FreezeTime = 1.2,
                            DebuffLength = 5,
                            SlowPercent = 35,
                            MaxSlow = 35,
                            Aftershock = true,
                            AftershockTime = 0.4,
                            AftershockDamageMult = 0.4,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock Aftershock",
                            Content = {
                                {Text = "Aftershock Delay: 0.4s"},
                                {Text = "Applies 35% base damage"},
                                {Text = "Applies chill"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Max Hits</b></font>",
                            Content = {{Text = "Max Hits: 5 -> 7"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {{Text = "Slow Debuff: 17.5% -> 35%"}, {Text = "Freeze Time: 0.85 -> 1.2"}},
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Bash zombies with powerful blows and freeze them.",
        BoundarySize = 1,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Normal DPS"] = TowerDPS.Default,
            ["Aftershock DPS"] = TowerDPS.Aftershock,
            ["Frozen DPS"] = TowerDPS.Frozen,
            ["Total DPS"] = TowerDPS.SledgerTotal,
            ["Frozen Total DPS"] = TowerDPS.SledgerFrozenTotal,
        },
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            ["Brave Soul"] = {Icon = 6883307471, Rarity = Enum.SkinRarity.Legendary},
            Phantom = {Icon = 6883307471, Rarity = Enum.SkinRarity.Legendary},
            Fallen = {Icon = 18961805501, Rarity = Enum.SkinRarity.Legendary},
            Chocolatier = {Icon = 128749730055893, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 75780199539960,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}