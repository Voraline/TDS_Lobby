-- Script path: ReplicatedStorage.Content.Tower.Freezer.Stats
-- Decompile time: 2.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 450,
                Range = 12,
                Cooldown = 0.55,
                Damage = 2,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
                Attributes = {
                    Burst = 1,
                    ReloadTime = 1,
                    DebuffLength = 2,
                    SlowPercent = 7.5,
                    MaxSlow = 15,
                    DebuffDamage = 0,
                    TickRate = 1,
                    DefenseMelt = 0,
                    CanFreeze = false,
                    FreezeTime = 0,
                    MaxHits = 5,
                    GrenadeFreezeTime = 2,
                    Velocity = 3,
                    ExplosionRadius = 6,
                    GrenadeEquip = 0.83,
                },
                Abilities = {
                    {
                        Name = "Frost Grenade",
                        Description = "Throws a grenade that freezes enemies in an area on impact.",
                        Price = 0,
                        Level = 4,
                        Icon = 14606405886,
                        Debounce = 15,
                    },
                },
            },
            Upgrades = {
                {
                    Image = 15686418975,
                    Title = "Expedition Gear",
                    Cost = 300,
                    Stats = {
                        Range = 12,
                        Damage = 2,
                        Cooldown = 0.35,
                        Attributes = {MaxSlow = 20, SlowPercent = 10},
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {
                                {Text = "❄️ Chill Slowness: 7.5% -> 10%"},
                                {Text = "❄️ Max Slowness: 15% -> 20%"},
                            },
                        },
                    },
                },
                {
                    Image = 15686418835,
                    Title = "Bundled Up!",
                    Cost = 450,
                    Stats = {
                        Damage = 3,
                        Range = 14,
                        Cooldown = 0.35,
                        Attributes = {
                            TickRate = 1,
                            DefenseMelt = 0,
                            FreezeTime = 0.5,
                            SlowPercent = 10,
                            MaxSlow = 20,
                            CanFreeze = true,
                        },
                        Extras = {},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {{Text = "🧊 Freeze Time: 0s -> 0.5s"}},
                        },
                    },
                },
                {
                    Image = 15686418748,
                    Title = "Arctic Soldier",
                    Cost = 1700,
                    Stats = {
                        Damage = 4,
                        Cooldown = 0.15,
                        Attributes = {
                            DebuffDamage = 3,
                            TickRate = 1,
                            Burst = 5,
                            MaxSlow = 25,
                            SlowPercent = 12.5,
                            DefenseMelt = 10,
                            FreezeTime = 0.5,
                            BurstCool = 0.6,
                            DebuffLength = 3,
                        },
                        Extras = {},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Burst</b></font>",
                            Content = {{Text = "Burst: 5"}, {Text = "Burst Cooldown: 0.6s"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {
                                {Text = "Defense Melt: 10%"},
                                {Text = "❄️ Chill Damage: 0 -> 3"},
                                {Text = "❄️ Damage Tick Rate: 1s"},
                                {Text = "❄️ Chill Slowness: 10% -> 12.5%"},
                                {Text = "❄️ Max Slowness: 20% -> 25%"},
                                {Text = "❄️ Chill Length: 2s -> 3s"},
                            },
                        },
                    },
                },
                {
                    Image = 15686418571,
                    Title = "Ull's Arrow",
                    Cost = 4500,
                    Stats = {
                        Damage = 9,
                        Cooldown = 0.15,
                        Range = 16,
                        Attributes = {
                            GrenadeFreezeTime = 2,
                            DebuffDamage = 5,
                            Burst = 7,
                            DefenseMelt = 10,
                            FreezeTime = 0.75,
                            MaxSlow = 25,
                        },
                        Extras = {},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Frost Grenade</b></font>",
                            Content = {
                                {Text = "Max Hits: 5"},
                                {Text = "Explosion Radius: 6"},
                                {Text = "Freeze Time: 2s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Burst</b></font>",
                            Content = {{Text = "Burst: 5 -> 7"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {
                                {Text = "❄️ Chill Damage: 3 -> 5"},
                                {Text = "🧊 Freeze Time: 0.5s -> 0.75s"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Brrr! Build up chill to slow and freeze enemies in their tracks!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.InclusiveBurstDamageOverTime},
        Role = Enum.TowerRole.Defense,
        Price = {Value = 650, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            ["Deep Freeze"] = {Icon = 4088821168, Rarity = Enum.SkinRarity.Common},
            IcyTea = {Icon = 5083319163, Rarity = Enum.SkinRarity.Uncommon},
            Foam = {Icon = 4088821168, Rarity = Enum.SkinRarity.Exclusive},
            ["Mint Choco"] = {Icon = 4629031777, Rarity = Enum.SkinRarity.Uncommon},
            Cryptid = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            ["Frost Legion"] = {Icon = 80819236795571, Rarity = Enum.SkinRarity.Rare},
            Vendor = {Icon = 109388902986099, Rarity = Enum.SkinRarity.Uncommon},
            ["Polar Bear"] = {Icon = 140734613188427, Rarity = Enum.SkinRarity.Uncommon},
            Bunny = {Icon = 111227800269391, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883287327,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}