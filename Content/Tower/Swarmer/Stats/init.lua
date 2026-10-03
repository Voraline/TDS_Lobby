-- Script path: ReplicatedStorage.Content.Tower.Swarmer.Stats
-- Decompile time: 1.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local SwarmerTooltips = require(script.SwarmerTooltips)
local beeDebuffTooltip = SwarmerTooltips.beeDebuffTooltip
local unlockAbility = SwarmerTooltips.unlockAbility
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 125107182964673,
                    Title = "Extra Honey",
                    Cost = 400,
                    Stats = {
                        Range = 13,
                        Cooldown = 1.2,
                        Damage = 2,
                        Detections = {},
                        Attributes = {MaxStacksPerTower = 3, BeeDamage = 3, BeeTickRate = 1, BeeDuration = 2.1},
                    },
                    Tooltips = {
                        (beeDebuffTooltip({damage = 3, tickRate = 1, duration = 2.1, maxStacksPerTower = 3})),
                    },
                },
                {
                    Image = 119703739718324,
                    Title = "Aggressive Bees",
                    Cost = 1250,
                    Stats = {
                        Range = 15,
                        Cooldown = 1.2,
                        Damage = 4,
                        Detections = {},
                        Attributes = {MaxStacksPerTower = 6, BeeDamage = 3, BeeTickRate = 1, BeeDuration = 4.1},
                    },
                    Tooltips = {
                        (beeDebuffTooltip({damage = 3, tickRate = 0.75, duration = 3.2, maxStacksPerTower = 6})),
                    },
                },
                {
                    Image = 111277904554322,
                    Title = "Bee Certified Weapons",
                    Cost = 2000,
                    Stats = {
                        Range = 18,
                        Cooldown = 1.5,
                        Damage = 0,
                        Detections = {},
                        Attributes = {
                            MaxStacksPerTower = 12,
                            BeeDamage = 3,
                            BeeTickRate = 0.75,
                            BeeDuration = 5.25,
                            BeeGrenadeDamage = 30,
                            BeeGrenadeRange = 6,
                        },
                    },
                    Tooltips = {
                        beeDebuffTooltip({damage = 3, tickRate = 0.75, duration = 5.25, maxStacksPerTower = 15}),
                        unlockAbility({damage = 30, cooldown = 15, range = 6}),
                    },
                },
                {
                    Image = 115125540733937,
                    Title = "Beehive of Madness",
                    Cost = 5750,
                    Stats = {
                        Range = 20,
                        Cooldown = 1.25,
                        Damage = 0,
                        Detections = {},
                        Attributes = {
                            MaxStacksPerTower = 25,
                            BeeDamage = 3,
                            BeeTickRate = 0.75,
                            BeeDuration = 7.5,
                            BeeGrenadeDamage = 70,
                            BeeGrenadeRange = 7,
                        },
                    },
                    Tooltips = {
                        beeDebuffTooltip({damage = 3, tickRate = 0.75, duration = 7.5, maxStacksPerTower = 30}),
                        unlockAbility({damage = 70, cooldown = 15, range = 7}),
                    },
                },
                {
                    Image = 115125540733937,
                    Title = "Beekeeper of Death",
                    Cost = 10000,
                    Stats = {
                        Range = 20,
                        Cooldown = 1.25,
                        Damage = 0,
                        Detections = {},
                        Attributes = {
                            MaxStacksPerTower = 30,
                            BeeDamage = 4,
                            BeeTickRate = 0.75,
                            BeeDuration = 15,
                            BeeGrenadeDamage = 125,
                            BeeGrenadeRange = 8,
                        },
                    },
                    Tooltips = {
                        beeDebuffTooltip({damage = 4, tickRate = 0.75, duration = 15, maxStacksPerTower = 30}),
                        unlockAbility({damage = 125, cooldown = 15, range = 8}),
                    },
                },
            },
            Defaults = {
                Price = 900,
                Range = 13,
                Cooldown = 1.2,
                Damage = 2,
                Abilities = {
                    {
                        Name = "Swarm",
                        Description = "Chuck a hive grenade at the currently targeted enemy to unleash bees into the hoarde!",
                        Price = 0,
                        Level = 3,
                        Icon = 4865025806,
                        Debounce = 15,
                    },
                },
                Detections = {},
                Attributes = {MaxStacksPerTower = 1, BeeDamage = 3, BeeTickRate = 1, BeeDuration = 2.1},
            },
        },
    },
    Properties = {
        Description = "OH NOES, THE BEES! Attack enemies with bees that do damage over time. Won Spring 2020.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Regular DPS"] = TowerDPS.Default,
            ["Sting DPS"] = TowerDPS.Bees,
            ["Total DPS"] = TowerDPS.DamageOverTime,
        },
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        Gamepass = {Id = 8868555},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883314675,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.443460952792061, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}