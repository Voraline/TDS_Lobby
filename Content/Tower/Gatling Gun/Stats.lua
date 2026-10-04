-- Script path: ReplicatedStorage.Content.Tower.Gatling Gun.Stats
-- Decompile time: 1.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Immutable = true,
            Defaults = {
                Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                Price = 5250,
                Ammo = 50,
                Range = 25,
                Attributes = {
                    ReloadTime = 2.5,
                    Angle = 40,
                    Recoil = 0.08,
                    SpreadAdd = 10,
                    WindDownTime = 2,
                },
                Abilities = {
                    {
                        Name = "FPS",
                        Description = "Take matters into your own hands; manually control the Gatling Gun to unleash chaos and pierce through the hoarde.",
                        Debounce = 0.5,
                        Price = 0,
                        Level = 0,
                        Icon = 94564306265259,
                    },
                },
                Limit = 1,
                Cooldown = 0.17,
                Damage = 5,
            },
            Upgrades = {
                {
                    Stats = {
                        Detections = {},
                        Cooldown = 0.17,
                        Attributes = {ReloadTime = 2.5, Angle = 40, SpreadAdd = 10, Recoil = 0.08},
                        Ammo = 50,
                        Range = 30,
                        Damage = 8,
                    },
                    Image = 70569444235865,
                    Title = "Heavier Bullets",
                    Cost = 3000,
                },
                {
                    Stats = {
                        Attributes = {
                            SpreadAdd = 9,
                            Angle = 45,
                            Recoil = 0.08,
                            ReloadTime = 2,
                            DeadZone = 0,
                        },
                        Cooldown = 0.17,
                        Range = 30,
                        Damage = 12,
                        Ammo = 100,
                        Extras = {"Increased Ammo Size (50 -> 100)"},
                    },
                    Image = 104227180979769,
                    Title = "Bigger Magazine",
                    Cost = 7500,
                },
                {
                    Stats = {
                        Attributes = {ReloadTime = 2, Angle = 55, SpreadAdd = 7.5, Recoil = 0.08},
                        Range = 35,
                        Ammo = 200,
                        Cooldown = 0.12,
                        Damage = 13,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Extras = {"Angle (35 -> 40)", "Improved Spread", "Increased Ammo Size (100 -> 200)"},
                    },
                    Image = 71764582498505,
                    Title = "Extra Barrel",
                    Cost = 15000,
                },
                {
                    Stats = {
                        Attributes = {
                            SpreadAdd = 6.5,
                            WindUpTime = 0,
                            WindDownTime = 2,
                            Angle = 55,
                            DeadZone = 1.25,
                            ReloadTime = 2,
                            Recoil = 0.06,
                        },
                        Cooldown = 0.09,
                        Ammo = 200,
                        Range = 45,
                        Damage = 20,
                        Extras = {"Improved Recoil", "Improved Spread"},
                    },
                    Image = 128136625170591,
                    Title = "Minigun Barrel",
                    Cost = 32500,
                },
                {
                    Stats = {
                        Detections = {},
                        Attributes = {
                            SpreadAdd = 6.5,
                            WindUpTime = 0,
                            WindDownTime = 2,
                            Angle = 65,
                            DeadZone = 2,
                            ReloadTime = 6,
                            Recoil = 0.03,
                        },
                        Cooldown = 0.09,
                        Ammo = 400,
                        Range = 50,
                        Damage = 36,
                        Extras = {
                            "Increased Ammo Size (200 -> 400)",
                            "Increased Reload Time (2 -> 6)",
                            "Increased Firing Angle (45 -> 50)",
                            "Improved Recoil",
                            "Improved Spread",
                        },
                    },
                    Image = 125372339735512,
                    Title = "Impenetrable Fortress",
                    Cost = 50000,
                },
                {
                    Stats = {
                        Attributes = {
                            ReloadTime = 6,
                            Angle = 70,
                            SpreadAdd = 6.5,
                            Recoil = 0.03,
                            WindUpTime = 0,
                            WindDownTime = 2,
                        },
                        Cooldown = 0.09,
                        Ammo = 600,
                        Range = 50,
                        Damage = 67,
                        Extras = {
                            "Increased Ammo Size (400 -> 600)",
                            "Increased Reload Time (2 -> 6)",
                            "Improved Recoil",
                            "Improved Spread",
                        },
                    },
                    Image = 139181863986914,
                    Title = "Destruction-Oriented Output Machine",
                    Cost = 100000,
                },
            },
        },
    },
    Properties = {
        Description = "A cliff tower that you take personal control of. Time to take matters into your own hands",
        Height = 0,
        BoundarySize = 2,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Ammo},
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 35000,
            PreviewText = "REACH LEVEL 175 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Coins,
            Eligible = function(a1) -- Line: 193 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 175 <= Level.Value
            end,
        },
        Gamepass = {Id = 924927232},
        Class = Enum.TowerType.Both,
        SkinData = {
            Default = {Icon = 81281360352088, Rarity = Enum.SkinRarity.Common},
            Easter = {Icon = 102642733564095, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 70,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}