-- Script path: ReplicatedStorage.Content.Tower.Rocketeer.Stats
-- Decompile time: 1.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 2000,
                Damage = 30,
                Cooldown = 3.75,
                Range = 20,
                Limit = 8,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {
                    ExplosionRadius = 3,
                    Deadzone = 9,
                    Count = 1,
                    Knockback = 0,
                    ProjSpeed = 25,
                    Accuracy = 1,
                },
            },
            Upgrades = {
                {
                    Title = "Faster Reloading",
                    Image = 84475876520565,
                    Cost = 600,
                    Stats = {
                        Damage = 30,
                        Cooldown = 3,
                        Range = 20,
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                        },
                        Attributes = {ExplosionRadius = 3, Deadzone = 9, Count = 1, Knockback = 0},
                    },
                },
                {
                    Title = "Heavier Payload",
                    Image = 76900038470572,
                    Cost = 1800,
                    Stats = {
                        Damage = 50,
                        Cooldown = 3,
                        Range = 22.5,
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                        },
                        Attributes = {ExplosionRadius = 4, Deadzone = 9, Count = 1, Knockback = 0},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded Explosive Radius",
                            Header = "Passive Ability",
                            Content = {{Text = "Explosive Radius: 3 → 4"}},
                        },
                    },
                },
                {
                    Title = "Explosive Risks",
                    Image = 103303357353083,
                    Cost = 6000,
                    Stats = {
                        Damage = 95,
                        Cooldown = 2.75,
                        Range = 22.5,
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                        },
                        Attributes = {ExplosionRadius = 5, Deadzone = 9, Count = 1, Knockback = 0},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded Explosive Radius",
                            Header = "Passive Ability",
                            Content = {{Text = "Explosive Radius: 4 → 5"}},
                        },
                    },
                },
                {
                    Title = "Missile Maelstrom",
                    Image = 133610100963797,
                    Cost = 18500,
                    Stats = {
                        Damage = 95,
                        Cooldown = 4.5,
                        Range = 24,
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                        },
                        Attributes = {
                            ExplosionRadius = 5,
                            Deadzone = 9,
                            Count = 4,
                            SpreadAngle = 100,
                            Knockback = 0,
                            Accuracy = 0.25,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Quad Targeting",
                            Header = "Passive Ability",
                            Content = {
                                {Text = "Missile Count: 1 → 4"},
                                {Text = "Spread Angle: 100°"},
                                {Text = "Slightly decreased accuracy"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Shoot rockets that deal a large amount of damage across multiple enemies.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Counted},
        Price = {Value = 2500, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        Role = Enum.TowerRole.Defense,
        SkinData = {
            Pumpkin = {Icon = 103379695538461, Rarity = Enum.SkinRarity.Event},
            Steampunk = {Icon = 132152532289629, Rarity = Enum.SkinRarity.Uncommon},
            Toy = {Icon = 125539379459445, Rarity = Enum.SkinRarity.Common},
            Bosanka = {Icon = 97562066551955, Rarity = Enum.SkinRarity.Common},
            ["Dark Matter"] = {Icon = 82619969731160, Rarity = Enum.SkinRarity.Rare},
            Xmas = {Icon = 94263168154969, Rarity = Enum.SkinRarity.Event},
            Lunar = {Icon = 106246370633835, Rarity = Enum.SkinRarity.Rare},
            Fortress = {Icon = 104029788106610, Rarity = Enum.SkinRarity.Rare},
            Lovestriker = {Icon = 122261435962808, Rarity = Enum.SkinRarity.Legendary},
            Duck = {Icon = 106999111667907, Rarity = Enum.SkinRarity.Legendary},
            Ghost = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
            Trombone = {Icon = 96060254790033, Rarity = Enum.SkinRarity.Uncommon},
            Leprechaun = {Icon = 127482628451153, Rarity = Enum.SkinRarity.Legendary},
            Tiderunner = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
            Beach = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 82581428525440,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.792526803190927, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}