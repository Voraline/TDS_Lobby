-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.80.0
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🏷️ NULL & VOID TAG + BUG FIXES 🔧",
    ImageId = 80938705941296,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🏷️ Null and Void Tag! 🏷️",
                        HeaderSubject = "Conquer all 3 Nights on Hard in a single run—no restarts, one loadout—to earn this exclusive tag! Prove your mastery over the Rift Walker and the Children of EXO as you stand victorious against the forces threatening THE META.",
                        Points = {
                            function(a1, a2) -- Line: 18 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128434256155480,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.65,
                        SubjectName = "⚒️ Improvements",
                        Points = {
                            "Added Xbox controller support for selecting matchmaking modes",
                            "Enhanced Lyra system with data-store session locking for better stability",
                            "Fixed display issue where hacker purchases showed coins instead of\ngems in lobby",
                            "Optimized tower buff effects system for improved performance",
                            "Enhanced Mako DJ visual effects with better cleanup mechanisms",
                            "Resolved living statue emote issues with head and 3D clothing textures",
                            "Upgraded Sand Castle Barricade with improved damage\nand enemy detection",
                            "Fixed Sand Castle Barricade compatibility with game\ntime-scale adjustments",
                            "Updated Medic tower skins to include proper shirt textures",
                        },
                    },
                },
            },
        },
    },
}