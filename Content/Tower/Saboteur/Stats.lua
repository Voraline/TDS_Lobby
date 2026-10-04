-- Script path: ReplicatedStorage.Content.Tower.Saboteur.Stats
-- Decompile time: 2.40 ms

local BadgeService = game:GetService("BadgeService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 8,
                Price = 775,
                Damage = 2,
                Cooldown = 1.35,
                Range = 12.5,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {
                    BulletCount = 3,
                    BaseSpread = 3,
                    Spread = 2,
                    TwrDisableTime = 0,
                    HealthSteal = 0,
                    SlowPerc = 7.5,
                    PoisonLength = 5,
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
                        Description = "Throw a toxic grenade to weaken hit enemies and force towers to target them.",
                        Level = 3,
                        Icon = 126975676580950,
                        Debounce = 100,
                        Cooldown = 100,
                        InitialCooldown = 30,
                        Price = 500,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "Scam Artist",
                    Image = 138135211876727,
                    Cost = 375,
                    Stats = {
                        Damage = 3,
                        Cooldown = 1.35,
                        Range = 12.5,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {
                            PoisonTick = 0.6,
                            BulletCount = 3,
                            BaseSpread = 3,
                            Spread = 2,
                            MaxHits = 1,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Toxic Shotgun</b></font>",
                            Content = {{Text = "Poison Tick: 0.9s > 0.6s"}},
                        },
                    },
                },
                {
                    Title = "Brand New Rig",
                    Image = 75068776606540,
                    Cost = 1850,
                    Stats = {
                        Damage = 4,
                        Cooldown = 1,
                        Range = 13.5,
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
                            PoisonLength = 6,
                            PoisonTick = 0.6,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Scattershot</b></font>",
                            Content = {
                                {Text = "Damage dealt by Saboteur now scales with enemies hit."},
                                {Text = "1 Target: 2x Damage"},
                                {Text = "2 Targets: 1x Damage"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Toxic Shotgun</b></font>",
                            Content = {
                                {Text = "Base Spread: 3 > 3.5"},
                                {Text = "Spread: 2 > 1.5"},
                                {Text = "Max Hits: 1 > 2"},
                                {Text = "Poison Damage: 1 > 2"},
                                {Text = "Poison Length: 5s > 6s"},
                            },
                        },
                    },
                },
                {
                    Title = "Black Market Tech",
                    Image = 121470510950529,
                    Cost = 5950,
                    Stats = {
                        Damage = 7,
                        Cooldown = 0.8,
                        Range = 14.5,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {
                            BulletCount = 4,
                            BaseSpread = 3.5,
                            Spread = 1.5,
                            MaxHits = 2,
                            PoisonDmg = 4,
                            PoisonLength = 6,
                            PoisonTick = 0.6,
                            AbilityRadius = 3.5,
                            AbilityDuration = 5,
                            AbilityDamageTakenBonusPct = 10,
                            AbilityGrenadeThrowDelay = 0.4,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Aggressive Toxins</b></font>",
                            Content = {
                                {
                                    Text = "Throw a toxic grenade to apply a Neuralyzed debuff to enemies that amplifies damage taken and forces towers to target them.",
                                },
                                {Text = "Ability Cost: $500"},
                                {Text = "Neuralyze Duration: 5s"},
                                {Text = "Neuralyze Grenade Radius: 3.5"},
                                {Text = "Damage Taken Bonus: 10%"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Toxic Shotgun</b></font>",
                            Content = {
                                {Text = "Bullet Count: 3 > 4"},
                                {Text = "Poison Damage: 2 > 4"},
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
                        Range = 16.5,
                        Detections = {
                            [Enum.StatusEffect.HiddenDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                        Attributes = {
                            BulletCount = 6,
                            BaseSpread = 4,
                            Spread = 1,
                            MaxHits = 3,
                            PoisonDmg = 7,
                            PoisonLength = 8,
                            PoisonTick = 0.4,
                            SlowPerc = 10,
                            AbilityRadius = 3.5,
                            AbilityDuration = 7.5,
                            AbilityDamageTakenBonusPct = 15,
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
                                {Text = "Poison Length: 6s > 8s"},
                                {Text = "Poison Tick: 0.6s > 0.4s"},
                                {Text = "Base Spread: 3.5 > 4"},
                                {Text = "Spread: 1.5 > 1"},
                                {Text = "Hit Slowness: 7.5% > 10%"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Aggressive Toxins</b></font>",
                            Content = {
                                {Text = "Ability Cost: $500"},
                                {Text = "Neuralyze Duration: 5s > 7.5s"},
                                {Text = "Damage Taken Bonus: 10% > 15%"},
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
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 7500,
            MapLocked = "Polluted Wasteland II",
            Type = Enum.CurrencyType.Coins,
            Eligible = function(a1) -- Line: 328 -- upvalues: BadgeService (val) -- types: a1: userdata
                local success, result = pcall(function() -- Line: 329 -- upvalues: BadgeService (upval), a1 (val)
                    return BadgeService:UserHasBadgeAsync(a1.UserId, 2917934873985054)
                end)
                return success and result
            end,
        },
        Gamepass = {Id = 1804464267},
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 0,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 2.792526803190927, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        SkinData = {["Coral Princess"] = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon}},
        Category = Enum.TowerCategory.Advanced,
    },
}