-- Script path: ReplicatedStorage.Content.Tower.Mercenary Base.Stats-PVP
-- Decompile time: 2.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Defaults = {
                Limit = 3,
                Price = 2000,
                Range = 6,
                Cooldown = 0,
                Damage = 0,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {
                    RiflemanSpawnTime = 45,
                    RiflemanUpgrade = 0,
                    RiflemanCap = 10,
                    GrenadierCap = 7,
                    RiotGuardCap = 4,
                    MedicCap = 3,
                },
                Abilities = {
                    {
                        Name = "Air-Drop",
                        Price = 2500,
                        Level = 5,
                        Icon = 17190989424,
                        InitialCooldown = 15,
                        Debounce = 75,
                    },
                },
            },
            Upgrades = {
                {
                    Image = 17196819847,
                    Title = "Explosive Experts",
                    Cost = 1800,
                    Stats = {Range = 8, Attributes = {GrenadierSpawnTime = 40, GrenadierUpgrade = 0}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Grenadier Mercenary</b></font>",
                            Header = "Grenadier Mercenary",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">50</font>"},
                                {Text = "Explosion Damage: <font color=\"rgb(255, 0, 0)\">28</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">18</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">40 Sec</font>"},
                            },
                        },
                    },
                },
                {
                    Image = 17196820389,
                    Title = "Upgraded Barracks",
                    Cost = 2000,
                    Stats = {Attributes = {MaxUnits = 9}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock new <font color=\"rgb(255,185,0)\"><b>Unit Queue</b></font>",
                            Header = "Unit Queue",
                            Content = {{Text = "Select a mercenary unit to train and send out."}},
                        },
                    },
                },
                {
                    Image = 17196819964,
                    Title = "Improved Training",
                    Cost = 7000,
                    Stats = {
                        Range = 10,
                        Attributes = {
                            DamageBuff = 10,
                            RiflemanSpawnTime = 40,
                            RiflemanUpgrade = 1,
                            GrenadierSpawnTime = 40,
                            GrenadierUpgrade = 1,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>10% Damage Buff</b></font>",
                            Header = "Damage Buff",
                            Content = {{Text = "Provides a 10% damage buff to all towers within range."}},
                        },
                        {
                            ButtonText = "Rifleman <font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>",
                            Header = "Riflemen Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">80</font>"},
                                {Text = "Damage: <font color=\"rgb(255, 0, 0)\">8</font>"},
                                {Text = "Burst: <font color=\"rgb(255, 255, 255)\">8</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">24</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">40 Sec</font>"},
                            },
                        },
                        {
                            ButtonText = "Grenadier <font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>",
                            Header = "Grenadier Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">125</font>"},
                                {Text = "Explosion Damage: <font color=\"rgb(255, 0, 0)\">50</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">19</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">40 Sec</font>"},
                            },
                        },
                    },
                },
                {
                    Image = 13019520315,
                    Title = "Riot Control",
                    Cost = 10000,
                    Stats = {Attributes = {RiotGuardSpawnTime = 50, RiotGuardUpgrade = 0, MaxUnits = 9}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Riot Guard</b></font>",
                            Header = "Riot Guard Mercenary",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">800</font>"},
                                {Text = "Defense: <font color=\"rgb(255, 255, 255)\">10</font>"},
                                {Text = "Damage: <font color=\"rgb(255, 0, 0)\">50</font>"},
                                {Text = "Knockback Force: <font color=\"rgb(255, 255, 255)\">15</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">50 Sec</font>"},
                            },
                        },
                        {
                            ButtonText = "Unlock new <font color=\"rgb(255,185,0)\"><b>Unit Queue</b></font>",
                            Header = "Unit Queue",
                            Content = {{Text = "Select a mercenary unit to train and send out."}},
                        },
                    },
                },
                {
                    Image = 17196820108,
                    Title = "Air Transport",
                    Cost = 15000,
                    Stats = {Attributes = {FieldMedicSpawnTime = 35, FieldMedicUpgrade = 0}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Field Medic</b></font>",
                            Header = "Field Medic Mercenary",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">300</font>"},
                                {Text = "Heal Rate: <font color=\"rgb(0, 255, 0)\">75 HP</font>"},
                                {Text = "Max Targets: <font color=\"rgb(255, 255, 255)\">8</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">35 Sec</font>"},
                            },
                        },
                        {
                            ButtonText = "Unlock new <font color=\"rgb(255,185,0)\"><b>Air Drop Ability</b></font>",
                            Header = "Air Drop Ability",
                            Content = {{Text = "Pay cash to call in an air drop of mercenaries."}},
                        },
                    },
                },
                {
                    Image = 17196820275,
                    Title = "Enhanced Equipment",
                    Cost = 35000,
                    Stats = {
                        Attributes = {
                            DamageBuff = 20,
                            RiflemanSpawnTime = 35,
                            RiflemanUpgrade = 2,
                            GrenadierSpawnTime = 40,
                            GrenadierUpgrade = 2,
                            RiotGuardSpawnTime = 50,
                            RiotGuardUpgrade = 1,
                            FieldMedicSpawnTime = 30,
                            FieldMedicUpgrade = 1,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>20% Damage Buff</b></font>",
                            Header = "Damage Buff II",
                            Content = {{Text = "Provides a 20% damage buff to all towers within range."}},
                        },
                        {
                            ButtonText = "Rifleman <font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>",
                            Header = "Riflemen Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">275</font>"},
                                {Text = "Damage: <font color=\"rgb(255, 0, 0)\">17</font>"},
                                {Text = "Burst: <font color=\"rgb(255, 255, 255)\">8</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">30</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">35 Sec</font>"},
                            },
                        },
                        {
                            ButtonText = "Grenadier <font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>",
                            Header = "Grenadier Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">300</font>"},
                                {Text = "Explosion Damage: <font color=\"rgb(255, 0, 0)\">80</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">20</font>"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Field Medic</b></font>",
                            Header = "Field Medic Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">600</font>"},
                                {Text = "Heal Rate: <font color=\"rgb(0, 255, 0)\">100 HP</font>"},
                                {Text = "Max Targets: <font color=\"rgb(255, 255, 255)\">10</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">30 Sec</font>"},
                            },
                        },
                        {
                            ButtonText = "Upgrade <font color=\"rgb(255,185,0)\"><b>Riot Guard</b></font>",
                            Header = "Riot Guard Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">2000</font>"},
                                {Text = "Defense: <font color=\"rgb(255, 255, 255)\">15</font>"},
                                {Text = "Damage: <font color=\"rgb(255, 0, 0)\">50</font>"},
                                {Text = "knockback Force: <font color=\"rgb(255, 255, 255)\">25</font>"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Pick and choose between Riflemen, Grenadiers, Field Medics, or Riot Guards to send out and defend the front lines!",
        BoundarySize = 2.25,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Defense,
        Price = {
            PreviewText = "REACH LEVEL 150 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Free,
            Eligible = function(a1) -- Line: 366 -- types: a1: userdata
                local Level = a1:WaitForChild("Level", 1)
                return Level and 150 <= Level.Value
            end,
        },
        Gamepass = {Id = 786591818, Value = 1800},
        Class = Enum.TowerType.Ground,
        SkinData = {
            Liberator = {Icon = "rbxassetid://17746199722", Rarity = Enum.SkinRarity.Legendary},
            ["Frost Legion"] = {Icon = "rbxassetid://78931994632689", Rarity = Enum.SkinRarity.Legendary},
            Graveyard = {Icon = "rbxassetid://78931994632689", Rarity = Enum.SkinRarity.Rare},
        },
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0, 0),
            Icon = 17202640474,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, 3.9269908169872414, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Advanced,
    },
}