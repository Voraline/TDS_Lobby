-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.34.0
-- Decompile time: 0.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Stickers",
    ImageId = 135749242115238,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Stickers [BETA] 💥",
                        Points = {
                            "Stickers are here! 🎉",
                            "Currently you can only use the default stickers",
                            "More stickers will be added on Halloween",
                            function(a1, a2) -- Line: 21 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 87260951121470,
                                    Text = "Flexing on you",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Equipping stickers will prioritize the equipped sticker",
                            "All stickers can be used without being equipped",
                            "Press 'V' to open the sticker wheel",
                            "Equip stickers through the emotes inventory screen",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Improved Emote Wheel 🔥",
                        Points = {
                            "Enjoy a new and improved emote wheel!",
                            "Any emote can now be used in the lobby and in-game",
                            "Emotes now show the animation and custom accessories in the wheel",
                            "Smoother and more responsive wheel",
                            "Scroll through the wheel with the mouse wheel!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Gamemode Changes",
                        Points = {
                            "Easy Mode wave structure nerfs",
                            "Grave Digger health (20000 → <font color=\"rgb(255,100,100)\">17500</font>)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Slasher Returns...",
                        Points = {
                            "Slasher on sale and it will be around for one week",
                            "Try out the old Slasher before the rework comes",
                            "More Slasher skins will be coming soon!",
                            function(a1, a2) -- Line: 67 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 123593851017982,
                                    Text = "Before and After",
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
                        SubjectName = "Other Changes",
                        Points = {
                            "Monthly leaderboard expires correctly at the end of the month",
                            "Party UI overhauled, visually the same but more efficient",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Coming Soon 🔥",
                        Points = {
                            "Halloween coming out on ■■■■■! 🎃",
                            "New Lobby",
                            "Pursuit Rework coming after Halloween",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}