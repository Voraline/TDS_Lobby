-- Script path: ReplicatedStorage.Content.Tower.Paintballer.Stats-PVP
-- Decompile time: 1.04 ms

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
                    Cost = 125,
                    Stats = {
                        Range = 9.5,
                        Damage = 3,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Image = 3319083300,
                    Title = "Shoulder Pads",
                    Cost = 500,
                    Stats = {
                        Damage = 6,
                        Cooldown = 1.3,
                        Range = 9.5,
                        Extras = {"Explosion Radius = 3.5"},
                        Attributes = {ExplosionRadius = 3.5},
                    },
                },
                {
                    Image = 3280082028,
                    Title = "Double Barrel Gun",
                    Cost = 800,
                    Stats = {Range = 9.5, Cooldown = 0.9, Damage = 8},
                },
                {
                    Image = 3319084508,
                    Title = "Competitive Gear",
                    Cost = 1500,
                    Stats = {
                        Cooldown = 0.75,
                        Damage = 12,
                        Range = 11,
                        Extras = {"Explosion Radius = 4"},
                        Attributes = {ExplosionRadius = 4},
                    },
                },
                {
                    Image = 3319085582,
                    Title = "Paintball Champion",
                    Cost = 3000,
                    Stats = {
                        Damage = 17,
                        Range = 13,
                        Cooldown = 0.6,
                        Extras = {"Explosion Radius = 4.5"},
                        Attributes = {ExplosionRadius = 4.5},
                    },
                },
            },
            Defaults = {
                Price = 200,
                Range = 9,
                Cooldown = 1.6,
                Damage = 2,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
                Attributes = {ExplosionRadius = 3, MaxHits = 4},
            },
        },
    },
    Properties = {
        Description = "Usually, paintball guns aren't really useful in the apocalypse but apparently this one is. Deals splash damage.",
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