-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.82.0
-- Decompile time: 0.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
local v1 = utf8.char(8226)
return {
    UpdateName = "❄️ FROST MODE ❄️",
    ImageId = 98624846550189,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "❄️ Frost Mode ❄️",
                        HeaderSubject = "Bundle up and prepare yourselves for Frost Mode, our new survival difficulty! Pockets of frost have been found throughout the realm and some ‘chilling’ enemies have appeared. Join Commander, Professor V, and Dispatcher in an alternate storyline created specifically for this game mode.",
                        Points = {
                            ("%* 🥶 <b>New Gamemode:</b> Battle frozen enemies with tower-attacking abilities"):format(v1),
                            ("%* 📕 <b>New Story:</b> Non-canon storyline created for this mode."):format(v1),
                            (("%* 👿 <b>Upcoming:</b> A Frost Champion is preparing to join the enemy's ranks this January."):format(v1)),
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🗺️ New Map",
                        HeaderSubject = "Explore new battlegrounds and challenge yourself on fresh terrain! Test your strategies on this newly added map.",
                        Points = {
                            function(a1, a2) -- Line: 32 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Text = "Northern Lights",
                                    Image = 103614175938819,
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
                        HeaderName = "🎬 THE FINAL ACT",
                        HeaderSubject = "Now what do we have here? A show? No. A <i>MAGNIFICENT</i> performance unlike ANY other! Come and witness the most jaw-dropping theater ever conceived by yours truly, The Narrator! Hold your breath, my dear audience, and prepare yourselves for a story so EXTRAORDINARY that you'll be <i>DYING</i> to see more! Coming soon, a play that will leave you <i>SPEECHLESS!</i>",
                        Points = {},
                    },
                },
                {Type = "EventButton", Props = {eventId = "4431083314408587881"}},
            },
        },
    },
}