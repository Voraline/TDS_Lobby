-- Script path: ReplicatedStorage.Content.Tower.Jester.Stats
-- Decompile time: 2.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local u15 = {"Bomb 1", "Bomb 2"}
local v1 = {Enum.JesterBomb.Fire, "Fire"}
local v2 = {Enum.JesterBomb.Poison, "Poison"}
local u26 = {Enum.JesterBomb.Fire, "Fire", Enum.JesterBomb.Poison, "Poison"}
local u33 = {Enum.JesterBomb.Fire, "Fire", Enum.JesterBomb.Ice, "Ice"}

local function hasSelectedBomb(a1, a2) -- Line: 22 -- upvalues: u15 (val)
    local Options = a1.Options or {}
    for i, v in ipairs(u15) do
        for i2, i3 in ipairs(a2) do
            if Options[v] == i3 then
                return true
            end
        end
    end
    return false
end

return {
    Stats = {
        Default = {
            Defaults = {
                Cooldown = 1.2,
                Damage = 4,
                Limit = 8,
                Price = 650,
                Range = 10,
                Attributes = {
                    ExplosionRadius = 6,
                    EquipTime = 0.4,
                    AimTime = 0.2,
                    Velocity = 30,
                    MaxHits = 4,
                    BombCount = 1,
                    AnimTimes = {[0] = {Fire = 0.57, Equip = 0.23}, [4] = {Right = 0.6, Left = 0.6, Equip = 0.46}},
                    FireStats = {BurnTime = 0.25, BurnTick = 0.25},
                    IceStats = {
                        Radius = 6,
                        Length = 3,
                        MaxHits = 6,
                        SlowPercent = 25,
                        MaxSlow = 25,
                        DefenseMelt = 0,
                    },
                    PoisonStats = {Radius = 3.5, Length = 30, TickRate = 0.4, DefenseMelt = 0},
                    ConfuseStats = {Length = 2, Debounce = 6},
                },
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                    [Enum.StatusEffect.LeadDetection] = true,
                },
                Abilities = {
                    {
                        Name = "Equip Bombs",
                        Description = "Swaps the currently held bombs with the newly equipped bombs, without the need for existing bombs to be used.",
                        Price = 0,
                        Level = 0,
                        Icon = 14606405886,
                        Debounce = 0,
                    },
                },
            },
            Upgrades = {
                {
                    Cost = 400,
                    Image = 15332518871,
                    Title = "Trained Juggling",
                    Stats = {Damage = 6, Cooldown = 1, Range = 12.3},
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Fire Bomb</b></font>",
                            Header = "Fire Bomb",
                            Content = {{Text = "Bomb Damage: 4 -> 6"}},
                        },
                    },
                },
                {
                    Cost = 670,
                    Image = 15332518503,
                    Title = "Cold Humor",
                    Stats = {
                        Damage = 10,
                        Range = 13,
                        Attributes = {
                            ExplosionRadius = 6,
                            FireStats = {BurnTick = 0.25, BurnTime = 0.25, MaxHits = 3},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Ice Bomb</b></font>",
                            Header = "Ice Bomb",
                            Content = {
                                {Text = "Bomb Damage: 2"},
                                {Text = "Slowdown Per Hit: 25%"},
                                {Text = "Max Slow: 25%"},
                                {Text = "Explosion Radius: 6"},
                                {Text = "Max Hits: 4"},
                                {Text = "Chill Duration: 3s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Fire Bomb</b></font>",
                            Header = "Fire Bomb",
                            Content = {{Text = "Bomb Damage: 6 -> 10"}, {Text = "Burn Damage: 2 -> 3"}},
                        },
                    },
                },
                {
                    Cost = 2750,
                    Image = 15332518237,
                    Title = "Potent Bombs",
                    Stats = {
                        Damage = 30,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {
                            ExplosionRadius = 6,
                            FireStats = {BurnTime = 0.25, BurnTick = 0.25},
                            IceStats = {SlowPercent = 25, MaxSlow = 25, Radius = 7, MaxHits = 7},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Poison Bomb</b></font>",
                            Header = "Poison Bomb",
                            Content = {
                                {Text = "Bomb Damage: 0"},
                                {Text = "Poison Damage: 3"},
                                {Text = "Poison Tick: 0.4s"},
                                {Text = "Poison Radius: 3.5"},
                                {Text = "Poison Duration: 30s"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Ice Bomb</b></font>",
                            Header = "Ice Bomb",
                            Content = {{Text = "Bomb Damage: 2 -> 6"}, {Text = "Explosion Radius: 6 -> 7"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Fire Bomb</b></font>",
                            Header = "Fire Bomb",
                            Content = {{Text = "Bomb Damage: 10 -> 30"}, {Text = "Burn Damage: 3 -> 9"}},
                        },
                    },
                },
                {
                    Cost = 8500,
                    Image = 15332519184,
                    Title = "Harlequin of Doom",
                    Stats = {
                        Damage = 48,
                        Range = 16,
                        Cooldown = 0.6,
                        Attributes = {BombCount = 2, IceStats = {SlowPercent = 25, MaxSlow = 25, MaxHits = 10}},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Confusion Bomb</b></font>",
                            Header = "Confusion Bomb",
                            Content = {
                                {Text = "Bomb Damage: 0"},
                                {Text = "Confusion Duration: 2s"},
                                {Text = "Confusion Cooldown: 6s"},
                                {Text = "Max Hits: 4"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Poison Bomb</b></font>",
                            Header = "Poison Bomb",
                            Content = {{Text = "Poison Damage: 3 -> 5"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Ice Bomb</b></font>",
                            Header = "Ice Bomb",
                            Content = {{Text = "Bomb Damage: 6 -> 10"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Fire Bomb</b></font>",
                            Header = "Fire Bomb",
                            Content = {{Text = "Bomb Damage: 30 -> 50"}, {Text = "Burn Damage: 9 -> 15"}},
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "I have a ton of tricks in my pockets! Cycle through and throw debuff bombs at enemies!",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {
            Default = {Calculate = TowerDPS.Default, Option = {Name = u15, Value = u33}},
            ["Burn DPS"] = {Calculate = TowerDPS.JesterBurn, Option = {Name = u15, Value = v1}},
            ["Poison DPS"] = {Calculate = TowerDPS.JesterPoison, Option = {Name = u15, Value = v2}},
            ["Total DPS"] = {
                Calculate = TowerDPS.JesterCombined,
                Visible = function(a1) -- Line: 36 -- upvalues: hasSelectedBomb (val), u33 (val), u26 (val)
                    return hasSelectedBomb(a1, u33) and hasSelectedBomb(a1, u26)
                end,
            },
        },
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 6883281690,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        SkinData = {
            Clown = {Icon = 17744634147, Rarity = Enum.SkinRarity.Legendary},
            Heartbreak = {Icon = 119670783538459, Rarity = Enum.SkinRarity.Rare},
            ["The Beast"] = {Icon = 75863398247354, Rarity = Enum.SkinRarity.Legendary},
            ["The Flea"] = {Icon = 105377590942476, Rarity = Enum.SkinRarity.Legendary},
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}