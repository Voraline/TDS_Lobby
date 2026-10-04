-- Script path: ReplicatedStorage.Content.Tower.DJ Booth.Stats
-- Decompile time: 3.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 1,
                HideTargetingMode = true,
                Price = 850,
                Range = 12,
                Cooldown = 0,
                Damage = 0,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {
                    PurpleTrackBuffs = {Range = 12.5, Discount = 0, Damage = 0},
                    GreenTrackBuffs = {Range = 0, Discount = 5, Damage = 0},
                    RedTrackBuffs = {Range = 0, Discount = 0, Damage = 0},
                },
                Abilities = {
                    {
                        Name = "Drop The Beat",
                        Description = "Send out a powerful beat that has different effects based on the active track.",
                        Level = 3,
                        Icon = 132111474124053,
                        InitialCooldown = 10,
                        Debounce = 30,
                    },
                },
            },
            Upgrades = {
                {
                    Image = 95144637961093,
                    Title = "Laptop Studio",
                    Cost = 300,
                    Stats = {Range = 15, Extras = {}},
                },
                {
                    Image = 113548130163293,
                    Title = "Party Mode",
                    Cost = 1250,
                    Stats = {
                        Range = 15,
                        Extras = {"Purple Track Range 12.5 → 15", "Green Track Discount 5 → 7.5"},
                        Attributes = {
                            PurpleTrackBuffs = {Range = 15, Discount = 0, Damage = 0},
                            GreenTrackBuffs = {Range = 0, Discount = 7.5, Damage = 0},
                            RedTrackBuffs = {Range = 0, Discount = 0, Damage = 10},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Unlock</b></font> <font color=\"rgb(255, 96, 96)\"><b>Red Track</b></font>",
                            Header = "Track",
                            Content = {
                                {
                                    Text = "Provides allied towers in range with a <font color=\"rgb(255,185,0)\"><b>10%</b></font> damage buff.",
                                },
                            },
                        },
                    },
                },
                {
                    Image = 101877307760287,
                    Title = "Thrifty Music",
                    Cost = 3000,
                    Stats = {
                        Damage = 25,
                        Range = 15,
                        Extras = {
                            "Purple Track Range 15 → 17.5",
                            "Green Track Discount 7.5 → 10",
                            "Red Track Damage 10 → 12.5",
                        },
                        Attributes = {
                            PurpleTrackBuffs = {Range = 17.5, Discount = 0, Damage = 0},
                            GreenTrackBuffs = {Range = 0, Discount = 10, Damage = 0},
                            RedTrackBuffs = {Range = 0, Discount = 0, Damage = 12.5},
                            PurpleTrackAbility = {
                                Knockback = 20,
                                SlowDuration = 5,
                                BaseSlowDebuff = 10,
                                SlowDebuffPerTwr = 1,
                                MaxSlowDebuff = 25,
                                MaxHits = 6,
                            },
                            GreenTrackAbility = {BaseCash = 250, CashPerTower = 35, MaxCash = 600},
                            RedTrackAbility = {BaseDefenseMelt = 2, DefenseMeltPerTwr = 0.25, MaxDefMelt = 10},
                            PulseCount = 3,
                            PulseCD = 1.5,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Unlock Drop The Beat</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Perform a powerful ability that differs based on what track is active. Scales with towers in range.",
                                },
                            },
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Drop The Beat (Purple)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Knockback and apply a slowness debuff to enemies in range.\n\t• Base Slowness: <font color=\"rgb(255,185,0)\"><b>10%</b></font>\n\t• Slowness per Tower: <font color=\"rgb(255,185,0)\"><b>1%</b></font>\n\t• Max Slowness: <font color=\"rgb(255,185,0)\"><b>25%</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Drop The Beat (Green)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Gain a cash payout based on the number of towers in range.\n\t• Base cash: <font color=\"rgb(255,185,0)\"><b>$250</b></font>\n\t• Cash per Tower: <font color=\"rgb(255,185,0)\"><b>$35</b></font>\n\t• Max Payout: <font color=\"rgb(255,185,0)\"><b>$600</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Drop The Beat (Red)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Apply defense melt and deal damage to enemies in range.\n\t• Base Defense Melt: <font color=\"rgb(255,185,0)\"><b>2%</b></font>\n\t• Defense Melt per tower: <font color=\"rgb(255,185,0)\"><b>0.25%</b></font>\n\t• Max Defense Melt: <font color=\"rgb(255,185,0)\"><b>10%</b></font>",
                                },
                            },
                        },
                    },
                },
                {
                    Image = 123117801948681,
                    Title = "Audio Visualizer",
                    Cost = 8000,
                    Stats = {
                        Damage = 50,
                        Range = 16.5,
                        Extras = {
                            "Purple Track Range 17.5 → 22.5",
                            "Green Track Discount 10 → 12.5",
                            "Red Track Damage 10 → 15",
                        },
                        Attributes = {
                            PurpleTrackBuffs = {Range = 22.5, Discount = 0, Damage = 0},
                            GreenTrackBuffs = {Range = 0, Discount = 12.5, Damage = 0},
                            RedTrackBuffs = {Range = 0, Discount = 0, Damage = 15},
                            PurpleTrackAbility = {
                                Knockback = 20,
                                SlowDuration = 8,
                                BaseSlowDebuff = 10,
                                SlowDebuffPerTwr = 1,
                                MaxSlowDebuff = 30,
                                MaxHits = 6,
                            },
                            RedTrackAbility = {BaseDefenseMelt = 3, DefenseMeltPerTwr = 0.25, MaxDefMelt = 12},
                            GreenTrackAbility = {BaseCash = 500, CashPerTower = 50, MaxCash = 1250},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Drop The Beat (Purple)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Knockback and apply a slowness debuff to enemies in range.\n\t• Base Slowness: <font color=\"rgb(255,185,0)\"><b>10%</b></font>\n\t• Slowness per Tower: <font color=\"rgb(255,185,0)\"><b>1%</b></font>\n\t• Max Slowness: <font color=\"rgb(255,185,0)\"><b>30%</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Drop The Beat (Green)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Gain a cash payout based on the number of towers in range.\n\t• Base cash: <font color=\"rgb(255,185,0)\"><b>$250</b></font>\n\t• Cash per Tower: <font color=\"rgb(255,185,0)\"><b>$35</b></font>\n\t• Max Payout: <font color=\"rgb(255,185,0)\"><b>$600</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Drop The Beat (Red)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Apply defense melt and deal damage to enemies in range.\n\t• Base Defense Melt: <font color=\"rgb(255,185,0)\"><b>3%</b></font>\n\t• Defense Melt per tower: <font color=\"rgb(255,185,0)\"><b>0.25%</b></font>\n\t• Max Defense Melt: <font color=\"rgb(255,185,0)\"><b>12%</b></font>",
                                },
                            },
                        },
                    },
                },
                {
                    Image = 113854542319656,
                    Title = "Apocalypse Rave",
                    Cost = 20000,
                    Stats = {
                        Damage = 75,
                        Range = 18,
                        Extras = {},
                        Attributes = {
                            PurpleTrackBuffs = {Range = 25, Discount = 5, Damage = 7.5},
                            GreenTrackBuffs = {Discount = 15, Range = 10, Damage = 7.5},
                            RedTrackBuffs = {Damage = 20, Discount = 5, Range = 10},
                            PurpleTrackAbility = {
                                Knockback = 20,
                                SlowDuration = 10,
                                BaseSlowDebuff = 10,
                                SlowDebuffPerTwr = 1,
                                MaxSlowDebuff = 35,
                                MaxHits = 8,
                            },
                            GreenTrackAbility = {BaseCash = 750, CashPerTower = 75, MaxCash = 2250},
                            RedTrackAbility = {BaseDefenseMelt = 5, DefenseMeltPerTwr = 0.25, MaxDefMelt = 15},
                            PulseCount = 4,
                            PulseCD = 1.5,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Unlock Trinity Buffs</b></font>",
                            Header = "Passive Buffs",
                            Content = {{Text = "All tracks now apply all passive buffs."}},
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Trinity Buffs (Purple)</b></font>",
                            Header = "Purple Track Buffs",
                            Content = {
                                {
                                    Text = "Range 22.5 → <font color=\"rgb(255,185,0)\"><b>25%</b></font>",
                                },
                                {
                                    Text = "Discount 0 → <font color=\"rgb(255,185,0)\"><b>5%</b></font>",
                                },
                                {
                                    Text = "Damage 0 → <font color=\"rgb(255,185,0)\"><b>7.5%</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Trinity Buffs (Green)</b></font>",
                            Header = "Green Track Buffs",
                            Content = {
                                {Text = "Range 0 → <font color=\"rgb(255,185,0)\"><b>10%</b></font>"},
                                {
                                    Text = "Discount 12.5 → <font color=\"rgb(255,185,0)\"><b>15%</b></font>",
                                },
                                {
                                    Text = "Damage 0 → <font color=\"rgb(255,185,0)\"><b>7.5%</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>Trinity Buffs (Red)</b></font>",
                            Header = "Red Track Buffs",
                            Content = {
                                {Text = "Range 0 → <font color=\"rgb(255,185,0)\"><b>10%</b></font>"},
                                {
                                    Text = "Discount 0 → <font color=\"rgb(255,185,0)\"><b>5%</b></font>",
                                },
                                {
                                    Text = "Damage 15 → <font color=\"rgb(255,185,0)\"><b>20%</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Drop The Beat (Purple)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Knockback and apply a slowness debuff to enemies in range.\n\t• Base Slowness: <font color=\"rgb(255,185,0)\"><b>10%</b></font>\n\t• Slowness per Tower: <font color=\"rgb(255,185,0)\"><b>1%</b></font>\n\t• Max Slowness: <font color=\"rgb(255,185,0)\"><b>35%</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Drop The Beat (Green)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Gain a cash payout based on the number of towers in range.\n\t• Base cash: <font color=\"rgb(255,185,0)\"><b>$250</b></font>\n\t• Cash per Tower: <font color=\"rgb(255,185,0)\"><b>$35</b></font>\n\t• Max Payout: <font color=\"rgb(255,185,0)\"><b>$600</b></font>",
                                },
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Drop The Beat (Red)</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Apply defense melt and deal damage to enemies in range.\n\t• Base Defense Melt: <font color=\"rgb(255,185,0)\"><b>5%</b></font>\n\t• Defense Melt per tower: <font color=\"rgb(255,185,0)\"><b>0.25%</b></font>\n\t• Max Defense Melt: <font color=\"rgb(255,185,0)\"><b>15%</b></font>",
                                },
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Who said you couldn't rave during the apocalypse? Pick between 3 different tracks to support your allies in unique ways.",
        Height = 0,
        BoundarySize = 2.5,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Support,
        Price = {Value = 5000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            ["Neon Rave"] = {Icon = 88395223637973, Rarity = Enum.SkinRarity.Rare},
            Neko = {Icon = 115310627249069, Rarity = Enum.SkinRarity.Legendary},
            Ghost = {Icon = 111981689753740, Rarity = Enum.SkinRarity.Event},
            Plushie = {Icon = 4343065951, Rarity = Enum.SkinRarity.Exclusive},
            Masquerade = {Icon = 4343065951, Rarity = Enum.SkinRarity.Event},
            Mako = {
                Icon = 105492996309734,
                Rarity = Enum.SkinRarity.Ultimate,
                Price = {
                    Value = 749,
                    GiftId = 2835767831,
                    Id = 1925912139,
                    Type = Enum.CurrencyType.Robux,
                },
            },
            ["Garage Band"] = {Icon = 102404432745932, Rarity = Enum.SkinRarity.Legendary},
            Ducky = {Icon = 108324875176244, Rarity = Enum.SkinRarity.Rare},
            Seal = {Icon = 124438946534088, Rarity = Enum.SkinRarity.Legendary},
            Gingerbread = {Icon = 90183289444675, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 90127560097295,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.490658503988659, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}