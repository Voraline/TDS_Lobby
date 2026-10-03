-- Script path: ReplicatedStorage.Content.Tower.Ace Pilot.Stats
-- Decompile time: 1.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 17847640091,
                    Title = "Greased Guns",
                    Cost = 225,
                    Stats = {Damage = 3, Cooldown = 0.22, Extras = {}, Attributes = {HiddenAssist = false}},
                },
                {
                    Image = 17847639896,
                    Title = "Bombs away!",
                    Cost = 625,
                    Stats = {Damage = 4, Attributes = {BombDropping = true, HiddenAssist = false}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Bomb Dropping</b></font>",
                            Header = "Bomb Dropping",
                            Content = {{Text = "Damage: 10"}, {Text = "Radius: 3"}, {Text = "Cooldown: 4s"}},
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(46, 206, 255)\"><b>Figure8</b></font>",
                            Header = "Flight Path",
                            Content = {{Text = "Will fly in a figure 8 pattern."}},
                        },
                    },
                },
                {
                    Image = 17847640366,
                    Title = "Aerial Ace",
                    Cost = 1500,
                    Stats = {
                        Cooldown = 0.15,
                        Range = 10,
                        Damage = 5,
                        Extras = {},
                        Attributes = {
                            ExplosionDamage = 30,
                            ExplosionRadius = 3,
                            SpeedMultiplier = 1.1,
                            HiddenAssist = false,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded Bombs",
                            Header = "Stats",
                            Content = {{Text = "Damage: <font color=\"rgb(0, 255, 0)\">30</font>"}},
                        },
                    },
                },
                {
                    Image = 17847640366,
                    Title = "Spy Plane",
                    Cost = 3000,
                    Stats = {
                        Damage = 8,
                        Range = 10,
                        Cooldown = 0.15,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {
                            Buildzone = 10,
                            BombTime = 2,
                            ExplosionDamage = 30,
                            ExplosionRadius = 3,
                            HiddenAssist = false,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Hidden Assist",
                            Header = "Stats",
                            Content = {
                                {
                                    Text = "<font color=\"rgb(0, 255, 0)\">Grants hidden detection to nearby towers!</font>",
                                },
                                {Text = "Assist Radius: <font color=\"rgb(0, 255, 0)\">10</font>"},
                            },
                        },
                        {
                            ButtonText = "Upgraded Bombs",
                            Header = "Stats",
                            Content = {{Text = "Bomb Time: <font color=\"rgb(0, 255, 0)\">2</font>"}},
                        },
                    },
                },
                {
                    Image = 17847640211,
                    Title = "The Surging Sky",
                    Cost = 7000,
                    Stats = {
                        Range = 10,
                        Cooldown = 0.12,
                        Damage = 14,
                        Extras = {"Speed increased by 35%"},
                        Attributes = {
                            Buildzone = 10,
                            BombTime = 1.5,
                            ExplosionDamage = 45,
                            ExplosionRadius = 4,
                            SpeedMultiplier = 1.35,
                            HiddenAssist = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Hidden Assist",
                            Header = "Stats",
                            Content = {
                                {
                                    Text = "<font color=\"rgb(0, 255, 0)\">Grants hidden detection to nearby towers!</font>",
                                },
                                {Text = "Assist Radius: <font color=\"rgb(0, 255, 0)\">10</font>"},
                            },
                        },
                        {
                            ButtonText = "Upgraded Bombs",
                            Header = "Stats",
                            Content = {
                                {Text = "Damage: <font color=\"rgb(0, 255, 0)\">45</font>"},
                                {Text = "Radius: <font color=\"rgb(0, 255, 0)\">4</font>"},
                                {Text = "Cooldown: <font color=\"rgb(0, 255, 0)\">1.5s</font>"},
                            },
                        },
                    },
                },
            },
            Defaults = {
                Limit = 8,
                Price = 500,
                Range = 9,
                Cooldown = 0.22,
                Damage = 2,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
                Abilities = {
                    {
                        Name = "Toggle Reverse",
                        Description = "Reverses the flight direction of the tower.",
                        Price = 0,
                        Level = 0,
                        Icon = 17846960799,
                        Debounce = 8,
                    },
                },
                Attributes = {
                    ExplosionRadius = 3,
                    ExplosionDamage = 10,
                    BombTime = 4,
                    BombDropping = false,
                    HiddenAssist = false,
                },
            },
        },
    },
    Properties = {
        Description = "Flies in a circular path, shooting enemies in its line of fire and dropping bombs.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Gun DPS"] = TowerDPS.Default,
            ["Bomb DPS"] = {Calculate = TowerDPS.Bomb, Visible = TowerDPS.HasBombDropping},
            ["Total DPS"] = {Calculate = TowerDPS.GunAndBomb, Visible = TowerDPS.HasBombDropping},
        },
        Role = Enum.TowerRole.Defense,
        Price = {Value = 1500, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Flying,
        SkinData = {
            Navy = {Icon = 17859247163, Rarity = Enum.SkinRarity.Rare},
            Purple = {Icon = 17859247791, Rarity = Enum.SkinRarity.Common},
            Green = {Icon = 17859246778, Rarity = Enum.SkinRarity.Common},
            Pumpkin = {Icon = 17859247510, Rarity = Enum.SkinRarity.Event},
            Yellow = {Icon = 17859248807, Rarity = Enum.SkinRarity.Common},
            ["Aerial Ace"] = {Icon = 17859245825, Rarity = Enum.SkinRarity.Common},
            Red = {Icon = 17859248266, Rarity = Enum.SkinRarity.Common},
            Easter = {Icon = 137734270861409, Rarity = Enum.SkinRarity.Legendary},
            ["Toy Plane"] = {Icon = 130633804263917, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.3499999940395355, 0),
            Icon = 17859246260,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.490658503988659, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}