-- Script path: ReplicatedStorage.Content.Tower.Slasher.Stats
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 92740435796975,
                    Title = "Sleight of Hands",
                    Cost = 1000,
                    Stats = {
                        Cooldown = 0.4,
                        Damage = 14,
                        Range = 5,
                        Attributes = {CritMult = 2},
                        Extras = {},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Image = 93224058728799,
                    Title = "Bloodlust",
                    Cost = 4800,
                    Stats = {
                        Range = 5,
                        Cooldown = 0.6,
                        Damage = 14,
                        Extras = {},
                        Attributes = {BleedStack = 13, CritMult = 2.1},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                            ["FreezeImmune"] = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Bleed Debuff</b></font>",
                            Content = {
                                {
                                    Text = "Stacks 13 bleed per hit, up to 450 max stacks. When max stacks are reached, bleed collapses, dealing all accumulated bleed damage at once.",
                                },
                                {Text = "Bleed Base Damage: 3 (per stack). Scales with enemy HP."},
                                {Text = "Bleed Tick Rate: 1s"},
                                {Text = "Bleed Collapse Cooldown: 5s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Critical Hit</b></font>",
                            Content = {{Text = "Critical Damage Multiplier increased from 2x to 2.1x."}},
                        },
                    },
                },
                {
                    Image = 102669883500047,
                    Title = "Psycho Knife",
                    Cost = 11003,
                    Stats = {
                        Cooldown = 0.55,
                        Damage = 24,
                        Range = 5,
                        Attributes = {BleedStack = 20, CritMult = 2.5},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                            ["FreezeImmune"] = true,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Bleed Debuff</b></font>",
                            Content = {{Text = "Bleed Stacks: 13 -> 20 per hit."}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Critical Hit</b></font>",
                            Content = {{Text = "Critical Damage Multiplier increased from 2.1x to 2.5x."}},
                        },
                    },
                },
                {
                    Image = 102686099141752,
                    Title = "Ocean Of Blood",
                    Cost = 40000,
                    Stats = {
                        Range = 5,
                        Cooldown = 0.5,
                        Damage = 38,
                        Extras = {},
                        Attributes = {BleedStack = 45, CritMult = 4},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                            ["FreezeImmune"] = true,
                            ["StunImmune"] = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Bleed Debuff</b></font>",
                            Content = {{Text = "Bleed Stacks: 20 -> 45 per hit."}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Critical Hit</b></font>",
                            Content = {{Text = "Critical Damage Multiplier increased from 2.5x to 4x."}},
                        },
                    },
                },
            },
            Defaults = {
                Price = 2400,
                Range = 5,
                Cooldown = 0.4,
                Damage = 10,
                Limit = 8,
                Detections = {},
                Attributes = {SliceAngle = 280, CritChance = 25, CritMult = 2},
                Extras = {},
            },
        },
    },
    Properties = {
        Description = "Stabs nearby enemies and applies bleed on higher levels. Exclusive tower.",
        BoundarySize = 1,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.CriticalChance},
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Spooky = {Icon = 87446356234317, Rarity = Enum.SkinRarity.Event},
            ["Spring Time"] = {Icon = 100945870370166, Rarity = Enum.SkinRarity.Exclusive},
            Jason = {Icon = 80815511240891, Rarity = Enum.SkinRarity.Event},
            Pirate = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 85826790424914,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}