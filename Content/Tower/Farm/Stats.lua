-- Script path: ReplicatedStorage.Content.Tower.Farm.Stats
-- Decompile time: 1.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {Image = 3294497195, Title = "Carrot Farm", Cost = 200, Stats = {Income = 100}},
                {Image = 3294496318, Title = "Wheat Farm", Cost = 600, Stats = {Income = 225}},
                {Image = 3294498124, Title = "Tree Farm", Cost = 1250, Stats = {Income = 500}},
                {Image = 3294499153, Title = "Apple Farm", Cost = 2500, Stats = {Income = 900}},
                {Image = 3294500097, Title = "Space Fruit Farm", Cost = 4500, Stats = {Income = 1500}},
            },
            Defaults = {
                Limit = 10,
                HideTargetingMode = true,
                Price = 300,
                Range = 5,
                Cooldown = 0,
                Damage = 0,
                Income = 60,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
            },
        },
    },
    Properties = {
        Description = "Earn extra cash per wave. The higher the upgrade, the higher the income.",
        BoundarySize = 1.75,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Support,
        Price = {Value = 2000, Type = Enum.CurrencyType.Coins},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Arcade = {Icon = 4056868908, Rarity = Enum.SkinRarity.Rare},
            Vendor = {Icon = 4863529214, Rarity = Enum.SkinRarity.Exclusive},
            Xmas = {Icon = 4538507361, Rarity = Enum.SkinRarity.Event},
            Tycoon = {Icon = 5083394605, Rarity = Enum.SkinRarity.Rare},
            Graveyard = {Icon = 4863529214, Rarity = Enum.SkinRarity.Event},
            Present = {Icon = 4863529214, Rarity = Enum.SkinRarity.Exclusive},
            Ducky = {Icon = 4863529214, Rarity = Enum.SkinRarity.Legendary},
            Crypto = {Icon = 4863529214, Rarity = Enum.SkinRarity.Legendary},
            Pirate = {Icon = 4088821168, Rarity = Enum.SkinRarity.Legendary},
            Wasteland = {Icon = 115389901462450, Rarity = Enum.SkinRarity.Rare},
            Booth = {Icon = 114387520669997, Rarity = Enum.SkinRarity.Event},
            ["Cozy Camp"] = {Icon = 140408163540785, Rarity = Enum.SkinRarity.Uncommon},
            ["Lemonade Stand"] = {Icon = 81915340530819, DisplayName = "Vendor", Rarity = Enum.SkinRarity.Rare},
            PNG = {Icon = 102229660485968, DisplayName = "PNG", Rarity = Enum.SkinRarity.Uncommon},
            Discovered = {Icon = 76281484654151, Rarity = Enum.SkinRarity.Rare},
            Crab = {Icon = 80117562627776, Rarity = Enum.SkinRarity.Rare},
            ["Null Soul"] = {Icon = 0, Rarity = Enum.SkinRarity.Legendary},
            Cinema = {Icon = 83537140289968, Rarity = Enum.SkinRarity.Rare},
            ["Pot Of Gold"] = {Icon = 113008230083777, Rarity = Enum.SkinRarity.Common},
            Bunny = {Icon = 122746562897241, Rarity = Enum.SkinRarity.Uncommon},
            ["Void Altar"] = {Icon = 4088821168, Rarity = Enum.SkinRarity.Common},
            ["Popsicle Vendor"] = {Icon = 0, Rarity = Enum.SkinRarity.Common},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 1, 0),
            Icon = 6883286151,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 0.7853981633974483, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Intermediate,
    },
}