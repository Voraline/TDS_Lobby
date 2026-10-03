-- Script path: ReplicatedStorage.Content.Tower.Necromancer.Stats-PVP
-- Decompile time: 2.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.5,
                Damage = 10,
                MaxAmmo = 50,
                Limit = 3,
                Price = 1500,
                Range = 21,
                Abilities = {
                    {
                        Name = "Raise The Dead",
                        Price = 0,
                        Level = 0,
                        Icon = 15229477810,
                        Debounce = 5,
                    },
                },
                Attributes = {
                    BuildTime = 1.5,
                    BuildDelay = 0.4,
                    Buildzone = 6.5,
                    SpawnCount = 2,
                    Max_Graves = 2,
                    Max_Grave_Level = 1,
                    ExplosionDamage = 492,
                    ExplosionRadius = 4,
                    Grave_Cooldown = 2,
                    Summon_Debounce = 0.1,
                    Summon_Delay = 0.4,
                    ProjectileSpeed = 50,
                    MaxHits = 1,
                    MustAim = true,
                    BookAim = 0.4,
                    BookDebounce = 0.76,
                    SlowTime = 1,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 1000,
                    Image = 15332519996,
                    Title = "Spirit Tuning",
                    Stats = {
                        Damage = 12,
                        Cooldown = 1.2,
                        Range = 21,
                        MaxAmmo = 60,
                        Attributes = {MaxHits = 2, Max_Graves = 4, BuildTime = 1},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {
                                {Text = "Max Hits 1 -> 2"},
                                {Text = "Soul Meter: 50 -> 60"},
                                {Text = "Max Graves: 2 -> 4"},
                            },
                        },
                    },
                },
                {
                    Cost = 3500,
                    Image = 15332520691,
                    Title = "Soul Forge",
                    Stats = {
                        Cooldown = 1.2,
                        Damage = 12,
                        Range = 24,
                        MaxAmmo = 96,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {SpawnCount = 3, Max_Graves = 6, MaxHits = 2, BuildTime = 1},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {
                                {Text = "Soul Meter: 60 -> 96"},
                                {Text = "Grave Spawn Count: 2 -> 3"},
                                {Text = "Max Graves: 4 -> 6"},
                                {Text = "Spawns: Sword Skeletons"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Sword Skeleton</b></font>",
                            Header = "Sword Skeleton",
                            Content = {
                                {Text = "Health: 90"},
                                {Text = "Damage: 20"},
                                {Text = "Cooldown: 0.8"},
                                {Text = "Range: 6"},
                                {Text = "Speed: 3.5"},
                            },
                        },
                    },
                },
                {
                    Cost = 10000,
                    Image = 15332520335,
                    Title = "Skull Centrifuge",
                    Stats = {
                        Range = 26,
                        Damage = 30,
                        Cooldown = 0.8,
                        MaxAmmo = 450,
                        Attributes = {MaxHits = 2, Max_Graves = 6, Max_Grave_Level = 2, BuildTime = 0.8},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {
                                {Text = "Soul Meter: 96 -> 450"},
                                {Text = "Unlocks lv. 2 Gravestones"},
                                {Text = "Spawns: Giant Skeletons"},
                                {Text = "Spawns: Skeleton Knights"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Giant Skeleton</b></font>",
                            Header = "Giant Skeleton",
                            Content = {{Text = "Health: 600"}, {Text = "Range: 2"}, {Text = "Speed: 3.5"}},
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Skeleton Knight</b></font>",
                            Header = "Skeleton Knight",
                            Content = {
                                {Text = "Health: 250"},
                                {Text = "Damage: 87"},
                                {Text = "Cooldown: 0.65"},
                                {Text = "Range: 6"},
                                {Text = "Speed: 3.5"},
                            },
                        },
                    },
                },
                {
                    Cost = 40000,
                    Image = 15332519505,
                    Title = "Apostle of Hades",
                    Stats = {
                        Cooldown = 0.4,
                        Range = 32,
                        Damage = 20,
                        MaxAmmo = 1440,
                        Attributes = {
                            Max_Graves = 9,
                            MaxHits = 3,
                            SpawnCount = 3,
                            Max_Grave_Level = 3,
                            BuildTime = 0.8,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {
                                {
                                    Text = "Primary attack becomes a laser that can split to attack 3 targets or stack on a single target if not enough targets are in range",
                                },
                                {Text = "Max Hits: 2 -> 3"},
                                {Text = "Gravestones Explode (492 DMG)"},
                                {Text = "Soul Meter: 450 -> 1440"},
                                {Text = "Max Graves: 6 -> 9"},
                                {Text = "Unlocks lv. 3 gravestone"},
                                {Text = "Spawns: x1 Executioner Skeleton"},
                                {Text = "Spawns: Hallow Guards"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Hallow Guard</b></font>",
                            Header = "Hallow Guard",
                            Content = {{Text = "Health: 2000"}, {Text = "Range: 2"}, {Text = "Speed: 3.5"}},
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Executioner Skeleton</b></font>",
                            Header = "Executioner Skeleton",
                            Content = {
                                {Text = "Health: 3000"},
                                {Text = "Damage: 75"},
                                {Text = "Cooldown: 6"},
                                {Text = "Range: 32"},
                                {Text = "Speed: 2"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Deal damage to collect souls! Collected souls generate gravestones that can be used to resurrect the dead.",
        Height = 0,
        Level = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Default},
        Role = Enum.TowerRole.Defense,
        Price = {
            Value = 2250,
            PreviewText = "REACH LEVEL 50 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Gems,
            Eligible = function(a1) -- Line: 324 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 3)
                return Level and 50 <= Level.Value
            end,
        },
        Gamepass = {Id = 643819691, Price = 1500},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Mage = {Icon = 4863374697, Rarity = Enum.SkinRarity.Legendary},
            Fallen = {Icon = 18950652558, Rarity = Enum.SkinRarity.Legendary},
            Duck = {Icon = 106663322139673, Rarity = Enum.SkinRarity.Legendary},
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