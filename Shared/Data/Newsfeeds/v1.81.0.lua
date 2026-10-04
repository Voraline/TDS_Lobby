-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.81.0
-- Decompile time: 2.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
local v1 = utf8.char(57346)
local v2 = utf8.char(8226)
return {
    UpdateName = "🏷️ CYBER WEEK 💲",
    ImageId = 86868785793551,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.5,
                        HeaderName = "🏷️ Black Friday Sale!",
                        HeaderSubject = "Celebrate Cyber Week with exclusive discounts on in-game items! Don't miss out on this limited-time opportunity to enhance your gaming experience with fantastic deals.",
                        Points = {
                            ("%* All Currencies: <font color='#00ff00'><b>15%% off</b></font>"):format(v2),
                            ("%* Sandbox Plus: <s>%* 7999</s> → <b>%* 3999</b> <font color='#00ff00'>(50%% off)</font>"):format(
                                v2,
                                v1,
                                v1
                            ),
                            ("%* Gatling Gun: <s>%* 2599</s> → <b>%* 1689</b> <font color='#00ff00'>(35%% off)</font>"):format(v2, v1, v1),
                            ("%* Mercenary Base: <s>%* 1800</s> → <b>%* 1080</b> <font color='#00ff00'>(40%% off)</font>"):format(
                                v2,
                                v1,
                                v1
                            ),
                            ("%* Warden: <s>%* 600</s> → <b>%* 420</b> <font color='#00ff00'>(30%% off)</font>"):format(v2, v1, v1),
                            ("%* Warlock: <s>%* 849</s> → <b>%* 679</b> <font color='#00ff00'>(20%% off)</font>"):format(v2, v1, v1),
                            ("%* Cowboy: <s>%* 340</s> → <b>%* 255</b> <font color='#00ff00'>(25%% off)</font>"):format(v2, v1, v1),
                            ("%* Resize Your Player: <s>%* 70</s> → <b>%* 56</b> <font color='#00ff00'>(20%% off)</font>"):format(
                                v2,
                                v1,
                                v1
                            ),
                            ("%* Engineer: <s>%* 2250</s> → <b>%* 1350</b> <font color='#00ff00'>(40%% off)</font>"):format(v2, v1, v1),
                            ("%* VIP: <s>%* 300</s> → <b>%* 225</b> <font color='#00ff00'>(25%% off)</font>"):format(v2, v1, v1),
                            ("%* Pursuit: <s>%* 1500</s> → <b>%* 1050</b> <font color='#00ff00'>(30%% off)</font>"):format(v2, v1, v1),
                            ("%* Mortar: <s>%* 395</s> → <b>%* 296</b> <font color='#00ff00'>(25%% off)</font>"):format(v2, v1, v1),
                            ("%* Custom Music (DJ Booth): <s>%* 110</s> → <b>%* 82</b> <font color='#00ff00'>(25%% off)</font>"):format(
                                v2,
                                v1,
                                v1
                            ),
                            ("%* Turret: <s>%* 450</s> → <b>%* 292</b> <font color='#00ff00'>(35%% off)</font>"):format(v2, v1, v1),
                            ("%* Crook Boss: <s>%* 300</s> → <b>%* 195</b> <font color='#00ff00'>(35%% off)</font>"):format(v2, v1, v1),
                            ("%* Hacker: <s>%* 2999</s> → <b>%* 1799</b> <font color='#00ff00'>(40%% off)</font>"):format(v2, v1, v1),
                            (("%* <b>Commando</b> & <b>Archer</b> are on-sale for a limited time only!\nEnds <b><font color='#ff6b6b'>Monday, 1st December at 11:59 PM UTC.</font></b>"):format(v2)),
                        },
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Archer", Skin = "Default", Details = "LIMITED TIME"}},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 8928263}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {
                                Type = "tower",
                                Name = "Commando",
                                Skin = "Default",
                                Details = "LIMITED TIME",
                            },
                        },
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 977109244}},
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Warlock", Skin = "Default", Details = "20% OFF"}},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 1558344290}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🛒 Merch Shop [NEW]",
                        HeaderSubject = "Check out our brand-new Merch Shop, where you can find exclusive in-game merchandise to customize your experience! From apparel to accessories, there's something for every fan.",
                        Points = {
                            ("%* 👕 New Apparel: Explore a variety of clothing items featuring game-themed designs"):format(v2),
                            (("%* 🎁 Limited-Time Offers: Grab exclusive items for a limited time only"):format(v2)),
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "⌛ Battlepass Extension",
                        HeaderSubject = "The current Battlepass has been extended! Earn currency from playing the game to unlock tiers and claim exclusive rewards before time runs out.",
                        Points = {
                            ("%* ⏰ Extension ends: <b><font color='#ff6b6b'>December 1st at 11:59 PM UTC</font></b>"):format(v2),
                            ("%* 🎖️ Battlepass Ranks: <font color='#ffff00'><b>20%% off</b></font> during extension"):format(v2),
                            (("%* 💎 Battlepass Premium & Gifting: <font color='#ffff00'><b>20%% off</b></font> during extension"):format(v2)),
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🗺️ New Maps",
                        HeaderSubject = "Explore new battlegrounds and challenge yourself on fresh terrain! Test your strategies on these newly added maps.",
                        Points = {
                            function(a1, a2) -- Line: 131 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Text = "❄️ Winter Abyss: Rework",
                                    Image = 109109572610228,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 139 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Text = "🌙 Midnight Issue",
                                    Image = 130877770537337,
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
                        HeaderName = "❄️ Frost Mode ❄️",
                        HeaderSubject = "Brace yourself for a new frozen challenge! Face off against relentless frozen enemies that can attack your towers directly.",
                        Points = {
                            ("%* 🥶 <b>New Gamemode:</b> Battle frozen enemies with tower-attacking abilities"):format(v2),
                            (("%* 📅 <b>Coming Next Week:</b> Stay tuned for the launch!"):format(v2)),
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "5019729824898089606"}},
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "⚒️ Improvements",
                        Points = {
                            "Fixed UI disappearing when rejoining the game",
                            "Added initial cooldowns to prevent immediately using abilities after\nplacing towers, for certain towers",
                            "Updated PVP leaderboards season end message to accurately reflect\nthe PVP season",
                            "Fixed invalid damage values causing NaN errors in contracts",
                            "Adjusted Null & Void tag size to scale down appropriately",
                        },
                    },
                },
                {
                    Type = "ItemChange",
                    Props = {SubjectName = "DJ Booth", Points = {"<b>Initial Cooldown:</b> 10"}},
                },
                {
                    Type = "ItemChange",
                    Props = {SubjectName = "Medic", Points = {"<b>Initial Cooldown:</b> 15"}},
                },
                {
                    Type = "ItemChange",
                    Props = {SubjectName = "Mercenary Base", Points = {"<b>Initial Cooldown:</b> 15"}},
                },
            },
        },
    },
}