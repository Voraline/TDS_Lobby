-- Script path: ReplicatedStorage.Content.Tower.Paintballer.Stats
-- Decompile time: 1.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 3280081327,
                    Title = "Paintball Gear",
                    Cost = 25,
                    Stats = {
                        Range = 9,
                        Damage = 1,
                        Extras = {"Explosion Radius = 3.5"},
                        Attributes = {ExplosionRadius = 3.5, MaxHits = 8},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Image = 3319083300,
                    Title = "Shoulder Pads",
                    Cost = 150,
                    Stats = {
                        Range = 9,
                        Cooldown = 1.4,
                        Damage = 2,
                        Extras = {"Explosion Radius = 4"},
                        Attributes = {ExplosionRadius = 4, MaxHits = 8},
                    },
                },
                {
                    Image = 3280082028,
                    Title = "Double Barrel Gun",
                    Cost = 600,
                    Stats = {
                        Range = 9,
                        Cooldown = 0.7,
                        Damage = 3,
                        Attributes = {ExplosionRadius = 4, MaxHits = 8},
                    },
                },
                {
                    Image = 3319084508,
                    Title = "Competitive Gear",
                    Cost = 1500,
                    Stats = {
                        Cooldown = 0.7,
                        Damage = 8,
                        Range = 10.5,
                        Extras = {"Explosion Radius = 4.5"},
                        Attributes = {ExplosionRadius = 4.5, MaxHits = 8},
                    },
                },
                {
                    Image = 3319085582,
                    Title = "Paintball Champion",
                    Cost = 3600,
                    Stats = {
                        Damage = 20,
                        Range = 10.5,
                        Cooldown = 0.7,
                        Extras = {"Explosion Radius = 5"},
                        Attributes = {ExplosionRadius = 5, MaxHits = 8},
                    },
                },
            },
            Defaults = {
                Price = 100,
                Range = 7.5,
                Cooldown = 1.7,
                Damage = 1,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
                Attributes = {ExplosionRadius = 3, MaxHits = 8},
            },
        },
    },
    Properties = {
        Description = "Usually, paintball guns aren't really useful in the apocalypse but apparently this one... kinda is. Deals splash damage.",
        BoundarySize = 1.25,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {Value = 100, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Green = {Icon = 17766383428, Rarity = Enum.SkinRarity.Common},
            Red = {Icon = 4863572920, Rarity = Enum.SkinRarity.Common},
            Bunny = {Icon = 4863573120, Rarity = Enum.SkinRarity.Event},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6062424209,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.6179938779914944, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
    },
}