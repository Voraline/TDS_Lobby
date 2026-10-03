-- Script path: ReplicatedStorage.Content.Tower.Trapper.Stats-PVP
-- Decompile time: 2.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 4.5,
                Damage = 0,
                Price = 500,
                Range = 7,
                Limit = 7,
                Attributes = {
                    MaxTraps = 4,
                    ThrowTime = 0.5,
                    TrapLifespan = 75,
                    Velocity = 15,
                    Traps = {Spike = {Damage = 10, Cooldown = 4.5, Range = 1.5, Health = 10}},
                },
            },
            Upgrades = {
                {
                    Cost = 500,
                    Image = 16493201931,
                    Title = "Faster Throwing",
                    Stats = {
                        Cooldown = 4,
                        Attributes = {
                            MaxTraps = 5,
                            Traps = {Spike = {Damage = 20, Cooldown = 4, Range = 1.5, Health = 20}},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Max Traps</b></font>",
                            Header = "Max Traps Upgrade",
                            Content = {{Text = "Max Traps: 5"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Spikes</b></font>",
                            Header = "Spike Upgrade",
                            Content = {
                                {Text = "Spike Cooldown: 4"},
                                {Text = "Spike Health: 20"},
                                {Text = "Spike Damage: 20"},
                            },
                        },
                    },
                },
                {
                    Cost = 1500,
                    Image = 16493202507,
                    Title = "Watch your step",
                    Stats = {
                        Range = 9,
                        Attributes = {
                            MaxTraps = 6,
                            Traps = {
                                Spike = {Damage = 25, Cooldown = 4, Range = 2, Health = 60},
                                Landmine = {Cooldown = 4.5, Damage = 45, Range = 1, ExplosionRadius = 4},
                            },
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Max Traps</b></font>",
                            Header = "Max Traps Upgrade",
                            Content = {{Text = "Max Traps: 6"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Spikes</b></font>",
                            Header = "Spike Upgrade",
                            Content = {
                                {Text = "Spike Cooldown: 4"},
                                {Text = "Spike Health: 60"},
                                {Text = "Spike Damage: 25"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Mine</b></font>",
                            Header = "Unlock Mine",
                            Content = {
                                {Text = "Mine Cooldown: 4.5"},
                                {Text = "Mine Damage: 45"},
                                {Text = "Explosion Radius: 4"},
                            },
                        },
                    },
                },
                {
                    Cost = 5000,
                    Image = 16493202350,
                    Title = "Better Traps",
                    Stats = {
                        Range = 10,
                        Cooldown = 4,
                        Attributes = {
                            MaxTraps = 7,
                            Traps = {
                                Spike = {Damage = 40, Cooldown = 4, Range = 2, Health = 280},
                                Landmine = {
                                    Cooldown = 3.5,
                                    Damage = 70,
                                    Range = 1,
                                    ExplosionRadius = 4,
                                    BurnDamage = 5,
                                    BurnTick = 0.25,
                                    BurnTime = 2,
                                },
                            },
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Max Traps</b></font>",
                            Header = "Max Traps Upgrade",
                            Content = {{Text = "Max Traps: 7"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Spikes</b></font>",
                            Header = "Spike Upgrade",
                            Content = {
                                {Text = "Spike Cooldown: 4"},
                                {Text = "Spike Health: 280"},
                                {Text = "Spike Damage: 40"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Mine</b></font>",
                            Header = "Mine Upgrade",
                            Content = {
                                {Text = "Mine Cooldown: 3.5"},
                                {Text = "Mine Damage: 70"},
                                {Text = "Explosion Radius: 4"},
                                {Text = "Causes burn damage"},
                            },
                        },
                    },
                },
                {
                    Cost = 13500,
                    Image = 16493202129,
                    Title = "Don't try this at home",
                    Stats = {
                        Cooldown = 2,
                        Range = 10,
                        Attributes = {
                            MaxTraps = 9,
                            Traps = {
                                Spike = {Damage = 60, Cooldown = 4, Range = 2, Health = 600},
                                Landmine = {
                                    Cooldown = 2.25,
                                    Damage = 130,
                                    Range = 1,
                                    ExplosionRadius = 5,
                                    DefenseMelt = 0,
                                    BurnDamage = 7,
                                    BurnTick = 0.25,
                                    BurnTime = 5,
                                },
                                BearTrap = {Damage = 350, Cooldown = 2.75, Range = 1, StunLength = 3},
                            },
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Max Traps</b></font>",
                            Header = "Max Traps Upgrade",
                            Content = {{Text = "Max Traps: 9"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Spikes</b></font>",
                            Header = "Spike Upgrade",
                            Content = {
                                {Text = "Spike Cooldown: 4"},
                                {Text = "Spike Health: 600"},
                                {Text = "Spike Damage: 60"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Mines</b></font>",
                            Header = "Mine Upgrade",
                            Content = {
                                {Text = "Mine Cooldown: 2.25"},
                                {Text = "Mine Damage: 130"},
                                {Text = "Explosion Radius: 5"},
                                {Text = "Burn Time: 5 Seconds"},
                                {Text = "Burn Tick: 0.25"},
                                {Text = "Burn Damage: 7"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Bear Trap</b></font>",
                            Header = "Unlock Bear Trap",
                            Content = {
                                {Text = "Bear Trap Cooldown: 2.75"},
                                {Text = "Bear Trap Damage: 350"},
                                {Text = "Stun Time: 4"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Watch your step.. Place various traps on the path to damage and stun enemies!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            Default = TowerDPS.SelectedTrap,
            ["Burn DPS"] = {
                Calculate = TowerDPS.TrapBurn("Landmine"),
                Option = {Name = "Trap", Value = "Landmine"},
            },
            ["Total DPS"] = {
                Calculate = TowerDPS.TrapDamageOverTime("Landmine"),
                Option = {Name = "Trap", Value = "Landmine"},
            },
        },
        Role = Enum.TowerRole.Defense,
        Price = {Value = 3000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Plushie = {Icon = 4690285744, Rarity = Enum.SkinRarity.Exclusive},
            ["Dark Frost"] = {Icon = 120378214035608, Rarity = Enum.SkinRarity.Rare},
            ["Mallard Duck"] = {Icon = 128010558189605, Rarity = Enum.SkinRarity.Rare},
            Hermit = {Icon = 130310121167383, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883281690,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}