-- Script path: ReplicatedStorage.Content.Tower.Accelerator.Stats
-- Decompile time: 1.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.25,
                Damage = 12,
                Limit = 5,
                MaxAmmo = 9000,
                Price = 7500,
                Range = 19,
                Attributes = {ChargeTime = 6.5, LaserCooldown = 2.5, LaserTime = 6},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 2000,
                    Image = 11821094308,
                    Title = "Extra Juice",
                    Stats = {
                        Damage = 15,
                        MaxAmmo = 11250,
                        Attributes = {LaserTime = 4},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Extras = {"Overcharge: 9000 -> 11250"},
                    },
                },
                {
                    Cost = 6000,
                    Image = 11821094198,
                    Title = "Second Energy Canister",
                    Stats = {
                        Damage = 25,
                        MaxAmmo = 18750,
                        Range = 21,
                        Attributes = {LaserTime = 8, ChargeTime = 5.5},
                        Extras = {"Overcharge: 11250 -> 18750", "Charge Time: 6.5s -> 5.5s"},
                    },
                },
                {
                    Cost = 9999,
                    Image = 11821093989,
                    Title = "Powerhouse Armor",
                    Stats = {
                        Damage = 40,
                        MaxAmmo = 30000,
                        Range = 21,
                        Attributes = {LaserCooldown = 1, LaserTime = 3, ChargeTime = 4},
                        Extras = {
                            "Overcharge: 18750 -> 30000",
                            "Laser Cooldown: 2.5s -> 1s",
                            "Charge Time: 5.5s -> 4s",
                        },
                    },
                },
                {
                    Cost = 27500,
                    Image = 11821093828,
                    Title = "Supercharger",
                    Stats = {
                        Cooldown = 0.175,
                        Damage = 50,
                        MaxAmmo = 50000,
                        Range = 22.5,
                        Extras = {"Overcharge: 30000 -> 50000", "Charge Time: 4s -> 2.5s", ""},
                        Attributes = {ChargeTime = 2.5, LaserCooldown = 1, LaserTime = 4.8},
                    },
                },
                {
                    Cost = 50000,
                    Image = 11821093672,
                    Title = "Vessel Of Infinite Destruction",
                    Stats = {
                        Cooldown = 0.125,
                        Damage = 60,
                        MaxAmmo = 100000,
                        Range = 24,
                        Attributes = {ChargeTime = 1.5, LaserTime = 2},
                        Extras = {"Overcharge: 50000 -> 100000", "Charge Time: 2.5s -> 1.5s", ""},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Charge a laser and release massive damage at deadly rates!",
        Height = 0,
        Level = 50,
        BoundarySize = 1.75,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Accelerator},
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 2500,
            PreviewText = "REACH LEVEL 50 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Gems,
            Eligible = function(a1) -- Line: 141 -- types: a1: userdata
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
            Magician = {Icon = 116772850280844, Rarity = Enum.SkinRarity.Rare},
            Bunny = {Icon = 99808162793688, Rarity = Enum.SkinRarity.Common},
            Void = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Beach = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
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