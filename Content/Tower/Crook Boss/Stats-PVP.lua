-- Script path: ReplicatedStorage.Content.Tower.Crook Boss.Stats-PVP
-- Decompile time: 2.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1,
                Damage = 5,
                Limit = 5,
                Price = 800,
                Range = 14,
                Attributes = {
                    PistolCrookSpawnTime = 50,
                    BackupCallTime = 1.5,
                    PistolCrookCap = 10,
                    TommyCrookCap = 4,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 525,
                    Image = 3032133716,
                    Title = "Quick Getaway",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 6,
                        Range = 14,
                        Attributes = {PistolCrookSpawnTime = 50},
                        Extras = {},
                    },
                },
                {
                    Cost = 1000,
                    Image = 3444643559,
                    Title = "Double Trouble",
                    Stats = {
                        Cooldown = 0.6,
                        Damage = 10,
                        Range = 15,
                        Attributes = {DoublePistolCrooks = true},
                        Extras = {"2 Pistol Crooks spawn at a time."},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = true,
                        },
                    },
                },
                {
                    Cost = 5000,
                    Image = 3838914605,
                    Title = "Tommy Goons",
                    Stats = {
                        Cooldown = 0.2,
                        Damage = 10,
                        Range = 16.5,
                        Attributes = {TommyCrookSpawnTime = 50, PistolCrookSpawnTime = 50},
                        Extras = {"Tommy Crooks (50s Spawn Time)", "5 Damage, 0.25 Firerate, 125 Health"},
                    },
                },
                {
                    Cost = 16000,
                    Image = 3444644903,
                    Title = "The Godfather",
                    Stats = {
                        Cooldown = 0.12,
                        Damage = 14,
                        Range = 17.5,
                        Attributes = {TommyDrum = true, TommyCrookSpawnTime = 50, PistolCrookSpawnTime = 50},
                        Extras = {"Upgraded Tommy Crooks", "6 Damage, 0.12 Firerate, 225 Health"},
                    },
                },
            },
        },
        Golden = {
            Defaults = {
                Cooldown = 0.9,
                Damage = 4,
                Limit = 5,
                Price = 800,
                Range = 14,
                Attributes = {
                    PistolCrookSpawnTime = 50,
                    BackupCallTime = 1.5,
                    PistolCrookCap = 10,
                    TommyCrookCap = 4,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                },
            },
            Upgrades = {
                {
                    Cost = 500,
                    Image = 3032133716,
                    Title = "Lvl 1. Broke",
                    Stats = {
                        Cooldown = 0.7,
                        Damage = 6,
                        Range = 14,
                        Attributes = {PistolCrookSpawnTime = 50},
                        Extras = {},
                    },
                },
                {
                    Cost = 1500,
                    Image = 3444643559,
                    Title = "Lvl. 2 Normie",
                    Stats = {
                        Cooldown = 0.7,
                        Damage = 10,
                        Range = 15,
                        Attributes = {DoublePistolCrooks = true},
                        Extras = {"2 Pistol Crooks spawn at a time."},
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.FlyingDetection] = true,
                        },
                    },
                },
                {
                    Cost = 6000,
                    Image = 3838914605,
                    Title = "Lvl 3. Gamer",
                    Stats = {
                        Cooldown = 0.18,
                        Damage = 10,
                        Range = 16,
                        Attributes = {TommyCrookSpawnTime = 50},
                        Extras = {"Golden Tommy Crooks (50s Spawn Time)", "5 Damage, 0.18 Firerate, 125 Health"},
                    },
                },
                {
                    Cost = 30000,
                    Image = 3444644903,
                    Title = "Lvl. 4 GOD",
                    Stats = {
                        Cooldown = 0.1,
                        Damage = 16,
                        Range = 17.5,
                        Attributes = {TommyDrum = true},
                        Extras = {"Upgraded Gold Tommy Crooks", "10 Damage, 0.1 Firerate, 225 Health"},
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Command henchmen to fight for you while looking cool!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {["Gun DPS"] = TowerDPS.Default},
        Role = Enum.TowerRole.Offense,
        Price = {
            Type = Enum.CurrencyType.Free,
            Eligible = function(a1) -- Line: 201 -- types: a1: userdata
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
            Null = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
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
    },
}