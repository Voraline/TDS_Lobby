-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.35.0
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Bug Fixes",
    ImageId = 135749242115238,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Emote Fixes 🙂",
                        Points = {"Lazy Chair", "Recliner", "Axe Throw", "Frozen"},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Bug Fixes 🛠️",
                        Points = {
                            "Fixed revive tickets",
                            "Fixed Gunslinger beam",
                            "Fixed DJ trying to get distance of towers that are sold and cleaned up",
                            "Fixed Mercenary Base placement when it tries to access an invalid path",
                            "Fixed debuffs updating for enemies that have been cleaned up",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Gamemode Changes",
                        Points = {"Minor changes to wave structure in Easy Mode"},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Patient Zero Skin Going Off Sale Soon",
                        Points = {
                            "Plushie going off sale soon",
                            "Get your plushie while you can and get a free gift!",
                            function(a1, a2) -- Line: 53 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 85747921772301,
                                    Text = "🧟‍♂️ Plushie goes off sale October 20th @ 11:59 PM ET 🧟‍♂️",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 61 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 76997295686336,
                                    Text = "🧟‍♂️ Free gift when purchasing the plushie 🧟‍♂️",
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
                        Points = {
                            "Halloween is coming 🎃",
                            function(a1, a2) -- Line: 78 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 107789968183999,
                                    Text = "👀",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "New lobby maybe next week???",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}