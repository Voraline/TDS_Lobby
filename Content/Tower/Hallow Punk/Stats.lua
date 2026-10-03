-- Script path: ReplicatedStorage.Content.Tower.Hallow Punk.Stats
-- Decompile time: 1.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Defaults = {
                Price = 500,
                Damage = 12,
                Cooldown = 4.5,
                Range = 18,
                Limit = 10,
                Attributes = {ExplosionRadius = 3, Knockback = 10, RocketSpeed = 35, Deadzone = 7.5},
                Detections = {[Enum.StatusEffect.LeadDetection] = true},
            },
            Upgrades = {
                {
                    Title = "Vengeful Missiles",
                    Image = 87280920444213,
                    Cost = 300,
                    Stats = {
                        Damage = 18,
                        Cooldown = 4,
                        Range = 21,
                        Attributes = {ExplosionRadius = 3.5, Knockback = 10},
                    },
                },
                {
                    Title = "Bewitching Blaze",
                    Image = 103271630916907,
                    Cost = 2700,
                    Stats = {
                        Damage = 50,
                        Cooldown = 4,
                        Range = 21,
                        Attributes = {
                            ExplosionRadius = 3.5,
                            Knockback = 10,
                            RocketSpeed = 45,
                            Burn = {Duration = 6, Tick = 1, Damage = 6, Deadzone = 7.5},
                        },
                        Extras = {"Rocket Speed: 35 → 40"},
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded Explosion",
                            Header = "Attributes",
                            Content = {{Text = "Explosion Radius: 3 → 4"}},
                        },
                        {
                            ButtonText = "Burn Effect Unlocked",
                            Header = "Attributes",
                            Content = {
                                {Text = "Burn Duration: 6 Seconds"},
                                {Text = "Burn Damage: 6 Per Tick"},
                                {Text = "Burn Tick: 1 Seconds"},
                            },
                        },
                    },
                },
                {
                    Title = "Queen of the Blood Ember",
                    Image = 98952678277583,
                    Cost = 7270,
                    Stats = {
                        Damage = 150,
                        Cooldown = 4,
                        Range = 21,
                        Attributes = {
                            ExplosionRadius = 5,
                            Knockback = 12.5,
                            RocketSpeed = 45,
                            Burn = {Duration = 7, Tick = 1, Damage = 12, Deadzone = 7.5},
                        },
                        Extras = {"Rocket Speed: 40 → 45"},
                        Detections = {[Enum.StatusEffect.FlyingDetection] = true},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Explosion Upgrade",
                            Header = "Attributes",
                            Content = {{Text = "Explosion Radius: 4 → 5"}, {Text = "Knockback: 10 → 12.5"}},
                        },
                        {
                            ButtonText = "Upgraded Burn Effect",
                            Header = "Attributes",
                            Content = {
                                {Text = "Burn Duration: 7 Seconds"},
                                {Text = "Burn Damage: 12 Per Tick"},
                                {Text = "Burn Tick: 1 Seconds"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "A mad explosives expert capable of knocking back and burning enemies.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            ["Normal DPS"] = TowerDPS.Default,
            ["Burn DPS"] = TowerDPS.Burn,
            ["Total DPS"] = TowerDPS.DamageOverTime,
        },
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        SkinData = {Lunar = {Icon = 108437763960397, Rarity = Enum.SkinRarity.Rare}},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 134504826386080,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.490658503988659, 0),
            CameraOffset = CFrame.new(0, 0, 0),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}