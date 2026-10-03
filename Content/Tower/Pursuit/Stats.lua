-- Script path: ReplicatedStorage.Content.Tower.Pursuit.Stats
-- Decompile time: 2.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 5000,
                Damage = 7,
                Cooldown = 0.225,
                Range = 7,
                Limit = 6,
                MaxAmmo = 50,
                Attributes = {
                    Speed = 45,
                    PatrolRange = 14,
                    RepulsionRadius = 6,
                    ReloadTime = 3.5,
                    RevTime = 0,
                },
                Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                Abilities = {
                    {
                        Name = "Patrol",
                        Description = "Roger that! Call Pursuit to a new location on the battlefield.",
                        Level = 0,
                        Icon = 108315390601615,
                        Debounce = 20,
                    },
                },
            },
            Upgrades = {
                {
                    Title = "AP Rounds",
                    Cost = 1750,
                    Image = 117186100008439,
                    Stats = {
                        Damage = 10,
                        Cooldown = 0.225,
                        Range = 7,
                        MaxAmmo = 50,
                        Attributes = {Speed = 45, ReloadTime = 3.5},
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                    },
                },
                {
                    Title = "Enhanced Radar",
                    Cost = 3000,
                    Image = 117186100008439,
                    Stats = {
                        Damage = 10,
                        Cooldown = 0.175,
                        Range = 8,
                        MaxAmmo = 75,
                        Attributes = {Speed = 45, PatrolRange = 16, ReloadTime = 3},
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                    },
                    Tooltips = {
                        {
                            {
                                ButtonText = "Upgrade Ammo",
                                Header = "Passive Ability",
                                Content = {{Text = "Ammo: 50 → 75"}},
                            },
                            ButtonText = "Upgrade Patrol Zone",
                            Header = "Active Ability",
                            Content = {{Text = "Range: 14 → 16", {Text = "Reload: 3.5 → 3 seconds"}}},
                        },
                    },
                },
                {
                    Title = "Air to Ground Missiles",
                    Cost = 4750,
                    Image = 98101516586169,
                    Stats = {
                        Damage = 12,
                        Cooldown = 0.175,
                        Range = 8,
                        MaxAmmo = 75,
                        Attributes = {
                            Speed = 45,
                            ExplosionDamage = 30,
                            ExplosionRadius = 4,
                            MissileCount = 2,
                            MissileSpeed = 20,
                            Spread = 10,
                            TimeBetweenMissiles = 0.5,
                            MissileCooldown = 4,
                            MissileTargetingTime = 3,
                            ReloadTime = 3,
                        },
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock Missiles",
                            Header = "Passive Ability",
                            Content = {
                                {Text = "Explosion Damage: 35"},
                                {Text = "Explosion Radius: 4"},
                                {Text = "Count: 2"},
                                {Text = "Burst Time: 0.5"},
                                {Text = "Cooldown: 4s"},
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Sky Shredder",
                        Cost = 15000,
                        Image = 110652411715254,
                        Stats = {
                            Damage = 18,
                            Cooldown = 0.15,
                            Range = 11,
                            MaxAmmo = 200,
                            Attributes = {
                                Speed = 60,
                                ExplosionDamage = 35,
                                ExplosionRadius = 4,
                                MissileCount = 4,
                                TimeBetweenMissiles = 0.5,
                                MissileCooldown = 4,
                                PatrolRange = 16,
                                ReloadTime = 3,
                                RevTime = 0,
                            },
                            Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Missiles",
                                Header = "Passive Ability",
                                Content = {{Text = "Count: 2 → 4"}},
                            },
                            {
                                ButtonText = "Altered Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Heli Speed: 45 → 60"}},
                            },
                            {
                                ButtonText = "Upgrade Ammo",
                                Header = "Passive Ability",
                                Content = {{Text = "Ammo: 75 → 200"}},
                            },
                        },
                    },
                    {
                        Title = "Modified Payload",
                        Cost = 9500,
                        Image = 138033956206562,
                        Stats = {
                            Damage = 12,
                            Cooldown = 0.175,
                            Range = 10,
                            MaxAmmo = 75,
                            Attributes = {
                                Speed = 45,
                                ExplosionDamage = 35,
                                ExplosionRadius = 7.5,
                                MissileCount = 6,
                                TimeBetweenMissiles = 0.25,
                                MissileCooldown = 4,
                                PatrolRange = 20,
                                ReloadTime = 3,
                                RevTime = 0,
                            },
                            Detections = {
                                [Enum.StatusEffect.FlyingDetection] = true,
                                [Enum.StatusEffect.HiddenDetection] = true,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Range: 16 → 20"}},
                            },
                            {
                                ButtonText = "Upgrade Missiles",
                                Header = "Passive Ability",
                                Content = {
                                    {Text = "Explosion Damage: 30 → 35"},
                                    {Text = "Explosion Radius: 4 → 7.5"},
                                    {Text = "Count: 2 → 6"},
                                    {Text = "Burst Time: 0.5 → 0.25"},
                                    {Text = "Cooldown: 4s"},
                                },
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Leviathan",
                        Cost = 47500,
                        Image = 110652411715254,
                        Stats = {
                            Damage = 46,
                            Cooldown = 0.15,
                            Range = 11,
                            MaxAmmo = 200,
                            Attributes = {
                                Speed = 60,
                                ExplosionDamage = 35,
                                ExplosionRadius = 4,
                                MissileCount = 4,
                                MissileCooldown = 4,
                                TimeBetweenMissiles = 0.5,
                                PatrolRange = 18,
                                ReloadTime = 3,
                                RevTime = 0,
                            },
                            Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Range: 16 → 18"}},
                            },
                        },
                    },
                    {
                        Title = "Demolition Gunship",
                        Cost = 13500,
                        Image = 138033956206562,
                        MaxAmmo = 65,
                        Stats = {
                            Damage = 12,
                            Cooldown = 0.175,
                            Range = 12,
                            MaxAmmo = 75,
                            Attributes = {
                                Speed = 45,
                                ExplosionDamage = 60,
                                ExplosionRadius = 8.5,
                                MissileCount = 8,
                                TimeBetweenMissiles = 0.15,
                                MissileCooldown = 4,
                                PatrolRange = 22,
                                ReloadTime = 3,
                            },
                            Detections = {
                                [Enum.StatusEffect.FlyingDetection] = true,
                                [Enum.StatusEffect.HiddenDetection] = true,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Range: 20 → 22"}},
                            },
                            {
                                ButtonText = "Upgrade Missiles",
                                Header = "Passive Ability",
                                Content = {
                                    {Text = "Explosion Damage: 45 → 80"},
                                    {Text = "Explosion Radius: 7.5 → 8.5"},
                                    {Text = "Count: 6 → 8"},
                                    {Text = "Burst Time: 0.25 → 0.15"},
                                },
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Roger that! Pursues enemies in a designated patrol zone and splits into two upgrade paths!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            DPS = TowerDPS.Ammo,
            ["Missile DPS"] = {Calculate = TowerDPS.Missile, Visible = TowerDPS.HasMissile},
            ["Total DPS"] = {Calculate = TowerDPS.AmmoAndMissile, Visible = TowerDPS.HasMissile},
        },
        Role = Enum.TowerRole.Offense,
        Price = {
            Value = 15000,
            PreviewText = "REACH LEVEL 100 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Coins,
            Eligible = function(a1) -- Line: 411 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 100 <= Level.Value
            end,
        },
        Gamepass = {Id = 9735384, Value = 1500},
        Class = Enum.TowerType.Flying,
        SkinData = {
            Patriotic = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
            Eggy = {
                Icon = 129121886854482,
                DisplayName = "Easter",
                Rarity = Enum.SkinRarity.Uncommon,
            },
            Dragon = {
                Icon = 129121886854482,
                DisplayName = "Dragon",
                Rarity = Enum.SkinRarity.Legendary,
            },
            Mercenary = {
                Icon = 129753090714341,
                DisplayName = "Mercenary",
                Rarity = Enum.SkinRarity.Rare,
            },
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.3499999940395355, 0),
            Icon = 71565475215945,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0.17453292519943295, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}