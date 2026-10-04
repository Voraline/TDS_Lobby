-- Script path: ReplicatedStorage.Content.Tower.Warden.Stats
-- Decompile time: 2.47 ms

local BadgeService = game:GetService("BadgeService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.6,
                Damage = 12,
                Limit = 12,
                Price = 1850,
                Range = 6.5,
                Attributes = {
                    CanBlock = false,
                    CanStun = false,
                    ParryCooldown = 8,
                    ParryLength = 1,
                    MaxHits = 1,
                    CritMult = 1.5,
                    StunLength = 0.5,
                    AttackAngle = 80,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 975,
                    Image = 11415010529,
                    Title = "Night Shift",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 17,
                        Range = 7,
                        Attributes = {
                            CanBlock = false,
                            CanStun = false,
                            ParryCooldown = 8,
                            ParryLength = 1,
                            MaxHits = 1,
                            CritMult = 1.75,
                            StunLength = 0.5,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {"Critical Hit Multiplier: 1.5x > 1.75x"},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Part 1: <font color=\"rgb(255,185,0)\"><b>Warden Job Interview</b></font>",
                            Content = {
                                {
                                    Text = "Warden, if you want to keep this job, you must spend five waves at Wox's.",
                                },
                            },
                        },
                    },
                },
                {
                    Cost = 1987,
                    Image = 11415012702,
                    Title = "Heavier Stick",
                    Stats = {
                        Cooldown = 0.55,
                        Damage = 28,
                        Range = 7,
                        Attributes = {
                            CanBlock = false,
                            CanStun = false,
                            ParryCooldown = 8,
                            ParryLength = 1,
                            MaxHits = 1,
                            CritMult = 1.75,
                            StunLength = 0.75,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Stun Time: 0.5s > 0.75s"},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Part 2: <font color=\"rgb(255,185,0)\"><b>Warden Job Interview</b></font>",
                            Content = {
                                {
                                    Text = "Uhm, okay, sounds simple enough... can I bring my Hacker to the location?",
                                },
                            },
                        },
                    },
                },
                {
                    Cost = 5750,
                    Image = 11415014676,
                    Title = "Stunning Blows",
                    Stats = {
                        Cooldown = 0.45,
                        Damage = 48,
                        Range = 7.5,
                        Attributes = {
                            CanBlock = false,
                            CanStun = true,
                            ParryCooldown = 8,
                            ParryLength = 1,
                            MaxHits = 1,
                            CritMult = 2,
                            StunLength = 0.75,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Now stuns Enemies Every Hit", "Critical Hit Multiplier: 1.75x > 2x"},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Part 3: <font color=\"rgb(255,185,0)\"><b>Warden Job Interview</b></font>",
                            Content = {
                                {
                                    Text = "Yes, that's fine. But don't be mistaken, this isn't some kind of Tower Defense Simulator.",
                                },
                            },
                        },
                    },
                },
                {
                    Cost = 16500,
                    Image = 11415015418,
                    Title = "Class Foxtrot Defense Level",
                    Stats = {
                        Cooldown = 0.45,
                        Damage = 80,
                        Range = 8.5,
                        Attributes = {
                            CanBlock = true,
                            CanStun = true,
                            MaxHits = 1,
                            CritMult = 3,
                            ParryCooldown = 6,
                            ParryLength = 1,
                            StunLength = 1.25,
                            ParryDamageBuff = 100,
                            ParryBuffTime = 6,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Stun Time: 1.25s > 1.5s", "Critical Hit Multiplier: 2x > 3x"},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocks <font color=\"rgb(255,185,0)\"><b>Riot Shield</b></font>",
                            Content = {
                                {
                                    Text = "Parries stuns and grants self temporary stun immunity and a damage buff!",
                                },
                                {Text = "Parry Duration: 1s"},
                                {Text = "Parry Cooldown: 6s"},
                                {Text = "Parry Damage Buff: 100%"},
                                {Text = "Parry Buff Time: 6s (Stun Immune & Damage Buff Duration)"},
                            },
                        },
                        {
                            ButtonText = "Part 4: <font color=\"rgb(255,185,0)\"><b>Warden Job Interview</b></font>",
                            Content = {{Text = "I understand.. believe me, your souls are truly lost."}},
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Hit and Stun nearby enemies with a baton! Deals Critical hits every 3rd swing.",
        BoundarySize = 1,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.CriticalEveryThird},
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 4000,
            MapLocked = "Pizza Party",
            Type = Enum.CurrencyType.Coins,
            Eligible = function(a1) -- Line: 225 -- upvalues: BadgeService (val) -- types: a1: userdata
                local success, result = pcall(function() -- Line: 226 -- upvalues: BadgeService (upval), a1 (val)
                    return BadgeService:UserHasBadgeAsync(a1.UserId, 2129234537)
                end)
                return success and result
            end,
        },
        Gamepass = {Id = 99570026},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Patriotic = {Icon = 0, Rarity = Enum.SkinRarity.Legendary},
            Slaughter = {Icon = 4071738215, Rarity = Enum.SkinRarity.Exclusive},
            Baseball = {Icon = 4629030932, Rarity = Enum.SkinRarity.Rare},
            Ducky = {Icon = 4629030932, Rarity = Enum.SkinRarity.Uncommon},
            Pirate = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Galactic = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Masquerade = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Isaac = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Korblox = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            Fallen = {Icon = 18960948589, Rarity = Enum.SkinRarity.Rare},
            Freddy = {Icon = 106739389283977, Rarity = Enum.SkinRarity.Uncommon},
            ["Dark Frost"] = {Icon = 137394918093332, Rarity = Enum.SkinRarity.Uncommon},
            Shark = {Icon = 70941336840822, Rarity = Enum.SkinRarity.Rare},
            Shamrock = {Icon = 81691471922457, Rarity = Enum.SkinRarity.Uncommon},
            Bunny = {Icon = 88016690050740, Rarity = Enum.SkinRarity.Common},
            Amalgamation = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 11415034651,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}