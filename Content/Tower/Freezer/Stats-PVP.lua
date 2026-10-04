-- Script path: ReplicatedStorage.Content.Tower.Freezer.Stats-PVP
-- Decompile time: 1.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 425,
                Range = 12,
                Cooldown = 0.5,
                Damage = 1,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
                Attributes = {
                    Burst = 1,
                    ReloadTime = 1,
                    DebuffLength = 5,
                    SlowPercent = 10,
                    MaxSlow = 30,
                    DebuffDamage = 0,
                    TickRate = 0.25,
                    DefenseMelt = 0,
                    CanFreeze = false,
                    FreezeTime = 0,
                    MaxHits = 5,
                    Velocity = 3,
                    ExplosionRadius = 6,
                    GrenadeEquip = 0.83,
                },
                Abilities = {
                    {
                        Name = "Frost Grenade",
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
                    Cost = 225,
                    Stats = {Range = 12, Damage = 2, Attributes = {MaxSlow = 40, SlowPercent = 10}, Extras = {}},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {{Text = "❄️ Max Slowness: 30% -> 40%"}},
                        },
                    },
                },
                {
                    Image = 15686418835,
                    Title = "Bundled Up!",
                    Cost = 650,
                    Stats = {
                        Damage = 2,
                        Range = 14,
                        Attributes = {DefenseMelt = 0, FreezeTime = 2, SlowPercent = 20, CanFreeze = true},
                        Extras = {},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {{Text = "🧊 Freeze Time: 0 -> 2"}, {Text = "Chill Slowness: 10% -> 20%"}},
                        },
                    },
                },
                {
                    Image = 15686418748,
                    Title = "Arctic Soldier",
                    Cost = 2000,
                    Stats = {
                        Damage = 3,
                        Cooldown = 0.15,
                        Attributes = {
                            Burst = 3,
                            MaxSlow = 60,
                            SlowPercent = 20,
                            DefenseMelt = 10,
                            FreezeTime = 2.5,
                            BurstCool = 0.8,
                        },
                        Extras = {},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Burst</b></font>",
                            Content = {{Text = "Burst: 1 -> 3"}, {Text = "Burst Cooldown: 0.8"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Chill</b></font>",
                            Content = {{Text = "Defense Melt: 10"}, {Text = "❄️ Max Slowness: 40% -> 60%"}},
                        },
                    },
                },
                {
                    Image = 15686418571,
                    Title = "Frost Bite!",
                    Cost = 4500,
                    Stats = {
                        Damage = 5,
                        Cooldown = 0.15,
                        Range = 16,
                        Attributes = {Burst = 6, DefenseMelt = 10, FreezeTime = 3},
                        Extras = {"Burst: 3 -> 6", "🧊 Frost Grenade Ability"},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Chill enemies to a slow freeze!",
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