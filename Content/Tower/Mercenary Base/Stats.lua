-- Script path: ReplicatedStorage.Content.Tower.Mercenary Base.Stats
-- Decompile time: 2.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Immutable = true,
            Defaults = {
                Limit = 3,
                Price = 2750,
                Range = 6,
                Cooldown = 0,
                Damage = 0,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {
                    RiflemanSpawnTime = 30,
                    RiflemanUpgrade = 0,
                    RiflemanCap = 100,
                    GrenadierCap = 100,
                    RiotGuardCap = 100,
                    MedicCap = 100,
                    DamageBuff = 0,
                },
                Abilities = {
                    {
                        Name = "Air-Drop",
                        Description = "Call in an air-drop that deploys an additional 3 mercenaries onto the battlefield.",
                        Price = 2500,
                        Level = 5,
                        Icon = 17190989424,
                        InitialCooldown = 15,
                        Debounce = 50,
                    },
                },
            },
            Upgrades = {
                {
                    Image = 17196819847,
                    Title = "Explosive Experts",
                    Cost = 1350,
                    Stats = {Range = 8, Attributes = {GrenadierSpawnTime = 25, GrenadierUpgrade = 0}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Grenadier Mercenary</b></font>",
                            Header = "Grenadier Mercenary",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">50</font>"},
                                {Text = "Explosion Damage: <font color=\"rgb(255, 0, 0)\">20</font>"},
                                {Text = "Cooldown: <font color=\"rgb(255, 0, 0)\">1.4</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">19</font>"},
                                {
                                    Text = "Explosion Radius: <font color=\"rgb(255, 255, 255)\">4.5</font>",
                                },
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">25 Sec</font>"},
                            },
                        },
                    },
                },
                {
                    Image = 17196820389,
                    Title = "Upgraded Barracks",
                    Cost = 2750,
                    Stats = {Attributes = {MaxUnits = 100}},
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
                    Cost = 9650,
                    Stats = {
                        Range = 10,
                        Attributes = {
                            DamageBuff = 10,
                            RiflemanSpawnTime = 30,
                            RiflemanUpgrade = 1,
                            GrenadierSpawnTime = 25,
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
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">30 Sec</font>"},
                            },
                        },
                        {
                            ButtonText = "Grenadier <font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>",
                            Header = "Grenadier Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">135</font>"},
                                {Text = "Explosion Damage: <font color=\"rgb(255, 0, 0)\">30</font>"},
                                {Text = "Cooldown: <font color=\"rgb(255, 0, 0)\">1.3</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">20</font>"},
                                {Text = "Explosion Radius: <font color=\"rgb(255, 255, 255)\">5</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">25 Sec</font>"},
                            },
                        },
                    },
                },
                {
                    Image = 13019520315,
                    Title = "Riot Control",
                    Cost = 10000,
                    Stats = {Attributes = {RiotGuardSpawnTime = 40, RiotGuardUpgrade = 0, MaxUnits = 100}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Riot Guard</b></font>",
                            Header = "Riot Guard Mercenary",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">800</font>"},
                                {Text = "Defense: <font color=\"rgb(255, 255, 255)\">10</font>"},
                                {Text = "Damage: <font color=\"rgb(255, 0, 0)\">50</font>"},
                                {Text = "Knockback Force: <font color=\"rgb(255, 255, 255)\">15</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">40 Sec</font>"},
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
                    Cost = 12500,
                    Stats = {Attributes = {DamageBuff = 12.5, FieldMedicSpawnTime = 30, FieldMedicUpgrade = 0}},
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>12.5% Damage Buff</b></font>",
                            Header = "Damage Buff II",
                            Content = {{Text = "Provides a 12.5% damage buff to all towers within range."}},
                        },
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>Field Medic</b></font>",
                            Header = "Field Medic Mercenary",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">300</font>"},
                                {Text = "Heal Rate: <font color=\"rgb(0, 255, 0)\">75 HP</font>"},
                                {Text = "Max Targets: <font color=\"rgb(255, 255, 255)\">8</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">30 Sec</font>"},
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
                    Cost = 45000,
                    Stats = {
                        Attributes = {
                            DamageBuff = 15,
                            RiflemanSpawnTime = 30,
                            RiflemanUpgrade = 2,
                            GrenadierSpawnTime = 25,
                            GrenadierUpgrade = 2,
                            RiotGuardSpawnTime = 40,
                            RiotGuardUpgrade = 1,
                            FieldMedicSpawnTime = 30,
                            FieldMedicUpgrade = 1,
                        },
                    },
                    Tooltips = {
                        {
                            ButtonText = "Unlock <font color=\"rgb(255,185,0)\"><b>15% Damage Buff</b></font>",
                            Header = "Damage Buff III",
                            Content = {{Text = "Provides a 15% damage buff to all towers within range."}},
                        },
                        {
                            ButtonText = "Rifleman <font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>",
                            Header = "Riflemen Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">275</font>"},
                                {Text = "Damage: <font color=\"rgb(255, 0, 0)\">17</font>"},
                                {Text = "Burst: <font color=\"rgb(255, 255, 255)\">8</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">30</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">30 Sec</font>"},
                            },
                        },
                        {
                            ButtonText = "Grenadier <font color=\"rgb(255,185,0)\"><b>Upgrade</b></font>",
                            Header = "Grenadier Upgrade",
                            Content = {
                                {Text = "Health: <font color=\"rgb(0, 255, 0)\">325</font>"},
                                {Text = "Explosion Damage: <font color=\"rgb(255, 0, 0)\">40</font>"},
                                {Text = "Cooldown: <font color=\"rgb(255, 0, 0)\">1.2</font>"},
                                {Text = "Range: <font color=\"rgb(255, 255, 255)\">21.5</font>"},
                                {Text = "Explosion Radius: <font color=\"rgb(255, 255, 255)\">6</font>"},
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">25 Sec</font>"},
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
                                {Text = "Spawn Time: <font color=\"rgb(255, 255, 255)\">40 Sec</font>"},
                            },
                        },
                    },
                },
            },
        },
    },
    Properties = {
        Description = "Pick and choose between Riflemen, Grenadiers, Field Medics, or Riot Guards to send out and defend the front lines! Must be placed close to the path to spawn units.",
        BoundarySize = 2.25,
        Height = 0,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Defense,
        Price = {
            PreviewText = "REACH LEVEL 150 TO UNLOCK TOWER!",
            Type = Enum.CurrencyType.Free,
            Eligible = function(a1) -- Line: 404 -- types: a1: userdata
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