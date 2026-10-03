-- Script path: ReplicatedStorage.Content.Tower.Medic.Stats
-- Decompile time: 2.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 117008581932706,
                    Title = "Medical Precautions",
                    Cost = 425,
                    Stats = {
                        Range = 12,
                        Attributes = {
                            ["Shield Rechage Speed"] = 8,
                            ["Health Regen"] = 5,
                            ["Health Overheal Limit"] = 100,
                            ["Towers Can Support"] = 2,
                            Boosts = {Cooldown = 15},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Medi Gun",
                            Header = "Passive Ability",
                            Content = {{Text = "Max Assigned Towers: 1 → 2"}},
                        },
                    },
                },
                {
                    Image = 71546954858462,
                    Title = "Prescribed Vitamins",
                    Cost = 650,
                    Stats = {
                        Range = 14,
                        Detections = {},
                        Attributes = {
                            ["Shield Rechage Speed"] = 6,
                            ["Health Regen"] = 10,
                            ["Health Overheal Limit"] = 100,
                            ["Towers Can Support"] = 3,
                            Boosts = {Cooldown = 15},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Medi Gun",
                            Header = "Passive Ability",
                            Content = {
                                {Text = "Max Assigned Towers: 2 → 3"},
                                {Text = "Shield Regen Speed: 8s → 6s"},
                            },
                        },
                        {
                            ButtonText = "Upgrade Health Regen",
                            Header = "Passive Ability",
                            Content = {{Text = "Health Regen: 5 → 10"}},
                        },
                    },
                },
                {
                    Image = 130592941614779,
                    Title = "BIG BRAIN",
                    Cost = 2400,
                    Stats = {
                        Range = 15,
                        Detections = {},
                        Attributes = {
                            ["Shield Rechage Speed"] = 6,
                            ["Health Regen"] = 10,
                            ["Health Overheal Limit"] = 100,
                            ["Towers Can Support"] = 3,
                            Boosts = {Cooldown = 15},
                            UberCharge = {Duration = 7.5, ["Damage Boost"] = 20},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Health Regen",
                            Header = "Passive Ability",
                            Content = {{Text = "Health Regen: 10 → 20"}},
                        },
                        {
                            ButtonText = "Unlock Ubercharge",
                            Header = "Active Ability",
                            Content = {
                                {
                                    Text = "Give all assigned towers a temporary damage boost and full stun and freeze immunity while active. Grants self Freeze immunity while active.",
                                },
                                {Text = "Damage Boost: 20%"},
                                {Text = "Duration: 7.5s"},
                                {Text = "Cooldown: 60s"},
                            },
                        },
                    },
                },
                {
                    Image = 112504548905627,
                    Title = "Medical Pack",
                    Cost = 5000,
                    Stats = {
                        Range = 18,
                        Attributes = {
                            ["Shield Rechage Speed"] = 5,
                            ["Health Regen"] = 20,
                            ["Health Overheal Limit"] = 100,
                            ["Towers Can Support"] = 4,
                            Boosts = {Cooldown = 15},
                            UberCharge = {Duration = 10, ["Damage Boost"] = 27.5},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Medi Gun",
                            Header = "Active Ability",
                            Content = {
                                {Text = "Max Assigned Towers: 3 → 4"},
                                {Text = "Shield Regen Speed: 6s → 5s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded Ubercharge",
                            Header = "Active Ability",
                            Content = {
                                {
                                    Text = "Give all assigned towers a temporary damage boost and full stun and freeze immunity while active.",
                                },
                                {Text = "Damage Boost: 20% → 27.5%"},
                                {Text = "Duration: 7.5s → 10s"},
                                {Text = "Cooldown: 60s"},
                            },
                        },
                    },
                },
                {
                    Image = 112504548905627,
                    Title = "MD-PhD",
                    Cost = 12000,
                    Stats = {
                        Range = 20,
                        Attributes = {
                            ["Shield Rechage Speed"] = 4.5,
                            ["Health Regen"] = 20,
                            ["Health Overheal Limit"] = 100,
                            ["Towers Can Support"] = 5,
                            Boosts = {Cooldown = 15},
                            UberCharge = {Duration = 10, ["Damage Boost"] = 35},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Medi Gun",
                            Header = "Active Ability",
                            Content = {
                                {Text = "Max Assigned Towers: 4 → 5"},
                                {Text = "Shield Regen Speed: 5s → 4.5s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded Ubercharge",
                            Header = "Active Ability",
                            Content = {
                                {
                                    Text = "Give all assigned towers a temporary damage boost and full stun and freeze immunity while active.",
                                },
                                {Text = "Damage Boost: 27.5% → 35%"},
                                {Text = "Cooldown: 60s"},
                            },
                        },
                    },
                },
            },
            Defaults = {
                Immutable = true,
                Limit = 4,
                Price = 400,
                Range = 12,
                HideTargetingMode = true,
                Abilities = {
                    {
                        Name = "Ubercharge",
                        Description = "Gives all assigned towers a temporary damage boost, stun immunity, and freeze immunity while active. Grants self freeze immunity while active.",
                        Price = 0,
                        Level = 3,
                        Icon = 231100685,
                        InitialCooldown = 30,
                        Debounce = 60,
                    },
                },
                Detections = {},
                Attributes = {
                    ["Shield Rechage Speed"] = 8,
                    ["Health Regen"] = 5,
                    ["Health Overheal Limit"] = 100,
                    ["Towers Can Support"] = 1,
                    Boosts = {Cooldown = 15},
                    TowerSelectionCoolDown = 0.5,
                },
            },
        },
    },
    Properties = {
        Description = "Equipped with health regen and a medi gun to support and boost towers in range.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Support,
        Price = {Value = 2000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Mermaid = {Icon = 107509961893175, Rarity = Enum.SkinRarity.Legendary},
            Stranded = {Icon = 97722323410544, Rarity = Enum.SkinRarity.Uncommon},
            Witch = {Icon = 120995785751376, Rarity = Enum.SkinRarity.Event},
            Cyber = {Icon = 77947916767981, Rarity = Enum.SkinRarity.Rare},
            Valentines = {Icon = 98455922318086, Rarity = Enum.SkinRarity.Event},
            Bunny = {Icon = 81292807669872, Rarity = Enum.SkinRarity.Event},
            Masquerade = {Icon = 102457549018286, Rarity = Enum.SkinRarity.Event},
            Fallen = {Icon = 131777122693897, Rarity = Enum.SkinRarity.Rare},
            Plague = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
            ["Toy Ballerina"] = {Icon = 106910611115953, Rarity = Enum.SkinRarity.Rare},
            Bartender = {Icon = 132872148974242, Rarity = Enum.SkinRarity.Common},
            ["Second Chance"] = {Icon = 103107154309507, Rarity = Enum.SkinRarity.Legendary},
            Shamrock = {Icon = 73516049870313, Rarity = Enum.SkinRarity.Uncommon},
            Beach = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 70910607127530,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.6179938779914944, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}