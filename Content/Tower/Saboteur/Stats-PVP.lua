-- Script path: ReplicatedStorage.Content.Tower.Saboteur.Stats-PVP
-- Decompile time: 2.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 8,
                Price = 575,
                Damage = 2,
                Cooldown = 1.1,
                Range = 11.5,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {
                    BulletCount = 3,
                    BaseSpread = 3,
                    Spread = 2,
                    TwrDisableTime = 0,
                    HealthSteal = 0,
                    SlowPerc = 10,
                    PoisonLength = 4,
                    PoisonDmg = 1,
                    PoisonTick = 0.9,
                    MaxHits = 1,
                    AbilityRadius = 3.5,
                    AbilityDuration = 3,
                    AbilityDamageTakenBonusPct = 15,
                    AbilityGrenadeThrowDelay = 0.4,
                },
                Abilities = {
                    {
                        Name = "Aggressive Toxins",
                        Level = 3,
                        Icon = 126975676580950,
                        Debounce = 90,
                        Cooldown = 90,
                        InitialCooldown = 15,
                        Price = 500,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Scam Artist",
                    Image = 138135211876727,
                    Cost = 450,
                    Stats = {
                        Damage = 2,
                        Cooldown = 1.1,
                        Range = 11.5,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {BulletCount = 3, BaseSpread = 3, Spread = 2, MaxHits = 2},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Toxic Shotgun</b></font>",
                            Content = {{Text = "Max Hits: 1 > 2"}},
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Scattershot</b></font>",
                            Content = {
                                {Text = "Damage dealt by Saboteur now scales with enemies hit."},
                                {Text = "1 Target: 2x Damage"},
                                {Text = "2 Targets: 1x Damage"},
                            },
                        },
                    },
                },
                {
                    Title = "Brand New Rig",
                    Image = 75068776606540,
                    Cost = 1475,
                    Stats = {
                        Damage = 4,
                        Cooldown = 1.1,
                        Range = 14.5,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {
                            BulletCount = 3,
                            BaseSpread = 3.5,
                            Spread = 1.5,
                            MaxHits = 2,
                            PoisonDmg = 2,
                            PoisonLength = 5,
                            PoisonTick = 0.9,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Toxic Shotgun</b></font>",
                            Content = {
                                {Text = "Base Spread: 3 > 3.5"},
                                {Text = "Spread: 2 > 1.5"},
                                {Text = "Poison Damage: 1 > 2"},
                                {Text = "Poison Length: 4s > 5s"},
                            },
                        },
                    },
                },
                {
                    Title = "Black Market Tech",
                    Image = 121470510950529,
                    Cost = 5150,
                    Stats = {
                        Damage = 7,
                        Cooldown = 0.9,
                        Range = 14.5,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {
                            BulletCount = 3,
                            BaseSpread = 3.5,
                            Spread = 1.5,
                            MaxHits = 2,
                            PoisonDmg = 4,
                            PoisonLength = 5.5,
                            PoisonTick = 0.6,
                            AbilityRadius = 3.5,
                            AbilityDuration = 5,
                            AbilityDamageTakenBonusPct = 15,
                            AbilityGrenadeThrowDelay = 0.8,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Aggressive Toxins</b></font>",
                            Content = {
                                {
                                    Text = "Throw a toxic grenade to apply a `Neuralyze` debuff to enemies that amplifies damage taken and forces towers to target them.",
                                },
                                {Text = "Neuralyze Duration: 5s"},
                                {Text = "Neuralyze Grenade Radius: 3.5"},
                                {Text = "Damage Taken Bonus: 15%"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Toxic Shotgun</b></font>",
                            Content = {
                                {Text = "Poison Damage: 2 > 4"},
                                {Text = "Poison Length: 5s > 5.5s"},
                                {Text = "Poison Tick: 0.9s > 0.6s"},
                            },
                        },
                    },
                },
                {
                    Title = "Neural-Runner",
                    Image = 111948304760969,
                    Cost = 15115,
                    Stats = {
                        Damage = 7,
                        Cooldown = 0.65,
                        Range = 14.5,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {
                            BulletCount = 5,
                            BaseSpread = 4,
                            Spread = 1,
                            MaxHits = 3,
                            PoisonDmg = 7,
                            PoisonLength = 7,
                            PoisonTick = 0.4,
                            SlowPerc = 15,
                            AbilityRadius = 3.5,
                            AbilityDuration = 9,
                            AbilityDamageTakenBonusPct = 25,
                        },
                    },
                    AbilityUpgrades = {{Name = "Aggressive Toxins", Stats = {Price = 500}}},
                    Tooltips = {
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>The Vitriolic Withering</b></font>",
                            Content = {
                                {Text = "Max Hits: 2 > 3"},
                                {Text = "Bullet Count: 4 > 6"},
                                {Text = "Poison Damage: 4 > 7"},
                                {Text = "Poison Length: 5.5s > 7s"},
                                {Text = "Poison Tick: 0.6s > 0.4s"},
                                {Text = "Base Spread: 3.5 > 4"},
                                {Text = "Spread: 1.5 > 1"},
                                {Text = "Hit Slowness: 10% > 20%"},
                                {Text = "Aggressive Toxins: radius 2, Neuralyzed 3s > 5s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Aggressive Toxins</b></font>",
                            Content = {
                                {Text = "Neuralyze Duration: 5s > 9s"},
                                {Text = "Neuralyze Grenade Radius: 3.5 > 5"},
                                {Text = "Damage Taken Bonus: 15% > 25%"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Scattershot</b></font>",
                            Content = {
                                {Text = "1 Target: 3x Damage"},
                                {Text = "2 Targets: 1.5x Damage"},
                                {Text = "3 Targets: 1x Damage"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A toxic shotgunner who poisons enemies and can throw a grenade that amplifies damage taken in an area.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        BoundarySize = 1.5,
        DPS_Display = {
            ["Normal DPS"] = TowerDPS.Shotgun,
            ["Poison DPS"] = TowerDPS.Poison,
            ["Total DPS"] = TowerDPS.ShotgunDamageOverTime,
        },
        Price = {
            Value = 4000,
            Type = Enum.CurrencyType.Coins,
            Role = Enum.TowerRole.Offense,
        },
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.792526803190927, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}