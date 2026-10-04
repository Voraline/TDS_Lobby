-- Script path: ReplicatedStorage.Content.Tower.Military Base.Stats-PVP
-- Decompile time: 2.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 3877874591,
                    Title = "Mechanics",
                    Cost = 200,
                    Stats = {Cooldown = 25, Extras = {}, Attributes = {UnitToSend = "Humvee", SpawnTime = 25}},
                },
                {
                    Image = 3877875003,
                    Title = "Barbed Wire",
                    Cost = 400,
                    Stats = {Extras = {"Health: 60 -> 100"}, Attributes = {UnitToSend = "Humvee 2"}},
                },
                {
                    Image = 3877873543,
                    Title = "Mounted Gunner",
                    Cost = 1750,
                    Stats = {
                        Damage = 3,
                        Extras = {"Mounted gunner", "Gunner Damage: 4"},
                        Attributes = {UnitToSend = "Humvee 3"},
                    },
                },
                {
                    Image = 3444568329,
                    Title = "Tank",
                    Cost = 7500,
                    Stats = {
                        Damage = 10,
                        Extras = {
                            "Health: 100 -> 500",
                            "Gunner Damage: 4 -> 7",
                            "Explosion Damage: 36",
                            "Airstrike ability",
                            "Airstrike damage: 450",
                        },
                        Attributes = {
                            AirstrikeDamage = 75,
                            Bombs = 6,
                            AirstrikeExplosionRange = 8,
                            AirstrikeRange = 4,
                            UnitToSend = "Tank",
                        },
                    },
                },
                {
                    Image = 3444568580,
                    Title = "Railgun Tank",
                    Cost = 25000,
                    Stats = {
                        Damage = 24,
                        Extras = {
                            "Health: 500 -> 1600",
                            "Gunner Damage: 7 -> 20",
                            "Explosion Damage: 36 -> 64",
                            "Airstrike damage: 450 -> 750",
                            "Airstrike explosion range: 8 -> 12",
                        },
                        Attributes = {
                            AirstrikeDamage = 125,
                            Bombs = 6,
                            AirstrikeExplosionRange = 12,
                            AirstrikeRange = 6,
                            UnitToSend = "Railgun Tank",
                        },
                    },
                },
            },
            Defaults = {
                Limit = 5,
                Price = 400,
                Range = 0,
                Cooldown = 45,
                Damage = 0,
                Abilities = {
                    {
                        Name = "Airstrike",
                        Price = 250,
                        Level = 4,
                        Icon = 16899461518,
                        Debounce = 45,
                    },
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {UnitToSend = "Humvee", SpawnTime = 40},
            },
        },
    },
    Properties = {
        Description = "Send out a vehicle every couple of seconds to run over and shoot enemies.",
        BoundarySize = 2.25,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Gun DPS"] = {Calculate = TowerDPS.ActiveUnitGun, Visible = TowerDPS.HasActiveUnitGun},
            ["Explosion DPS"] = {
                Calculate = TowerDPS.ActiveUnitMissile,
                Visible = TowerDPS.HasActiveUnitMissile,
            },
            ["Total DPS"] = {Calculate = TowerDPS.ActiveUnitTotal, Visible = TowerDPS.HasActiveUnitTotal},
        },
        Role = Enum.TowerRole.Defense,
        Price = {Value = 4000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Classic = {Icon = 3877874187, Rarity = Enum.SkinRarity.Rare},
            Wasteland = {Icon = 78972347785643, Rarity = Enum.SkinRarity.Rare},
            Cyber = {Icon = 109839701132351, Rarity = Enum.SkinRarity.Rare},
            ["Base 1776"] = {Icon = 82822915671522, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 1, 0),
            Icon = 6883295548,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}