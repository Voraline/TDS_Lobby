-- Script path: ReplicatedStorage.Content.Tower.Commando.Stats
-- Decompile time: 1.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 119448063654848,
                    Title = "Recon Mission",
                    Cost = 935,
                    Stats = {
                        Range = 16,
                        Damage = 5,
                        Cooldown = 0.17,
                        Ammo = 30,
                        MaxAmmo = 30,
                        Attributes = {
                            StunCooldown = 3.5,
                            BurstSize = 30,
                            BurstCooldown = 0.17,
                            Pierce = 2,
                            ReloadTime = 2,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Weapon</b></font>",
                            Header = "Weapon Upgrade",
                            Content = {{Text = "Reload Time: 2.25 -> 2"}},
                        },
                    },
                },
                {
                    Image = 72540829223100,
                    Title = "Titanium Rounds",
                    Cost = 2850,
                    Stats = {
                        Range = 17.5,
                        Damage = 7,
                        Cooldown = 0.14,
                        Ammo = 45,
                        MaxAmmo = 45,
                        Attributes = {
                            StunCooldown = 3.5,
                            BurstSize = 45,
                            BurstCooldown = 0.14,
                            Pierce = 2,
                            ReloadTime = 2,
                        },
                        Extras = {},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Weapon</b></font>",
                            Header = "Weapon Upgrade",
                            Content = {{Text = "Ammo: 30 -> 45"}},
                        },
                    },
                },
                {
                    Image = 111526844050563,
                    Title = "Jericho Missiles",
                    Cost = 8115,
                    Stats = {
                        Range = 17.5,
                        Damage = 14,
                        Cooldown = 0.14,
                        Ammo = 60,
                        MaxAmmo = 60,
                        Attributes = {
                            StunCooldown = 3.5,
                            BurstSize = 60,
                            BurstCooldown = 0.14,
                            Pierce = 2,
                            ReloadTime = 1.5,
                            MissileExpireTime = 80,
                            MissileExplosionRadius = 1.5,
                            MissileDamage = 275,
                            StunTime = 0.5,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Concussive Missiles</b></font>",
                            Header = "Concussive Missiles",
                            Content = {
                                {Text = "Damage: 275"},
                                {Text = "Stun Time: 0.5 Seconds"},
                                {Text = "Radius: 1.5"},
                                {Text = "Cooldown: 20 Seconds"},
                                {Text = "Missile Count: 2"},
                                {Text = "Missile Lifetime: 80"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Weapon</b></font>",
                            Header = "Weapon Upgrade",
                            Content = {{Text = "Reload Time: 2 -> 1.5"}, {Text = "Ammo: 45 -> 60"}},
                        },
                    },
                },
                {
                    Image = 113494545335861,
                    Title = "Death & Taxes",
                    Cost = 25000,
                    AbilityUpgrades = {{Name = "Missile", Stats = {Interval = 10, MaxAmmo = 4, MissileDamage = 325}}},
                    Stats = {
                        Range = 20,
                        Damage = 23,
                        Cooldown = 0.1,
                        Ammo = 80,
                        MaxAmmo = 80,
                        Attributes = {
                            StunCooldown = 3.5,
                            BurstSize = 80,
                            BurstCooldown = 0.1,
                            Pierce = 2,
                            ReloadTime = 1.25,
                            MissileExpireTime = 80,
                            MissileExplosionRadius = 1.5,
                            MissileDamage = 325,
                            StunTime = 1,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Burst</b></font>",
                            Header = "Burst Upgrade",
                            Content = {{Text = "Reload Time: 1.5 -> 1.25"}, {Text = "Ammo: 60 -> 80"}},
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Missile Upgrade</b></font>",
                            Header = "Concussive Missiles",
                            Content = {
                                {Text = "Missile Count: 2 -> 4"},
                                {Text = "Stun Time: 1 Second"},
                                {Text = "Damage: 325"},
                                {Text = "Radius: 1.5"},
                                {Text = "Cooldown: 10 Seconds"},
                                {Text = "Missile Lifetime: 80"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Really Cool Armor</b></font>",
                            Content = {{Text = "May or may not be stolen from Area 51"}},
                        },
                    },
                },
            },
            Defaults = {
                Ammo = 30,
                Price = 2150,
                Range = 16,
                Cooldown = 0.225,
                Damage = 5,
                Limit = 8,
                Attributes = {
                    StunCooldown = 3.5,
                    BurstSize = 30,
                    BurstCooldown = 0.225,
                    Pierce = 2,
                    ReloadTime = 2.25,
                    MissileRangeMultiplier = 2,
                },
                Abilities = {
                    {
                        Name = "Missile",
                        Description = "Charge up 1-4 missiles that can be manually deployed at the enemies! Stuns enemies on impact.",
                        Cooldown = 20,
                        Ammo = 2,
                        MaxAmmo = 2,
                        Icon = 80456675021529,
                        Price = 0,
                        Level = 3,
                        Debounce = 0,
                    },
                },
                Detections = {[Enum.StatusEffect.FlyingDetection] = true},
            },
        },
    },
    Properties = {
        Description = "Shoots enemies with dual laser guns and launches missiles. Won from the Area 51 event.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Gun DPS"] = TowerDPS.BurstWithReload,
            ["Missile DPS"] = TowerDPS.MissileAbility,
            ["Total DPS"] = TowerDPS.BurstAndMissileAbility,
        },
        Role = Enum.TowerRole.Offense,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Pirate = {Icon = 135452131994371, Rarity = Enum.SkinRarity.Rare},
            Trooper = {Icon = 81411979969960, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 140552401698797,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}