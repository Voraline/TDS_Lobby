-- Script path: ReplicatedStorage.Content.Tower.Brawler.Stats-PVP
-- Decompile time: 1.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Immutable = true,
            Defaults = {
                Price = 600,
                Range = 6,
                Damage = 10,
                Cooldown = 0.9,
                Limit = 6,
                Detections = {[Enum.StatusEffect.LeadDetection] = true},
                Attributes = {MaxCombo = 1, KnockbackDebounce = 3, AbilityKnockback = 25},
                Abilities = {
                    {
                        Name = "Reposition",
                        Price = 0,
                        Level = 3,
                        Icon = 17408583420,
                        Debounce = 20,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Hand to Hand Training",
                    Cost = 300,
                    Image = 0,
                    Stats = {Range = 6, Damage = 10, Cooldown = 0.6},
                },
                {
                    Title = "Enhanced Gauntlets",
                    Cost = 950,
                    Image = 17522564142,
                    Stats = {
                        Damage = 12,
                        Cooldown = 0.6,
                        Attributes = {MaxCombo = 3, FinalHitDmg = 23, FinalHitCD = 0.75, KnockbackForce = 17.5},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Attack Combo</b></font>",
                            Header = "Combo",
                            Content = {
                                {
                                    Text = "Performs a 3 hit combo, dealing increased damage on the final hit.",
                                },
                                {Text = "Final Hit Damage: <font color=\"rgb(255, 0, 0)\">24</font>"},
                            },
                        },
                    },
                },
                {
                    Title = "Pack a Punch",
                    Cost = 2250,
                    Image = 17522564023,
                    Stats = {
                        Damage = 20,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {
                            FinalHitDmg = 38,
                            KnockbackForce = 20,
                            FinalHitCD = 0.65,
                            GroundSmashDamage = 20,
                        },
                        Extras = {"Final Hit Damage: 40"},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Reposition</b></font>",
                            Header = "Ability",
                            Content = {
                                {
                                    Text = "Choose a new location to move the Brawler tower to. Has an AOE stun radius of 10 around where the tower drops.",
                                },
                                {Text = "Cooldown: 20 seconds"},
                                {Text = "Reposition Damage: 20"},
                            },
                        },
                    },
                },
                {
                    Title = "Prototype Frame",
                    Cost = 5200,
                    Image = 17522564307,
                    Stats = {
                        Range = 6.5,
                        Cooldown = 0.5,
                        Damage = 38,
                        Attributes = {
                            GroundSmashDamage = 80,
                            KnockbackForce = 24,
                            FinalHitDmg = 67,
                            FinalHitCD = 0.5,
                        },
                        Extras = {"Final Hit Damage: 70"},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Reposition Damage</b></font>",
                            Header = "Ability",
                            Content = {
                                {Text = "Reposition now deals damage on landing!"},
                                {Text = "Reposition Damage: 80"},
                            },
                        },
                    },
                },
                {
                    Title = "Faster Hydraulics",
                    Cost = 12000,
                    Image = 17522563932,
                    Stats = {
                        Damage = 70,
                        Range = 7,
                        Cooldown = 0.5,
                        Attributes = {
                            GroundSmashDamage = 150,
                            FinalHitDmg = 143,
                            FinalHitCD = 0.5,
                            KnockbackForce = 30,
                        },
                        Extras = {"Final Hit Damage: 150", "Reposition Damage: 150"},
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
        Price = {Value = 1250, Type = Enum.CurrencyType.Gems},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Blazing = {Icon = 18549605468, Rarity = Enum.SkinRarity.Legendary},
            Fallen = {Icon = 18835925180, Rarity = Enum.SkinRarity.Legendary},
            Loader = {Icon = 131316320823683, Rarity = Enum.SkinRarity.Legendary},
            Rudolph = {Icon = 122757939585280, Rarity = Enum.SkinRarity.Legendary},
            Jordan = {Icon = 70748904383488, Rarity = Enum.SkinRarity.Rare},
            Lovestriker = {Icon = 83049730035300, Rarity = Enum.SkinRarity.Legendary},
            Lobster = {Icon = 123985511698683, Rarity = Enum.SkinRarity.Rare},
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