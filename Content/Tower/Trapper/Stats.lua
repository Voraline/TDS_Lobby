-- Script path: ReplicatedStorage.Content.Tower.Trapper.Stats
-- Decompile time: 2.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Damage = 0,
                Price = 500,
                Cooldown = 4,
                Range = 7,
                Limit = 7,
                Attributes = {
                    MaxTraps = 6,
                    ThrowTime = 0.5,
                    TrapLifespan = 25,
                    Velocity = 15,
                    Traps = {Spike = {Damage = 10, Cooldown = 4, Range = 1.5, Health = 10}},
                },
                Detections = {[Enum.StatusEffect.HiddenDetection] = true},
            },
            Upgrades = {
                {
                    Cost = 500,
                    Image = 16493201931,
                    Title = "Sharper Spikes",
                    Stats = {
                        Cooldown = 4,
                        Attributes = {
                            MaxTraps = 6,
                            Traps = {Spike = {Damage = 20, Cooldown = 4, Range = 1.5, Health = 20}},
                        },
                    },
                    Tooltips = {
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
                        Cooldown = 4,
                        Attributes = {
                            MaxTraps = 7,
                            Traps = {
                                Spike = {Damage = 25, Cooldown = 4, Range = 2, Health = 75},
                                Landmine = {
                                    Cooldown = 4,
                                    Damage = 50,
                                    Range = 1,
                                    ExplosionRadius = 5,
                                    BurnDamage = 5,
                                    BurnTick = 0.25,
                                    BurnTime = 1,
                                },
                            },
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Trap Limit</b></font>",
                            Header = "Trap Limit Upgrade",
                            Content = {{Text = "Max Traps: 7"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Spikes</b></font>",
                            Header = "Spike Upgrade",
                            Content = {
                                {Text = "Spike Cooldown: 4"},
                                {Text = "Spike Health: 75"},
                                {Text = "Spike Damage: 25"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Mine</b></font>",
                            Header = "Unlock Mine",
                            Content = {
                                {Text = "Mine Cooldown: 4"},
                                {Text = "Mine Damage: 50"},
                                {Text = "Explosion Radius: 5"},
                                {Text = "Burn Damage: 5"},
                                {Text = "Burn Tick Rate: 0.25s"},
                                {Text = "Burn Time: 1s"},
                            },
                        },
                    },
                },
                {
                    Cost = 6000,
                    Image = 16493202350,
                    Title = "Better Traps",
                    Stats = {
                        Range = 10,
                        Cooldown = 3,
                        Attributes = {
                            MaxTraps = 9,
                            Traps = {
                                Spike = {Damage = 45, Cooldown = 3, Range = 2, Health = 225},
                                Landmine = {
                                    Cooldown = 3,
                                    Damage = 100,
                                    Range = 1,
                                    ExplosionRadius = 5,
                                    BurnDamage = 3,
                                    BurnTick = 0.25,
                                    BurnTime = 2,
                                },
                            },
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Trap Limit</b></font>",
                            Header = "Trap Limit Upgrade",
                            Content = {{Text = "Max Traps: 8"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Spikes</b></font>",
                            Header = "Spike Upgrade",
                            Content = {
                                {Text = "Spike Cooldown: 3"},
                                {Text = "Spike Health: 225"},
                                {Text = "Spike Damage: 45"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Mine</b></font>",
                            Header = "Mine Upgrade",
                            Content = {
                                {Text = "Mine Cooldown: 3"},
                                {Text = "Mine Damage: 100"},
                                {Text = "Explosion Radius: 5"},
                                {Text = "Burn Damage: 3"},
                                {Text = "Burn Tick Rate: 0.25s"},
                                {Text = "Burn Time: 2s"},
                            },
                        },
                    },
                },
                {
                    Cost = 11500,
                    Image = 16493202129,
                    Title = "Don't try this at home",
                    Stats = {
                        Range = 10,
                        Cooldown = 2.5,
                        Attributes = {
                            MaxTraps = 13,
                            Traps = {
                                Spike = {Damage = 65, Cooldown = 2.5, Range = 2, Health = 325},
                                Landmine = {
                                    Cooldown = 2.5,
                                    Damage = 160,
                                    Range = 1,
                                    ExplosionRadius = 6,
                                    DefenseMelt = 0,
                                    BurnDamage = 4,
                                    BurnTick = 0.25,
                                    BurnTime = 5,
                                },
                                BearTrap = {Damage = 325, Cooldown = 2.5, Range = 1, StunLength = 3},
                            },
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Trap Limit</b></font>",
                            Header = "Trap Limit Upgrade",
                            Content = {{Text = "Max Traps: 14"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Spikes</b></font>",
                            Header = "Spike Upgrade",
                            Content = {
                                {Text = "Spike Cooldown: 2.5"},
                                {Text = "Spike Health: 350"},
                                {Text = "Spike Damage: 70"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Mines</b></font>",
                            Header = "Mine Upgrade",
                            Content = {
                                {Text = "Mine Cooldown: 2.5"},
                                {Text = "Mine Damage: 175"},
                                {Text = "Explosion Radius: 6"},
                                {Text = "Burn Time: 5s"},
                                {Text = "Burn Tick Rate: 0.25s"},
                                {Text = "Burn Damage: 10"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Bear Trap</b></font>",
                            Header = "Unlock Bear Trap",
                            Content = {
                                {Text = "Bear Trap Cooldown: 2.5"},
                                {Text = "Bear Trap Damage: 325"},
                                {Text = "Stun Time: 3s"},
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
            Banned = {Icon = 130310121167383, Rarity = Enum.SkinRarity.Exclusive},
            ["Jolly Tree"] = {Icon = 72043309574728, Rarity = Enum.SkinRarity.Common},
            Holiday = {Icon = 80676421892989, Rarity = Enum.SkinRarity.Uncommon},
            Chocolatier = {Icon = 97990283366444, Rarity = Enum.SkinRarity.Common},
            Void = {Icon = 4088821168, Rarity = Enum.SkinRarity.Uncommon},
            Crew = {Icon = 129651968567178, Rarity = Enum.SkinRarity.Exclusive},
            ["Coconut Lover"] = {Icon = 130310121167383, Rarity = Enum.SkinRarity.Uncommon},
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