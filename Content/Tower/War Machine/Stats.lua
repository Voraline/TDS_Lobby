-- Script path: ReplicatedStorage.Content.Tower.War Machine.Stats
-- Decompile time: 2.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local v1 = {}
local v2 = {}
local v3 = {
    Defaults = {
        Limit = 5,
        Price = 6750,
        Range = 13,
        Cooldown = 0.175,
        Damage = 10,
        Abilities = {
            {
                Name = "Convoy",
                DisplayName = "Convoy",
                Description = "Deploys a convoy of railgun tanks that will fire at enemies in range.",
                Level = 4,
                Icon = 3444568580,
                Debounce = 60,
                Price = 3500,
            },
        },
        Detections = {
            [Enum_2.StatusEffect.FlyingDetection] = false,
            [Enum_2.StatusEffect.HiddenDetection] = false,
        },
        Attributes = {
            RevTime = 3,
            MinUpgradeForMinigunRevSpool = 3,
            AnimatedFireLoopPeriod = 0.265,
            SlowTime = 2,
            MissileUnlockLevel = 2,
            MissileTime = 2,
            RocketBurstGap = 0.16,
            RocketVolleyCount = 1,
            RocketSpeed = 28,
            RocketArcGravity = 2.4,
            ExplosionRadius = 4.5,
            ExplosionDamage = 40,
            Spread = 10,
            RangeBuff = 0,
            CooldownBuff = 0,
            DamageBuff = 0,
            MissileAsset = "FastRocket",
            TankSpawnCount = 0,
            TankSpawnGap = 2.5,
            VisualOverrides = {
                MeshTextureTo = "rbxassetid://4987137990",
                MeshTextureFrom = {"rbxassetid://4986831402", "http://www.roblox.com/asset/?id=4986831402"},
                BarrelNeonColor = Color3.fromRGB(110, 153, 202),
            },
            MissileTracerColor = Color3.fromRGB(152, 238, 234),
            MissileImpactMaterial = Enum.Material.Neon,
        },
    },
}
local v4 = {[0] = {Title = "War Machine", Cost = 0, Stats = {}}}
local v5 = {
    Title = "Ultra Charged Body Armor",
    Cost = 50000,
    Image = 4989373124,
    Stats = {
        Range = 24,
        Damage = 45,
        Cooldown = 0.09,
        Attributes = {
            ExplosionRadius = 6,
            ExplosionDamage = 60,
            DamageBuff = 10,
            RocketVolleyCount = 3,
            TankSpawnCount = 2,
        },
        Detections = {[Enum_2.StatusEffect.HiddenDetection] = true},
    },
    Tooltips = {
        {
            ButtonText = "Unlock Convoy",
            Header = "Convoy",
            Content = {{Text = "Deploy 2 Railgun Tanks in a sequence on use."}},
        },
        {
            ButtonText = "Upgraded Command Aura",
            Header = "Ally Boost",
            Content = {{Text = "Towers in radius gain a +10% damage buff"}},
        },
        {
            ButtonText = "Upgraded Stark Missiles",
            Header = "Periodically fires rockets at enemies",
            Content = {
                {Text = "Rocket Volley Count: 2 > 3"},
                {Text = "Rocket Damage: 40 > 60"},
                {Text = "Explosion Radius: 4.5 > 6"},
            },
        },
    },
}
local v6 = {
    Title = "To the Void and Back",
    Cost = 125000,
    Image = 4989373460,
    AbilityUpgrades = {{Name = "Convoy", Stats = {Price = 3500}}},
    Stats = {
        Range = 26,
        Damage = 70,
        Cooldown = 0.09,
        Attributes = {
            ExplosionRadius = 7,
            ExplosionDamage = 75,
            MissileTime = 1.75,
            RangeBuff = 15,
            CooldownBuff = 15,
            DamageBuff = 15,
            RocketVolleyCount = 4,
            TankSpawnCount = 3,
            RevTime = 2.5,
        },
        Detections = {[Enum_2.StatusEffect.FlyingDetection] = true, ["FreezeImmune"] = true},
    },
    Tooltips = {
        {
            ButtonText = "Finalized Command Aura",
            Header = "Trinity Boosts",
            Content = {
                {Text = "...and so he left, with everything but his humanity.."},
                {Text = "All buffs increase to +15%."},
            },
        },
        {
            ButtonText = "Upgraded Convoy",
            Header = "Convoy",
            Content = {{Text = "Deploy 4 Railgun Tanks in a sequence on use."}},
        },
        {
            ButtonText = "Upgraded Stark Missiles",
            Header = "Periodically fires rockets at enemies",
            Content = {
                {Text = "Rocket Volley Count: 3 > 4"},
                {Text = "Rocket Damage: 60 > 75"},
                {Text = "Rocket Cooldown: 2s > 1.75s"},
            },
        },
        {
            ButtonText = "Upgraded Dual Miniguns",
            Header = "Needs time to rev up before reigning fire",
            Content = {{Text = "Rev Up Time: 3s > 2.5s"}},
        },
    },
}
v4[1] = {Title = "Improved Handling", Cost = 1500, Image = 4989372339, Stats = {Range = 18, Cooldown = 0.15}}
v4[2] = {
    Title = "Stark Missile",
    Cost = 5000,
    Image = 4989372568,
    Stats = {Range = 18, Damage = 12, Cooldown = 0.15, Attributes = {RangeBuff = 10}},
    Tooltips = {
        {
            ButtonText = "Unlock Command Aura",
            Header = "Ally Boost",
            Content = {{Text = "Towers in radius gain +10% range"}},
        },
        {
            ButtonText = "Unlock Stark Missiles",
            Header = "Periodically fires rockets at enemies",
            Content = {
                {Text = "Rocket Volley Count: 1"},
                {Text = "Rocket Damage: 40"},
                {Text = "Rocket Cooldown: 2s"},
                {Text = "Explosion Radius: 4.5"},
            },
        },
    },
}
v4[3] = {
    Title = "Epic Armor Plating",
    Cost = 20000,
    Image = 3584258139,
    Stats = {Damage = 20, Cooldown = 0.09, Attributes = {CooldownBuff = 10, RocketVolleyCount = 2}},
    Tooltips = {
        {
            ButtonText = "Upgraded Command Aura",
            Header = "Ally Boost",
            Content = {{Text = "Towers in radius gain a +10% cooldown reduction"}},
        },
        {
            ButtonText = "Upgraded Stark Missiles",
            Header = "Periodically fires rockets at enemies",
            Content = {{Text = "Rocket Volley Count: 1 > 2"}},
        },
        {
            ButtonText = "Dual Miniguns",
            Header = "Needs time to rev up before reigning fire",
            Content = {{Text = "Rev Up Time: 3s"}},
        },
    },
}
v4[4] = v5
v4[5] = v6
v3.Upgrades = v4
v2.Default = v3
v1.Stats = v2
v1.Properties = {
    Description = "The last recourse of the Threat Defense Strategy. Dual miniguns, rapid burst rockets, multiple passive support boosts and railgun tank convoys; nothing will stand in his way.",
    Height = 0,
    BoundingSize = Vector3.new(0, 0, 0),
    DisplayName = "War Machine",
    DPS_Display = {Default = TowerDPS.Default},
    Role = Enum_2.TowerRole.Offense,
    Class = Enum_2.TowerType.Ground,
    Preview = {
        FieldOfView = 60,
        TowerOffset = Vector3.new(0, 0, 0),
        Icon = 6883317252,
        Thumbnail = 0,
        TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
        CameraOffset = CFrame.new(0, 0, 6),
    },
    Price = {Value = 999999999999999, Type = Enum_2.CurrencyType.Gems},
    Category = Enum_2.TowerCategory.Exclusive,
}
v1.Defaults = v1.Stats.Default.Defaults
return v1