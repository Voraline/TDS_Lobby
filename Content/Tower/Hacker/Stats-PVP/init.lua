-- Script path: ReplicatedStorage.Content.Tower.Hacker.Stats-PVP
-- Decompile time: 2.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local HackerTooltips = require(script.HackerTooltips)
local beeDebuffTooltip = HackerTooltips.beeDebuffTooltip
local unlockAbility = HackerTooltips.unlockAbility
local TowerDPS = require(ReplicatedStorage.Shared.Modules.TowerDPS)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 116572141213630,
                    Title = "Upgraded Rig",
                    Cost = 600,
                    Stats = {
                        Range = 14,
                        Cooldown = 0.5,
                        Damage = 4,
                        Detections = {},
                        Attributes = {Beams = 1, ["Hologram Enemy EV"] = 0.6, ["Wire Fraud"] = 7.5, Slowness = 0},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Wire Fraud</b></font>",
                            Content = {{Text = "7.5% Increase to enemy cash rewards"}},
                        },
                    },
                },
                {
                    Image = 84772480553742,
                    Title = "Shady Business",
                    Cost = 1250,
                    Stats = {
                        Range = 14,
                        Cooldown = 0.5,
                        Damage = 6,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {Beams = 2, ["Hologram Enemy EV"] = 0.65, Slowness = 15, ["Wire Fraud"] = 10},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Synapses</b></font>",
                            Content = {{Text = "Number of synapses increased from 1 to 2"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Slowness</b></font>",
                            Content = {{Text = "Beam now applies a 15% slowness debuff to enemies"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Unit Conversion</b></font>",
                            Content = {{Text = "Enemies converted now have higher health"}},
                        },
                    },
                },
                {
                    Image = 73779458293742,
                    Title = "Teleportation Tech",
                    Cost = 7500,
                    Stats = {
                        Range = 15,
                        Cooldown = 0.5,
                        Damage = 20,
                        Detections = {},
                        Attributes = {
                            Beams = 2,
                            ["Hologram Enemy EV"] = 0.725,
                            Slowness = 15,
                            ["Wire Fraud"] = 10,
                            ["Hologram Tower Lifetime"] = 60,
                            CostClone = 35,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Tower Hologram</b></font>",
                            Content = {
                                {Text = "Select a tower to create a temporary hologram of it"},
                                {Text = "Cloning costs 90% of the tower's cost"},
                                {Text = "Hologram lifetime: 60 seconds"},
                            },
                        },
                    },
                },
                {
                    Image = 71327152036764,
                    Title = "5th Gen I9 3260590327",
                    Cost = 22000,
                    Stats = {
                        Range = 16,
                        Cooldown = 0.3,
                        Damage = 18,
                        Detections = {},
                        Attributes = {
                            Beams = 2,
                            ["Hologram Enemy EV"] = 0.825,
                            Slowness = 20,
                            ["Wire Fraud"] = 12.5,
                            ["Hologram Tower Lifetime"] = 75,
                            CostClone = 30,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Wire Fraud</b></font>",
                            Content = {{Text = "Increase to enemy cash rewards from 10% to 12.5%"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Slowness</b></font>",
                            Content = {{Text = "Increase slowness debuff from 15% to 20%"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Tower Hologram</b></font>",
                            Content = {
                                {Text = "Cloning costs 90% of the tower's cost"},
                                {Text = "Hologram lifetime: 60 -> 75 seconds"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Unit Conversion</b></font>",
                            Content = {{Text = "Enemies converted now have higher health"}},
                        },
                    },
                },
                {
                    {
                        Image = 78547724037844,
                        Title = "Overclock",
                        Cost = 63500,
                        Stats = {
                            Range = 18.5,
                            Cooldown = 0.1,
                            Damage = 15,
                            Detections = {},
                            Attributes = {
                                Beams = 4,
                                ["Hologram Enemy EV"] = 0.9,
                                Slowness = 15,
                                ["Wire Fraud"] = 12.5,
                                ["Hologram Tower Lifetime"] = 75,
                                CostClone = 30,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Synapses</b></font>",
                                Content = {{Text = "Number of synapses increased from 2 to 4"}},
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Unit Conversion</b></font>",
                                Content = {{Text = "Enemies converted now have higher health"}},
                            },
                        },
                    },
                    {
                        Image = 105579078081734,
                        Title = "Rug Pull",
                        Cost = 48000,
                        Stats = {
                            Range = 21,
                            Cooldown = 0.3,
                            Damage = 18,
                            Detections = {},
                            Attributes = {
                                Beams = 3,
                                ["Hologram Enemy EV"] = 0.825,
                                Slowness = 25,
                                ["Wire Fraud"] = 20,
                                ["Hologram Tower Lifetime"] = 120,
                                CostClone = 25,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Synapses</b></font>",
                                Content = {{Text = "Number of synapses increased from 2 to 3"}},
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Slowness</b></font>",
                                Content = {{Text = "Increase slowness debuff from 20% to 25%"}},
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Wired Fraud</b></font>",
                                Content = {{Text = "Increase to enemy cash rewards from 12.5% to 20%"}},
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Tower Hologram</b></font>",
                                Content = {
                                    {Text = "Cloning costs 25% of the tower's cost"},
                                    {Text = "Hologram lifetime: 75 -> 120 seconds"},
                                },
                            },
                        },
                    },
                },
            },
            Defaults = {
                Price = 1400,
                Range = 11,
                Limit = 2,
                Cooldown = 0.8,
                Damage = 4,
                Abilities = {
                    {
                        Name = "Hologram Tower",
                        Price = 0,
                        Level = 3,
                        Icon = 91867509401312,
                        Debounce = 60,
                    },
                },
                Detections = {},
                Attributes = {
                    Beams = 1,
                    ["Hologram Enemy EV"] = 0.6,
                    Slowness = 0,
                    CostClone = 40,
                    ["Unit Cap"] = 1000,
                    ["Unit Send Cooldown"] = 0.1,
                },
            },
        },
    },
    Properties = {
        Description = "Attack multiple enemies with synapses, siphon cash, and clone towers/enemies! This feels.. illegal!?! ",
        Level = 50,
        Limit = 6,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        DPS_Display = {Default = TowerDPS.Default},
        Role = Enum.TowerRole.Support,
        Class = Enum.TowerType.Ground,
        Gamepass = {Id = 1252103819},
        Price = {Value = 5500, Type = Enum.CurrencyType.Gems},
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 111199743077047,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.3161255787892263, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        SkinData = {
            Fallen = {Icon = 122092656436424, Rarity = Enum.SkinRarity.Rare},
            Triumphant = {Icon = 122127536135971, Rarity = Enum.SkinRarity.Exclusive},
        },
        Category = Enum.TowerCategory.Hardcore,
    },
}