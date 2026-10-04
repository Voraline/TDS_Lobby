-- Script path: ReplicatedStorage.Content.Tower.Elf Camp.Stats
-- Decompile time: 2.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 125956529169231,
                    Title = "Sno'ball Training",
                    Cost = 750,
                    Stats = {
                        Extras = {},
                        Attributes = {
                            SnowballElfSpawnTime = 10,
                            SnowballElfLimit = 30,
                            UnitsToSend = {"Snowball Elf"},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Snowball Elf</b></font>",
                            Header = "Throws a snowball at enemies to deal damage.",
                            Content = {
                                {Text = "Spawn Time: 10s"},
                                {Text = "Health: 15"},
                                {Text = "Damage: 4"},
                                {Text = "Range: 17"},
                                {Text = "Cooldown: 2s"},
                            },
                        },
                    },
                },
                {
                    Image = 75868965324711,
                    Title = "Unpaid Labor",
                    Cost = 2022,
                    Stats = {
                        Extras = {},
                        Attributes = {
                            BomberElfSpawnTime = 8,
                            GunnerElfUpgrade = 0,
                            CannoneerElfSpawnTime = 12,
                            CannoneerElfLimit = 30,
                            UnitsToSend = {"Bomber Elf", "Cannoneer Elf"},
                            UnitsToRemove = {"Snowball Elf"},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Bomber Elf</b></font>",
                            Header = "Runs into the enemies and explodes on impact.",
                            Content = {
                                {Text = "Spawn Time: 10s"},
                                {Text = "Health: 5"},
                                {Text = "Damage: 45"},
                                {Text = "Explosion Radius: 5"},
                                {Text = "Speed: 12"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Cannoneer Elf</b></font>",
                            Header = "Cannoneer Elf replaces Snowball Elf.",
                            Content = {
                                {Text = "Spawn Time: 25s"},
                                {Text = "Health: 20"},
                                {Text = "Damage: 4"},
                                {Text = "Range: 18"},
                                {Text = "Cooldown: 0.5s"},
                            },
                        },
                    },
                },
                {
                    Image = 120660526589244,
                    Title = "Cookie Cutting",
                    Cost = 4500,
                    Stats = {
                        Extras = {},
                        Attributes = {
                            WarriorElfUpgrade = 0,
                            WarriorElfSpawnTime = 10,
                            WarriorElfLimit = 30,
                            GunnerElfSpawnTime = 25,
                            GunnerElfLimit = 30,
                            GunnerElfUpgrade = 0,
                            UnitsToSend = {"Warrior Elf", "Gunner Elf"},
                            UnitsToRemove = {"Elf", "Snowball Elf", "Cannoneer Elf"},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Guardian Elf</b></font>",
                            Header = "Guardian Elf replaces Basic Elf. Detects Hidden Enemies.",
                            Content = {
                                {Text = "Spawn Time: 10s"},
                                {Text = "Health: 50"},
                                {Text = "Damage: 18"},
                                {Text = "Range: 7"},
                                {Text = "Cooldown: 0.5s"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Gunner Elf</b></font>",
                            Header = "Gunner Elf replaces Cannoneer Elf. Detects Hidden Enemies.",
                            Content = {
                                {Text = "Spawn Time: 25s"},
                                {Text = "Health: 25"},
                                {Text = "Damage: 4"},
                                {Text = "Range: 22"},
                                {Text = "Cooldown: 0.4s"},
                                {Text = "Burst Cooldown: 1s"},
                                {Text = "Burst Count: 5"},
                            },
                        },
                    },
                },
                {
                    Image = 70951173324126,
                    Title = "A Violent Night",
                    Cost = 12012,
                    Stats = {
                        Extras = {},
                        Attributes = {
                            WarriorElfUpgrade = 1,
                            GunnerElfUpgrade = 1,
                            GunnerElfSpawnTime = 25,
                            GunnerElfLimit = 30,
                            RippedElfSpawnTime = 100,
                            RippedElfLimit = 3,
                            GiftBomberSpawnTime = 50,
                            GiftBomberLimit = 30,
                            UnitsToSend = {"Gunner Elf", "Ripped Elf", "Gift Bomber"},
                            NumOfUnitsToSpawn = {["Gunner Elf"] = 2},
                            UnitsToRemove = {"Bomber Elf", "Cannoneer Elf"},
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Guardian Elf</b></font>",
                            Header = "Guardian Elf Upgraded.",
                            Content = {
                                {Text = "Health: 50 > 75"},
                                {Text = "Damage: 14 > 28"},
                                {Text = "Defense: 30%"},
                            },
                        },
                        {
                            ButtonText = "Upgraded <font color=\"rgb(255,185,0)\"><b>Gunner Elf</b></font>",
                            Header = "Gunner Elf Detects Hidden Enemies.",
                            Content = {{Text = "Cooldown: 0.4s > 0.35s"}},
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Ripped Elf</b></font>",
                            Header = "An Absolute Unit.",
                            Content = {
                                {Text = "Spawn Time: 100s"},
                                {Text = "Health: 1000"},
                                {Text = "Explosion Damage: 375"},
                                {Text = "Range: 60"},
                                {Text = "Explosion Radius: 4"},
                                {Text = "Cooldown: 7s"},
                            },
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Gift Bomber Elf</b></font>",
                            Header = "Gift Bomber replaces Bomber Elf. Detects Hidden and Flying Enemies.",
                            Content = {
                                {Text = "Spawn Time: 50s"},
                                {Text = "Health: 500"},
                                {Text = "Damage: 60"},
                                {Text = "Explosion Radius: 4.5"},
                                {Text = "Range: 25"},
                                {Text = "Cooldown: 2s"},
                            },
                        },
                        {
                            ButtonText = "<font color=\"rgb(255,185,0)\"><b>A Violent Night</b></font>",
                            Content = {
                                {
                                    Text = "Guardian Elf, you go left. Gunner Elf, you go right. And Ripped Elf? Make this a violent night!",
                                },
                            },
                        },
                    },
                },
            },
            Defaults = {
                Limit = 4,
                Price = 300,
                Range = 0,
                Cooldown = 0,
                Damage = 0,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {ElfSpawnTime = 10, ElfLimit = 30, UnitsToSend = {"Elf"}},
            },
        },
    },
    Properties = {
        Description = "Elf army.. ATTACK! Send out elf units to defend your base.",
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Defense,
        Gamepass = {Id = 112619685},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Classic = {Icon = 11866257745, Rarity = Enum.SkinRarity.Event},
            Chocolatier = {Icon = 79600048176341, Rarity = Enum.SkinRarity.Uncommon},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 1, 0),
            Icon = 128513705259048,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}