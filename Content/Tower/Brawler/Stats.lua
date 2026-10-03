-- Script path: ReplicatedStorage.Content.Tower.Brawler.Stats
-- Decompile time: 2.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 300,
                Range = 6,
                Damage = 5,
                Cooldown = 1,
                Limit = 10,
                Detections = {StunImmune = true, [Enum.StatusEffect.LeadDetection] = true},
                Attributes = {MaxCombo = 1, KnockbackDebounce = 3, AbilityKnockback = 25},
                Abilities = {
                    {
                        Name = "Reposition",
                        Description = "Choose a new location to move the Brawler tower to. Has an AOE knockback radius around where the tower lands.",
                        Price = 0,
                        Level = 4,
                        Icon = 17408583420,
                        Debounce = 30,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Hand to Hand Training",
                    Cost = 200,
                    Image = 17522564142,
                    Stats = {Range = 6.5, Damage = 5, Cooldown = 0.6},
                },
                {
                    Title = "Enhanced Gauntlets",
                    Cost = 1200,
                    Image = 17522564142,
                    Stats = {
                        Range = 6.5,
                        Damage = 14,
                        Cooldown = 0.6,
                        Attributes = {MaxCombo = 3, FinalHitDmg = 21, FinalHitCD = 0.6, KnockbackForce = 17.5},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Attack Combo</b></font>",
                            Header = "Combo",
                            Content = {
                                {
                                    Text = "Performs a 3 hit combo, dealing increased damage on the final hit.",
                                },
                                {Text = "Final Hit Damage: <font color=\"rgb(255, 0, 0)\">21</font>"},
                                {Text = "Final Hit Cooldown: <font color=\"rgb(255, 0, 0)\">0.6</font>"},
                                {
                                    Text = "Final Hit Knockback: <font color=\"rgb(255, 0, 0)\">17.5</font>",
                                },
                            },
                        },
                    },
                },
                {
                    Title = "Pack a Punch",
                    Cost = 2500,
                    Image = 17522564023,
                    Stats = {
                        Range = 6.5,
                        Damage = 24,
                        Cooldown = 0.5,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {
                            GroundSmashDamage = 0,
                            GroundSmashRadius = 0,
                            FinalHitDmg = 48,
                            KnockbackForce = 24,
                            FinalHitCD = 0.5,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Attack Combo</b></font>",
                            Header = "Combo",
                            Content = {
                                {Text = "Final Hit Damage: <font color=\"rgb(255, 0, 0)\">48</font>"},
                                {Text = "Final Hit Cooldown: <font color=\"rgb(255, 0, 0)\">0.5</font>"},
                                {Text = "Final Hit Knockback: <font color=\"rgb(255, 0, 0)\">24</font>"},
                            },
                        },
                    },
                },
                {
                    Title = "GALVAKNUCKLES",
                    Cost = 3500,
                    Image = 17522564307,
                    Stats = {
                        Range = 7,
                        Cooldown = 0.5,
                        Damage = 35,
                        Attributes = {
                            GroundSmashDamage = 50,
                            GroundSmashRadius = 7.5,
                            KnockbackForce = 28,
                            FinalHitDmg = 70,
                            FinalHitCD = 0.5,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Reposition</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Choose a new location to move the Brawler tower to. Has an AOE knockback radius of 7.5 around where the tower drops.",
                                },
                                {Text = "Shockwave Damage: 50"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Attack Combo</b></font>",
                            Header = "Combo",
                            Content = {
                                {Text = "Final Hit Damage: <font color=\"rgb(255, 0, 0)\">70</font>"},
                                {Text = "Final Hit Cooldown: <font color=\"rgb(255, 0, 0)\">0.5</font>"},
                                {Text = "Final Hit Knockback: <font color=\"rgb(255, 0, 0)\">28</font>"},
                            },
                        },
                    },
                },
                {
                    Title = "Boreas' Fury",
                    Cost = 7777,
                    Image = 17522563932,
                    Stats = {
                        Damage = 50,
                        Range = 8,
                        Cooldown = 0.4,
                        Attributes = {
                            GroundSmashDamage = 100,
                            GroundSmashRadius = 10,
                            FinalHitDmg = 100,
                            FinalHitCD = 0.4,
                            KnockbackForce = 32,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Reposition</b></font>",
                            Header = "Ability",
                            Content = {{Text = "Shockwave Damage: 100"}, {Text = "Shockwave Radius: 10"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Attack Combo</b></font>",
                            Header = "Combo",
                            Content = {
                                {Text = "Final Hit Damage: <font color=\"rgb(255, 0, 0)\">100</font>"},
                                {Text = "Final Hit Cooldown: <font color=\"rgb(255, 0, 0)\">0.4</font>"},
                                {Text = "Final Hit Knockback: <font color=\"rgb(255, 0, 0)\">32</font>"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A close range specialist capable of pushing back foes and moving around the battlefield!",
        Height = 0,
        BoundarySize = 1,
        DPS_Display = {DPS = TowerDPS.Combo},
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 1250,
            PreviewText = "REACH LEVEL 50 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Gems,
            Eligible = function(a1) -- Line: 227 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 50 <= Level.Value
            end,
        },
        Class = Enum.TowerType.Ground,
        SkinData = {
            Blazing = {Icon = 18549605468, Rarity = Enum.SkinRarity.Legendary},
            Fallen = {Icon = 18835925180, Rarity = Enum.SkinRarity.Legendary},
            Loader = {Icon = 131316320823683, Rarity = Enum.SkinRarity.Legendary},
            Rudolph = {Icon = 122757939585280, Rarity = Enum.SkinRarity.Legendary},
            Jordan = {Icon = 70748904383488, Rarity = Enum.SkinRarity.Rare},
            Lovestriker = {Icon = 83049730035300, Rarity = Enum.SkinRarity.Legendary},
            Lobster = {Icon = 123985511698683, Rarity = Enum.SkinRarity.Rare},
            Banned = {Icon = 123985511698683, Rarity = Enum.SkinRarity.Exclusive},
            Werewolf = {Icon = 0, Rarity = Enum.SkinRarity.Legendary},
            Horse = {Icon = 101555481625059, Rarity = Enum.SkinRarity.Legendary},
            Bunny = {Icon = 94949911649262, Rarity = Enum.SkinRarity.Uncommon},
            ["Scuba Ops"] = {Icon = 0, Rarity = Enum.SkinRarity.Legendary},
            Beach = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883280552,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.6651914291880923, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Hardcore,
    },
}