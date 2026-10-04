-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.78.0
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "👻 NULL & VOID - NIGHT 2 🎃",
    ImageId = 83165824794200,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "👻 Null & Void Night 2 is LIVE! 👻",
                        HeaderSubject = "<font color=\"rgb(224,0,75)\">A dreadful night isn't it?..</font> Welcome to the Outer Nil Zone - where all the forgotten and discarded end up, including you! Revisit some forgotten faces and fight for your life against the Null Guardian! I wonder where we can be going next?..",
                        Points = {
                            "Defend against 25 waves or be erased from existence!",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 83165824794200,
                                    Text = "Night 2 Hard and Easy are live!",
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
                        HeaderName = "🔥 Night 3 - Preview 🔥",
                        Points = {
                            function(a1, a2) -- Line: 36 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 136695255194910,
                                    Text = "October 30, 2025 @ 5:00 PM (ET)",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "1298481815492493931"}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Harvester returns on sale!",
                        HeaderSubject = "The previous Halloween event tower will return as a gamepass until <b><font color=\"rgb(255,33,0)\">Nov. 5, 2025</font></b>.",
                        Points = {
                            "Slasher will be extended until <b><font color=\"rgb(255,33,0)\">Nov. 5, 2025</font></b>. ",
                        },
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Harvester", Skin = "Default", Details = "Harvester"}},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 953808062}},
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Slasher", Skin = "Default", Details = "Slasher"}},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 7386135}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔨 Major Optimizations",
                        HeaderSubject = "After a lot of hard work, our team has been able to make major break throughs with optimization!.. <b>It was a lot harder than we thought..</b> Thanks Roblox for giving a really hard time! 😭",
                        Points = {},
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
                        SubjectName = "Fixed Skins:",
                        Points = {
                            "Updated Null Crook Boss",
                            "Updated Ghost Engineer",
                            "Updated Null Soldier",
                            "Updated Cursed Minigunner",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Mercenary Base",
                        Points = {
                            "<b>Lv. 3</b> Cost: 6500 → <font color=\"rgb(100,255,100)\">7500</font>",
                            "<b>Lv. 5</b> Cost: 12650 → <font color=\"rgb(100,255,100)\">13500</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Rifleman",
                        Points = {
                            "<b>Lv. 3/4/5</b> Damage: 12 → <font color=\"rgb(255,100,100)\">11</font>",
                            "<b>Lv. 6</b> Damage: 30 → <font color=\"rgb(255,100,100)\">25</font>",
                            "<b>Lv. 6</b> Spawn Time: 35s → <font color=\"rgb(100,255,100)\">40s</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Grenadier",
                        Points = {
                            "<b>Lv. 3/4/5</b> HP: 125 → <font color=\"rgb(100,255,100)\">135</font>",
                            "<b>Lv. 6</b> HP: 300 → <font color=\"rgb(100,255,100)\">325</font>",
                            "<b>Lv. 3/4/5</b> Damage: 45 → <font color=\"rgb(255,100,100)\">40</font>",
                            "<b>Lv. 6</b> Damage: 80 → <font color=\"rgb(255,100,100)\">75</font>",
                            "<b>Lv. 6</b> Range: 22 → <font color=\"rgb(100,255,100)\">22.5</font>",
                            "<b>Lv. 3/4/5</b> Spawn Time: 37.5s → <font color=\"rgb(255,100,100)\">35s</font>",
                            "<b>Lv. 6</b> Spawn Time: 40s → <font color=\"rgb(255,100,100)\">35s</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Field Medic",
                        Points = {
                            "<b>Lv. 6</b> HP: 750 → <font color=\"rgb(255,100,100)\">700</font>",
                            "<b>Lv. 5</b> Max Targets: 6 → <font color=\"rgb(100,255,100)\">8</font>",
                            "<b>Lv. 6</b> Max Targets: 8 → <font color=\"rgb(100,255,100)\">10</font>",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        SubjectName = "Golden Scout",
                        Points = {"<b>Placement Limit</b>: None → <font color=\"rgb(100,255,100)\">16</font>"},
                    },
                },
            },
        },
    },
}