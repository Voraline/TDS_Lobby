-- Script path: ReplicatedStorage.Content.Tower.Military Base.Stats
-- Decompile time: 2.04 ms

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
                    Stats = {Cooldown = 0, Extras = {}, Attributes = {UnitToSend = "Humvee", SpawnTime = 35}},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Armory</b></font>",
                            Header = "Humvee",
                            Content = {{Text = "Unit Spawn Time: 45s -> 35s"}},
                        },
                    },
                },
                {
                    Image = 3877875003,
                    Title = "Barbed Wire",
                    Cost = 400,
                    Stats = {Extras = {}, Attributes = {UnitToSend = "Humvee 2"}},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Armory</b></font>",
                            Header = "Barbed Wire Humvee",
                            Content = {{Text = "Unit Health: 60 -> 100"}},
                        },
                    },
                },
                {
                    Image = 3877873543,
                    Title = "Mounted Gunner",
                    Cost = 2000,
                    Stats = {Damage = 0, Extras = {}, Attributes = {UnitToSend = "Humvee 3"}},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Armory</b></font>",
                            Header = "Gunner Humvee",
                            Content = {
                                {Text = "Vehicle Speed: 8 -> 5"},
                                {Text = "Unlocks Mounted Gunner"},
                                {Text = "Gunner Damage: 4"},
                                {Text = "Gunner Cooldown: 0.225s"},
                                {Text = "Gunner Range: 30"},
                                {Text = "Slows Down When Firing At Enemies"},
                                {Text = "Detects Hidden Enemies"},
                            },
                        },
                    },
                },
                {
                    Image = 3444568329,
                    Title = "Tank",
                    Cost = 7500,
                    Stats = {
                        Damage = 0,
                        Extras = {},
                        Attributes = {
                            AirstrikeDamage = 75,
                            Bombs = 6,
                            AirstrikeExplosionRange = 8,
                            AirstrikeRange = 4,
                            UnitToSend = "Tank",
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Airstrike Ability</b></font>",
                            Header = "Call in a powerful airstrike on the path!",
                            Content = {
                                {Text = "Ability Cost: 500"},
                                {Text = "Ability Cooldown: 45s"},
                                {Text = "Missile Damage: 75"},
                                {Text = "Missile Amount: 6"},
                                {Text = "Explosion Radius: 8"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Armory</b></font>",
                            Header = "Tank",
                            Content = {
                                {Text = "Unit Health: 100 -> 500"},
                                {Text = "Gunner Damage: 4 -> 8"},
                                {Text = "Unlocks Explosive Cannon"},
                                {Text = "Explosive Damage: 40"},
                                {Text = "Explosive Radius: 6"},
                                {Text = "Time Between Missiles: 2s"},
                            },
                        },
                    },
                },
                {
                    Image = 3444568580,
                    Title = "Railgun Tank",
                    Cost = 25000,
                    Stats = {
                        Damage = 0,
                        Extras = {},
                        Attributes = {
                            AirstrikeDamage = 125,
                            Bombs = 6,
                            AirstrikeExplosionRange = 12,
                            AirstrikeRange = 6,
                            UnitToSend = "Railgun Tank",
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Airstrike Ability</b></font>",
                            Header = "Call in a powerful airstrike on the path!",
                            Content = {{Text = "Missile Damage: 75 -> 125"}, {Text = "Explosion Radius: 8 -> 12"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Armory</b></font>",
                            Header = "Railgun Tank",
                            Content = {
                                {Text = "Unit Health: 500 -> 1600"},
                                {Text = "Gunner Damage: 8 -> 22"},
                                {Text = "Gunner Cooldown: 0.225s -> 0.175s"},
                                {Text = "Explosive Damage: 40 -> 75"},
                                {Text = "Explosive Radius: 6 -> 8"},
                            },
                        },
                    },
                },
            },
            Defaults = {
                Limit = 5,
                Price = 400,
                Range = 0,
                Cooldown = 0,
                Damage = 0,
                Abilities = {
                    {
                        Name = "Airstrike",
                        Description = "Calls in a powerful airstrike onto the path, dealing large area damage.",
                        Price = 500,
                        Level = 4,
                        Icon = 16899461518,
                        Debounce = 45,
                    },
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {UnitToSend = "Humvee", SpawnTime = 45},
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
            ["Ice Cream"] = {Icon = 0, Rarity = Enum.SkinRarity.Common},
            Pirate = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
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