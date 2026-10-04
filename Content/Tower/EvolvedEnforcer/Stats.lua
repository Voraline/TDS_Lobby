-- Script path: ReplicatedStorage.Content.Tower.EvolvedEnforcer.Stats
-- Decompile time: 3.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 5,
                Price = 3000,
                Range = 10,
                Cooldown = 1,
                Damage = 10,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
                Attributes = {
                    AbilityFireLockDuration = 1,
                    ProjectileCount = 6,
                    ShotgunBaseSpread = 3.5,
                    ShotgunRandomSpread = 2,
                    MaxHits = 2,
                    FlashbangStunTime = 0,
                    FlashbangRadius = 0,
                    FlashbangChargeThreshold = 0,
                    FlashbangFireLockDuration = 0.5,
                    FlashbangThrowSpeed = 35,
                    FlashbangAnimationDelay = 0.25,
                    Ammo = 0,
                    ReloadTime = 2,
                    PumpTime = 1,
                },
                Abilities = {
                    {
                        Name = "SWAT Van",
                        DisplayName = "SWAT Van",
                        Level = 5,
                        Path = 2,
                        Icon = 100823329847564,
                        Debounce = 45,
                    },
                    {
                        Name = "Helicopter Reposition",
                        DisplayName = "Helicopter Reposition",
                        Level = 5,
                        Path = 1,
                        Icon = 99853162676239,
                        Debounce = 90,
                        InitialCooldown = 90,
                        Price = 2500,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Elbow Grease",
                    Cost = 750,
                    Image = 136369346813725,
                    Stats = {
                        Damage = 10,
                        Cooldown = 0.85,
                        Range = 12,
                        Attributes = {ProjectileCount = 6, PumpTime = 0.85},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shotgun</b></font>",
                            Content = {{Text = "Shotgun Pump Time: 1s -> 0.85s"}},
                        },
                    },
                },
                {
                    Title = "Flash Grenade",
                    Cost = 2650,
                    Image = 107404064476607,
                    Stats = {
                        Damage = 12,
                        Cooldown = 0.85,
                        Range = 12,
                        Detections = {
                            [Enum.StatusEffect.LeadDetection] = true,
                            [Enum.StatusEffect.HiddenDetection] = true,
                        },
                        Attributes = {
                            ProjectileCount = 8,
                            FlashbangStunTime = 0.5,
                            FlashbangRadius = 4,
                            FlashbangChargeThreshold = 640,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                            Content = {
                                {Text = "Flashbang Damage Charge Requirement: 640"},
                                {Text = "Flashbang Stun Time: 0.5s"},
                                {Text = "Flashbang Stun Radius: 4"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shotgun</b></font>",
                            Content = {{Text = "Shotgun Pellet Count: 6 -> 8"}},
                        },
                    },
                },
                {
                    Title = "Urban Operations",
                    Cost = 4600,
                    Image = 82782455075877,
                    Stats = {
                        Damage = 20,
                        Cooldown = 0.85,
                        Range = 12,
                        Attributes = {
                            MaxHits = 2,
                            ProjectileCount = 8,
                            FlashbangStunTime = 0.5,
                            FlashbangRadius = 5,
                            FlashbangChargeThreshold = 1000,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                            Content = {
                                {Text = "Flashbang Damage Charge Requirement: 640 -> 1000"},
                                {Text = "Flashbang Stun Radius: 4 -> 5"},
                            },
                        },
                    },
                },
                {
                    Title = "Specialist",
                    Cost = 7250,
                    Image = 76520357411079,
                    Stats = {
                        Damage = 33,
                        Cooldown = 0.85,
                        Range = 12,
                        Attributes = {
                            PumpTime = 0.85,
                            ProjectileCount = 8,
                            FlashbangStunTime = 0.75,
                            FlashbangRadius = 5,
                            FlashbangChargeThreshold = 1500,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                            Content = {
                                {Text = "Flashbang Damage Charge Requirement: 1000 -> 1500"},
                                {Text = "Flashbang Stun Time: 0.5s -> 0.75s"},
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Good Comms",
                        Cost = 12000,
                        Image = 75300201894000,
                        Stats = {
                            Damage = 14,
                            Cooldown = 0.2,
                            Range = 17,
                            Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                            Attributes = {
                                MaxHits = 1,
                                ShotgunBaseSpread = 1.5,
                                ShotgunRandomSpread = 1,
                                ProjectileCount = 4,
                                Ammo = 25,
                                ReloadTime = 1.5,
                                PumpTime = 0,
                                FlashbangStunTime = 1.2,
                                FlashbangRadius = 4.5,
                                FlashbangChargeThreshold = 1200,
                                HelicopterSpeed = 20,
                                HelicopterTransportSpeedMultiplier = 0.5,
                                HelicopterHoverDuration = 0.5,
                                HelicopterMinTransportDuration = 1.5,
                                HelicopterApproachDistance = 100,
                                HelicopterExitDistance = 100,
                                UnitSpawns = {},
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Support Helicopter</b></font>",
                                Header = "Active Ability",
                                Content = {
                                    {
                                        Text = "Call in a helicopter to reposition one of your own towers on the battlefield",
                                    },
                                    {Text = "Cost: 2500"},
                                    {Text = "Cooldown: 90s"},
                                    {Text = "Initial Cooldown: 90s"},
                                },
                            },
                            {
                                ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Automatic Shotgun</b></font>",
                                Content = {
                                    {Text = "Shotgun Pump Time removed, now fires automatically"},
                                    {Text = "Shotgun now has to reload after 25 shots"},
                                    {Text = "Shotgun Reload Time: 1.5s"},
                                    {Text = "Shotgun Base Spread: 3.5 -> 1.5"},
                                    {Text = "Shotgun Random Spread: 2 -> 1"},
                                    {Text = "Shotgun Pellet Count: 8 -> 4"},
                                    {Text = "Shotgun Max Hits: 2 -> 1"},
                                },
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                                Content = {
                                    {Text = "Flashbang Damage Charge Requirement: 1500 -> 1200"},
                                    {Text = "Flashbang Stun Radius: 5 -> 4.5"},
                                    {Text = "Flashbang Stun Time: 0.75s -> 1.2s"},
                                },
                            },
                        },
                    },
                    {
                        Title = "SWAT Van",
                        Cost = 12000,
                        Image = 93191574637363,
                        Stats = {
                            Damage = 33,
                            Cooldown = 0.7,
                            Range = 13,
                            Attributes = {
                                PumpTime = 0.7,
                                ShotgunBaseSpread = 2.5,
                                ShotgunRandomSpread = 2,
                                MaxHits = 2,
                                ProjectileCount = 8,
                                FlashbangStunTime = 0.75,
                                FlashbangRadius = 6.5,
                                FlashbangChargeThreshold = 2000,
                                UnitSpawns = {
                                    {
                                        unitName = "Swat Van",
                                        unitUpgrade = 0,
                                        amount = 1,
                                        health = 750,
                                        stunTime = 1,
                                        spawnTime = 1,
                                    },
                                },
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>SWAT VANS</b></font>",
                                Header = "Active Ability",
                                Content = {
                                    {Text = "Call in a SWAT Van to assist you in battle"},
                                    {Text = "Cooldown: 45s"},
                                    {Text = "Health: 750"},
                                    {Text = "Defense: 10"},
                                    {Text = "Speed: 7"},
                                    {Text = "Explosion Damage: 350"},
                                    {Text = "Explosion Radius: 6"},
                                },
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                                Content = {
                                    {Text = "Flashbang Damage Charge Requirement: 1500 -> 2000"},
                                    {Text = "Flashbang Stun Radius: 5 -> 6.5"},
                                },
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shotgun</b></font>",
                                Content = {
                                    {Text = "Shotgun Pump Time: 0.85s -> 0.7s"},
                                    {Text = "Shotgun Base Spread: 3.5 -> 2.5"},
                                },
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Full Arsenal",
                        Cost = 20000,
                        Image = 90582348502485,
                        Stats = {
                            Damage = 14,
                            Cooldown = 0.2,
                            Range = 19.5,
                            Attributes = {
                                MaxHits = 1,
                                ShotgunBaseSpread = 1.5,
                                ShotgunRandomSpread = 1,
                                ProjectileCount = 6,
                                Ammo = 60,
                                ReloadTime = 1.5,
                                PumpTime = 0,
                                FlashbangStunTime = 1.2,
                                FlashbangRadius = 4.5,
                                FlashbangChargeThreshold = 1800,
                                UnitSpawns = {},
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                                Content = {{Text = "Flashbang Damage Charge Requirement: 1200 -> 1800"}},
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Automatic Shotgun</b></font>",
                                Content = {
                                    {Text = "Shotgun Pellet Count: 4 -> 6"},
                                    {Text = "Shotgun Ammo Count: 25 -> 60"},
                                },
                            },
                        },
                    },
                    {
                        Title = "Full Suit",
                        Cost = 15000,
                        Image = 79398593824767,
                        Stats = {
                            Damage = 38,
                            Cooldown = 0.7,
                            Range = 13,
                            Attributes = {
                                PumpTime = 0.7,
                                ShotgunBaseSpread = 2.5,
                                ShotgunRandomSpread = 2,
                                ProjectileCount = 10,
                                FlashbangStunTime = 1,
                                FlashbangRadius = 6.5,
                                FlashbangChargeThreshold = 2500,
                                UnitSpawns = {
                                    {
                                        unitName = "Swat Van",
                                        unitUpgrade = 1,
                                        amount = 1,
                                        health = 1200,
                                        stunTime = 1.25,
                                        spawnTime = 1,
                                    },
                                },
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>SWAT VANS</b></font>",
                                Header = "Active Ability",
                                Content = {
                                    {Text = "Health: 750 -> 1200"},
                                    {Text = "Explosion Damage: 350 -> 450"},
                                    {Text = "Defense: 10 -> 15"},
                                },
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                                Content = {
                                    {Text = "Flashbang Damage Charge Requirement: 2000 -> 2500"},
                                    {Text = "Flashbang Stun Time: 0.75s -> 1s"},
                                },
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Shotgun</b></font>",
                                Content = {{Text = "Shotgun Pellet Count: 8 -> 10"}},
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Punisher",
                        Cost = 31500,
                        Image = 83679968823067,
                        Stats = {
                            Damage = 18,
                            Cooldown = 0.2,
                            Range = 19.5,
                            Attributes = {
                                MaxHits = 1,
                                ProjectileCount = 6,
                                ShotgunBaseSpread = 1.5,
                                ShotgunRandomSpread = 1,
                                Ammo = 60,
                                ReloadTime = 1,
                                PumpTime = 0,
                                FlashbangStunTime = 1.5,
                                FlashbangRadius = 4.5,
                                FlashbangChargeThreshold = 2700,
                                UnitSpawns = {},
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                                Content = {{Text = "Flashbang Damage Charge Requirement: 1800 -> 2700"}},
                            },
                        },
                    },
                    {
                        Title = "Peacekeeper",
                        Cost = 20000,
                        Image = 79055341194840,
                        Stats = {
                            Damage = 45,
                            Cooldown = 0.7,
                            Range = 14,
                            Detections = {StunImmune = true},
                            Attributes = {
                                PumpTime = 0.7,
                                ShotgunBaseSpread = 2.5,
                                ShotgunRandomSpread = 2,
                                ProjectileCount = 10,
                                FlashbangStunTime = 1,
                                FlashbangRadius = 6.5,
                                FlashbangChargeThreshold = 3000,
                                UnitSpawns = {
                                    {
                                        unitName = "Swat Van Gunner",
                                        amount = 1,
                                        health = 1500,
                                        stunTime = 1.5,
                                        spawnTime = 2,
                                    },
                                    {
                                        unitName = "Swat Van Gunner",
                                        amount = 1,
                                        health = 1500,
                                        stunTime = 1.5,
                                        spawnTime = 2,
                                    },
                                },
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>SWAT VANS</b></font>",
                                Header = "Active Ability",
                                Content = {
                                    {Text = "Now sends out two SWAT Vans per call"},
                                    {
                                        Text = "SWAT vans are now equipped with a machine gun. Detects hidden enemies.",
                                    },
                                    {Text = "Health: 1200 -> 1500"},
                                    {Text = "Explosion Damage: 450 -> 550"},
                                    {Text = "Machine Gun Damage: 10"},
                                    {Text = "Machine Gun Cooldown: 0.15s"},
                                    {Text = "Machine Gun Range: 25"},
                                },
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Flashbang</b></font>",
                                Content = {{Text = "Flashbang Damage Charge Requirement: 2500 -> 3000"}},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Strike force rolling! A powerful shotgunner that can flashbang enemies, call in backup swat vans, and reposition other towers with a helicopter.",
        Height = 0,
        BoundarySize = 1,
        BoundingSize = Vector3.new(0, 0, 0),
        DisplayName = "Enforcer",
        EvolvesFrom = "Shotgunner",
        EvolutionLevel = 20,
        BuyAllLevelsProductId = 3707916695,
        DPS_Display = {Default = TowerDPS.Enforcer},
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {Abyssal = {Icon = 0, Rarity = Enum.SkinRarity.Rare}},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Evolved,
        Price = {
            {Value = 15000, Type = Enum.CurrencyType.Coins},
            {Value = 4750, Type = Enum.CurrencyType.Gems},
        },
        Progression = {MaxLevel = 20, BaseExp = 75, GrowthRate = 1.075},
        UpgradeUnlockTree = {
            DefaultUnlockedThrough = 5,
            Nodes = {
                Upgrade6A = {
                    DisplayName = "Full Arsenal",
                    Level = 6,
                    Path = 1,
                    RequiredTowerLevel = 5,
                    PreviousNode = "Upgrade5A",
                    Coordinate = {q = 6, r = -1},
                },
                Upgrade6B = {
                    DisplayName = "Full Suit",
                    Level = 6,
                    Path = 2,
                    RequiredTowerLevel = 10,
                    PreviousNode = "Upgrade5B",
                    Coordinate = {q = 5, r = 1},
                },
                Upgrade7A = {
                    DisplayName = "Punisher",
                    Level = 7,
                    Path = 1,
                    RequiredTowerLevel = 15,
                    PreviousNode = "Upgrade6A",
                    Coordinate = {q = 7, r = -1},
                },
                Upgrade7B = {
                    DisplayName = "Peacekeeper",
                    Level = 7,
                    Path = 2,
                    RequiredTowerLevel = 20,
                    PreviousNode = "Upgrade6B",
                    Coordinate = {q = 6, r = 1},
                },
            },
        },
    },
}