-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.57.0
-- Decompile time: 1.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "The Hunt: Mega Edition",
    ImageId = 80684444601566,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "The Deathwalker Returns...",
                        HeaderSubject = "The Hunt returns to T.D.S along with the Korblox empire. Group up with your friends to stand against this ancient undead empire!",
                        Points = {
                            "<b>The Hunt: Mega Edition</b> will go live on <u>March 13 @ 7:00PM ET</u>",
                            "<b>Director's Cut</b> (aka hard mode) will be live on <u>Friday, March 14th</u>",
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "Coming To The Event", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "tower", Name = "Soldier", Skin = "Korblox", Details = "Korblox"},
                            {
                                Type = "tower",
                                Name = "Electroshocker",
                                Skin = "Korblox",
                                Details = "Korblox",
                            },
                            {Type = "tower", Name = "Warden", Skin = "Korblox", Details = "Korblox"},
                            {Type = "nametag", Name = "KorbloxHunter"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Spring Lobby 🌳",
                        Points = {
                            "New spring lobby theme",
                            "Like goal has been added to the lobby",
                            function(a1, a2) -- Line: 67 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 111468503494867,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 74 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 85944174728286,
                                    Text = "At 1.7M likes we will be giving away the long awaited Lemonade Stand farm skin!",
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
                        HeaderName = "Game Improvements 🛠️",
                        Points = {
                            "Added a new settings category called \"Gameplay\"",
                            "Added a new setting called \"Low Quality Rings\"",
                            "Fixed tower stats stacking",
                            "Statues now utilize the matchmaking UI",
                            "Disabled the lobby tutorial",
                            "Updated game tutorial to give out demoman on win, alongside the cash",
                            "We're running an experiment for matchmaking, some players may not see the survival difficulty menu and will be forced to vote for difficulty in a match rather than using the matchmaking menu for difficulty, this is to compare match pair times",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            function(a1, a2) -- Line: 105 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 120455413169383,
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
                        SubjectName = "Medic",
                        Points = {
                            "Lvl 0 Cost 900 → <font color=\"rgb(255,100,100)\">450</font>",
                            "Lvl 1 Cost 400 → <font color=\"rgb(255,100,100)\">200</font>",
                            "Lvl 2 Cost 900 → <font color=\"rgb(255,100,100)\">400</font>",
                            "Lvl 3 Cost 2400 → <font color=\"rgb(255,100,100)\">800</font>",
                            "Lvl 4 Cost 4500 → <font color=\"rgb(255,100,100)\">1750</font>",
                            "Lvl 5 Cost 6500 → <font color=\"rgb(255,100,100)\">5000</font>",
                            "Lvl 0 Range 10 → <font color=\"rgb(100,255,100)\">12</font>",
                            "Lvl 1 Range 11 → <font color=\"rgb(100,255,100)\">13</font>",
                            "Lvl 2 Range 12 → <font color=\"rgb(100,255,100)\">13</font>",
                            "Lvl 3 Range 15 → <font color=\"rgb(100,255,100)\">16</font>",
                            "Lvl 0 Damage 2 → <font color=\"rgb(100,255,100)\">3</font>",
                            "Lvl 2 Damage 6 → <font color=\"rgb(255,100,100)\">5</font>",
                            "Lvl 3 Damage 6 → <font color=\"rgb(100,255,100)\">8</font>",
                            "Lvl 4 Damage 8 → <font color=\"rgb(100,255,100)\">12</font>",
                            "Lvl 1 Cooldown 1 → <font color=\"rgb(255,100,100)\">0.75</font>",
                            "Lvl 2 Cooldown 0.8 → <font color=\"rgb(255,100,100)\">0.75</font>",
                            "Lvl 3 Cooldown 0.8 → <font color=\"rgb(255,100,100)\">0.65</font>",
                            "Lvl 4 Cooldown 0.65 → <font color=\"rgb(255,100,100)\">0.5</font>",
                            "Cleaning Cooldown 30 → <font color=\"rgb(255,100,100)\">20</font>",
                            "Lvl 2 Healing 7 → <font color=\"rgb(100,255,100)\">10</font>",
                            "Lvl 3 Healing 7 → <font color=\"rgb(100,255,100)\">10</font>",
                            "Lvl 4 Healing 10 → <font color=\"rgb(100,255,100)\">25</font>",
                            "Lvl 5 Healing 10 → <font color=\"rgb(100,255,100)\">100</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Brawler",
                        Points = {
                            "Lvl 1 Cost 350 → <font color=\"rgb(255,100,100)\">300</font>",
                            "Lvl 3 Cost 2250 → <font color=\"rgb(255,100,100)\">2000</font>",
                            "Lvl 4 Cost 6000 → <font color=\"rgb(255,100,100)\">5000</font>",
                            "Lvl 5 Cost 17500 → <font color=\"rgb(255,100,100)\">12500</font>",
                            "Lvl 0 Damage 10 → <font color=\"rgb(255,100,100)\">6</font>",
                            "Lvl 1 Damage 10 → <font color=\"rgb(255,100,100)\">9</font>",
                            "Lvl 2 Damage 15 → <font color=\"rgb(255,100,100)\">12</font>",
                            "Lvl 3 Damage 30 → <font color=\"rgb(255,100,100)\">20</font>",
                            "Lvl 4 Damage 50 → <font color=\"rgb(255,100,100)\">40</font>",
                            "Lvl 5 Damage 100 → <font color=\"rgb(255,100,100)\">85</font>",
                            "Lvl 0 Cooldown 1 → <font color=\"rgb(255,100,100)\">0.6</font>",
                            "Lvl 1 Cooldown 0.75 → <font color=\"rgb(255,100,100)\">0.6</font>",
                            "Reposition Level Unlock 4 → <font color=\"rgb(255,100,100)\">3</font>",
                            "Lvl 2 Final Hit Damage 30 → <font color=\"rgb(255,100,100)\">24</font>",
                            "Lvl 3 Final Hit Damage 60 → <font color=\"rgb(255,100,100)\">40</font>",
                            "Lvl 4 Final Hit Damage 85 → <font color=\"rgb(255,100,100)\">80</font>",
                            "Lvl 5 Final Hit Damage 200 → <font color=\"rgb(255,100,100)\">170</font>",
                            "Lvl 3 Reposition Damage 0",
                            "Lvl 4 Reposition Damage 80 → <font color=\"rgb(100,255,100)\">100</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Minigunner",
                        Points = {
                            "Lvl 0 Cost 2000 → <font color=\"rgb(255,100,100)\">1850</font>",
                            "Lvl 1 Cost 950 → <font color=\"rgb(255,100,100)\">400</font>",
                            "Lvl 2 Cost 2250 → <font color=\"rgb(255,100,100)\">1500</font>",
                            "Lvl 4 Cost 15000 → <font color=\"rgb(100,255,100)\">17500</font>",
                            "Lvl 0 Range 13 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 1 Range 13 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 2 Range 14 → <font color=\"rgb(100,255,100)\">18</font>",
                            "Lvl 3 Range 14 → <font color=\"rgb(100,255,100)\">18</font>",
                            "Lvl 4 Range 15 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 0 Cooldown 0.14 → <font color=\"rgb(100,255,100)\">0.15</font>",
                            "Lvl 1 Cooldown 0.14 → <font color=\"rgb(255,100,100)\">0.12</font>",
                            "Lvl 2 Cooldown 0.14 → <font color=\"rgb(255,100,100)\">0.12</font>",
                            "Lvl 3 Cooldown 0.12 → <font color=\"rgb(255,100,100)\">0.1</font>",
                            "Lvl 1 Damage 3 → <font color=\"rgb(255,100,100)\">2</font>",
                            "Lvl 2 Damage 5 → <font color=\"rgb(255,100,100)\">3</font>",
                            "Lvl 3 Damage 10 → <font color=\"rgb(255,100,100)\">7</font>",
                            "Lvl 0 Rev Time 1.5 → <font color=\"rgb(255,100,100)\">1.4</font>",
                            "Lvl 1 Rev Time 1.25 → <font color=\"rgb(255,100,100)\">1.2</font>",
                            "Lvl 3 Rev Time 0.75 → <font color=\"rgb(100,255,100)\">1</font>",
                            "Lvl 4 Rev Time 0.75 → <font color=\"rgb(100,255,100)\">1</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Golden Minigunner",
                        Points = {
                            "Limit 15 → <font color=\"rgb(255,100,100)\">12</font>",
                            "Lvl 1 Cost 800 → <font color=\"rgb(100,255,100)\">900</font>",
                            "Lvl 2 Cost 2400 → <font color=\"rgb(255,100,100)\">2000</font>",
                            "Lvl 3 Cost 7750 → <font color=\"rgb(100,255,100)\">8500</font>",
                            "Lvl 4 Cost 24000 → <font color=\"rgb(100,255,100)\">30000</font>",
                            "Lvl 0 Range 13 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 1 Range 13 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 2 Range 14 → <font color=\"rgb(100,255,100)\">18</font>",
                            "Lvl 3 Range 16 → <font color=\"rgb(100,255,100)\">18</font>",
                            "Lvl 4 Range 18 → <font color=\"rgb(100,255,100)\">20</font>",
                            "Lvl 2 Damage 6 → <font color=\"rgb(255,100,100)\">5</font>",
                            "Lvl 4 Damage 24 → <font color=\"rgb(100,255,100)\">28</font>",
                            "Lvl 0 Rev Time 1.25 → <font color=\"rgb(100,255,100)\">1.4</font>",
                            "Lvl 1 Rev Time 0.75 → <font color=\"rgb(100,255,100)\">1.2</font>",
                            "Lvl 2 Rev Time 0.75 → <font color=\"rgb(100,255,100)\">1.2</font>",
                            "Lvl 3 Rev Time 0.75 → <font color=\"rgb(100,255,100)\">1</font>",
                            "Lvl 4 Rev Time 2.25 → <font color=\"rgb(255,100,100)\">1</font>",
                        },
                    },
                },
            },
        },
    },
}