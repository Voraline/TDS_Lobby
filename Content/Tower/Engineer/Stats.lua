-- Script path: ReplicatedStorage.Content.Tower.Engineer.Stats
-- Decompile time: 2.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.4,
                Damage = 4,
                Limit = 6,
                Price = 600,
                Range = 13,
                Attributes = {
                    BuildTime = 2,
                    Buildzone = 4,
                    Deadzone = 1.5,
                    MaxUnits = 1,
                    SentryShield = false,
                    SpawnTime = 1,
                    UnitToSend = "Sentry1",
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 325,
                    Image = 4517035597,
                    Title = "Precise Calculations",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 6,
                        Range = 16,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1.5,
                            MaxUnits = 1,
                            SentryShield = false,
                            SpawnTime = 1,
                            UnitToSend = "Sentry1",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 900,
                    Image = 149177741,
                    Title = "Makeshift Radar",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 10,
                        Range = 18,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1.5,
                            MaxUnits = 1,
                            SentryShield = false,
                            SpawnTime = 1,
                            UnitToSend = "Sentry2",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Rifle Sentry</b></font>",
                            Header = "Sentry Upgrade",
                            Content = {
                                {Text = "Max Units: 1"},
                                {Text = "Scrap Cost: 32"},
                                {Text = "Health: 400"},
                                {Text = "Range: 20"},
                                {Text = "Cooldown: 0.2s"},
                                {Text = "Damage: 1"},
                                {Text = "Lifespan: 30s"},
                                {Text = "Detects hidden enemies"},
                            },
                        },
                    },
                },
                {
                    Cost = 2077,
                    Image = 8998290803,
                    Title = "Auto Converter",
                    Stats = {
                        Cooldown = 1,
                        Damage = 20,
                        Range = 18,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 4,
                            Deadzone = 1.5,
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
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Extra <font color=\"rgb(255,185,0)\"><b>Sentry</b></font>",
                            Header = "Sentry Upgrade",
                            Content = {{Text = "Max Units: 2"}},
                        },
                    },
                },
                {
                    Cost = 6250,
                    Image = 155526941,
                    Title = "Heavy Construction",
                    Stats = {
                        Cooldown = 0.9,
                        Damage = 30,
                        Range = 21,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 3,
                            Deadzone = 1.5,
                            MaxUnits = 2,
                            SentryShield = false,
                            SpawnTime = 1,
                            UnitToSend = "Sentry3",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Minigun Sentry</b></font>",
                            Header = "Sentry Upgrade",
                            Content = {
                                {Text = "Max Units: 2"},
                                {Text = "Scrap Cost: 150"},
                                {Text = "Health: 750"},
                                {Text = "Range: 22"},
                                {Text = "Cooldown: 0.15s"},
                                {Text = "Damage: 3"},
                                {Text = "Lifespan: 45s"},
                                {Text = "Detects hidden enemies"},
                            },
                        },
                    },
                },
                {
                    Cost = 12500,
                    Image = 31857714,
                    Title = "Improved Blueprints",
                    Stats = {
                        Cooldown = 0.75,
                        Damage = 80,
                        Range = 21,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 3,
                            Deadzone = 1.5,
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
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Sentries</b></font>",
                            Header = "Sentry Upgrade",
                            Content = {{Text = "Max Units: 3"}, {Text = "Sentries are now shielded"}},
                        },
                    },
                },
                {
                    Cost = 32500,
                    Image = 7852911857,
                    Title = "Illegal Gun Parts",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 90,
                        Range = 22.5,
                        Attributes = {
                            BuildTime = 2,
                            Buildzone = 2,
                            Deadzone = 1.5,
                            MaxUnits = 4,
                            SentryShield = true,
                            SpawnTime = 1,
                            UnitToSend = "Sentry4",
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>WAR MACHINE SENTRIES</b></font>",
                            Header = "Sentry Upgrade",
                            Content = {
                                {Text = "Max Units: 4"},
                                {Text = "Scrap Cost: 340"},
                                {Text = "Health: 1000"},
                                {Text = "Range: 24"},
                                {Text = "Cooldown: 0.125s"},
                                {Text = "Damage: 3"},
                                {Text = "Explosive Damage: 60"},
                                {Text = "Missile Cooldown: 4s"},
                                {Text = "Lifespan: 60s"},
                                {Text = "Hidden Detection"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Sentry comin' up! A Jack of All Trades tower that builds up scrap and deploys powerful sentry turrets.",
        Height = 0,
        Level = 60,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {["Gun DPS"] = TowerDPS.Default},
        Role = Enum.TowerRole.Defense,
        Price = {
            Value = 4500,
            PreviewText = "REACH LEVEL 50 TO UNLOCK TOWER OR BUY WITH GAMEPASS!",
            Type = Enum.CurrencyType.Gems,
            Eligible = function(a1) -- Line: 329 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 50 <= Level.Value
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
            Springtime = {Icon = 122286021659066, Rarity = Enum.SkinRarity.Rare},
            Bunny = {Icon = 132321390608519, Rarity = Enum.SkinRarity.Legendary},
            ["Scuba Ops"] = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
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