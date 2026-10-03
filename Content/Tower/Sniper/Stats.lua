-- Script path: ReplicatedStorage.Content.Tower.Sniper.Stats
-- Decompile time: 1.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 3280081327,
                    Title = "Faster Reloading",
                    Cost = 200,
                    Stats = {Cooldown = 4, Damage = 12},
                },
                {
                    Image = 3280367022,
                    Title = "Geared Up",
                    Cost = 750,
                    Stats = {
                        Damage = 25,
                        Range = 30,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Image = 3280367963,
                    Title = "Frontlines Sniping",
                    Cost = 2000,
                    Stats = {
                        Range = 35,
                        Cooldown = 4,
                        Damage = 60,
                        Detections = {[Enum.StatusEffect.LeadDetection] = true},
                    },
                },
                {
                    Image = 3280368786,
                    Title = "Spec Ops",
                    Cost = 5000,
                    Stats = {Range = 45, Cooldown = 3.2, Damage = 100},
                },
            },
            Defaults = {
                Price = 450,
                Range = 28,
                Cooldown = 5,
                Damage = 10,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    ["StunImmune"] = true,
                },
            },
        },
    },
    Properties = {
        Description = "Shoot enemies from large distances. One of the starter towers.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        BoundarySize = 1.25,
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Defense,
        Price = {Value = 50, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Cliff,
        SkinData = {
            Valentines = {Icon = 4863371866, Rarity = Enum.SkinRarity.Common},
            Blue = {Icon = 4863372115, Rarity = Enum.SkinRarity.Common},
            Bunny = {Icon = 4863374697, Rarity = Enum.SkinRarity.Event},
            Ghillie = {Icon = 4863371676, Rarity = Enum.SkinRarity.Common},
            Red = {Icon = 4863371468, Rarity = Enum.SkinRarity.Common},
            Ducky = {Icon = 4863374697, Rarity = Enum.SkinRarity.Common},
            Silent = {Icon = 4863374697, Rarity = Enum.SkinRarity.Common},
            Davinchi = {Icon = 4863374697, Rarity = Enum.SkinRarity.Event},
            Redemption = {Icon = 4863374697, Rarity = Enum.SkinRarity.Uncommon},
            ["Frost Legion"] = {Icon = 93332491661008, Rarity = Enum.SkinRarity.Common},
            Shrimp = {Icon = 139661519405754, Rarity = Enum.SkinRarity.Common},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.75, 0),
            Icon = 9391771210,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Starter,
    },
}