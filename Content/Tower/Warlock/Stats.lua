-- Script path: ReplicatedStorage.Content.Tower.Warlock.Stats
-- Decompile time: 2.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.1,
                MeleeCooldown = 2,
                MeleeWindup = 0.8,
                MeleeDamage = 45,
                Damage = 25,
                Limit = 4,
                Price = 4200,
                Range = 18,
                Attributes = {
                    Knockback = 0,
                    Deadzone = 7,
                    HitboxAngle = 80,
                    MaxHits = 2,
                    KnockbackDebounce = 3,
                },
                MeleeWindupMultipliers = {1, 0.75, 0.75},
                Detections = {},
            },
            Upgrades = {
                {
                    Title = "Acolyte",
                    Image = 132600421163755,
                    Cost = 2500,
                    Stats = {
                        Damage = 40,
                        MeleeDamage = 75,
                        Cooldown = 1.1,
                        MeleeCooldown = 2,
                        MeleeWindup = 0.8,
                        Range = 19,
                        MeleeWindupMultipliers = {1, 0.75, 0.75},
                        Detections = {},
                        Attributes = {Knockback = 0, Deadzone = 7, MaxHits = 2},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Melee</b></font>",
                            Content = {
                                {Text = "Melee Range: 7"},
                                {Text = "Max Hits: 2"},
                                {Text = "Melee Damage: 45 > 75"},
                                {Text = "Melee Cooldown: 2s"},
                            },
                        },
                    },
                },
                {
                    Title = "Forbidden Arts",
                    Image = 92386627632419,
                    Cost = 6800,
                    Stats = {
                        Damage = 60,
                        MeleeDamage = 140,
                        Cooldown = 0.8,
                        MeleeCooldown = 2,
                        MeleeWindup = 0.8,
                        Range = 22,
                        MeleeWindupMultipliers = {1, 0.75, 0.75},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {Knockback = 15, Deadzone = 7.5, MaxHits = 2},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Melee</b></font>",
                            Content = {
                                {Text = "Melee Range: 7 > 7.5"},
                                {Text = "Max Hits: 2"},
                                {Text = "Melee Damage: 75 > 140"},
                                {Text = "Melee Cooldown: 2s"},
                            },
                        },
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Knockback</b></font>",
                            Content = {{Text = "Knockback Force: 15"}},
                        },
                    },
                },
                {
                    Title = "Pact of the Blade",
                    Image = 114159381171941,
                    Cost = 12000,
                    Stats = {
                        Damage = 115,
                        MeleeDamage = 200,
                        Cooldown = 0.8,
                        MeleeCooldown = 1.8,
                        MeleeWindup = 0.8,
                        Range = 22,
                        MeleeWindupMultipliers = {1, 0.75, 0.75},
                        Detections = {},
                        Attributes = {Knockback = 17.5, Deadzone = 7.5, MaxHits = 2},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Melee</b></font>",
                            Content = {
                                {Text = "Melee Range: 7.5"},
                                {Text = "Max Hits: 2"},
                                {Text = "Melee Damage: 140 > 200"},
                                {Text = "Melee Cooldown: 2s > 1.8s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Knockback</b></font>",
                            Content = {{Text = "Knockback Force: 15 > 17.5"}},
                        },
                    },
                },
                {
                    Title = "Eldritch Knight",
                    Image = 135475007047111,
                    Cost = 20000,
                    Stats = {
                        Damage = 190,
                        MeleeDamage = 350,
                        Cooldown = 0.8,
                        MeleeCooldown = 1.8,
                        MeleeWindup = 0.8,
                        Range = 24,
                        MeleeWindupMultipliers = {1, 0.75, 0.75},
                        Detections = {},
                        Attributes = {Knockback = 17.5, Deadzone = 8, BleedStack = 3, MaxHits = 3},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Melee</b></font>",
                            Content = {
                                {Text = "Melee Range: 7.5 > 8"},
                                {Text = "Max Hits: 2 > 3"},
                                {Text = "Melee Damage: 200 > 350"},
                                {Text = "Melee Cooldown: 1.8s"},
                                {Text = "Bleed Stacks on Hit: 3"},
                                {Text = "Bleed Tick: 1.8s"},
                            },
                        },
                    },
                },
                {
                    Title = "Abyss Walker",
                    Image = 134932843522178,
                    Cost = 30000,
                    Stats = {
                        Damage = 250,
                        MeleeDamage = 550,
                        Cooldown = 0.7,
                        MeleeCooldown = 1.8,
                        MeleeWindup = 0.8,
                        Range = 24,
                        MeleeWindupMultipliers = {1, 0.75, 0.75},
                        Detections = {[Enum.StatusEffect.LeadDetection] = true},
                        Attributes = {
                            Knockback = 20,
                            Deadzone = 9,
                            KnockbackDebounce = 3,
                            BleedStack = 5,
                            MaxHits = 3,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Melee</b></font>",
                            Content = {
                                {Text = "Melee Range: 8 > 9"},
                                {Text = "Max Hits: 3"},
                                {Text = "Melee Damage: 350 > 550"},
                                {Text = "Melee Cooldown: 1.8s"},
                                {Text = "Bleed Stacks on Hit: 5"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Knockback</b></font>",
                            Content = {{Text = "Knockback Force: 17.5 > 20"}},
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A hybrid melee and ranged tower that fights with eldritch magic. Capable of knocking back enemies and applying bleed.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Default, ["Melee DPS"] = TowerDPS.Melee},
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Rockstar = {Icon = 120290529373041, Rarity = Enum.SkinRarity.Legendary},
            Tiger = {Icon = 139541269723119, Rarity = Enum.SkinRarity.Uncommon},
            Eyecatcher = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
            ["Surfs Up"] = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
            Dragon = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883284370,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}