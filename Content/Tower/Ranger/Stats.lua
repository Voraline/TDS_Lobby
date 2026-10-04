-- Script path: ReplicatedStorage.Content.Tower.Ranger.Stats
-- Decompile time: 1.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 3280081327,
                    Title = "Faster Reloading",
                    Cost = 1500,
                    Stats = {Cooldown = 4.75, Damage = 100},
                },
                {
                    Image = 3381734408,
                    Title = "Intelligence Radio",
                    Cost = 5500,
                    Stats = {
                        Damage = 185,
                        Attributes = {Buildzone = 12, RangeBuff = 10},
                        Detections = {[Enum.StatusEffect.LeadDetection] = true},
                        Extras = {"Allies get a small range boost every wave. (20 secs)"},
                    },
                },
                {
                    Image = 3381735232,
                    Title = "Trained Outlaw",
                    Cost = 15750,
                    Stats = {Damage = 430, Cooldown = 4.5, Extras = {""}},
                },
                {
                    Image = 3381735846,
                    Title = "Experimental Weapon of Destruction",
                    Cost = 25000,
                    Stats = {
                        Cooldown = 8,
                        Damage = 875,
                        Attributes = {CanExplode = true, MaxHits = 3},
                        Extras = {
                            "Explosive Impact",
                            "375 DMG (Stacks w/ base damage)",
                            "Can hit up to 3 enemies",
                        },
                    },
                },
            },
            Defaults = {
                Limit = 8,
                Price = 4500,
                Range = 70,
                Cooldown = 6,
                Damage = 100,
                Attributes = {
                    CanExplode = false,
                    ExplosionRadius = 5,
                    ExplosionDamage = 375,
                    Buildzone = 0,
                    AssistTime = 20,
                    RangeBuff = 0,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = false,
                    ["StunImmune"] = true,
                },
            },
        },
    },
    Properties = {
        Description = "Precision is key. A cliff tower that deals exceptional damage at near infinite range.",
        Height = 0,
        Level = 30,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            Default = TowerDPS.Default,
            ["Impact DPS"] = {Calculate = TowerDPS.Impact, Visible = TowerDPS.HasImpact},
            ["Total DPS"] = {Calculate = TowerDPS.DefaultAndImpact, Visible = TowerDPS.HasImpact},
        },
        Role = Enum.TowerRole.Defense,
        Price = {Value = 12000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Cliff,
        SkinData = {
            Steampunk = {Icon = "rbxassetid://17746205236", Rarity = Enum.SkinRarity.Uncommon},
            Partisan = {Icon = 4629030229, Rarity = Enum.SkinRarity.Uncommon},
            Blue = {Icon = 4863435105, Rarity = Enum.SkinRarity.Common},
            Bunny = {Icon = 4863434919, Rarity = Enum.SkinRarity.Event},
            ["Gun Gale"] = {Icon = 4863434919, Rarity = Enum.SkinRarity.Legendary},
            Eclipse = {Icon = 4088821168, Rarity = Enum.SkinRarity.Event},
            ["Black Ops"] = {Icon = 4863435398, Rarity = Enum.SkinRarity.Common},
            Valentines = {Icon = 4690286866, Rarity = Enum.SkinRarity.Event},
            Frost = {Icon = 4863434919, Rarity = Enum.SkinRarity.Event},
            Green = {Icon = 4863434596, Rarity = Enum.SkinRarity.Common},
            Railgunner = {Icon = 3958401842, Rarity = Enum.SkinRarity.Legendary},
            Wraith = {Icon = 4497120092, Rarity = Enum.SkinRarity.Rare},
            ["Dark Matter"] = {Icon = 4863434919, Rarity = Enum.SkinRarity.Rare},
            Classic = {Icon = 4863434919, Rarity = Enum.SkinRarity.Rare},
            Pumpkin = {Icon = 4863434919, Rarity = Enum.SkinRarity.Exclusive},
            Phantom = {Icon = 4863434919, Rarity = Enum.SkinRarity.Rare},
            ["Beast Slayer"] = {Icon = 4863434919, Rarity = Enum.SkinRarity.Event},
            Propellars = {Icon = 4343065951, Rarity = Enum.SkinRarity.Legendary},
            Badlands = {Icon = 4343065951, Rarity = Enum.SkinRarity.Rare},
            ["5ouls"] = {Icon = 18549607210, Rarity = Enum.SkinRarity.Rare},
            Frankenstein = {Icon = 123830216490388, Rarity = Enum.SkinRarity.Uncommon},
            ["Mecha Ducky"] = {Icon = 111106612615105, Rarity = Enum.SkinRarity.Rare},
            Shark = {Icon = 118641195806072, Rarity = Enum.SkinRarity.Rare},
            Eskimo = {
                Icon = 113205798099757,
                DisplayName = "Indigenous",
                Rarity = Enum.SkinRarity.Rare,
            },
            Aquatic = {Icon = 0, Rarity = Enum.SkinRarity.Rare},
            Axolotl = {Icon = 0, Rarity = Enum.SkinRarity.Uncommon},
            Beach = {Icon = 0, Rarity = Enum.SkinRarity.Common},
            Banned = {Icon = 0, Rarity = Enum.SkinRarity.Exclusive},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.375, 0),
            Icon = 6883302449,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.6651914291880923, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}