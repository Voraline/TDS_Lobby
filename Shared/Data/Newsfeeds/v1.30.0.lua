-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.30.0
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🔴 Mako DJ 🔵",
    ImageId = 83513859685698,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "✨ Mako DJ finally makes her debut! ✨ ",
                        Points = {
                            "The Mako DJ is the first of the new <font color=\"rgb(255,67,174)\"><b><u>Ultimate</u></b></font> skin rarity. Ultimate skins\nseparate themselves from the rest of the rarities with their quality and unique\ninteractions with towers, enemies, or their environment! As we explore\nwith more Ultimate skin rarities, we'll find even more ways to make these\nskins cooler!",
                            "The skin will be available for purchase for <font color=\"rgb(255,255,255)\">749</font> in the Inventory Menu",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 91017686313133,
                                    Text = "Mako DJ Skin",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 27 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 90062602903096,
                                    Text = "Towers placed in Mako DJ's range will have a custom aura 🎶",
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
                        SubjectName = "🤠 Plushie Cowboy Skin!",
                        Points = {
                            function(a1, a2) -- Line: 71 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 108943414070457,
                                    Text = "Plushie",
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
                        SubjectName = "🐛 Bug Fixes",
                        Points = {
                            "Fixed DJ not accounting for towers sold",
                            "Fixed DJ's slowness debuff applying to Boss enemies",
                            "Fixed options cooldown when reselecting the current track",
                            "Fixed wave timer not scaling correctly with timescale",
                            "Fixed projectile towers doing damage to units",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Next Week 🔥",
                        Points = {"4 new skins 👀", "...keep an eye on our socials for more info! 📢"},
                    },
                },
            },
        },
    },
}