-- Script path: ReplicatedStorage.Content.Tower.Demoman.Stats-PVP
-- Decompile time: 0.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.75,
                Damage = 6,
                Price = 575,
                Range = 9,
                Attributes = {AimTime = 1, ExplosionRadius = 4.5, MustAim = true, Velocity = 30},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 150,
                    Image = 0,
                    Title = "Further Throwing",
                    Stats = {Cooldown = 1.5, Range = 11, Damage = 6},
                },
                {
                    Cost = 500,
                    Image = 5523227714,
                    Title = "Steil Grenade",
                    Stats = {Damage = 10, Attributes = {ExplosionRadius = 5.5}},
                },
                {
                    Cost = 1500,
                    Image = 5523228733,
                    Title = "Chinalake",
                    Stats = {
                        Cooldown = 1.35,
                        Damage = 15,
                        Range = 14,
                        Attributes = {MustAim = false, Velocity = 20},
                        Extras = {"Faster Projectile", "No Aim Time"},
                    },
                },
                {
                    Cost = 6000,
                    Image = 5523229364,
                    Title = "Collateral Damage",
                    Stats = {
                        Cooldown = 1,
                        Damage = 34,
                        Range = 16,
                        Attributes = {ExplosionRadius = 5.5},
                        Extras = {"Bigger Explosion"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Ka-boooom! A great splash damage tower for beginners!",
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