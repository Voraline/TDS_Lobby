-- Script path: ReplicatedStorage.Content.Tower.Engineer.Stats-PVP
-- Decompile time: 2.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.2,
                Damage = 4,
                Limit = 5,
                Price = 700,
                Range = 13,
                Attributes = {
                    BuildTime = 2,
                    Buildzone = 4,
                    Deadzone = 1,
                    MaxUnits = 1,
                    SentryShield = false,
                    SpawnTime = 1,
                    UnitToSend = "Sentry1",
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 250,
                    Image = 4517035597,
                    Title = "Precise Calculations",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 6,
                        Range = 15,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1,
                            MaxUnits = 1,
                            SentryShield = false,
                            SpawnTime = 1,
                            UnitToSend = "Sentry1",
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
                    Cost = 400,
                    Image = 149177741,
                    Title = "Makeshift Radar",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 6,
                        Range = 17,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1,
                            MaxUnits = 2,
                            SentryShield = false,
                            SpawnTime = 1,
                            UnitToSend = "Sentry1",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"2 Max Units"},
                    },
                },
                {
                    Cost = 1800,
                    Image = 8998290803,
                    Title = "Auto Converter",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 16,
                        Range = 17,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1,
                            MaxUnits = 2,
                            SentryShield = false,
                            SpawnTime = 1,
                            UnitToSend = "Sentry2",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Rifle Sentry"},
                    },
                },
                {
                    Cost = 2600,
                    Image = 31857714,
                    Title = "Improved Blueprints",
                    Stats = {
                        Cooldown = 0.75,
                        Damage = 20,
                        Range = 20,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1,
                            MaxUnits = 2,
                            SentryShield = true,
                            SpawnTime = 1,
                            UnitToSend = "Sentry2",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"2 Max Units", "Sentry Shield"},
                    },
                },
                {
                    Cost = 11500,
                    Image = 155526941,
                    Title = "Heavy Construction",
                    Stats = {
                        Cooldown = 0.75,
                        Damage = 30,
                        Range = 20,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1,
                            MaxUnits = 3,
                            SentryShield = true,
                            SpawnTime = 1,
                            UnitToSend = "Sentry3",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Minigun Sentry"},
                    },
                },
                {
                    Cost = 27500,
                    Image = 7852911857,
                    Title = "Illegal Gun Parts",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 48,
                        Range = 22,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 0.5,
                            MaxUnits = 3,
                            SentryShield = true,
                            SpawnTime = 1,
                            UnitToSend = "Sentry4",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"War Machine Sentry", "3 Max Units"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Sentry comin' up!",
        Height = 0,
        Level = 60,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {["Gun DPS"] = TowerDPS.Default},
        Role = Enum.TowerRole.Defense,
        Price = {
            Value = 4500,
            PreviewText = "REACH LEVEL 60 TO UNLOCK TOWER OR BUY WITH GAMEPASS!",
            Type = Enum.CurrencyType.Gems,
            Eligible = function(a1) -- Line: 209 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 60 <= Level.Value
            end,
        },
        Class = Enum.TowerType.Ground,
        SkinData = {
            Mechanic = {Icon = 4690285744, Rarity = Enum.SkinRarity.Legendary},
            Holiday = {Icon = 4690285744, Rarity = Enum.SkinRarity.Event},
            Ducky = {Icon = 4690285744, Rarity = Enum.SkinRarity.Legendary},
            Heartbreak = {Icon = 4690285744, Rarity = Enum.SkinRarity.Legendary},
            ["Grave Digger"] = {Icon = 4690285744, Rarity = Enum.SkinRarity.Event},
            Plushie = {Icon = 4690285744, Rarity = Enum.SkinRarity.Exclusive},
            Phantom = {Icon = 4690285744, Rarity = Enum.SkinRarity.Legendary},
            Wikia = {Icon = 4343065951, Rarity = Enum.SkinRarity.Rare},
            DraxRex = {Icon = 18549606104, DisplayName = "CrazRex", Rarity = Enum.SkinRarity.Rare},
            Fallen = {Icon = 18950630600, Rarity = Enum.SkinRarity.Legendary},
            ["Dark Frost"] = {Icon = 72967186484602, Rarity = Enum.SkinRarity.Legendary},
            Beach = {Icon = 70830745549464, Rarity = Enum.SkinRarity.Rare},
            Ghost = {Icon = 0, Rarity = Enum.SkinRarity.Legendary},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 9391770231,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Hardcore,
    },
}