-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.72.0
-- Decompile time: 3.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🗡️ Silent But Deadly 🎯",
    ImageId = 106780289490146,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🗡️ Assassin Tower",
                        Points = {
                            "A new intermediate tower joins the roster! Send fatal stabs and whirlwind slashes towards enemies and throw knives! Get him in the shop for 800 coins!",
                            "Assassin is an early game tower that returns to the roots of the tower defense genre, capable of handling single-target threats and crowds with its various combo attacks!",
                            "At level 2, Assassin unlocks a whirlwind slash, dealing AOE damage to all enemies in range every third hit.",
                            "At max level, Assassin unlocks fan of knives, charging up a deadly attack to throw 3 projectiles in an arc that pierce multiple enemies.",
                            function(a1, a2) -- Line: 21 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128714941591715,
                                    Text = "Assassin's Wirlwind Slash",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 29 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 88586516371510,
                                    Text = "Assassin's Fan of Knives",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🎯 Archer Rework",
                        Points = {
                            "The Archer event tower is now sharper than ever! Enjoy a new fresh new look, bouncing arrows, and new animations!",
                            function(a1, a2) -- Line: 46 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 82649031563159,
                                    Text = "Archer's game pass will be on sale for 649 î€‚ (Available for 1 week)",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🎆 Pier Pressure",
                        Points = {
                            function(a1, a2) -- Line: 62 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 79881122630664,
                                    Text = "Defeat the newest map, inspired by the Chicago Pier -- Pier Pressure!",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            "❤️ Medic Rework",
                            "⚔️ PVP Clans & Quests",
                            "...keep an eye on our socials for more info! 📢",
                            function(a1, a2) -- Line: 81 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 95517534898824,
                                    Text = "💥 Turret Refresh",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Improvements",
                        Points = {
                            "Multiple adjustments to enemy sends in Basic, Molten, and Fallen arenas!",
                            "Bug fixes regarding how elo is calculated in PVP.",
                            "Heavier penalties for leaving PVP matches.",
                            "Fixed some win trading issues in PVP matches",
                            "Fixed an issue with the Beach nametag",
                            "Expect more fundamental changes to PVP coming soon to improve\nthe experience!",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Assassin",
                        Points = {
                            "Lvl 0 Cost: 300",
                            "Lvl 1 Cost: 150",
                            "Lvl 2 Cost: 600",
                            "Lvl 3 Cost: 1500",
                            "Lvl 4 Cost: 4250",
                            "Lvl 0 Range: 5.5",
                            "Lvl 1 Range: 6.5",
                            "Lvl 4 Range: 7",
                            "Lvl 0 Cooldown: 0.75",
                            "Lvl 2 Cooldown: 0.6",
                            "Lvl 3 Cooldown: 0.5",
                            "Lvl 0 Damage: 2",
                            "Lvl 1 Damage: 3",
                            "Lvl 2 Damage: 8",
                            "Lvl 3 Damage: 18",
                            "Lvl 4 Damage: 30",
                            "Lvl 2 Whirlwind Slash Damage: 8",
                            "Lvl 2 Whirlwind Slash Range: 6",
                            "Lvl 3 Whirlwind Slash Damage: 18",
                            "Lvl 4 Whirlwind Slash Damage: 30",
                            "Lvl 4 Whirlwind Range: 7",
                            "Lvl 4 Fan Of Knives Damage: 25",
                            "Lvl 4 Fan Of Knives Range: 10",
                            "Lvl 4 Fan Of Knives Pierce: 3",
                            "Lvl 4 Fan Of Knives Damage Threshold: 150",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Assassin (PVP)",
                        Points = {
                            "Lvl 0 Cost: 300",
                            "Lvl 1 Cost: 150",
                            "Lvl 2 Cost: 600",
                            "Lvl 3 Cost: 1700",
                            "Lvl 4 Cost: 4750",
                            "Lvl 0 Range: 5.5",
                            "Lvl 1 Range: 6.5",
                            "Lvl 4 Range: 7",
                            "Lvl 3 Cooldown: 0.5",
                            "Lvl 0 Damage: 2",
                            "Lvl 1 Damage: 3",
                            "Lvl 2 Damage: 8",
                            "Lvl 3 Damage: 14",
                            "Lvl 4 Damage: 25",
                            "Lvl 2 Whirlwind Slash Damage: 6",
                            "Lvl 2 Whirlwind Slash Range: 6",
                            "Lvl 3 Whirlwind Slash Damage: 14",
                            "Lvl 4 Whirlwind Slash Damage: 25",
                            "Lvl 4 Whirlwind Range: 7",
                            "Lvl 4 Fan Of Knives Damage: 25",
                            "Lvl 4 Fan Of Knives Range: 10",
                            "Lvl 4 Fan Of Knives Pierce: 3",
                            "Lvl 4 Fan Of Knives Damage Threshold: 150",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Archer",
                        Points = {
                            "Limit: 15",
                            "Lvl 0 Cost: 400 → <font color=\"rgb(100,255,100)\">600</font>",
                            "Lvl 1 Cost: 50 → <font color=\"rgb(100,255,100)\">100</font>",
                            "Lvl 3 Cost: 800 → <font color=\"rgb(100,255,100)\">1000</font>",
                            "Lvl 5 Cost: 7000 → <font color=\"rgb(100,255,100)\">7375</font>",
                            "Lvl 0 Range: 18 → <font color=\"rgb(255,100,100)\">16</font>",
                            "Lvl 4 Burn Damage: 2 → <font color=\"rgb(100,255,100)\">4</font>",
                            "Lvl 5 Burn Damage: 4 → <font color=\"rgb(100,255,100)\">8</font>",
                            "Lvl 5 Burn Max Hits: 6 → <font color=\"rgb(255,100,100)\">5</font>",
                            "Lvl 4 Stun Time: 0.25 → <font color=\"rgb(100,255,100)\">0.3</font>",
                            "Lvl 5 Stun Time: 0.3 → <font color=\"rgb(100,255,100)\">0.45</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Warden (PVP)",
                        Points = {
                            "Lvl 0 Cost: 800 → <font color=\"rgb(100,255,100)\">1000</font>",
                            "Lvl 0 Cooldown: 0.6 → <font color=\"rgb(100,255,100)\">0.65</font>",
                            "Lvl 1 Cooldown: 0.6 → <font color=\"rgb(100,255,100)\">0.65</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Scout (PVP)",
                        Points = {
                            "Lvl 3 Cost: 1600 → <font color=\"rgb(100,255,100)\">1800</font>",
                            "Lvl 3 Range: 18 → <font color=\"rgb(255,100,100)\">17</font>",
                            "Lvl 4 Range: 18 → <font color=\"rgb(255,100,100)\">17</font>",
                            "Lvl 4 Damage: 16 → <font color=\"rgb(255,100,100)\">14</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Mercenary Base (PVP)",
                        Points = {
                            "Lvl 1 Cost: 1000 → <font color=\"rgb(100,255,100)\">1800</font>",
                            "Lvl 0 Grenadier Damage: 35 → <font color=\"rgb(255,100,100)\">28</font>",
                            "Lvl 1 Grenadier Damage: 65 → <font color=\"rgb(255,100,100)\">50</font>",
                            "Lvl 2 Grenadier Damage: 100 → <font color=\"rgb(255,100,100)\">80</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Ranger (PVP)",
                        Points = {
                            "Lvl 0 Cost: 3000 → <font color=\"rgb(255,100,100)\">2000</font>",
                            "Lvl 2 Cost: 3250 → <font color=\"rgb(255,100,100)\">2400</font>",
                            "Lvl 3 Cost: 10000 → <font color=\"rgb(255,100,100)\">8500</font>",
                            "Lvl 4 Cost: 20000 → <font color=\"rgb(255,100,100)\">17000</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Brawler (PVP)",
                        Points = {
                            "Lvl 4 Cost: 6000 → <font color=\"rgb(255,100,100)\">5200</font>",
                            "Lvl 0 Cooldown: 1 → <font color=\"rgb(255,100,100)\">0.9</font>",
                            "Lvl 1 Cooldown: 0.75 → <font color=\"rgb(255,100,100)\">0.6</font>",
                            "Lvl 4 Reposition Damage: 50 → <font color=\"rgb(100,255,100)\">80</font>",
                            "Lvl 5 Reposition Damage: 100 → <font color=\"rgb(100,255,100)\">150</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Necromancer (PVP)",
                        Points = {
                            "Lvl 0 Cost: 1100 → <font color=\"rgb(100,255,100)\">1500</font>",
                            "Lvl 1 Cost: 750 → <font color=\"rgb(100,255,100)\">1000</font>",
                            "Lvl 2 Cost: 1750 → <font color=\"rgb(100,255,100)\">3500</font>",
                            "Lvl 3 Cost: 7500 → <font color=\"rgb(100,255,100)\">10000</font>",
                            "Lvl 4 Cost: 30000 → <font color=\"rgb(100,255,100)\">40000</font>",
                            "Sword Skeleton Range: 8 → <font color=\"rgb(255,100,100)\">6</font>",
                            "Skeleton Knight Range: 8 → <font color=\"rgb(255,100,100)\">6</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Pursuit (PVP)",
                        Points = {
                            "Lvl 0 Cost: 3000 → <font color=\"rgb(255,100,100)\">2500</font>",
                            "Lvl 1 Cost: 1200 → <font color=\"rgb(255,100,100)\">750</font>",
                            "Lvl 2 Cost: 1850 → <font color=\"rgb(255,100,100)\">1500</font>",
                            "Lvl 3 Cost: 5000 → <font color=\"rgb(255,100,100)\">3500</font>",
                            "Lvl 4A Cost: 16000 → <font color=\"rgb(255,100,100)\">12500</font>",
                            "Lvl 5A Cost: 42500 → <font color=\"rgb(255,100,100)\">30000</font>",
                            "Lvl 4B Cost: 10000 → <font color=\"rgb(255,100,100)\">7500</font>",
                            "Lvl 5B Cost: 28500 → <font color=\"rgb(255,100,100)\">22500</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Mortar (PVP)",
                        Points = {
                            "Lvl 1 Cost: 400 → <font color=\"rgb(255,100,100)\">300</font>",
                            "Lvl 3 Cost: 3000 → <font color=\"rgb(255,100,100)\">2500</font>",
                            "Lvl 4 Cost: 10000 → <font color=\"rgb(100,255,100)\">12500</font>",
                            "Lvl 5 Cost: 20000 → <font color=\"rgb(100,255,100)\">22500</font>",
                            "Lvl 0 Cooldown: 3.75 → <font color=\"rgb(100,255,100)\">4</font>",
                            "Lvl 3 Cooldown: 3 → <font color=\"rgb(100,255,100)\">3.25</font>",
                            "Lvl 4 Cooldown: 3 → <font color=\"rgb(100,255,100)\">3.25</font>",
                            "Lvl 5 Cooldown: 3 → <font color=\"rgb(100,255,100)\">3.25</font>",
                            "Lvl 2 Damage: 28 → <font color=\"rgb(255,100,100)\">25</font>",
                            "Lvl 3 Damage: 60 → <font color=\"rgb(255,100,100)\">50</font>",
                            "Lvl 0 Explosion Range: 6 → <font color=\"rgb(255,100,100)\">5.5</font>",
                            "Lvl 1 Explosion Range: 6 → <font color=\"rgb(255,100,100)\">5.5</font>",
                            "Lvl 2 Explosion Range: 7.5 → <font color=\"rgb(255,100,100)\">7</font>",
                            "Lvl 3 Explosion Range: 8.5 → <font color=\"rgb(255,100,100)\">8</font>",
                            "Lvl 4 Explosion Range: 8.5 → <font color=\"rgb(255,100,100)\">8</font>",
                            "Lvl 5 Explosion Range: 9 → <font color=\"rgb(255,100,100)\">8.5</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Accelerator (PVP)",
                        Points = {
                            "Lvl 0 Cost: 3000 → <font color=\"rgb(100,255,100)\">4250</font>",
                            "Lvl 2 Cost: 2125 → <font color=\"rgb(255,100,100)\">2000</font>",
                            "Lvl 3 Cost: 3250 → <font color=\"rgb(100,255,100)\">4500</font>",
                            "Lvl 4 Cost: 8250 → <font color=\"rgb(100,255,100)\">12000</font>",
                            "Lvl 5 Cost: 30000 → <font color=\"rgb(255,100,100)\">28500</font>",
                            "Lvl 2 Range: 20 → <font color=\"rgb(255,100,100)\">18</font>",
                            "Lvl 4 Range: 22.5 → <font color=\"rgb(255,100,100)\">20</font>",
                            "Lvl 5 Range: 25 → <font color=\"rgb(255,100,100)\">23</font>",
                            "Lvl 3 Cooldown: 0.2 → <font color=\"rgb(255,100,100)\">0.15</font>",
                            "Lvl 4 Cooldown: 0.15 → <font color=\"rgb(255,100,100)\">0.1</font>",
                            "Lvl 0 Damage: 10 → <font color=\"rgb(100,255,100)\">12</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Cowboy (PVP)",
                        Points = {
                            "Lvl 4 Cost: 3825 → <font color=\"rgb(255,100,100)\">3500</font>",
                            "Lvl 5 Cost: 7500 → <font color=\"rgb(255,100,100)\">7000</font>",
                            "Lvl 0 Cooldown: 1.25 → <font color=\"rgb(255,100,100)\">1</font>",
                            "Lvl 1 Cooldown: 1 → <font color=\"rgb(255,100,100)\">0.8</font>",
                            "Lvl 2 Cooldown: 1 → <font color=\"rgb(255,100,100)\">0.8</font>",
                            "Lvl 3 Cooldown: 0.6 → <font color=\"rgb(255,100,100)\">0.5</font>",
                            "Lvl 4 Cooldown: 0.3 → <font color=\"rgb(255,100,100)\">0.25</font>",
                            "Lvl 5 Cooldown: 0.3 → <font color=\"rgb(255,100,100)\">0.25</font>",
                            "Lvl 0 Income: 45 → <font color=\"rgb(100,255,100)\">50</font>",
                            "Lvl 1 Income: 45 → <font color=\"rgb(100,255,100)\">50</font>",
                            "Lvl 2 Income: 55 → <font color=\"rgb(100,255,100)\">60</font>",
                            "Lvl 3 Income: 65 → <font color=\"rgb(100,255,100)\">75</font>",
                            "Lvl 4 Income: 125 → <font color=\"rgb(100,255,100)\">175</font>",
                            "Lvl 5 Income: 225 → <font color=\"rgb(100,255,100)\">300</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Sniper (PVP)",
                        Points = {
                            "Lvl 2 Cost: 1500 → <font color=\"rgb(255,100,100)\">800</font>",
                            "Lvl 3 Cost: 2750 → <font color=\"rgb(100,255,100)\">3250</font>",
                            "Lvl 4 Cost: 5500 → <font color=\"rgb(255,100,100)\">5000</font>",
                            "Lvl 0 Range: 25 → <font color=\"rgb(255,100,100)\">20</font>",
                            "Lvl 1 Range: 25 → <font color=\"rgb(255,100,100)\">20</font>",
                            "Lvl 2 Range: 30 → <font color=\"rgb(255,100,100)\">22.5</font>",
                            "Lvl 3 Range: 30 → <font color=\"rgb(255,100,100)\">25</font>",
                            "Lvl 4 Range: 35 → <font color=\"rgb(255,100,100)\">30</font>",
                            "Lvl 0 Cooldown: 2.5 → <font color=\"rgb(255,100,100)\">1.65</font>",
                            "Lvl 1 Cooldown: 1.5 → <font color=\"rgb(255,100,100)\">1.3</font>",
                            "Lvl 2 Cooldown: 1.5 → <font color=\"rgb(255,100,100)\">1.3</font>",
                            "Lvl 3 Cooldown: 0.75 → <font color=\"rgb(255,100,100)\">0.5</font>",
                            "Lvl 4 Cooldown: 0.75 → <font color=\"rgb(255,100,100)\">0.5</font>",
                            "Lvl 0 Damage: 8 → <font color=\"rgb(255,100,100)\">6</font>",
                            "Lvl 2 Damage: 20 → <font color=\"rgb(255,100,100)\">15</font>",
                            "Lvl 3 Damage: 20 → <font color=\"rgb(255,100,100)\">15</font>",
                            "Lvl 5 Damage: 40 → <font color=\"rgb(255,100,100)\">30</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Hunter (PVP)",
                        Points = {
                            "Lvl 0 Cost: 1750 → <font color=\"rgb(255,100,100)\">1600</font>",
                            "Lvl 1 Cost: 650 → <font color=\"rgb(100,255,100)\">750</font>",
                            "Lvl 2 Cost: 2000 → <font color=\"rgb(255,100,100)\">1800</font>",
                            "Lvl 3 Cost: 8000 → <font color=\"rgb(255,100,100)\">6250</font>",
                            "Lvl 4 Cost: 16500 → <font color=\"rgb(255,100,100)\">12000</font>",
                            "Lvl 0 Range: 20 → <font color=\"rgb(255,100,100)\">18</font>",
                            "Lvl 1 Range: 22.5 → <font color=\"rgb(255,100,100)\">21</font>",
                            "Lvl 2 Range: 25 → <font color=\"rgb(255,100,100)\">21</font>",
                            "Lvl 3 Range: 25 → <font color=\"rgb(255,100,100)\">21</font>",
                            "Lvl 4 Range: 30 → <font color=\"rgb(255,100,100)\">24</font>",
                            "Lvl 0 Cooldown: 2 → <font color=\"rgb(255,100,100)\">1.7</font>",
                            "Lvl 1 Cooldown: 1.5 → <font color=\"rgb(255,100,100)\">1.2</font>",
                            "Lvl 2 Cooldown: 1.5 → <font color=\"rgb(255,100,100)\">1.2</font>",
                            "Lvl 3 Cooldown: 1.5 → <font color=\"rgb(255,100,100)\">1.2</font>",
                            "Lvl 4 Cooldown: 1.5 → <font color=\"rgb(255,100,100)\">1.2</font>",
                            "Lvl 3 Damage: 100 → <font color=\"rgb(255,100,100)\">85</font>",
                            "Lvl 4 Damage: 225 → <font color=\"rgb(255,100,100)\">165</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Militant (PVP)",
                        Points = {
                            "Lvl 0 Cost: 1600 → <font color=\"rgb(255,100,100)\">1400</font>",
                            "Lvl 1 Cost: 700 → <font color=\"rgb(255,100,100)\">600</font>",
                            "Lvl 2 Cost: 1000 → <font color=\"rgb(100,255,100)\">2600</font>",
                            "Lvl 3 Cost: 3500 → <font color=\"rgb(100,255,100)\">5000</font>",
                            "Lvl 0 Range: 16 → <font color=\"rgb(255,100,100)\">15</font>",
                            "Lvl 1 Range: 18 → <font color=\"rgb(255,100,100)\">17</font>",
                            "Lvl 2 Range: 18 → <font color=\"rgb(255,100,100)\">17</font>",
                            "Lvl 2 Cooldown: 0.15 → <font color=\"rgb(255,100,100)\">0.1</font>",
                            "Lvl 3 Damage: 4 → <font color=\"rgb(100,255,100)\">6</font>",
                            "Lvl 4 Damage: 10 → <font color=\"rgb(100,255,100)\">12</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Crook Boss (PVP)",
                        Points = {
                            "Lvl 0 Cost: 700 → <font color=\"rgb(100,255,100)\">800</font>",
                            "Lvl 2 Cost: 1100 → <font color=\"rgb(255,100,100)\">1000</font>",
                            "Lvl 4 Cost: 15250 → <font color=\"rgb(100,255,100)\">16000</font>",
                            "Lvl 0 Cooldown: 0.9 → <font color=\"rgb(100,255,100)\">1</font>",
                            "Pistol Crook Range: 20 → <font color=\"rgb(255,100,100)\">18</font>",
                            "Pistol Crook Cooldown: 0.9 → <font color=\"rgb(255,100,100)\">0.8</font>",
                            "Pistol Crook Damage: 3 → <font color=\"rgb(255,100,100)\">2</font>",
                            "Tommy Crook Range: 17.5 → <font color=\"rgb(100,255,100)\">20</font>",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumables",
                        Points = {
                            "Protein Shake Cost: 250 → <font color=\"rgb(100,255,100)\">1000</font>",
                            "Energy Drink Cost: 550 → <font color=\"rgb(100,255,100)\">1400</font>",
                            "Energy Drink Cooldown: 60 → <font color=\"rgb(255,100,100)\">50</font>",
                        },
                    },
                },
            },
        },
    },
}