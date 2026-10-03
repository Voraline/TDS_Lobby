-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.29.0
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎵 DJ Rework 🎵",
    ImageId = 138924286251630,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🎵 New DJ",
                        Points = {
                            "DJ Boosts are determined by what track the player has active",
                            function(a1, a2) -- Line: 18 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 140300061576601,
                                    Text = "Red Track",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 26 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128028657950615,
                                    Text = "Green Track",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 34 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 111757217983424,
                                    Text = "Purple Track",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Skins got a refresh",
                            function(a1, a2) -- Line: 43 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 98990886827012,
                                    Text = "Plushie",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 51 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 98867395733462,
                                    Text = "Neon Rave",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 59 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 94196836925494,
                                    Text = "Masquerade",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 67 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 73517020025075,
                                    Text = "Ghost",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 75 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 133211921839440,
                                    Text = "Neko",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 83 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 81989149695459,
                                    Text = "Default",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {
                        Item = {Type = "tower", Name = "DJ Booth"},
                        Changes = {
                            {
                                Title = "General Changes",
                                Lines = {
                                    "Boosts are determined by the active track.",
                                    "Unlocks a track-specific ability at Level 3.",
                                    "Purple Track: Knockback and apply slowness to enemies in range.",
                                    "Purple Track scales with towers in range. Min: 20% / Max 40% Slowness.",
                                    "Green Track: Gain a cash payout based on the number of towers in range.",
                                    "Red Track: Apply defense melt and deal damage to enemies in range.",
                                    "Red Track scales with towers in range. Min: 5% / Max 25% Defense Melt.",
                                },
                            },
                            {
                                Title = "Level 0 Changes",
                                Lines = {
                                    "<b>Cost:</b> 600 → <font color=\"rgb(100,255,100)\">1200</font>",
                                    "<b>Range:</b> 15 → <font color=\"rgb(255,100,100)\">12</font>",
                                    "<b>Range Boost:</b> 10 → <font color=\"rgb(100,255,100)\">12.5</font>",
                                    "<b>Discount Boost:</b> 0 → <font color=\"rgb(100,255,100)\">5</font>",
                                },
                            },
                            {
                                Title = "Level 1 Changes",
                                Lines = {"<b>Range:</b> 17 → <font color=\"rgb(255,100,100)\">15</font>"},
                            },
                            {
                                Title = "Level 2 Changes",
                                Lines = {
                                    "<b>Cost:</b> 850 → <font color=\"rgb(100,255,100)\">1250</font>",
                                    "<b>Discount Boost:</b> 0 → <font color=\"rgb(100,255,100)\">7.5</font>",
                                    "<b>Damage Boost:</b> 0 → <font color=\"rgb(100,255,100)\">10</font>",
                                },
                            },
                            {
                                Title = "Level 3 Changes",
                                Lines = {
                                    "<b>Cost:</b> 2500 → <font color=\"rgb(100,255,100)\">3000</font>",
                                    "<b>Range:</b> 18 → <font color=\"rgb(255,100,100)\">15</font>",
                                    "<b>Range Boost:</b> 15 → <font color=\"rgb(100,255,100)\">17.5</font>",
                                    "<b>Damage Boost:</b> 0 → <font color=\"rgb(100,255,100)\">12.5</font>",
                                    "<b>Green Track Max Cash Payout:</b> 600",
                                },
                            },
                            {
                                Title = "Level 4 Changes",
                                Lines = {
                                    "<b>Cost:</b> 4000 → <font color=\"rgb(100,255,100)\">8000</font>",
                                    "<b>Range:</b> 18 → <font color=\"rgb(255,100,100)\">16.5</font>",
                                    "<b>Damage:</b> 0 → <font color=\"rgb(100,255,100)\">25</font>",
                                    "<b>Range Boost:</b> 25 → <font color=\"rgb(255,100,100)\">22.5</font>",
                                    "<b>Discount Boost:</b> 10 → <font color=\"rgb(100,255,100)\">12.5</font>",
                                    "<b>Damage Boost:</b> 0 → <font color=\"rgb(100,255,100)\">15</font>",
                                    "<b>Green Track Max Cash Payout:</b> 1250",
                                },
                            },
                            {
                                Title = "Level 5 Changes",
                                Lines = {
                                    "<b>Cost:</b> 9000 → <font color=\"rgb(100,255,100)\">20000</font>",
                                    "<b>Range:</b> 20 → <font color=\"rgb(255,100,100)\">18.5</font>",
                                    "<b>Damage:</b> 0 → <font color=\"rgb(100,255,100)\">50</font>",
                                    "<b>Range Boost:</b> 35 → <font color=\"rgb(255,100,100)\">25</font>",
                                    "<b>Discount Boost:</b> 20 → <font color=\"rgb(255,100,100)\">15</font>",
                                    "<b>Damage Boost:</b> 0 → <font color=\"rgb(100,255,100)\">20</font>",
                                    "<b>Green Track Max Cash Payout:</b> 2250",
                                },
                            },
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Matchmaking UI",
                        Points = {
                            "You can matchmake by difficulty now",
                            "Activate it by pressing `Play Survival`",
                            function(a1, a2) -- Line: 181 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 123266652505045,
                                    Text = "Shows live player count per gamemode",
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
                        Minimize = 0.65,
                        SubjectName = "🔧 Game Improvements",
                        Points = {
                            "Fixed all tower's passive to ignore height",
                            "Fixed timescale to reset back to one when it detects there are over 1 player",
                            "Optimized ui rendering for lobby and shop",
                            "Optimized rendering for playerlist",
                            "Optimized culling for tower pets and nametags",
                            "Disabled statue collisions",
                            "Optimized tower-pets",
                            "2D rich-text doesn't update anymore",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Next Week 🔥",
                        Points = {
                            function(a1, a2) -- Line: 214 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 91017686313133,
                                    Text = "Mako DJ Skin 🎵",
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
    },
}