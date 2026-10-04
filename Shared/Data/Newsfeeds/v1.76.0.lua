-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.76.0
-- Decompile time: 0.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎃 Halloween Countdown 🎃",
    ImageId = 100669068520755,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "👻 A SPOOKY LIVE EVENT!",
                        HeaderSubject = "Let's kick off October with a VERY special LIVE EVENT! Join us on <b><font color=\"rgb(237, 40, 54)\">October 4th @ 12:00 (ET)</font></b> for exclusive game content, admin abuse, and FREE LIMITED SKINS!",
                        Points = {
                            function(a1, a2) -- Line: 18 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 103669225933601,
                                    Text = "You don't want to miss this! Sign up for the event in the event lobby! 👻",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "2832424972347769352"}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "A Spooky Makeover!",
                        HeaderSubject = "September is dead.. and Halloween is here! Explore the Halloween lobby early and check out the Halloween event area! Can you guess what's coming next? 👀",
                        Points = {
                            function(a1, a2) -- Line: 41 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 131575011221003,
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
                        HeaderName = "Jester return on sale!",
                        HeaderSubject = "The Jester tower is back for a limited time! Get it now before it's gone again!",
                        Points = {
                            function(a1, a2) -- Line: 57 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 78519223499699,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 652291181}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            function(a1, a2) -- Line: 78 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 76154937220085,
                                    Text = "Night 1 Preview",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "3575316445904241251"}},
            },
        },
    },
}