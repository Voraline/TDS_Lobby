-- Script path: ReplicatedStorage.Content.Tower.Necromancer.Stats
-- Decompile time: 2.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.2,
                Damage = 15,
                MaxAmmo = 105,
                Limit = 3,
                Price = 4200,
                Range = 23,
                Abilities = {
                    {
                        Name = "Raise The Dead",
                        Description = "Raise the dead to fight for you, summoning skeletons from nearby graves to attack enemies. Skeletons summoned depends on amount of placed graves and grave levels.",
                        Price = 0,
                        Level = 0,
                        Icon = 15229477810,
                        Debounce = 5,
                    },
                },
                Attributes = {
                    BuildTime = 1.5,
                    BuildDelay = 0.5,
                    Buildzone = 6.5,
                    SpawnCount = 3,
                    Max_Graves = 3,
                    Max_Grave_Level = 1,
                    ExplosionDamage = 490,
                    ExplosionRadius = 5,
                    Grave_Cooldown = 2,
                    Summon_Debounce = 0.1,
                    Summon_Delay = 0.1,
                    ProjectileSpeed = 75,
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
                    Cost = 3950,
                    Image = 15332519996,
                    Title = "Soul Forge",
                    Stats = {
                        Damage = 20,
                        Cooldown = 1.1,
                        Range = 23,
                        MaxAmmo = 125,
                        Attributes = {
                            ProjectileSpeed = 75,
                            MaxHits = 1,
                            SpawnCount = 3,
                            Max_Graves = 3,
                            BuildTime = 1,
                            Summon_Delay = 0.1,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {{Text = "Soul Meter: 105 -> 125"}, {Text = "Spawns: Sword Skeletons"}},
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Sword Skeleton</b></font>",
                            Header = "Sword Skeleton",
                            Content = {
                                {Text = "Health: 120"},
                                {Text = "Damage: 24"},
                                {Text = "Cooldown: 0.7"},
                                {Text = "Range: 6"},
                                {Text = "Speed: 3.3"},
                            },
                        },
                    },
                },
                {
                    Cost = 11320,
                    Image = 15332520691,
                    Title = "Skull Centrifuge",
                    Stats = {
                        Cooldown = 1.1,
                        Damage = 30,
                        Range = 26,
                        MaxAmmo = 180,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {
                            ProjectileSpeed = 75,
                            SpawnCount = 3,
                            Max_Graves = 6,
                            MaxHits = 1,
                            BuildTime = 1,
                            Summon_Delay = 0.1,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {
                                {Text = "Soul Meter: 125 -> 180"},
                                {Text = "Max Graves: 3 -> 6"},
                                {Text = "Spawns: Giant Skeletons"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Giant Skeleton</b></font>",
                            Header = "Giant Skeleton",
                            Content = {{Text = "Health: 1200"}, {Text = "Speed: 3.5"}},
                        },
                    },
                },
                {
                    Cost = 26650,
                    Image = 15332520335,
                    Title = "Graveward",
                    Stats = {
                        Range = 28,
                        Damage = 45,
                        Cooldown = 0.8,
                        MaxAmmo = 405,
                        Attributes = {
                            ProjectileSpeed = 60,
                            MaxHits = 1,
                            Max_Graves = 6,
                            Max_Grave_Level = 2,
                            BuildTime = 0.8,
                            Summon_Delay = 0.1,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {
                                {Text = "Soul Meter: 180 -> 405"},
                                {Text = "Unlocks lv. 2 Gravestones"},
                                {Text = "Spawns: Skeleton Knights"},
                                {Text = "Spawns: Hallow Guards"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Skeleton Knight</b></font>",
                            Header = "Skeleton Knight",
                            Content = {
                                {Text = "Health: 235"},
                                {Defense = "15%"},
                                {Text = "Damage: 87"},
                                {Text = "Cooldown: 0.7"},
                                {Text = "Range: 6"},
                                {Text = "Speed: 3.3"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Hallow Guard</b></font>",
                            Header = "Hallow Guard",
                            Content = {{Text = "Health: 2000"}, {Text = "Defense: 15%"}, {Text = "Speed: 3.5"}},
                        },
                    },
                },
                {
                    Cost = 65000,
                    Image = 15332519505,
                    Title = "Apostle of Hades",
                    Stats = {
                        Cooldown = 0.4,
                        Range = 36,
                        Damage = 28,
                        MaxAmmo = 1620,
                        Detections = {[Enum.StatusEffect.LeadDetection] = true},
                        Attributes = {
                            Max_Graves = 9,
                            MaxHits = 3,
                            SpawnCount = 3,
                            Max_Grave_Level = 3,
                            BuildTime = 0.8,
                            Summon_Delay = 0.1,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Necromancy</b></font>",
                            Content = {
                                {
                                    Text = "Primary attack becomes a laser that can split to attack 3 targets or stack on a single target if not enough targets are in range",
                                },
                                {
                                    Text = "Deals split damage based on targets in range. 28 damage for 3 targets, 42 damage for 2 targets, 84 damage for 1 target.",
                                },
                                {Text = "Max Hits: 1 -> 3"},
                                {Text = "Gravestones Explode (490 DMG)"},
                                {Text = "Soul Meter: 405 -> 1620"},
                                {Text = "Max Graves: 6 -> 9"},
                                {Text = "Unlocks lv. 3 gravestone"},
                                {Text = "Spawns: x1 Executioner Skeleton"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Executioner Skeleton</b></font>",
                            Header = "Executioner Skeleton",
                            Content = {
                                {Text = "Health: 3000"},
                                {Text = "Defense 25%"},
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
            Eligible = function(a1) -- Line: 332 -- types: a1: userdata
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
            ["Creepy Santa"] = {Icon = 73735298063200, Rarity = Enum.SkinRarity.Rare},
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