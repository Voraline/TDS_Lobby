-- Script path: ReplicatedStorage.Content.Tower.Toxic Gunner.Stats
-- Decompile time: 1.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 102914016108099,
                    Title = "Faster Reloading",
                    Cost = 200,
                    Stats = {Range = 10, Damage = 1, Attributes = {ReloadSpeed = 6}},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Reload</b></font>",
                            Content = {{Text = "Reload Speed: 1.2s > 0.6s"}},
                        },
                    },
                },
                {
                    Image = 128999577258285,
                    Title = "Poisonous Bullets",
                    Cost = 800,
                    Stats = {
                        Range = 14,
                        Damage = 1,
                        Attributes = {
                            Burst = 8,
                            PoisonDamage = 3,
                            PoisonLength = 6,
                            ReloadSpeed = 6,
                            Slowness = 20,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Weapon</b></font>",
                            Header = "Weapon Upgrade",
                            Content = {
                                {Text = "Burst: 4 > 8"},
                                {Text = "Poison Damage: 1 > 3"},
                                {Text = "Slowness on Hit: 20%"},
                            },
                        },
                    },
                },
                {
                    Image = 113002281422021,
                    Title = "Sinister Gear",
                    Cost = 3500,
                    Stats = {
                        Range = 14,
                        Cooldown = 0.12,
                        Damage = 4,
                        Attributes = {
                            Burst = 20,
                            PoisonDamage = 3,
                            PoisonLength = 6,
                            Slowness = 20,
                            ReloadSpeed = 6,
                            DefenseMelt = 3,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Weapon</b></font>",
                            Header = "Weapon Upgrade",
                            Content = {{Text = "Burst: 8 > 20"}, {Text = "Defense Melt: 3"}},
                        },
                    },
                },
                {
                    Image = 119544300071007,
                    Title = "Going Nuclear!",
                    Cost = 14000,
                    Stats = {
                        Range = 18,
                        Damage = 8,
                        Cooldown = 0.12,
                        Attributes = {
                            Burst = 10,
                            PoisonLength = 10,
                            ReloadSpeed = 0,
                            PoisonDamage = 10,
                            DefenseMelt = 3,
                            Slowness = 30,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Weapon</b></font>",
                            Header = "Weapon Upgrade",
                            Content = {
                                {Text = "Full Auto Minigun"},
                                {Text = "Poison Damage: 3 > 10"},
                                {Text = "Poison Length: 6 > 10"},
                                {Text = "Slowness on Hit: 20% > 30%"},
                            },
                        },
                    },
                },
            },
            Defaults = {
                Price = 525,
                Range = 10,
                Cooldown = 0.12,
                Damage = 1,
                Attributes = {
                    Burst = 4,
                    ReloadSpeed = 12,
                    PoisonLength = 6,
                    PoisonDamage = 1,
                    PoisonTick = 1,
                    DefenseMelt = 0,
                    Slowness = 10,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
        },
    },
    Properties = {
        Description = "Shoot a burst of poison bullets that slow down enemies!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Gun DPS"] = TowerDPS.Burst,
            ["Poison DPS"] = TowerDPS.Poison,
            ["Total DPS"] = TowerDPS.BurstDamageOverTime,
        },
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 90181586755701,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        SkinData = {Phantom = {Icon = 6883307471, Rarity = Enum.SkinRarity.Legendary}},
        Category = Enum.TowerCategory.Exclusive,
    },
}