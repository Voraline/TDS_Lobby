-- Script path: ReplicatedStorage.Content.Tower.Mortar.Stats-PVP
-- Decompile time: 2.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 4,
                Damage = 12,
                Limit = 5,
                Price = 1000,
                Range = 20,
                Attributes = {
                    CanCluster = false,
                    ClusterCount = 3,
                    ClusterDamage = 15,
                    ClusterRadius = 5,
                    ClusterOffset = Vector3.new(0, 0, 6),
                    ExplosionRadius = 5.5,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
            Upgrades = {
                {
                    Cost = 300,
                    Image = 4538447265,
                    Title = "Improved Handling",
                    Stats = {
                        Cooldown = 3.25,
                        Damage = 12,
                        Range = 22,
                        Attributes = {
                            CanCluster = false,
                            ClusterCount = 3,
                            ClusterDamage = 15,
                            ClusterRadius = 5,
                            ExplosionRadius = 5.5,
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
                    Cost = 1400,
                    Image = 4538447347,
                    Title = "Upgraded Armaments",
                    Stats = {
                        Cooldown = 3.25,
                        Damage = 25,
                        Range = 25,
                        Attributes = {
                            CanCluster = false,
                            ClusterCount = 3,
                            ClusterDamage = 15,
                            ClusterRadius = 5,
                            ExplosionRadius = 7,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Explosion Radius: 5.5 -> 7"},
                    },
                },
                {
                    Cost = 2500,
                    Image = 4538447424,
                    Title = "Bigger Cannon",
                    Stats = {
                        Cooldown = 3.25,
                        Damage = 50,
                        Range = 30,
                        Attributes = {
                            CanCluster = false,
                            ClusterCount = 3,
                            ClusterDamage = 15,
                            ClusterRadius = 5,
                            ExplosionRadius = 8,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Explosion Radius: 7 -> 8"},
                    },
                },
                {
                    Cost = 12000,
                    Image = 4538447493,
                    Title = "Loaded Warhead",
                    Stats = {
                        Cooldown = 3.25,
                        Damage = 100,
                        Range = 32,
                        Attributes = {
                            CanCluster = true,
                            ClusterCount = 3,
                            ClusterDamage = 40,
                            ClusterRadius = 5,
                            ExplosionRadius = 8,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Cluster Bombs</b></font>",
                            Content = {
                                {Text = "Cluster Count: 3"},
                                {Text = "Cluster Damage: 40"},
                                {Text = "Cluster Explosion Radius: 5"},
                            },
                        },
                    },
                },
                {
                    Cost = 22500,
                    Image = 4538447579,
                    Title = "City Buster",
                    Stats = {
                        Cooldown = 3.25,
                        Damage = 150,
                        Range = 35,
                        Attributes = {
                            CanCluster = true,
                            ClusterCount = 6,
                            ClusterDamage = 50,
                            ClusterRadius = 5,
                            ExplosionRadius = 8.5,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Explosion Radius: 8 -> 8.5", "Mushroom Cloud"},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Cluster Bombs</b></font>",
                            Content = {{Text = "Cluster Count: 3 -> 6"}, {Text = "Cluster Damage: 40 -> 50"}},
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Rain fire from above! Deals extremely high splash damage!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Default, ["Cluster DPS"] = TowerDPS.Cluster},
        Role = Enum.TowerRole.Defense,
        Price = {
            PreviewText = "REACH LEVEL 75 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Free,
            Eligible = function(a1) -- Line: 199 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 75 <= Level.Value
            end,
        },
        Gamepass = {Id = 7838041, Value = 700},
        Class = Enum.TowerType.Cliff,
        SkinData = {
            Bunny = {Icon = 4863584523, Rarity = Enum.SkinRarity.Event},
            Eclipse = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Ducky = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Vigilante = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Pirate = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Defender = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Baseball = {Icon = 18549606696, Rarity = Enum.SkinRarity.Rare},
            Fallen = {Icon = 18835927281, Rarity = Enum.SkinRarity.Legendary},
            Frost = {Icon = 119613427526708, Rarity = Enum.SkinRarity.Legendary},
            ["Dark Frost"] = {Icon = 75806838714392, Rarity = Enum.SkinRarity.Rare},
            ["Mecha Ducky"] = {Icon = 70538066358366, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.25, 0),
            Icon = 6883297964,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}