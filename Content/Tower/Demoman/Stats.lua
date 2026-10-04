-- Script path: ReplicatedStorage.Content.Tower.Demoman.Stats
-- Decompile time: 1.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 2.6,
                Damage = 8,
                Price = 700,
                Range = 10,
                Attributes = {AimTime = 1, ExplosionRadius = 4.5, MustAim = true, Velocity = 30},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 300,
                    Image = 5523227714,
                    Title = "Faster Throwing",
                    Stats = {Cooldown = 1.9, Range = 12, Damage = 8, Attributes = {ExplosionRadius = 4.5}},
                },
                {
                    Cost = 950,
                    Image = 5523227714,
                    Title = "Ullapool Caber",
                    Stats = {
                        Damage = 18,
                        Attributes = {ExplosionRadius = 5},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Extras = {"Explosion Radius: 4.5 -> 5"},
                    },
                },
                {
                    Cost = 2400,
                    Image = 5523228733,
                    Title = "Loch-n-Load",
                    Stats = {
                        Cooldown = 1.5,
                        Damage = 25,
                        Range = 14,
                        Attributes = {MustAim = false, Velocity = 20, ExplosionRadius = 5.5},
                        Extras = {"Explosion Radius: 5 -> 5.5", "Faster Projectile", "No Aim Time"},
                    },
                },
                {
                    Cost = 5500,
                    Image = 5523229364,
                    Title = "Expert's Ordnance",
                    Stats = {
                        Cooldown = 1,
                        Damage = 35,
                        Range = 16,
                        Attributes = {ExplosionRadius = 5.5},
                        Extras = {"", "", ""},
                    },
                },
            },
        },
        Golden = {
            Defaults = {
                Cooldown = 1.95,
                Damage = 10,
                Price = 875,
                Range = 12,
                Attributes = {AimTime = 0.8, ExplosionRadius = 4.5, MustAim = true, Velocity = 25},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 200,
                    Image = 5523227714,
                    Title = "Faster Pitch",
                    Stats = {Cooldown = 1.8, Range = 13.5, Damage = 10, Attributes = {ExplosionRadius = 4.5}},
                },
                {
                    Cost = 1150,
                    Image = 5523227714,
                    Title = "Golden Handshake",
                    Stats = {
                        Damage = 18,
                        Attributes = {ExplosionRadius = 5},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Extras = {"Explosion Radius: 4.5 -> 5"},
                    },
                },
                {
                    Cost = 2650,
                    Image = 5523228733,
                    Title = "Loose Cannon",
                    Stats = {
                        Cooldown = 1.1,
                        Damage = 25,
                        Range = 15,
                        Attributes = {MustAim = false, Velocity = 20, ExplosionRadius = 5.5},
                        Extras = {"Faster Projectile", "No Aim Time", "Explosion Radius: 5 -> 5.5"},
                    },
                },
                {
                    Cost = 7750,
                    Image = 5523229364,
                    Title = "A Thousand Exploding Suns",
                    Stats = {
                        Cooldown = 0.45,
                        Damage = 25,
                        Range = 17,
                        Attributes = {ExplosionRadius = 5.5},
                        Detections = {[Enum.StatusEffect.StunImmune] = true},
                        Extras = {"", "", ""},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Ka-boooom! A great early game splash tower.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 200, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Military = {Icon = 3959453189, Rarity = Enum.SkinRarity.Uncommon},
            Blue = {Icon = 3959453189, Rarity = Enum.SkinRarity.Common},
            Green = {Icon = 3959449848, Rarity = Enum.SkinRarity.Common},
            Red = {Icon = 3959449848, Rarity = Enum.SkinRarity.Common},
            Yellow = {Icon = 3959449848, Rarity = Enum.SkinRarity.Common},
            Pirate = {Icon = 3959449848, Rarity = Enum.SkinRarity.Common},
            Fortress = {Icon = 3959449848, Rarity = Enum.SkinRarity.Uncommon},
            Pumpkin = {Icon = 3959449848, Rarity = Enum.SkinRarity.Exclusive},
            Ducky = {Icon = 112748767260662, Rarity = Enum.SkinRarity.Uncommon},
            Ghost = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
            Egg = {Icon = 127330371379323, Rarity = Enum.SkinRarity.Uncommon},
            Crew = {Icon = 113919822910484, Rarity = Enum.SkinRarity.Exclusive},
            Golden = {Icon = 100800618077150, Rarity = Enum.SkinRarity.Golden},
            Beach = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883281690,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
    },
}