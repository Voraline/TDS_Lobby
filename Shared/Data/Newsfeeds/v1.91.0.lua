-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.91.0
-- Decompile time: 1.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
local v1 = utf8.char(8226)
return {
    UpdateName = "⚽ adidas Event ⚽",
    ImageId = 95972374540687,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "⚽ adidas Event",
                        HeaderSubject = "Rumor has it that a mysterious crew has arrived. Step into the backyard and defend the legacy with 3 new maps, themed enemies and more in celebration for the upcoming World Cup!",
                        Points = {
                            "The adidas Event goes till <b><font color=\"rgb(255,255,0)\">June 6th</font></b>!",
                            function(a1, a2) -- Line: 22 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 137161203332630,
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
                        HeaderName = "🦆 Ducky Revenge Extension",
                        HeaderSubject = "The ducks are sticking around a little longer! Ducky Revenge will now be available until <b><font color=\"rgb(255,255,0)\">June 5th</font></b>.",
                        Points = {
                            "Finish your runs, claim those rewards, and show Ducky D00M the door before the event flies off.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🏷️ Memorial Day Sale",
                        HeaderSubject = "The Memorial Day Sale starts today! Stock up, round out your tower roster, and grab limited-time deals on gamepasses, crates, currency, and Battle Pass offers.",
                        Points = {
                            ("%* <b><font color=\"rgb(0,255,0)\">35%% Off:</font></b> Sandbox Plus+, Hacker, and Gatling Gun"):format(v1),
                            ("%* <b><font color=\"rgb(0,255,0)\">30%% Off:</font></b> Engineer and Mercenary Base"):format(v1),
                            ("%* <b><font color=\"rgb(0,255,0)\">25%% Off:</font></b> Pursuit, Swarmer, Biologist, Saboteur, Warden, Custom Music, and Meme Emotes"):format(v1),
                            (("%* <b><font color=\"rgb(0,255,0)\">20%% Off:</font></b> VIP, Turret, Mortar, Crook Boss, and Cowboy"):format(v1)),
                        },
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Minimize = 0.6,
                        Items = {
                            {
                                Type = "tower",
                                Name = "Hacker",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">35% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Gatling Gun",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">35% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Engineer",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">30% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Mercenary Base",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">30% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Pursuit",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Swarmer",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Biologist",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Saboteur",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Warden",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "DJ Booth",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Turret",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">20% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Mortar",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">20% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Crook Boss",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">20% OFF</font>",
                            },
                            {
                                Type = "tower",
                                Name = "Cowboy",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">20% OFF</font>",
                            },
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Archer Returns",
                        HeaderSubject = "The limited Archer tower is back! Pick it up while it is available.",
                        Points = {},
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {
                                Type = "tower",
                                Name = "Archer",
                                Skin = "Default",
                                Details = "<font color=\"rgb(250,72,72)\">LIMITED TIME</font>",
                            },
                        },
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 8928263}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "More Memorial Day Deals",
                        Points = {
                            ("%* <b>Crates:</b> Deluxe Crate and Premium Crate are <font color=\"rgb(0,255,0)\">20%% off</font>."):format(v1),
                            ("%* <b>Currency:</b> 10,000 Coins, 5,000 Coins, 2,500 Gems, and 1,500 Gems are <font color=\"rgb(0,255,0)\">20%% off</font>."):format(v1),
                            ("%* <b>Battle Pass:</b> Premium is <font color=\"rgb(0,255,0)\">20%% off</font>, and Rank purchases are <font color=\"rgb(0,255,0)\">25%% off</font>."):format(v1),
                            (("%* Sale prices will appear in-game while the Memorial Day Sale is active."):format(v1)),
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            function(a1, a2) -- Line: 191 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 100872448574038,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "1937657529807012466"}},
            },
        },
        {
            Name = "🛠️ Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.65,
                        SubjectName = "Fixes",
                        Points = {
                            "Fixed waves not ending immediately when an enemy dies.",
                            "Fixed issues with Pursuit repositioning incorrectly.",
                            "Fixed issues with the Bloated modifier.",
                            "Fixed targeting and explosion damage for various Elf Camp units.",
                            "Fixed incorrect fan art name credits in the lobby.",
                            "Fixed issues with Warlock and Brawler not correctly applying buffs from\nother towers.",
                            "Fixed shields applied by the Medic not reappearing after being damaged.",
                            "Fixed button overlap issues in the inventory item equipping menu.",
                        },
                    },
                },
            },
        },
    },
}