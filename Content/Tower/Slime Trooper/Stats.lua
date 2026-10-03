-- Script path: ReplicatedStorage.Content.Tower.Slime Trooper.Stats
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Title = "Stickier Slime",
                    Image = 120435945409322,
                    Cost = 250,
                    Stats = {
                        Cooldown = 2.25,
                        Range = 13,
                        Damage = 10,
                        Attributes = {Slowness = 17.5, SlowTime = 3, ClipSize = 1, ReloadTime = 1.7},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Slime</b></font>",
                            Content = {{Text = "Slowdown Amount: 15% > 17.5%"}},
                        },
                    },
                },
                {
                    Title = "Heavy Globs",
                    Image = 121720184434292,
                    Cost = 650,
                    Stats = {
                        Cooldown = 2.25,
                        Range = 15.5,
                        Damage = 20,
                        Attributes = {Slowness = 17.5, SlowTime = 3, ClipSize = 1, ReloadTime = 1.7},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Title = "Potent Goo",
                    Image = 105885379664792,
                    Cost = 2100,
                    Stats = {
                        Cooldown = 2.25,
                        Range = 17,
                        Damage = 46,
                        Attributes = {Slowness = 20, SlowTime = 5, ClipSize = 1, ReloadTime = 1.2},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Slime</b></font>",
                            Content = {{Text = "Slowdown Amount: 17.5% > 20%"}, {Text = "Slowdown Time: 3s > 5s"}},
                        },
                    },
                },
                {
                    Title = "Explosive Goo",
                    Image = 90312326197262,
                    Cost = 4650,
                    Stats = {
                        Cooldown = 1.8,
                        Range = 17,
                        Damage = 64,
                        Attributes = {
                            Slowness = 22.5,
                            SlowTime = 5,
                            ExplosionRadius = 2.5,
                            ClipSize = 1,
                            ReloadTime = 0.7,
                        },
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Explosive Slime</b></font>",
                            Content = {
                                {Text = "Slime now explodes on impact, dealing area damage"},
                                {Text = "Explosive Radius: 2.5"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Slime</b></font>",
                            Content = {{Text = "Slowdown Amount: 20% > 22.5%"}},
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Slime Time</b></font>",
                            Content = {{Text = "Slime out the enemies!"}},
                        },
                    },
                },
            },
            Defaults = {
                Price = 500,
                Range = 11.5,
                Cooldown = 3,
                Damage = 10,
                Attributes = {Slowness = 15, SlowTime = 3, ClipSize = 1, ReloadTime = 2.2},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
        },
    },
    Properties = {
        Description = "It's slime time! Fires globs of slime that stick to and slows down enemies!",
        BoundarySize = 1.5,
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Support,
        Class = Enum.TowerType.Ground,
        Category = Enum.TowerCategory.Starter,
        Price = {Value = 300, Type = Enum.CurrencyType.Coins},
        SkinData = {
            Default = {Icon = 0, Rarity = Enum.SkinRarity.Common},
            Anemone = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
    },
}