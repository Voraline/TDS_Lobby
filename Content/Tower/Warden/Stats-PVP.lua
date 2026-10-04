-- Script path: ReplicatedStorage.Content.Tower.Warden.Stats-PVP
-- Decompile time: 1.91 ms

local BadgeService = game:GetService("BadgeService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.65,
                Damage = 6,
                Limit = 15,
                Price = 1000,
                Range = 6,
                Attributes = {
                    CanBlock = false,
                    CanStun = false,
                    MaxHits = 1,
                    ParryCooldown = 0.25,
                    ParryLength = 1.25,
                    StunLength = 0.65,
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
                    Cost = 350,
                    Image = 11415010529,
                    Title = "Night Shift",
                    Stats = {
                        Cooldown = 0.65,
                        Damage = 8,
                        Range = 6,
                        Attributes = {
                            CanBlock = false,
                            CanStun = false,
                            MaxHits = 1,
                            ParryCooldown = 0.25,
                            ParryLength = 1.25,
                            StunLength = 0.65,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 1250,
                    Image = 11415012702,
                    Title = "Heavier Stick",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 15,
                        Range = 7,
                        Attributes = {
                            CanBlock = false,
                            CanStun = false,
                            MaxHits = 1,
                            ParryCooldown = 0.25,
                            ParryLength = 1.25,
                            StunLength = 1.25,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = false,
                        },
                        Extras = {},
                    },
                },
                {
                    Cost = 4500,
                    Image = 11415014676,
                    Title = "Stunning Blows",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 34,
                        Range = 7,
                        Attributes = {
                            CanBlock = false,
                            CanStun = true,
                            MaxHits = 1,
                            ParryCooldown = 0.25,
                            ParryLength = 1.25,
                            StunLength = 1.25,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Stuns Enemies Every Hit"},
                    },
                },
                {
                    Cost = 17500,
                    Image = 11415015418,
                    Title = "Class Foxtrot Defense Level",
                    Stats = {
                        Cooldown = 0.5,
                        Damage = 80,
                        Range = 7.5,
                        Attributes = {
                            CanBlock = true,
                            CanStun = true,
                            MaxHits = 1,
                            ParryCooldown = 0.25,
                            ParryLength = 1.25,
                            StunLength = 1.75,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = false,
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Extras = {"Riot Shield: Block Stuns", "Longer Stuns"},
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
            Eligible = function(a1) -- Line: 148 -- upvalues: BadgeService (val) -- types: a1: userdata
                local success, result = pcall(function() -- Line: 149 -- upvalues: BadgeService (upval), a1 (val)
                    return BadgeService:UserHasBadgeAsync(a1.UserId, 2129234537)
                end)
                return success and result
            end,
        },
        Gamepass = {Id = 99570026},
        Class = Enum.TowerType.Ground,
        SkinData = {
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