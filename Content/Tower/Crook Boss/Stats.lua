-- Script path: ReplicatedStorage.Content.Tower.Crook Boss.Stats
-- Decompile time: 2.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 0.9,
                Damage = 12,
                Limit = 5,
                Price = 2250,
                Range = 16.5,
                Attributes = {
                    PistolCrookSpawnTime = 45,
                    BackupCallTime = 1.5,
                    PistolCrookCap = 10,
                    TommyCrookCap = 3,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 1500,
                    Image = 3032133716,
                    Title = "Quick Getaway",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 16,
                        Range = 16.5,
                        Attributes = {PistolCrookSpawnTime = 40},
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        Extras = {},
                    },
                },
                {
                    Cost = 2750,
                    Image = 3444643559,
                    Title = "Double Trouble",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 23,
                        Range = 19,
                        Attributes = {DoublePistolCrooks = true},
                        Extras = {"2 Pistol Crooks spawn at a time."},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Cost = 14000,
                    Image = 3838914605,
                    Title = "Tommy Goons",
                    Stats = {
                        Cooldown = 0.2,
                        Damage = 23,
                        Range = 22,
                        Attributes = {TommyCrookSpawnTime = 32.5, PistolCrookSpawnTime = 40},
                        Extras = {"Tommy Crooks (32.5s Spawn Time)", "5 Damage, 0.2 Firerate, 175 Health"},
                    },
                },
                {
                    Cost = 47500,
                    Image = 3444644903,
                    Title = "The Godfather",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 38,
                        Range = 22,
                        Attributes = {TommyDrum = true, TommyCrookSpawnTime = 32.5, PistolCrookSpawnTime = 40},
                        Extras = {"Upgraded Tommy Crooks", "5 Damage, 0.12 Firerate, 275 Health"},
                    },
                },
            },
        },
        Golden = {
            Defaults = {
                Cooldown = 0.8,
                Damage = 12,
                Limit = 5,
                Price = 2400,
                Range = 16.5,
                Attributes = {
                    PistolCrookSpawnTime = 45,
                    BackupCallTime = 1.5,
                    PistolCrookCap = 10,
                    TommyCrookCap = 3,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 1600,
                    Image = 3032133716,
                    Title = "Lvl 1. Broke",
                    Stats = {
                        Cooldown = 0.55,
                        Damage = 16,
                        Range = 16.5,
                        Attributes = {PistolCrookSpawnTime = 45},
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        Extras = {},
                    },
                },
                {
                    Cost = 3200,
                    Image = 3444643559,
                    Title = "Lvl. 2 Normie",
                    Stats = {
                        Cooldown = 0.55,
                        Damage = 25,
                        Range = 19,
                        Attributes = {DoublePistolCrooks = true},
                        Extras = {"2 Pistol Crooks spawn at a time."},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                },
                {
                    Cost = 16500,
                    Image = 3838914605,
                    Title = "Lvl 3. Gamer",
                    Stats = {
                        Cooldown = 0.18,
                        Damage = 25,
                        Range = 22,
                        Attributes = {TommyCrookSpawnTime = 31},
                        Extras = {"Golden Tommy Crooks (31s Spawn Time)", "5 Damage, 0.18 Firerate, 175 Health"},
                    },
                },
                {
                    Cost = 50000,
                    Image = 3444644903,
                    Title = "Lvl. 4 GOD",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 42,
                        Range = 22,
                        Attributes = {TommyDrum = true},
                        Extras = {"Upgraded Gold Tommy Crooks", "6 Damage, 0.12 Firerate, 300 Health"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Command henchmen to fight for you while looking cool!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        EvolvedTo = "EvolvedKingpin",
        BuyAllLevelsProductId = 3610270179,
        DPS_Display = {["Gun DPS"] = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {
            Type = Enum.CurrencyType.Free,
            Eligible = function(a1) -- Line: 205 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 30 <= Level.Value
            end,
        },
        Gamepass = {Id = 6757455, Value = 400},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Golden = {Icon = 116517852538324, Rarity = Enum.SkinRarity.Golden},
            Demon = {Icon = 4221838067, Rarity = Enum.SkinRarity.Event},
            Checker = {Icon = 4343073579, Rarity = Enum.SkinRarity.Common},
            Spooky = {Icon = 4592599925, Rarity = Enum.SkinRarity.Event},
            Xmas = {Icon = 4538506451, Rarity = Enum.SkinRarity.Event},
            Soviet = {Icon = 4592599925, Rarity = Enum.SkinRarity.Legendary},
            Blue = {Icon = 4592648399, Rarity = Enum.SkinRarity.Common},
            Red = {Icon = 4592599925, Rarity = Enum.SkinRarity.Common},
            Cupid = {Icon = 4592599925, Rarity = Enum.SkinRarity.Legendary},
            Holiday = {Icon = 4343065951, Rarity = Enum.SkinRarity.Event},
            Pirate = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Necromancer = {Icon = 4088821168, Rarity = Enum.SkinRarity.Exclusive},
            Corso = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            Intern = {Icon = 4088821168, Rarity = Enum.SkinRarity.Exclusive},
            SteamPunk = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            DRKSHDW = {Icon = 4088821168, Rarity = Enum.SkinRarity.Uncommon},
            Cybernetic = {Icon = 4088821168, Rarity = Enum.SkinRarity.Rare},
            ["Dark Frost"] = {Icon = 125130339305089, Rarity = Enum.SkinRarity.Rare},
            ["Alien Focus"] = {Icon = 133134889361359, Rarity = Enum.SkinRarity.Rare},
            ["Game Master"] = {
                Icon = 75261782948960,
                Rarity = Enum.SkinRarity.Ultimate,
                Price = {
                    Value = 749,
                    GiftId = 2828558207,
                    Id = 2828558111,
                    Type = Enum.CurrencyType.Robux,
                },
            },
            Easter = {Icon = 101408307745429, Rarity = Enum.SkinRarity.Rare},
            Null = {Icon = 129534020809985, Rarity = Enum.SkinRarity.Rare},
            Yourself = {Icon = 0, Rarity = Enum.SkinRarity.Exclusive},
            ["Rat King"] = {Icon = 93096777615093, Rarity = Enum.SkinRarity.Rare},
            Victorian = {Icon = 106585833687838, Rarity = Enum.SkinRarity.Rare},
            Narrator = {
                Icon = 92111450115834,
                Rarity = Enum.SkinRarity.Ultimate,
                Price = {
                    Value = 1199,
                    GiftId = 3555416409,
                    Id = 3555415611,
                    Type = Enum.CurrencyType.Robux,
                },
            },
            ["Pool Day"] = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883280552,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.356194490192345, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
        Progression = {MaxLevel = 20, BaseExp = 50, GrowthRate = 1.09},
    },
}