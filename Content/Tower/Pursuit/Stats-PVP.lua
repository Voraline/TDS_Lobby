-- Script path: ReplicatedStorage.Content.Tower.Pursuit.Stats-PVP
-- Decompile time: 3.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 2500,
                Damage = 6,
                Cooldown = 0.25,
                Range = 7,
                Limit = 5,
                MaxAmmo = 35,
                Attributes = {
                    Speed = 30,
                    PatrolRange = 14,
                    RepulsionRadius = 6,
                    ReloadTime = 4,
                    RevTime = 0,
                },
                Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                Abilities = {{Name = "Patrol", Level = 0, Icon = 108315390601615, Debounce = 20}},
            },
            Upgrades = {
                {
                    Title = ".50 Caliber",
                    Cost = 750,
                    Image = 117186100008439,
                    Stats = {
                        Damage = 7,
                        Cooldown = 0.25,
                        Range = 8,
                        MaxAmmo = 35,
                        Attributes = {Speed = 16, ReloadTime = 4},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                    },
                },
                {
                    Title = "Enhanced Radar",
                    Cost = 1500,
                    Image = 117186100008439,
                    Stats = {
                        Damage = 10,
                        Cooldown = 0.25,
                        Range = 9.5,
                        MaxAmmo = 35,
                        Attributes = {Speed = 25, PatrolRange = 16, ReloadTime = 4},
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Patrol Zone",
                            Header = "Active Ability",
                            Content = {{Text = "Range: 14 → 16"}},
                        },
                    },
                },
                {
                    Title = "Air to Ground Missiles",
                    Cost = 3500,
                    Image = 98101516586169,
                    Stats = {
                        Damage = 10,
                        Cooldown = 0.2,
                        Range = 10.5,
                        MaxAmmo = 75,
                        Attributes = {
                            Speed = 25,
                            ExplosionDamage = 32,
                            ExplosionRadius = 3,
                            MissileCount = 2,
                            MissileSpeed = 20,
                            Spread = 10,
                            TimeBetweenMissiles = 0.5,
                            MissileCooldown = 7,
                            MissileTargetingTime = 3,
                            ReloadTime = 3.5,
                        },
                        Detections = {
                            [Enum.StatusEffect.FlyingDetection] = true,
                            [Enum.StatusEffect.LeadDetection] = true,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade Ammo",
                            Header = "Passive Ability",
                            Content = {{Text = "Ammo: 35 → 75"}, {Text = "Reload: 4 → 3.5 seconds"}},
                        },
                        {
                            ButtonText = "Unlock Missiles",
                            Header = "Passive Ability",
                            Content = {
                                {Text = "Explosion Damage: 35"},
                                {Text = "Explosion Radius: 3"},
                                {Text = "Count: 2"},
                                {Text = "Burst Time: 0.5"},
                                {Text = "Cooldown: 7s"},
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Tri-Barrel Minigun",
                        Cost = 12500,
                        Image = 110652411715254,
                        Stats = {
                            Damage = 12,
                            Cooldown = 0.1,
                            Range = 11,
                            MaxAmmo = 150,
                            Attributes = {
                                Speed = 25,
                                ExplosionDamage = 35,
                                ExplosionRadius = 3,
                                MissileCount = 4,
                                TimeBetweenMissiles = 0.5,
                                MissileCooldown = 6,
                                PatrolRange = 18.5,
                                ReloadTime = 3,
                                RevTime = 1.5,
                            },
                            Detections = {
                                [Enum.StatusEffect.FlyingDetection] = true,
                                [Enum.StatusEffect.LeadDetection] = true,
                                [Enum.StatusEffect.HiddenDetection] = false,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Range: 16 → 18.5"}},
                            },
                            {
                                ButtonText = "Upgrade Ammo",
                                Header = "Passive Ability",
                                Content = {
                                    {Text = "Ammo: 75 → 150"},
                                    {Text = "Reload: 3.5 → 3 seconds"},
                                    {Text = "Rev Time: 1.5 seconds"},
                                },
                            },
                            {
                                ButtonText = "Upgrade Missiles",
                                Header = "Passive Ability",
                                Content = {{Text = "Count: 2 → 4"}, {Text = "Cooldown: 6s"}},
                            },
                        },
                    },
                    {
                        Title = "Upgraded Payload",
                        Cost = 7500,
                        Image = 138033956206562,
                        Stats = {
                            Damage = 10,
                            Cooldown = 0.2,
                            Range = 11,
                            MaxAmmo = 75,
                            Attributes = {
                                Speed = 25,
                                ExplosionDamage = 25,
                                ExplosionRadius = 6,
                                MissileCount = 6,
                                TimeBetweenMissiles = 0.25,
                                MissileCooldown = 3,
                                PatrolRange = 17.5,
                                ReloadTime = 3.5,
                                RevTime = 0,
                            },
                            Detections = {
                                [Enum.StatusEffect.FlyingDetection] = true,
                                [Enum.StatusEffect.LeadDetection] = true,
                                [Enum.StatusEffect.HiddenDetection] = true,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Range: 16 → 17.5"}},
                            },
                            {
                                ButtonText = "Upgrade Ammo",
                                Header = "Passive Ability",
                                Content = {{Text = "Reload: 2.5 → 3.5 seconds"}},
                            },
                            {
                                ButtonText = "Upgrade Missiles",
                                Header = "Passive Ability",
                                Content = {
                                    {Text = "Explosion Damage: 35 -> 25"},
                                    {Text = "Explosion Radius: 3 → 6"},
                                    {Text = "Count: 2 → 6"},
                                    {Text = "Burst Time: 0.5 → 0.25"},
                                    {Text = "Cooldown: 3s"},
                                },
                            },
                        },
                    },
                },
                {
                    {
                        Title = "Sky Shredder",
                        Cost = 30000,
                        Image = 110652411715254,
                        Stats = {
                            Damage = 26,
                            Cooldown = 0.085,
                            Range = 12,
                            MaxAmmo = 200,
                            Attributes = {
                                Speed = 25,
                                ExplosionDamage = 35,
                                ExplosionRadius = 4,
                                MissileCount = 4,
                                MissileCooldown = 6,
                                TimeBetweenMissiles = 0.25,
                                PatrolRange = 21,
                                ReloadTime = 2.5,
                                RevTime = 1.5,
                            },
                            Detections = {
                                [Enum.StatusEffect.FlyingDetection] = true,
                                [Enum.StatusEffect.LeadDetection] = true,
                                [Enum.StatusEffect.HiddenDetection] = false,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Range: 18.5 → 21"}},
                            },
                            {
                                ButtonText = "Upgrade Ammo",
                                Header = "Passive Ability",
                                Content = {
                                    {Text = "Ammo: 150 → 200"},
                                    {Text = "Reload: 2.25 → 2.5 seconds"},
                                    {Text = "Rev Time: 1.5 seconds"},
                                },
                            },
                            {
                                ButtonText = "Upgrade Missiles",
                                Header = "Passive Ability",
                                Content = {
                                    {Text = "Explosion Damage: 35"},
                                    {Text = "Explosion Radius: 4"},
                                    {Text = "Count: 4"},
                                    {Text = "Burst Time: 0.35 → 0.25"},
                                    {Text = "Cooldown: 6s"},
                                },
                            },
                        },
                    },
                    {
                        Title = "Demolition Gunship",
                        Cost = 22500,
                        Image = 138033956206562,
                        MaxAmmo = 75,
                        Stats = {
                            Damage = 12,
                            Cooldown = 0.2,
                            Range = 12,
                            MaxAmmo = 75,
                            Attributes = {
                                Speed = 25,
                                ExplosionDamage = 60,
                                ExplosionRadius = 6,
                                MissileCount = 8,
                                TimeBetweenMissiles = 0.15,
                                MissileCooldown = 3,
                                PatrolRange = 19.5,
                                ReloadTime = 2.25,
                            },
                            Detections = {
                                [Enum.StatusEffect.FlyingDetection] = true,
                                [Enum.StatusEffect.LeadDetection] = true,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgrade Patrol Zone",
                                Header = "Active Ability",
                                Content = {{Text = "Range: 17.5 → 19.5"}},
                            },
                            {
                                ButtonText = "Upgrade Missiles",
                                Header = "Passive Ability",
                                Content = {
                                    {Text = "Explosion Damage: 45 → 60"},
                                    {Text = "Explosion Radius: 6"},
                                    {Text = "Count: 6 → 8"},
                                    {Text = "Burst Time: 0.25 → 0.15"},
                                    {Text = "Cooldown: 6s → 3s"},
                                },
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Roger that! A vehicle that follows a path and enemies.",
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
            Eligible = function(a1) -- Line: 478 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 100 <= Level.Value
            end,
        },
        Gamepass = {Id = 9735384, Value = 1500},
        Class = Enum.TowerType.Flying,
        SkinData = {
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