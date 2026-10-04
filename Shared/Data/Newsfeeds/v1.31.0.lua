-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.31.0
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "💥 Skin Drop 💥",
    ImageId = 83513859685698,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "More skins!",
                        Points = {
                            function(a1, a2) -- Line: 17 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 100891975576935,
                                    Text = "Star Spartan - Militant\nEarn by completing the <u><b>For the Commander!</b></u> mission",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 25 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 95658666931242,
                                    Text = "Megalodon - Cowboy",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 33 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 113838647340601,
                                    Text = "Loader - Brawler",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 41 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 94884664380986,
                                    Text = "Stealth Ops - Soldier",
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
                        SubjectName = "🔥 Coming Soon 🔥",
                        Points = {"New tower 💥", "...keep an eye on our socials for more info! 📢"},
                    },
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Golden Scout",
                        Points = {
                            "Lvl 0 Cost (200 → <font color=\"rgb(100,255,100)\">250</font>)",
                            "Lvl 1 Cost (125 → <font color=\"rgb(100,255,100)\">200</font>)",
                            "Lvl 2 Cost (500 → <font color=\"rgb(100,255,100)\">650</font>)",
                            "Lvl 4 Cost (4000 → <font color=\"rgb(100,255,100)\">4500</font>)",
                            "Lvl 0 Damage (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Lvl 1 Damage (3 → <font color=\"rgb(100,255,100)\">4</font>)",
                            "Lvl 2 Damage (4 → <font color=\"rgb(100,255,100)\">8</font>)",
                            "Lvl 3 Damage (10 → <font color=\"rgb(100,255,100)\">15</font>)",
                            "Lvl 4 Damage (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Lvl 1 Range (14 → <font color=\"rgb(255,100,100)\">12</font>)",
                            "Lvl 2 Range (16 → <font color=\"rgb(255,100,100)\">14</font>)",
                            "Lvl 3 Range (16 → <font color=\"rgb(100,255,100)\">16.5</font>)",
                            "Lvl 4 Range (18 → <font color=\"rgb(255,100,100)\">16.5</font>)",
                            "Lvl 1 Cooldown (1.2 → <font color=\"rgb(255,100,100)\">1</font>)",
                            "Lvl 3 Cooldown (0.75 → <font color=\"rgb(100,255,100)\">0.8</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Crook Boss",
                        Points = {
                            "Tower placement limit (6 → <font color=\"rgb(255,100,100)\">5</font>)",
                            "Lvl 1 Cost (250 → <font color=\"rgb(100,255,100)\">300</font>)",
                            "Lvl 2 Cost (750 → <font color=\"rgb(100,255,100)\">900</font>)",
                            "Lvl 3 Cost (2850 → <font color=\"rgb(100,255,100)\">4250</font>)",
                            "Lvl 4 Cost (11500 → <font color=\"rgb(100,255,100)\">20000</font>)",
                            "Lvl 0 Damage (4 → <font color=\"rgb(255,100,100)\">3</font>)",
                            "Lvl 2 Damage (4 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 3 Damage (3 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 4 Damage (6 → <font color=\"rgb(100,255,100)\">18</font>)",
                            "Lvl 0 Range (10 → <font color=\"rgb(100,255,100)\">12.5</font>)",
                            "Lvl 1 Range (12 → <font color=\"rgb(100,255,100)\">12.5</font>)",
                            "Lvl 3 Range (14 → <font color=\"rgb(100,255,100)\">15</font>)",
                            "Lvl 4 Range (16 → <font color=\"rgb(100,255,100)\">16.5</font>)",
                            "Lvl 0 Cooldown (1.25 → <font color=\"rgb(255,100,100)\">0.9</font>)",
                            "Lvl 1 Cooldown (1 → <font color=\"rgb(255,100,100)\">0.75</font>)",
                            "Lvl 2 Cooldown (0.8 → <font color=\"rgb(255,100,100)\">0.75</font>)",
                            "Lvl 3 Cooldown (0.15 → <font color=\"rgb(100,255,100)\">0.2</font>)",
                            "Lvl 4 Cooldown (0.1 → <font color=\"rgb(100,255,100)\">0.12</font>)",
                            "Lvl 0 Pistol Crook Spawn Time (35 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "Lvl 1, 2, 3, 4 Pistol Crook Spawn Time (25 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "Lvl 3 Tommy Crook Spawn Time (30 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "Lvl 4 Pistol Crook Spawn Time (20 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "Gains Flying Detection at Level 2",
                            "<u><b>Pistol Crook</b></u>",
                            "Health (10 → <font color=\"rgb(100,255,100)\">15</font>)",
                            "Range (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Cooldown (0.9 → <font color=\"rgb(100,255,100)\">1</font>)",
                            "Damage (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Gained Hidden and Flying Detection",
                            "Removed Aim Delay",
                            "<u><b>Tommy Crook Lvl 1</b></u>",
                            "Health (35 → <font color=\"rgb(100,255,100)\">100</font>)",
                            "Cooldown (0.25 → <font color=\"rgb(255,100,100)\">0.2</font>)",
                            "Damage (3 → <font color=\"rgb(100,255,100)\">4</font>)",
                            "<u><b>Tommy Crook Lvl 2</b></u>",
                            "Health (50 → <font color=\"rgb(100,255,100)\">175</font>)",
                            "Range (20 → <font color=\"rgb(255,100,100)\">18</font>)",
                            "Cooldown (0.18 → <font color=\"rgb(255,100,100)\">0.12</font>)",
                            "Damage (4 → <font color=\"rgb(100,255,100)\">10</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Golden Crook Boss",
                        Points = {
                            "Tower placement limit (6 → <font color=\"rgb(255,100,100)\">5</font>)",
                            "Lvl 1 Cost (350 → <font color=\"rgb(100,255,100)\">500</font>)",
                            "Lvl 2 Cost (1100 → <font color=\"rgb(100,255,100)\">1500</font>)",
                            "Lvl 3 Cost (4750 → <font color=\"rgb(100,255,100)\">6000</font>)",
                            "Lvl 4 Cost (17500 → <font color=\"rgb(100,255,100)\">30000</font>)",
                            "Lvl 0 Damage (8 → <font color=\"rgb(255,100,100)\">4</font>)",
                            "Lvl 1 Damage (8 → <font color=\"rgb(255,100,100)\">6</font>)",
                            "Lvl 3 Damage (5 → <font color=\"rgb(100,255,100)\">10</font>)",
                            "Lvl 4 Damage (11 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Lvl 0 Cooldown (1.65 → <font color=\"rgb(255,100,100)\">0.9</font>)",
                            "Lvl 1 Cooldown (1.35 → <font color=\"rgb(255,100,100)\">0.7</font>)",
                            "Lvl 2 Cooldown (1.1 → <font color=\"rgb(255,100,100)\">0.7</font>)",
                            "Lvl 3 Cooldown (0.12 → <font color=\"rgb(100,255,100)\">0.18</font>)",
                            "Lvl 0 Range (12.5 → <font color=\"rgb(100,255,100)\">14</font>)",
                            "Lvl 1 Range (12.5 → <font color=\"rgb(100,255,100)\">14</font>)",
                            "Lvl 2 Range (14 → <font color=\"rgb(100,255,100)\">15</font>)",
                            "Lvl 3 Range (15 → <font color=\"rgb(100,255,100)\">16</font>)",
                            "Lvl 0 Pistol Crook Spawn Time (35 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "Lvl 1, 2, 3, 4 Pistol Crook Spawn Time (25 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "Lvl 3 Tommy Crook Spawn Time (25 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "Lvl 4 Pistol Crook Spawn Time (20 → <font color=\"rgb(100,255,100)\">50</font>)",
                            "<u><b>Pistol Crook</b></u>",
                            "Health (15 → <font color=\"rgb(100,255,100)\">25</font>)",
                            "Range (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Cooldown (0.7 → <font color=\"rgb(255,100,100)\">0.6</font>)",
                            "Damage (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Gained Hidden and Flying Detection",
                            "Removed Aim Delay",
                            "<u><b>Tommy Crook Lvl 1</b></u>",
                            "Health (40 → <font color=\"rgb(100,255,100)\">125</font>)",
                            "Cooldown (0.22 → <font color=\"rgb(255,100,100)\">0.18</font>)",
                            "Damage (3 → <font color=\"rgb(100,255,100)\">5</font>)",
                            "Range (17 → <font color=\"rgb(100,255,100)\">17.5</font>)",
                            "<u><b>Tommy Crook Lvl 2</b></u>",
                            "Health (65 → <font color=\"rgb(100,255,100)\">225</font>)",
                            "Cooldown (0.15 → <font color=\"rgb(255,100,100)\">0.1</font>)",
                            "Damage (5 → <font color=\"rgb(100,255,100)\">12</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {SubjectName = "Consumable Rarity Changes", Points = {"Molotov → Common"}},
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Uses Changes",
                        Points = {"Supply Drop (4 → <font color=\"rgb(255,100,100)\">3</font>)"},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Pregame Cooldown Changes",
                        Points = {
                            "Barricade (20 → <font color=\"rgb(100,255,100)\">45</font>)",
                            "Supply Drop (60 → <font color=\"rgb(100,255,100)\">75</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Cooldown Changes",
                        Points = {"Supply Drop (75 → <font color=\"rgb(255,100,100)\">60</font>)"},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Duration Changes",
                        Points = {
                            "Damage Flag (60 → <font color=\"rgb(255,100,100)\">45</font>)",
                            "Cooldown Flag (60 → <font color=\"rgb(255,100,100)\">45</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Radius Changes",
                        Points = {
                            "Damage Flag (20 → <font color=\"rgb(255,100,100)\">16</font>)",
                            "Cooldown Flag (20 → <font color=\"rgb(255,100,100)\">16</font>)",
                            "Range Flag (20 → <font color=\"rgb(255,100,100)\">16</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Individual Consumable Changes",
                        Points = {
                            "Supply Drop Cash (1250 → <font color=\"rgb(255,100,100)\">1000</font>)",
                            "Damage Buff (40 → <font color=\"rgb(255,100,100)\">20</font>)",
                            "Grenade Damage (100 → <font color=\"rgb(100,255,100)\">125</font>)",
                            "Flashbang Radius (5 → <font color=\"rgb(100,255,100)\">6.5</font>)",
                            "Flashbang Stun Time (4 → <font color=\"rgb(100,255,100)\">5</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Intermediate Gamemode Changes",
                        Points = {
                            "Slight increase to time between health regen healing",
                            "Adjustments to wave ECO",
                            "Adjusted waves to spam less enemies",
                            "Armored Health (70 → <font color=\"rgb(100,255,100)\">80</font>)",
                            "Breaker2 Health (30 → <font color=\"rgb(100,255,100)\">40</font>)",
                            "Breaker Health (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Enraged Health (45 → <font color=\"rgb(100,255,100)\">65</font>)",
                            "Failed Experiment Health (2000 → <font color=\"rgb(100,255,100)\">2500</font>)",
                            "Failed Experiment Speed (3.5 → <font color=\"rgb(100,255,100)\">4</font>)",
                            "Ghoul Health (180 → <font color=\"rgb(255,100,100)\">175</font>)",
                            "Hidden Health (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Patient Zero Health (70000 → <font color=\"rgb(100,255,100)\">80000</font>)",
                            "Reaver removed Tank modifier",
                            "Reaver Health (70 → <font color=\"rgb(100,255,100)\">300</font>)",
                            "Reaver Defense (0 → <font color=\"rgb(100,255,100)\">100</font>)",
                            "Skeleton health (55 → <font color=\"rgb(255,100,100)\">30</font>)",
                            "Slow health (18 → <font color=\"rgb(100,255,100)\">20</font>)",
                        },
                    },
                },
            },
        },
    },
}