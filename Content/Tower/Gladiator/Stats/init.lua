-- Script path: ReplicatedStorage.Content.Tower.Gladiator.Stats
-- Decompile time: 1.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GladiatorToolTips = require(script.GladiatorToolTips)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 525,
                Damage = 5,
                Cooldown = 0.95,
                Range = 5.5,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = true,
                },
                Attributes = {MaxHits = 2, ParryDuration = 0.75},
                Abilities = {
                    {
                        Name = "War Cry",
                        Description = "Call upon the warrior's might to temporarily boost attack rate and cleanse debuffs.",
                        Price = 0,
                        Level = 2,
                        Icon = 136428419311228,
                        Debounce = 30,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Arena Conditioning",
                    Image = 105348252118342,
                    Cost = 375,
                    Stats = {Damage = 7, Cooldown = 0.8, Range = 5.5},
                },
                {
                    Title = "Warrior's Call",
                    Image = 96547517389305,
                    Cost = 1250,
                    Tooltips = {
                        (GladiatorToolTips.unlockWarCry({
                            attackSpeedBuff = 65,
                            duration = 15,
                            cooldown = 30,
                            WarCryAtkSpdBuff = 65,
                            WarCryDuration = 15,
                            WarCryAttackCD = 1.5,
                            WarCryRangeMult = 1.5,
                        })),
                    },
                    Stats = {
                        Damage = 17,
                        Cooldown = 0.8,
                        Range = 5.5,
                        Attributes = {
                            WarCryAtkSpdBuff = 65,
                            WarCryDuration = 15,
                            WarCryAttackCD = 1.5,
                            WarCryRangeMult = 1.5,
                        },
                    },
                },
                {
                    Title = "Champion's Flame",
                    Image = 125163786762288,
                    Cost = 2125,
                    Tooltips = {
                        GladiatorToolTips.unlockFireAspect({burnDamage = 2, burnTick = 0.3, burnTime = 1.2, cooldown = 4}),
                        GladiatorToolTips.upgradeMaxHits({previousMaxHits = 2, maxHits = 5}),
                    },
                    Stats = {
                        Damage = 27,
                        Cooldown = 0.7,
                        Range = 6,
                        Detections = {
                            [Enum.StatusEffect.LeadDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                        },
                        Attributes = {
                            MaxHits = 5,
                            FireAspect = true,
                            FireAspectCooldown = 4,
                            BurnDamage = 2,
                            BurnTick = 0.3,
                            BurnTime = 1.2,
                        },
                    },
                },
                {
                    Title = "Centurion",
                    Image = 103812053986564,
                    Cost = 6200,
                    Tooltips = {
                        GladiatorToolTips.upgradeFireAspect({previousCooldown = 4, cooldown = 3, previousBurnDamage = 2, burnDamage = 4}),
                        GladiatorToolTips.upgradeMaxHits({previousMaxHits = 5, maxHits = 7}),
                    },
                    Stats = {
                        Damage = 57,
                        Cooldown = 0.7,
                        Range = 6,
                        Attributes = {FireAspectCooldown = 3, MaxHits = 7, BurnDamage = 4},
                    },
                },
                {
                    Title = "King of the Arena",
                    Image = 86341290427084,
                    Cost = 14900,
                    Tooltips = {
                        GladiatorToolTips.upgradeFireAspect({
                            previousCooldown = 3,
                            cooldown = 2,
                            previousBurnDamage = 4,
                            burnDamage = 7,
                            previousBurnTick = 0.3,
                            burnTick = 0.15,
                            previousBurnTime = 1.2,
                            burnTime = 1.5,
                        }),
                        GladiatorToolTips.upgradeMaxHits({previousMaxHits = 7, maxHits = 10}),
                    },
                    Stats = {
                        Damage = 77,
                        Cooldown = 0.55,
                        Range = 6.5,
                        Attributes = {
                            FireAspectCooldown = 2,
                            MaxHits = 10,
                            BurnDamage = 7,
                            BurnTick = 0.15,
                            BurnTime = 1.5,
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Slash nearby enemies, deal area damage, and parry incoming attacks! Won from SFOTH event 2019.",
        BoundarySize = 1,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {DPS = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Pumpkin = {Icon = 5084589873, Rarity = Enum.SkinRarity.Event},
            Demon = {Icon = 5084589873, Rarity = Enum.SkinRarity.Event},
            Slugger = {Icon = 5084589873, Rarity = Enum.SkinRarity.Legendary},
            Umbrella = {Icon = 5084589873, Rarity = Enum.SkinRarity.Exclusive},
            Beach = {Icon = 5084589873, Rarity = Enum.SkinRarity.Exclusive},
            Vigilante = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Pirate = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Galactic = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Phantom = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Cameraman = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883289853,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}