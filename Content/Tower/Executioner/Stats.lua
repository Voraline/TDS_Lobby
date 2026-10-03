-- Script path: ReplicatedStorage.Content.Tower.Executioner.Stats
-- Decompile time: 1.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 94311490799022,
                    Title = "Quick Chopping",
                    Cost = 450,
                    Stats = {
                        Range = 17,
                        Cooldown = 0.75,
                        Damage = 7,
                        Attributes = {MaxTargets = 3, MaxBounces = 5, BounceDamage = 6},
                    },
                },
                {
                    Image = 125594742597786,
                    Title = "Double-Headed Axe",
                    Cost = 1777,
                    Stats = {
                        Range = 17,
                        Cooldown = 0.75,
                        Damage = 14,
                        Attributes = {MaxTargets = 4, MaxBounces = 6, BounceDamage = 6},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Improved Bounces",
                            Content = {{Text = "Max Targets: 3 > 4"}, {Text = "Bounce Count: 5 > 6"}},
                        },
                    },
                },
                {
                    Image = 88160736854274,
                    Title = "Cloaked Revenant",
                    Cost = 3750,
                    Stats = {
                        Range = 17,
                        Cooldown = 0.75,
                        Damage = 20,
                        Attributes = {MaxTargets = 4, MaxBounces = 7, BounceDamage = 12},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Improved Bounces",
                            Content = {{Text = "Bounce Count: 6 > 7"}, {Text = "Added Damage On Bounce: 6 > 12"}},
                        },
                    },
                },
                {
                    Image = 105063766778640,
                    Title = "Ghoul Shreddin'",
                    Cost = 6750,
                    Stats = {
                        Range = 17,
                        Cooldown = 0.75,
                        Damage = 40,
                        Attributes = {MaxTargets = 6, MaxBounces = 9, BounceDamage = 13},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Improved Bounces",
                            Content = {
                                {Text = "Max Targets: 4 > 6"},
                                {Text = "Bounce Count: 7 > 9"},
                                {Text = "Added Damage On Bounce: 12 > 13"},
                            },
                        },
                    },
                },
                {
                    Image = 121607739944705,
                    Title = "The Judge & The Jury",
                    Cost = 13500,
                    Stats = {
                        Range = 19,
                        Cooldown = 0.5,
                        Damage = 50,
                        Attributes = {MaxTargets = 7, MaxBounces = 12, BounceDamage = 15},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Improved Bounces",
                            Content = {
                                {Text = "Max Targets: 6 > 7"},
                                {Text = "Bounce Count: 9 > 12"},
                                {Text = "Added Damage On Bounce: 13 > 15"},
                            },
                        },
                    },
                },
            },
            Defaults = {
                Limit = 9,
                Price = 1800,
                Range = 15,
                Cooldown = 1,
                Damage = 7,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {MaxTargets = 3, MaxBounces = 5, BounceDamage = 6},
            },
        },
    },
    Properties = {
        Description = "Hey, catch this! Throws a sharp axe that bounces between enemies, gaining more damage on each contact.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Full-chain DPS (est.)"] = {
                Calculate = TowerDPS.Executioner,
                Tooltip = function(a1) -- Line: 170 -- upvalues: TowerDPS (val)
                    return {
                        Header = "Full-chain DPS (est.)",
                        Subject = string.format("Max damage per throw: %.2f", TowerDPS.ExecutionerThrowDamage(a1)),
                        Content = {
                            {Text = "Assumes all contacts land across enemies."},
                            {Text = "Uses the longest normal flight times."},
                            {Text = "Includes windup, return, catch, and cooldown."},
                            {Text = "Actual DPS varies with spacing, lost targets, and retargeting."},
                        },
                    }
                end,
            },
        },
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Eclipse = {Icon = 4690285744, Rarity = Enum.SkinRarity.Event},
            Vanquisher = {Icon = 4690285744, Rarity = Enum.SkinRarity.Rare},
            Heartbreak = {Icon = 100643097900090, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 8010337395,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}