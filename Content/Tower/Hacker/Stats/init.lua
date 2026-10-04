-- Script path: ReplicatedStorage.Content.Tower.Hacker.Stats
-- Decompile time: 2.64 ms

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
                    Cost = 125,
                    Stats = {
                        Range = 12.5,
                        Cooldown = 0.3,
                        Damage = 0,
                        Detections = {},
                        Attributes = {Beams = 1, ["Hologram Enemy EV"] = 0.45, ["Wire Fraud"] = 12.5, Slowness = 10},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Slowness</b></font>",
                            Content = {{Text = "Beam now applies a 10% slowness debuff to enemies"}},
                        },
                    },
                },
                {
                    Image = 84772480553742,
                    Title = "Shady Business",
                    Cost = 1337,
                    Stats = {
                        Range = 14,
                        Cooldown = 0.3,
                        Damage = 0,
                        Detections = {[Enum.StatusEffect.HiddenDetection] = true},
                        Attributes = {Beams = 2, ["Hologram Enemy EV"] = 0.55, Slowness = 10, ["Wire Fraud"] = 15},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Wire Fraud</b></font>",
                            Content = {{Text = "Increase to enemy cash rewards from 12.5% to 15%"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Synapses</b></font>",
                            Content = {{Text = "Number of synapses increased from 1 to 2"}},
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
                    Cost = 6500,
                    Stats = {
                        Range = 15,
                        Cooldown = 0.3,
                        Damage = 10,
                        Detections = {},
                        Attributes = {
                            Beams = 2,
                            ["Hologram Enemy EV"] = 0.625,
                            Slowness = 10,
                            ["Wire Fraud"] = 15,
                            ["Hologram Tower Lifetime"] = 25,
                            CostClone = 30,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlocked <font color=\"rgb(255,185,0)\"><b>Tower Hologram</b></font>",
                            Content = {
                                {Text = "Select a tower to create a temporary hologram of it"},
                                {Text = "Cloning costs 30% of the tower's cost"},
                                {Text = "Hologram lifetime: 25 seconds"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Unit Conversion</b></font>",
                            Content = {{Text = "Enemies converted now have higher health"}},
                        },
                    },
                },
                {
                    Image = 71327152036764,
                    Title = "5th Gen I9 3260590327",
                    Cost = 24000,
                    Stats = {
                        Range = 16,
                        Cooldown = 0.3,
                        Damage = 22,
                        Detections = {},
                        Attributes = {
                            Beams = 3,
                            ["Hologram Enemy EV"] = 0.675,
                            Slowness = 10,
                            ["Wire Fraud"] = 20,
                            ["Hologram Tower Lifetime"] = 25,
                            CostClone = 25,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Synapses</b></font>",
                            Content = {{Text = "Number of synapses increased from 2 to 3"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Wire Fraud</b></font>",
                            Content = {{Text = "Increase to enemy cash rewards from 15% to 20%"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Unit Conversion</b></font>",
                            Content = {{Text = "Enemies converted now have higher health"}},
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Tower Hologram</b></font>",
                            Content = {{Text = "Cloning cost: 30% -> 25%"}},
                        },
                    },
                },
                {
                    {
                        Image = 78547724037844,
                        Title = "Overclock",
                        Cost = 60001,
                        Stats = {
                            Range = 18.5,
                            Cooldown = 0.1,
                            Damage = 25,
                            RunOnDestroyEvents = true,
                            Detections = {},
                            Attributes = {
                                Beams = 3,
                                ["Hologram Enemy EV"] = 0.75,
                                Slowness = 10,
                                ["Wire Fraud"] = 20,
                                ["Hologram Tower Lifetime"] = 30,
                                CostClone = 25,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Unit Conversion</b></font>",
                                Content = {{Text = "Enemies converted now have higher health"}},
                                {
                                    ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Tower Hologram</b></font>",
                                    Content = {{Text = "Hologram lifetime: 25 -> 30 seconds"}},
                                },
                            },
                        },
                    },
                    {
                        Image = 105579078081734,
                        Title = "Rug Pull",
                        Cost = 53200,
                        Stats = {
                            Range = 21,
                            Cooldown = 0.3,
                            Damage = 22,
                            Detections = {},
                            Attributes = {
                                Beams = 4,
                                ["Hologram Enemy EV"] = 0.675,
                                Slowness = 12.5,
                                ["Wire Fraud"] = 25,
                                ["Hologram Tower Lifetime"] = 120,
                                CostClone = 75,
                            },
                        },
                        Tooltips = {
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Synapses</b></font>",
                                Content = {{Text = "Number of synapses increased from 3 to 4"}},
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Wired Fraud</b></font>",
                                Content = {{Text = "Increase to enemy cash rewards from 20% to 25%"}},
                            },
                            {
                                ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Tower Hologram</b></font>",
                                Content = {
                                    {Text = "Cloning cost: 25% -> 75%"},
                                    {Text = "Hologram lifetime: 35 -> 120 seconds"},
                                },
                            },
                        },
                    },
                },
            },
            Defaults = {
                Price = 900,
                Range = 11,
                Limit = 2,
                Cooldown = 0.3,
                Damage = 0,
                RunOnDestroyEvents = true,
                Abilities = {
                    {
                        Name = "Hologram Tower",
                        Description = "Deploy a hologram of an existing tower, completely mimicking its appearance and abilities for a limited duration.",
                        Price = 0,
                        Level = 3,
                        Icon = 91867509401312,
                        Debounce = 60,
                    },
                },
                Detections = {},
                Attributes = {
                    Beams = 1,
                    ["Hologram Enemy EV"] = 0.45,
                    Slowness = 7.5,
                    ["Wire Fraud"] = 12.5,
                    CostClone = 80,
                    ["Unit Cap"] = 1000,
                    ["Unit Send Cooldown"] = 0,
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
        Price = {
            Value = 5500,
            PreviewText = "REACH LEVEL 50 TO UNLOCK TOWER OR BUY WITH GAMEPASS!",
            Type = Enum.CurrencyType.Gems,
            Eligible = function(a1) -- Line: 336 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 50 <= Level.Value
            end,
        },
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
            ["Reindeer Mech"] = {Icon = 90815258282429, Rarity = Enum.SkinRarity.Legendary},
            ["Camera Operator"] = {Icon = 99561892943267, Rarity = Enum.SkinRarity.Legendary},
            ["Pool Day"] = {Icon = 0, Rarity = Enum.SkinRarity.Legendary},
        },
        Category = Enum.TowerCategory.Hardcore,
    },
}