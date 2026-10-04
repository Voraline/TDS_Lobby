-- Script path: ReplicatedStorage.Content.Tower.Ranger.Stats-PVP
-- Decompile time: 1.42 ms

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
                    Cost = 650,
                    Stats = {Cooldown = 2.5, Damage = 40},
                },
                {
                    Image = 3381734408,
                    Title = "Intelligence Radio",
                    Cost = 2400,
                    Stats = {
                        Damage = 74,
                        Cooldown = 2.5,
                        Attributes = {Buildzone = 12, RangeBuff = 10},
                        Extras = {"Allies get a small range boost every wave. (20 secs)"},
                    },
                },
                {
                    Image = 3381735232,
                    Title = "Trained Outlaw",
                    Cost = 8500,
                    Stats = {Damage = 148, Cooldown = 2},
                },
                {
                    Image = 3381735846,
                    Title = "Experimental Weapon of Destruction",
                    Cost = 17000,
                    Stats = {
                        Cooldown = 2,
                        Damage = 272,
                        Attributes = {CanExplode = true},
                        Extras = {"Explosive Impact", "25  DMG (Stacks w/ base damage)"},
                    },
                },
            },
            Defaults = {
                Limit = 8,
                Price = 2000,
                Range = 50,
                Cooldown = 3,
                Damage = 40,
                Attributes = {
                    CanExplode = false,
                    ExplosionRadius = 5,
                    ExplosionDamage = 25,
                    Buildzone = 0,
                    AssistTime = 120,
                    RangeBuff = 0,
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = true,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
            },
        },
    },
    Properties = {
        Description = "A long-range cliff tower that deals heavy damage.",
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