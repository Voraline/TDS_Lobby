-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.36.0
-- Decompile time: 1.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎃 Halloween Countdown 🎃",
    ImageId = 107789968183999,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Countdown to Halloween 🎃",
                        Points = {
                            "Only 1 week left until Halloween!",
                            "Releases on October 23rd @ 3PM ET",
                            "New lobby coming out with the event",
                            "New battle pass with exclusive skins",
                            "Are you ready for the spookiest event of the year?",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Bug Fixes 🛠️",
                        Points = {
                            "Restocked gingerbread cookies (Lazy Couch)",
                            "Fixed Trapper cooldown bug",
                            "Adjusted Trapper's throw to scale with cooldown buffs",
                            "Patched Mercenary Airdrop when time-scale is set to 0",
                            "Fixed Frost Blaster animations",
                            "Fixed Toxic Gunner animations",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Next Week 🔥",
                        Points = {
                            "Halloween is coming next week 🎃",
                            "New lobby",
                            "New HUD in lobby",
                            function(a1, a2) -- Line: 47 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 124344140117784,
                                    Text = "New lobby 🔥",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 55 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128571966721237,
                                    Text = "👀",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "...keep an eye on our socials for more info! 📢",
                        },
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
                        SubjectName = "Ranger",
                        Points = {
                            "Lvl 4 Damage (1125 → <font color=\"rgb(255,100,100)\">1050</font>)",
                            "Lvl 4 Cost (27500 → <font color=\"rgb(100,255,100)\">30000</font>)",
                            "Lvl 4 Splash Damage (200 → <font color=\"rgb(255,100,100)\">150</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Accelerator",
                        Points = {
                            "Lvl 0 Cost (4250 → <font color=\"rgb(100,255,100)\">5000</font>)",
                            "Lvl 1 Cost (800 → <font color=\"rgb(100,255,100)\">1200</font>)",
                            "Lvl 2 Cost (1350 → <font color=\"rgb(100,255,100)\">2250</font>)",
                            "Lvl 4 Cost (10500 → <font color=\"rgb(255,100,100)\">9500</font>)",
                            "Lvl 5 Cost (34000 → <font color=\"rgb(255,100,100)\">30000</font>)",
                            "Lvl 0 Damage (10 → <font color=\"rgb(100,255,100)\">12</font>)",
                            "Lvl 1 Damage (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Lvl 2 Damage (15 → <font color=\"rgb(100,255,100)\">20</font>)",
                            "Lvl 3 Damage (20 → <font color=\"rgb(100,255,100)\">30</font>)",
                            "Lvl 5 Damage (45 → <font color=\"rgb(255,100,100)\">40</font>)",
                            "Lvl 0 Max Ammo (180 → <font color=\"rgb(100,255,100)\">240</font>)",
                            "Lvl 1 Max Ammo (180 → <font color=\"rgb(100,255,100)\">240</font>)",
                            "Lvl 2 Max Ammo (300 → <font color=\"rgb(100,255,100)\">420</font>)",
                            "Lvl 4 Max Ammo (1200 → <font color=\"rgb(255,100,100)\">1050</font>)",
                            "Lvl 5 Max Ammo (3600 → <font color=\"rgb(100,255,100)\">4800</font>)",
                            "Lvl 0 Charge Time (3 → <font color=\"rgb(255,100,100)\">2.5</font>)",
                            "Lvl 1 Charge Time (3 → <font color=\"rgb(255,100,100)\">2.5</font>)",
                            "Lvl 2 Charge Time (3 → <font color=\"rgb(255,100,100)\">2.5</font>)",
                            "Lvl 3 Charge Time (3 → <font color=\"rgb(255,100,100)\">2.5</font>)",
                            "Lvl 4 Charge Time (3 → <font color=\"rgb(255,100,100)\">1.5</font>)",
                            "Lvl 5 Charge Time (2 → <font color=\"rgb(255,100,100)\">1.5</font>)",
                            "Lvl 2 Range (17.5 → <font color=\"rgb(100,255,100)\">19</font>)",
                            "Lvl 4 Range (17.5 → <font color=\"rgb(100,255,100)\">20.5</font>)",
                            "Lvl 5 Range (20 → <font color=\"rgb(100,255,100)\">22</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Ace Pilot",
                        Points = {
                            "Lvl 1 Cost (225 → <font color=\"rgb(100,255,100)\">300</font>)",
                            "Lvl 3 Cost (2200 → <font color=\"rgb(255,100,100)\">1500</font>)",
                            "Lvl 4 Cost (4000 → <font color=\"rgb(255,100,100)\">3500</font>)",
                            "Lvl 5 Cost (10000 → <font color=\"rgb(255,100,100)\">7500</font>)",
                            "Lvl 0 Range (7.5 → <font color=\"rgb(255,100,100)\">7</font>)",
                            "Lvl 1 Range (7.5 → <font color=\"rgb(255,100,100)\">7</font>)",
                            "Lvl 2 Range (7.5 → <font color=\"rgb(255,100,100)\">7</font>)",
                            "Lvl 4 Range (9 → <font color=\"rgb(255,100,100)\">8</font> )",
                            "Lvl 5 Range (10 → <font color=\"rgb(255,100,100)\">9</font>)",
                            "Lvl 3 Damage (4 → <font color=\"rgb(255,100,100)\">3</font>)",
                            "Lvl 4 Damage (7 → <font color=\"rgb(255,100,100)\">6</font>)",
                            "Lvl 5 Damage (12 → <font color=\"rgb(255,100,100)\">10</font>)",
                            "Lvl 3 Cooldown (0.12 → <font color=\"rgb(100,255,100)\">0.125</font>)",
                            "Lvl 4 Cooldown (0.12 → <font color=\"rgb(100,255,100)\">0.125</font>)",
                            "Lvl 5 Cooldown (0.09 → <font color=\"rgb(100,255,100)\">0.1</font>)",
                            "Lvl 0 Bomb Radius (4 → <font color=\"rgb(255,100,100)\">2</font>)",
                            "Lvl 3 Bomb Radius (4.5 → <font color=\"rgb(255,100,100)\">2.25</font>)",
                            "Lvl 4 Bomb Radius (4.5 → <font color=\"rgb(255,100,100)\">2.25</font>)",
                            "Lvl 5 Bomb Radius (4 → <font color=\"rgb(255,100,100)\">2</font>)",
                            "Lvl 5 Bomb Damage (25 → <font color=\"rgb(100,255,100)\">35</font>)",
                            "Lvl 5 Bomb Cooldown (0.8 → <font color=\"rgb(100,255,100)\">1.25</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Pyromancer",
                        Points = {
                            "Lvl 0 Cost (900 → <font color=\"rgb(255,100,100)\">850</font>)",
                            "Lvl 1 Cost (400 → <font color=\"rgb(255,100,100)\">350</font>)",
                            "Lvl 3 Cost (2200 → <font color=\"rgb(255,100,100)\">1500</font>)",
                            "Lvl 5 Cost (8000 → <font color=\"rgb(100,255,100)\">9000</font>)",
                            "Lvl 0 Max Hits (1 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Lvl 1 Max Hits (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Lvl 2 Max Hits (2 → <font color=\"rgb(100,255,100)\">5</font>)",
                            "Lvl 3 Max Hits (3 → <font color=\"rgb(100,255,100)\">5</font>)",
                            "Lvl 4 Max Hits (4 → <font color=\"rgb(100,255,100)\">5</font>)",
                            "Lvl 5 Max Hits (5 → <font color=\"rgb(100,255,100)\">8</font> )",
                            "Lvl 4 Damage (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Lvl 5 Damage (3 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 0 Fire Width (0.5 → <font color=\"rgb(100,255,100)\">1.25</font>)",
                            "Lvl 1 Burn Tick Time (0.8 → <font color=\"rgb(255,100,100)\">0.75</font>)",
                            "Lvl 2 Burn Tick Time (0.8 → <font color=\"rgb(255,100,100)\">0.75</font>)",
                            "Lvl 2 Burn Damage (1 → <font color=\"rgb(100,255,100)\">2</font>)",
                            "Lvl 3 Burn Damage (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Lvl 3 Burn Duration (4 → <font color=\"rgb(100,255,100)\">5</font>)",
                            "Lvl 4 Burn Duration (5 → <font color=\"rgb(100,255,100)\">7.5</font>)",
                            "Lvl 5 Burn Duration (8 → <font color=\"rgb(100,255,100)\">10</font>)",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Golden Pyromancer",
                        Points = {
                            "Lvl 3 Cost (1500 → <font color=\"rgb(100,255,100)\">1750</font>)",
                            "Lvl 4 Cost (6000 → <font color=\"rgb(255,100,100)\">5750</font>)",
                            "Lvl 5 Cost (10000 → <font color=\"rgb(255,100,100)\">9500</font>)",
                            "Lvl 0 Max Hits (1 → <font color=\"rgb(100,255,100)\">4</font>)",
                            "Lvl 1 Max Hits (2 → <font color=\"rgb(100,255,100)\">4</font>)",
                            "Lvl 2 Max Hits (2 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 3 Max Hits (3 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 4 Max Hits (4 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 5 Max Hits (5 → <font color=\"rgb(100,255,100)\">10</font>)",
                            "Lvl 4 Damage (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Lvl 5 Damage (3 → <font color=\"rgb(100,255,100)\">6</font>)",
                            "Lvl 0 Fire Width (0.5 → <font color=\"rgb(100,255,100)\">1.25</font>)",
                            "Lvl 3 Burn Tick Time (0.75 → <font color=\"rgb(255,100,100)\">0.5</font>)",
                            "Lvl 2 Burn Damage (1 → <font color=\"rgb(100,255,100)\">2</font>)",
                            "Lvl 3 Burn Damage (2 → <font color=\"rgb(100,255,100)\">3</font>)",
                            "Lvl 3 Burn Duration (4.5 → <font color=\"rgb(100,255,100)\">6</font>)",
                        },
                    },
                },
            },
        },
    },
}