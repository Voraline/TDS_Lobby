-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.44.0
-- Decompile time: 0.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VideoCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.VideoCaption)
return {
    UpdateName = "Small Update",
    ImageId = 133521365788414,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Holiday Update",
                        Points = {
                            "At Paradoxum Games, we prioritize delivering quality updates to our community. In order to uphold that value, we've made the decision to push back the Molten launch by a week. While the game mode itself is complete, our development team agrees that the mode needs more time for balancing. Since this update touches a core mode in the current game's progression, we also need a little more time to adjust Intermediate and Fallen mode to fill for Old Molten's place. We hope you understand ❤️",
                            function(a1, a2) -- Line: 18 -- upvalues: VideoCaption (val)
                                return VideoCaption({
                                    Video = 94400754301355,
                                    Text = "Here's a look at the new Molten Warlord (model WIP)!",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Operation I.C.E. coming <font color=\"#FFFF00\"><b>December 16th, 2024</b></font>! Are you ready?",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {
                            "Molten Rework",
                            "Admin Mode",
                            "Operation I.C.E. ❄️",
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
                        SubjectName = "Pursuit",
                        Points = {"Lvl 5(A) Cost: (35,000 → <font color=\"rgb(100,255,100)\">45,000</font>)"},
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Gatling Gun",
                        Points = {
                            "Lvl 2 Cost: 8250 → <font color=\"rgb(255,100,100)\">7250</font>",
                            "Lvl 6 Cost: 115000 → <font color=\"rgb(255,100,100)\">100000</font>",
                            "Lvl 3 Cooldown: 0.13 → <font color=\"rgb(255,100,100)\">0.12</font>",
                            "Lvl 3 Damage: 14 → <font color=\"rgb(100,255,100)\">15</font>",
                            "Lvl 4 Damage: 20 → <font color=\"rgb(100,255,100)\">25</font>",
                            "Lvl 5 Damage: 38 → <font color=\"rgb(100,255,100)\">45</font>",
                            "Lvl 6 Damage: 65 → <font color=\"rgb(100,255,100)\">75</font>",
                            "Lvl 0 Range Angle: 30 → <font color=\"rgb(100,255,100)\">40</font>",
                            "Lvl 1 Range Angle: 30 → <font color=\"rgb(100,255,100)\">40</font>",
                            "Lvl 2 Range Angle: 35 → <font color=\"rgb(100,255,100)\">45</font>",
                            "Lvl 3 Range Angle: 40 → <font color=\"rgb(100,255,100)\">55</font>",
                            "Lvl 4 Range Angle: 45 → <font color=\"rgb(100,255,100)\">55</font>",
                            "Lvl 5 Range Angle: 50 → <font color=\"rgb(100,255,100)\">65</font>",
                            "Lvl 6 Range Angle: 60 → <font color=\"rgb(100,255,100)\">70</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Trapper",
                        Points = {
                            "Lvl 0 Cost: 550 → <font color=\"rgb(255,100,100)\">500</font>",
                            "Lvl 0 Spike Cooldown: 5.5 → <font color=\"rgb(255,100,100)\">5.25</font>",
                            "Lvl 3 Spike Cooldown: 4 → <font color=\"rgb(100,255,100)\">7.5</font>",
                            "Lvl 4 Spike Cooldown: 2 → <font color=\"rgb(100,255,100)\">6</font>",
                            "Lvl 2 landmine Cooldown: 7 → <font color=\"rgb(255,100,100)\">5</font>",
                            "Lvl 3 landmine Cooldown: 6 → <font color=\"rgb(255,100,100)\">4</font>",
                            "Lvl 4 landmine Cooldown: 4.5 → <font color=\"rgb(255,100,100)\">2</font>",
                            "Lvl 4 Bear Trap Cooldown: 7.5 → <font color=\"rgb(255,100,100)\">3.5</font>",
                            "Lvl 2 Spike Health: 40 → <font color=\"rgb(100,255,100)\">60</font>",
                            "Lvl 3 Spike Health: 75 → <font color=\"rgb(100,255,100)\">250</font>",
                            "Lvl 4 Spike Health: 100 → <font color=\"rgb(100,255,100)\">450</font>",
                            "Lvl 3 Spike Damage: 75 → <font color=\"rgb(255,100,100)\">25</font>",
                            "Lvl 4 Spike Damage: 100 → <font color=\"rgb(255,100,100)\">40</font>",
                            "Lvl 2 landmine Explosion Radius: 3 → <font color=\"rgb(100,255,100)\">5</font>",
                            "Lvl 3 landmine Explosion Radius: 4 → <font color=\"rgb(100,255,100)\">5</font>",
                            "Lvl 4 landmine Explosion Radius: 6 → <font color=\"rgb(100,255,100)\">7</font>",
                            "Lvl 3 landmine Damage: 100 → <font color=\"rgb(255,100,100)\">80</font>",
                            "Lvl 4 landmine Damage: 175 → <font color=\"rgb(255,100,100)\">140</font>",
                            "Lvl 3 landmine Burn Damage: 0 → <font color=\"rgb(100,255,100)\">5</font>",
                            "Lvl 3 landmine Burn Tick Rate: 0 → <font color=\"rgb(100,255,100)\">0.25</font>",
                            "Lvl 3 landmine Burn Time: 0 → <font color=\"rgb(100,255,100)\">2</font>",
                            "Lvl 4 landmine Burn Tick Rate: 0.5 → <font color=\"rgb(255,100,100)\">0.25</font>",
                            "Lvl 4 landmine Burn Time: 8 → <font color=\"rgb(255,100,100)\">5</font>",
                            "Lvl 4 Beartrap Damage: 400 → <font color=\"rgb(255,100,100)\">300</font>",
                        },
                    },
                },
            },
        },
    },
}