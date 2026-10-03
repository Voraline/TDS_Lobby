-- Script path: ReplicatedStorage.Content.Tower.Cowboy.Stats
-- Decompile time: 3.19 ms

local BadgeService = game:GetService("BadgeService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1,
                Damage = 3,
                Income = 30,
                Price = 550,
                Range = 13,
                Limit = 12,
                Attributes = {MaxAmmo = 6, SpinDuration = 2},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 200,
                    Image = 5523233366,
                    Title = "Steady Hand",
                    Stats = {
                        Cooldown = 0.9,
                        Damage = 3,
                        Income = 30,
                        Range = 15,
                        Attributes = {MaxAmmo = 6, SpinDuration = 1.25},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Spin Time: 2s -> 1.25s"},
                    },
                },
                {
                    Cost = 600,
                    Image = 4999425200,
                    Title = "Lucky Shot",
                    Stats = {
                        Cooldown = 0.9,
                        Damage = 5,
                        Income = 50,
                        Range = 15,
                        Attributes = {MaxAmmo = 6, SpinDuration = 1.25},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {""},
                    },
                },
                {
                    Cost = 2000,
                    Image = 5523231844,
                    Title = "Deadly Precision",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 10,
                        Income = 50,
                        Range = 17.5,
                        Attributes = {MaxAmmo = 6, SpinDuration = 1},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Spin Time: 1.25s -> 1s"},
                    },
                },
                {
                    Cost = 3000,
                    Image = 5523234030,
                    Title = "Double Tap",
                    Stats = {
                        Cooldown = 0.35,
                        Damage = 10,
                        Income = 125,
                        Range = 20,
                        Attributes = {MaxAmmo = 12, SpinDuration = 1},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Max Ammo: 6 -> 12"},
                    },
                },
                {
                    Cost = 7777,
                    Image = 5523234990,
                    Title = "Outlawed",
                    Stats = {
                        Cooldown = 0.35,
                        Damage = 24,
                        Income = 185,
                        Range = 20,
                        Attributes = {MaxAmmo = 12, SpinDuration = 1},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                    },
                },
            },
        },
        Golden = {
            Defaults = {
                Cooldown = 0.9,
                Damage = 3,
                Income = 35,
                Price = 600,
                Range = 13,
                Limit = 12,
                Attributes = {MaxAmmo = 6, SpinDuration = 2},
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 200,
                    Image = 5523231844,
                    Title = "Headshot Practice",
                    Stats = {
                        Cooldown = 0.75,
                        Damage = 3,
                        Income = 35,
                        Range = 15,
                        Attributes = {MaxAmmo = 6, SpinDuration = 1.5},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Spin Time: 2s -> 1.5s"},
                    },
                },
                {
                    Cost = 650,
                    Image = 4999425200,
                    Title = "Gold Shot",
                    Stats = {
                        Cooldown = 0.75,
                        Damage = 5,
                        Income = 60,
                        Range = 15,
                        Attributes = {MaxAmmo = 6, SpinDuration = 1.5},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = false,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {""},
                    },
                },
                {
                    Cost = 2400,
                    Image = 5523233366,
                    Title = "Deadly Precision",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 12,
                        Income = 60,
                        Range = 17.5,
                        Attributes = {MaxAmmo = 6, SpinDuration = 1.25},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Spin Time: 1.5s -> 1.25s"},
                    },
                },
                {
                    Cost = 4250,
                    Image = 5523234030,
                    Title = "Double Tap II",
                    Stats = {
                        Cooldown = 0.3,
                        Damage = 12,
                        Income = 150,
                        Range = 20,
                        Attributes = {MaxAmmo = 12, SpinDuration = 1.25},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Max Ammo: 6 -> 12"},
                    },
                },
                {
                    Cost = 9750,
                    Image = 5523234990,
                    Title = "Wildest Of The West",
                    Stats = {
                        Cooldown = 0.3,
                        Damage = 26,
                        Income = 225,
                        Range = 20,
                        Attributes = {MaxAmmo = 12, SpinDuration = 1},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Spin Time: 1.25s -> 1s"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "There ain't enough room for the two of us pardner... Gains cash on reload.",
        Height = 0,
        BoundarySize = 1.25,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.SpinAmmo},
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 4000,
            MapLocked = "Badlands II",
            Type = Enum.CurrencyType.Coins,
            Eligible = function(a1) -- Line: 285 -- upvalues: BadgeService (val) -- types: a1: userdata
                local success, result = pcall(function() -- Line: 286 -- upvalues: BadgeService (upval), a1 (val)
                    return BadgeService:UserHasBadgeAsync(a1.UserId, 2128794382)
                end)
                return success and result
            end,
        },
        Class = Enum.TowerType.Ground,
        SkinData = {
            Patriotic = {Icon = 0, Rarity = Enum.SkinRarity.Legendary},
            Redemption = {Icon = 4592593282, Rarity = Enum.SkinRarity.Rare},
            Cop = {Icon = 6883278889, Rarity = Enum.SkinRarity.Common},
            Pumpkin = {Icon = 4134096662, Rarity = Enum.SkinRarity.Event},
            Cyberpunk = {Icon = 6883278889, Rarity = Enum.SkinRarity.Legendary},
            Retired = {Icon = 6883278889, Rarity = Enum.SkinRarity.Legendary},
            Golden = {Icon = 4592593400, Rarity = Enum.SkinRarity.Golden},
            Kasodus = {Icon = 5083320368, Rarity = Enum.SkinRarity.Uncommon},
            Noir = {Icon = 6883278889, Rarity = Enum.SkinRarity.Uncommon},
            Bandit = {Icon = 4592593126, Rarity = Enum.SkinRarity.Rare},
            Agent = {Icon = 4592593126, Rarity = Enum.SkinRarity.Rare},
            Badlands = {Icon = 4592593126, Rarity = Enum.SkinRarity.Exclusive},
            Valentines = {Icon = 4592593126, Rarity = Enum.SkinRarity.Rare},
            Holiday = {Icon = 4592593126, Rarity = Enum.SkinRarity.Event},
            Ducky = {Icon = 4592593126, Rarity = Enum.SkinRarity.Rare},
            Masquerade = {Icon = 4592593126, Rarity = Enum.SkinRarity.Event},
            ["Bounty Hunter"] = {Icon = 4592593126, Rarity = Enum.SkinRarity.Legendary},
            Fallen = {Icon = 18848220133, Rarity = Enum.SkinRarity.Rare},
            Megalodon = {Icon = 129525988654572, DisplayName = "MegaBit", Rarity = Enum.SkinRarity.Rare},
            Plushie = {Icon = 84617405752906, Rarity = Enum.SkinRarity.Exclusive},
            ["Dark Frost"] = {Icon = 78872525322359, Rarity = Enum.SkinRarity.Rare},
            ["Spring Time"] = {Icon = 127656855808415, Rarity = Enum.SkinRarity.Legendary},
            ["Mecha Bunny"] = {Icon = 74879957860347, Rarity = Enum.SkinRarity.Legendary},
            ["Vampire Hunter"] = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
            Shamrock = {Icon = 83616737653895, Rarity = Enum.SkinRarity.Common},
            ["Most Wanted"] = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
        },
        Gamepass = {Id = 90119024},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883278889,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}