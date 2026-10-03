-- Script path: ReplicatedStorage.Content.Tower.Accelerator.Stats-PVP
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.2,
                Damage = 10,
                Limit = 8,
                MaxAmmo = 300,
                Price = 4250,
                Range = 18,
                Attributes = {ChargeTime = 2.5, LaserCooldown = 2, LaserTime = 6},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 750,
                    Image = 11821094308,
                    Range = 20,
                    MaxAmmo = 300,
                    Title = "Extra Juice",
                    Stats = {
                        Damage = 13,
                        Attributes = {LaserTime = 4},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Cost = 2000,
                    Image = 11821094198,
                    Title = "Second Energy Canister",
                    Stats = {
                        MaxAmmo = 600,
                        Range = 18,
                        Damage = 13,
                        Attributes = {LaserTime = 8},
                        Extras = {"Overcharge: 300 -> 600"},
                    },
                },
                {
                    Cost = 4500,
                    Image = 11821093989,
                    Title = "Powerhouse Armor",
                    Stats = {
                        Damage = 30,
                        MaxAmmo = 600,
                        Cooldown = 0.15,
                        Range = 20,
                        Attributes = {LaserTime = 3},
                        Extras = {},
                    },
                },
                {
                    Cost = 12000,
                    Image = 11821093828,
                    Title = "Supercharger",
                    Stats = {
                        Cooldown = 0.1,
                        Damage = 28,
                        MaxAmmo = 1280,
                        Range = 20,
                        Extras = {"Overcharge: 600 -> 1280", "Faster Charge"},
                        Attributes = {ChargeTime = 1.5, LaserTime = 4.8},
                    },
                },
                {
                    Cost = 28500,
                    Image = 11821093672,
                    Title = "Vessel Of Infinite Destruction",
                    Stats = {
                        Cooldown = 0.1,
                        Damage = 72,
                        MaxAmmo = 2400,
                        Range = 23,
                        Attributes = {ChargeTime = 1.5, LaserTime = 2},
                        Extras = {"Overcharge: 1280 -> 2400"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Charge a laser and release massive damage at deadly rates!",
        Height = 0,
        Level = 50,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Accelerator},
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 2500,
            PreviewText = "REACH LEVEL 50 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Gems,
            Eligible = function(a1) -- Line: 129 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 50 <= Level.Value
            end,
        },
        Class = Enum.TowerType.Ground,
        SkinData = {
            Mage = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Eclipse = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Cupid = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            ["Ice Witch"] = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Nuclear = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Navy = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Red = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Ducky = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Vigilante = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Plushie = {Icon = 4088821168, Rarity = Enum.SkinRarity.Exclusive},
            ["Ghost Buster"] = {Icon = 4088821168, Rarity = Enum.SkinRarity.Exclusive},
            Legend = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Elite = {Icon = 4343065951, Rarity = Enum.SkinRarity.Legendary},
            ["Speaker Titan"] = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Senator = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Dank = {Icon = 18549604688, Rarity = Enum.SkinRarity.Legendary},
            Fallen = {Icon = 18848269402, Rarity = Enum.SkinRarity.Legendary},
            ["Patient Zero"] = {Icon = 88972169285855, Rarity = Enum.SkinRarity.Exclusive},
            Disco = {Icon = 96135720673651, Rarity = Enum.SkinRarity.Legendary},
            Octopus = {Icon = 138359133170089, Rarity = Enum.SkinRarity.Legendary},
            Champion = {Icon = 129272736506998, Rarity = Enum.SkinRarity.Ultimate},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883268397,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Hardcore,
    },
}