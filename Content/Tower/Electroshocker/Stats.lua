-- Script path: ReplicatedStorage.Content.Tower.Electroshocker.Stats
-- Decompile time: 1.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.35,
                Damage = 5,
                Limit = 7,
                Price = 650,
                Range = 10,
                Attributes = {
                    ChainRange = 10,
                    DefenseMelt = 0,
                    MaxHits = 2,
                    MaxStun = 0.1,
                    MinStun = 0.1,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 275,
                    Image = 4675534331,
                    Title = "Higher Voltage",
                    Stats = {
                        Cooldown = 1.15,
                        Damage = 6,
                        Range = 12,
                        Attributes = {
                            ChainRange = 10,
                            DefenseMelt = 0,
                            MaxHits = 2,
                            MaxStun = 0.1,
                            MinStun = 0.1,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 950,
                    Image = 3280081327,
                    Title = "Improved Handling",
                    Stats = {
                        Cooldown = 1.15,
                        Damage = 8,
                        Range = 13,
                        Attributes = {
                            ChainRange = 10,
                            DefenseMelt = 0,
                            MaxHits = 3,
                            MaxStun = 0.1,
                            MinStun = 0.1,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Max Hits: 2 -> 3"},
                    },
                },
                {
                    Cost = 2400,
                    Image = 4675521746,
                    Title = "Faraday's Vest",
                    Stats = {
                        Cooldown = 1.15,
                        Damage = 20,
                        Range = 13,
                        Attributes = {ChainRange = 12.5, MaxHits = 3, MaxStun = 0.1, MinStun = 0.1},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Chain Range: 10 -> 12.5"},
                    },
                },
                {
                    Cost = 4000,
                    Image = 4675504505,
                    Title = "Shock Force",
                    Stats = {
                        Cooldown = 2.5,
                        Damage = 60,
                        Range = 13,
                        Attributes = {ChainRange = 15, MaxHits = 4, MaxStun = 0.15, MinStun = 0.15},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Chain Range: 12.5 -> 15", "Stun Time: 0.1s -> 0.15s", "Max Hits: 3 -> 4"},
                    },
                },
                {
                    Cost = 10000,
                    Image = 4675504640,
                    Title = "Zeus Cannon",
                    Stats = {
                        Cooldown = 2.5,
                        Damage = 90,
                        Range = 15,
                        Attributes = {
                            ChainRange = 15,
                            DefenseMelt = 20,
                            MaxHits = 6,
                            MaxStun = 0.25,
                            MinStun = 0.25,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Now Reduces 20% Defense.", "Max Hits: 4 -> 6", "Stun Time: 0.15s -> 0.25s"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Zap! An early game tower that can stun enemies at higher levels.",
        Height = 0,
        Level = 10,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Default},
        Role = Enum.TowerRole.Defense,
        Price = {Value = 2500, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Classic = {Icon = 17744633836, Rarity = Enum.SkinRarity.Rare},
            Valentines = {Icon = 4690285744, Rarity = Enum.SkinRarity.Event},
            Bunny = {Icon = 4863544757, Rarity = Enum.SkinRarity.Event},
            Hazmat = {Icon = 4961735492, Rarity = Enum.SkinRarity.Common},
            Ghost = {Icon = 4961735492, Rarity = Enum.SkinRarity.Event},
            Ducky = {Icon = 4961735492, Rarity = Enum.SkinRarity.Rare},
            Vigilante = {Icon = 4088821168, Rarity = Enum.SkinRarity.Uncommon},
            Frankenstein = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            TeeVee = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            ["Dark Frost"] = {Icon = 92937669662901, Rarity = Enum.SkinRarity.Rare},
            Korblox = {Icon = 122538908879439, Rarity = Enum.SkinRarity.Event},
            Jellyfish = {Icon = 85663070964840, Rarity = Enum.SkinRarity.Legendary},
            Banned = {Icon = 85663070964840, Rarity = Enum.SkinRarity.Exclusive},
            Lovestriker = {Icon = 106374635483378, Rarity = Enum.SkinRarity.Uncommon},
            Easter = {Icon = 85351264477094, Rarity = Enum.SkinRarity.Rare},
            Beach = {Icon = 85351264477094, Rarity = Enum.SkinRarity.Uncommon},
            ["Black Cat"] = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883284370,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}