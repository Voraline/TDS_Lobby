-- Script path: ReplicatedStorage.Content.Tower.Tesla.Stats
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 5750,
                Range = 17,
                Cooldown = 2,
                Damage = 55,
                Limit = 2,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
                Attributes = {
                    MaxStun = 0.3,
                    MinStun = 0.3,
                    ChainRange = 12,
                    MaxHits = 2,
                    CanSmite = false,
                    SmiteRadius = 5,
                    SmiteDamage = 200,
                },
            },
            Upgrades = {
                {
                    Cost = 4314,
                    Image = 91355001385794,
                    Title = "Kite in the Wind",
                    Stats = {
                        Cooldown = 2,
                        Damage = 70,
                        Range = 17,
                        Attributes = {MaxStun = 0.45, MinStun = 0.45, MaxHits = 3},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shock</b></font>",
                            Content = {{Text = "Max Hits: 2 > 3"}, {Text = "Shock Stun: 0.3s > 0.45s"}},
                        },
                    },
                },
                {
                    Cost = 10007,
                    Image = 75051178841119,
                    Title = "Self-Sustaining Battery",
                    Stats = {
                        Cooldown = 1.6,
                        Damage = 70,
                        MaxAmmo = 9,
                        Range = 18.5,
                        Attributes = {
                            ChainRange = 16,
                            MaxStun = 0.45,
                            MinStun = 0.45,
                            MaxHits = 3,
                            CanSmite = true,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocks <font color=\"rgb(255,185,0)\"><b>Smite</b></font>",
                            Content = {
                                {
                                    Text = "Smites currently targeted enemy in the Tesla's chain when the meter reaches max. Gains 1 meter charge per enemy hit.",
                                },
                                {Text = "Deals 200 damage per hit with a radius of 5"},
                                {Text = "Meter Amount: 9"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shock</b></font>",
                            Content = {{Text = "Chain Range: 12 > 16"}},
                        },
                    },
                },
                {
                    Cost = 24000,
                    Image = 106313416363708,
                    Title = "Auric Quantum Cooling Cell",
                    Stats = {
                        Cooldown = 1.6,
                        Damage = 90,
                        MaxAmmo = 12,
                        Range = 20,
                        Attributes = {
                            MaxStun = 0.6,
                            MinStun = 0.6,
                            MaxHits = 3,
                            SmiteDamage = 475,
                            SmiteRadius = 5.5,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Smite</b></font>",
                            Content = {
                                {Text = "Smite Damage: 200 > 475"},
                                {Text = "Smite Radius: 5 > 5.5"},
                                {Text = "Meter Amount: 9 > 12"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shock</b></font>",
                            Content = {{Text = "Stun Time: 0.45 > 0.6"}},
                        },
                    },
                },
                {
                    Cost = 55000,
                    Image = 109247042334349,
                    Title = "Kimat's Bite",
                    Stats = {
                        Cooldown = 1.4,
                        Damage = 125,
                        MaxAmmo = 15,
                        Range = 20,
                        Attributes = {
                            ChainRange = 20,
                            MaxStun = 0.85,
                            MinStun = 0.85,
                            MaxHits = 3,
                            SmiteRadius = 7.5,
                            SmiteDamage = 650,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Smite</b></font>",
                            Content = {{Text = "Smite Damage: 475 > 650"}, {Text = "Smite Radius: 5.5 > 7.5"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shock</b></font>",
                            Content = {{Text = "Shock Stun: 0.6s > 0.85s"}},
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A strong crowd controller with SHOCKING results! Builds up a meter to smite enemies from above.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        BoundarySize = 2,
        DPS_Display = {DPS = TowerDPS.Default, ["Smite DPS"] = TowerDPS.Smite},
        Role = Enum.TowerRole.Defense,
        Price = {Value = 6000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Garden = {Icon = 95196748429400, Rarity = Enum.SkinRarity.Legendary},
            Voidborne = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, -0.5, -4),
            Icon = 92920315130007,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}