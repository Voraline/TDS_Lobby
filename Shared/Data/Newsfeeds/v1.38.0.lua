-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.38.0
-- Decompile time: 0.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎃 The Hexscape Event (Night II) 🎃",
    ImageId = 128454497076050,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "A New Threat Emerges...",
                        HeaderSubject = "🎃 Darkness falls over Robloxia this Halloween... As TDS defends against the undead and the Fallen, a sinister cult lurks in the shadows, plotting to unleash Lord EXO from his ancient prison!",
                        Points = {},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Your Objective:",
                        HeaderSubject = "⚠️ Command has detected radiation spikes matching the God Cube at the Eclipse Village! Your mission: deploy immediately to the battlefield and prevent the gateway from opening. It's highly unstable—failure is not an option!",
                        Points = {},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Version 1.38.0",
                        HeaderSubject = "💪 This Halloween, experience a brand-new story centered around the uprising of the Children of EXO! Battle through 3 Nights of unforgiving enemies to collect 2 limited-time Event Towers and complete the \"Hexscape\" battle pass for exclusive rewards!",
                        Points = {
                            "🌘 NIGHT 1: <b><font color=\"rgb(237, 40, 54)\">LIVE NOW</font></b>",
                            "🌗 NIGHT 2: 10/25/2024 @ 3:00 PM (ET)",
                            "🌕 NIGHT 3: 10/30/2024 @ 3:00 PM (ET)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Game Improvements 🛠️",
                        Points = {
                            "Optimized in game UI for better performance",
                            "Added hit vfx for bumper cart emote",
                            "Added critical hits for bumper cart emote",
                            "Mercenary base unit spawn times fixed",
                            "Added subtitles to all cutscenes",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.3,
                        HeaderName = "Changed Map Difficulties 🗺️",
                        Points = {
                            "Sky Islands: Hard ➡️ Easy",
                            "Abandoned City: Normal ➡️ Easy",
                            "Autumn Falling: Normal ➡️ Easy",
                            "Cataclysm: Normal ➡️ Hard",
                            "Chess Board: Hard ➡️ Normal",
                            "Construction Crazy: Normal ➡️ Hard",
                            "Crossroads: Normal ➡️ Easy",
                            "Enchanted Forest: Hard ➡️ Insane",
                            "Farm Lands: Hard ➡️ Normal",
                            "Forest Camp: Normal ➡️ Easy",
                            "Fungi Islands: Normal ➡️ Easy",
                            "Gilded Path: Insane ➡️ Hard",
                            "Happy Home of Robloxia: Easy ➡️ Normal",
                            "Iceville: Easy ➡️ Normal",
                            "Marshlands: Easy ➡️ Normal",
                            "Meltdown: Easy ➡️ Normal",
                            "Night Station: Hard ➡️ Normal",
                            "Rocket Arena: Normal ➡️ Easy",
                            "Ruby Escort: Hard ➡️ Normal",
                            "Sacred Mountains: Insane ➡️ Hard",
                            "The Heights: Normal ➡️ Hard",
                            "Tropical Isles: Normal ➡️ Easy",
                            "U-Turn: Normal ➡️ Easy",
                            "Winter Abyss: Hard ➡️ Normal",
                            "Winter Bridges: Normal ➡️ Easy",
                            "Wrecked Battlefield II: Hard ➡️ Normal",
                            "Wrecked Battlefield: Hard ➡️ Normal",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {
                            "Night III going live October 30 @ 3:00PM ET",
                            function(a1, a2) -- Line: 95 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 79706347686368,
                                    Text = "Are you ready?",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 103 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 89308425135779,
                                    Text = "Jason",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 111 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 104965757961147,
                                    Text = "Event Towers",
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