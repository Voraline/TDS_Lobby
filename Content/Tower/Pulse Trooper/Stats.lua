-- Script path: ReplicatedStorage.Content.Tower.Pulse Trooper.Stats
-- Decompile time: 1.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 7,
                HideTargetingMode = true,
                Price = 2100,
                Damage = 13,
                Cooldown = 1.5,
                Range = 7.5,
                Detections = {
                    [Enum.Modifier.Flying] = false,
                    [Enum.Modifier.Lead] = false,
                    [Enum.Modifier.Hidden] = false,
                },
                Attributes = {MaxHits = 1000, PulseSpeed = 20, SweeperDuration = 3, SweeperDamage = 100},
                Abilities = {
                    {
                        Name = "Sweeper",
                        Level = 4,
                        Icon = 128149436227441,
                        Debounce = 60,
                        Cooldown = 60,
                        InitialCooldown = 30,
                        Price = 0,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Capacitor Boost",
                    Cost = 700,
                    Image = 135644027404170,
                    Stats = {Damage = 15, Range = 7.5, Cooldown = 1.2, Attributes = {MaxHits = 1000}},
                },
                {
                    Title = "Pulse Amplifier",
                    Cost = 3600,
                    Image = 111802725289728,
                    Stats = {
                        Damage = 25,
                        Range = 8.5,
                        Cooldown = 1.2,
                        Detections = {[Enum.Modifier.Lead] = true},
                        Attributes = {MaxHits = 1000},
                    },
                },
                {
                    Title = "Charged Filament",
                    Cost = 4900,
                    Image = 134734546148883,
                    Stats = {
                        Damage = 25,
                        Cooldown = 0.55,
                        Range = 8.5,
                        Detections = {[Enum.Modifier.Lead] = true},
                        Attributes = {MaxHits = 1000},
                    },
                },
                {
                    Title = "Sweeper",
                    Cost = 8500,
                    Image = 135194593575463,
                    Stats = {
                        Damage = 35,
                        Cooldown = 0.55,
                        Range = 9,
                        Detections = {[Enum.Modifier.Lead] = true},
                        Attributes = {
                            MaxHits = 1000,
                            SweeperDuration = 7.5,
                            SweeperDamage = 175,
                            SweeperUnlocked = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Sweeper Ability</b></font>",
                            Content = {
                                {
                                    Text = "Active: pause basic attacks and sweep two opposite lasers in a 360° arc, hitting each enemy exactly twice over 7.5 seconds.",
                                },
                                {Text = "Laser Damage: 175"},
                                {Text = "Ability Cooldown: 60s"},
                            },
                        },
                    },
                },
                {
                    Title = "Arc Reactor",
                    Cost = 17000,
                    Image = 107722623424761,
                    Stats = {
                        Damage = 50,
                        Cooldown = 0.55,
                        Range = 10,
                        Detections = {[Enum.Modifier.Lead] = true},
                        Attributes = {MaxHits = 1000, SweeperDuration = 6, SweeperDamage = 300},
                    },
                    AbilityUpgrades = {{Name = "Sweeper", Stats = {Debounce = 60, Cooldown = 60}}},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Sweeper Ability</b></font>",
                            Content = {{Text = "Laser Damage: 175 > 300"}, {Text = "Laser Duration: 7.5 > 6"}},
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Look ma, no aiming! A high-tech unit that releases piercing pulses in a 360° arc. Unlocks a map-wide sweeper on higher levels.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        BoundarySize = 2.25,
        DPS_Display = {Default = TowerDPS.Default, ["Sweeper DPS"] = TowerDPS.Sweeper},
        Role = Enum.TowerRole.Defense,
        Price = {Value = 3250, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 2, -6),
            Icon = 92920315130007,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}