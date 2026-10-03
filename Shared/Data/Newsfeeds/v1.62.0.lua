-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.62.0
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🦆 Ducky DJ",
    ImageId = 78345868682726,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🦆 Ducky DJ Mission Quest",
                        Points = {
                            "Come one come all to see the greatest band in all of Roblox! DJ is here with a with a brand new band of Duckys, here to play a fiddle and invigorate your team! Act quick because the mission quest is only here until May 28th!",
                            function(a1, a2) -- Line: 18 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 90133598889695,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Items 🔥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "tower", Name = "DJ Booth", Skin = "Ducky", Details = "Ducky"},
                            {Type = "nametag", Name = "DuckyBath"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Next Week 🔥",
                        Points = {"Swarmer Rework", "...keep an eye on our socials for more info! 📢"},
                    },
                },
            },
        },
    },
}