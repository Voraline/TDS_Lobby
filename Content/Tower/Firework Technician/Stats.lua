-- Script path: ReplicatedStorage.Content.Tower.Firework Technician.Stats
-- Decompile time: 1.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 113918271734207,
                    Title = "Pyrotechnics",
                    Cost = 2000,
                    Stats = {
                        Range = 10,
                        Attributes = {
                            ["Detection Buff Duration"] = 10,
                            ["Firework Damage"] = 10,
                            ["Firework Radius"] = 1,
                            ["Firework Burn Damage"] = 2,
                            ["Firework Burn Duration"] = 5,
                            ["Firework Burn Tick Rate"] = 0.5,
                            ["Firework Chance Percentage Cap"] = 0.6,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Fireworks</b></font>",
                            Header = "Firework Upgrade",
                            Content = {
                                {Text = "Firework Burn Damage: 1 -> 2"},
                                {Text = "Firework Shot Added Damage: 5 -> 10"},
                                {Text = "Increased Chance to Trigger Firework Shot"},
                            },
                        },
                    },
                },
                {
                    Image = 102159060729309,
                    Title = "Bigger Boom",
                    Cost = 6500,
                    Stats = {
                        Range = 11,
                        Attributes = {
                            ["Detection Buff Duration"] = 15,
                            ["Firework Damage"] = 20,
                            ["Firework Radius"] = 2,
                            ["Firework Burn Damage"] = 2,
                            ["Firework Burn Duration"] = 5,
                            ["Firework Burn Tick Rate"] = 0.25,
                            ["Firework Chance Percentage Cap"] = 0.7,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Fireworks</b></font>",
                            Header = "Firework Upgrade",
                            Content = {
                                {Text = "Detection Buff Duration: 10 -> 15 Seconds"},
                                {Text = "Firework Burn Tick Rate: 0.5 -> 0.25"},
                                {Text = "Firework Shot Added Damage: 10 -> 20"},
                                {Text = "Firework Shot Radius: 1 -> 2"},
                                {Text = "Increased Chance to Trigger Firework Shot"},
                            },
                        },
                    },
                },
                {
                    Image = 76789690706169,
                    Title = "Light the Sky",
                    Cost = 12000,
                    Stats = {
                        Range = 11,
                        Attributes = {
                            ["Detection Buff Duration"] = 15,
                            ["Firework Damage"] = 30,
                            ["Firework Radius"] = 2,
                            ["Firework Burn Damage"] = 4,
                            ["Firework Burn Duration"] = 5,
                            ["Firework Burn Tick Rate"] = 0.25,
                            ["Firework Chance Percentage Cap"] = 0.8,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Fireworks</b></font>",
                            Header = "Firework Upgrade",
                            Content = {
                                {Text = "Firework Burn Damage: 2 -> 4"},
                                {Text = "Firework Shot Added Damage: 20 -> 30"},
                                {Text = "Increased Chance to Trigger Firework Shot"},
                            },
                        },
                    },
                },
                {
                    Image = 83889465749773,
                    Title = "The Finale",
                    Cost = 22000,
                    Stats = {
                        Range = 12,
                        Attributes = {
                            ["Detection Buff Duration"] = 20,
                            ["Firework Damage"] = 45,
                            ["Firework Radius"] = 3,
                            ["Firework Burn Damage"] = 7,
                            ["Firework Burn Duration"] = 5,
                            ["Firework Burn Tick Rate"] = 0.25,
                            ["Firework Chance Percentage Cap"] = 1,
                        },
                        Extras = {},
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Fireworks</b></font>",
                            Header = "Firework Upgrade",
                            Content = {
                                {Text = "Detection Buff Duration: 15 -> 20 Seconds"},
                                {Text = "Firework Burn Damage: 4 -> 7"},
                                {Text = "Firework Shot Added Damage: 30 -> 45"},
                                {Text = "Firework Shot Radius: 2 -> 3"},
                                {Text = "Increased Chance to Trigger Firework Shot"},
                            },
                        },
                    },
                },
            },
            Defaults = {
                Price = 1500,
                Range = 10,
                Limit = 1,
                HideTargetingMode = true,
                Attributes = {
                    ["Detection Buff Duration"] = 10,
                    ["Firework Damage"] = 5,
                    ["Firework Radius"] = 1,
                    ["Firework Burn Damage"] = 1,
                    ["Firework Burn Duration"] = 5,
                    ["Firework Burn Tick Rate"] = 0.5,
                    ["Firework Chance Percentage Cap"] = 0.5,
                },
            },
        },
    },
    Properties = {
        Description = "A firework tech who supports the team by giving them detection and grants chance for towers to shoot a firework",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Support,
        Class = Enum.TowerType.Ground,
        SkinData = {
            Inventor = {Icon = 120729210272262, Rarity = Enum.SkinRarity.Rare},
            ["2026"] = {Icon = 4056868908, Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(-0.5, 0, 0),
            Icon = 113647654122910,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}