-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.60.0
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🥊 PVP Testing",
    ImageId = 127911941047553,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🥊 PVP Testing is Live",
                        Points = {
                            "We're kicking off testing for Ranked Mode—jump in and prove your skill before testing ends on <u><b>April 23, 2025</b></u>!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 What's New:",
                        Points = {
                            "Ranked Mode Launch!",
                            "Compete in intense PVP matches with tower bans (up to 2 per team)\nto shake up your strategy and keep things fresh.",
                            "New Birds-Eye View Camera!",
                            "A top-down perspective just for PVP—perfect for placing towers and\nspectating the enemy’s battlefield.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.65,
                        SubjectName = "Other PVP Fixes and Changes",
                        Points = {
                            "Parties now stay together in matches—no more getting split from your\nfriends!",
                            "Revamped Win/Lose screen: See who won, which players were on the\nwinning team, and enjoy a fun little victory dance!",
                            "Golden perks are now disabled: No more pay-to-win, this one's all about\nskill!",
                            "Updated spawn menus",
                            "Polished various UI elements",
                            "New intermission lobby UI in the works!",
                            "Infinite waves now end once one team clears all enemies. Fast, fair,\nand fierce!",
                            "Enemy sends now apply modifiers instantly, and you'll get refunds for\nany cancelled sends.",
                            "Ensures all players load in before the match starts—no more early starts\nwithout you!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🗺️ 4 New PVP Maps Added:",
                        Points = {"Crash Course", "Judging Hall", "Laser Stadium", "Warm Land"},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🧃 New PVP-Exclusive Consumables!",
                        Points = {
                            "Unlimited use per match—just spend in-game cash:",
                            "Airhorn 🎺 — Adds Aggro to your next 2 summoned enemies",
                            "Energy Drink ⚡ — Adds Nimble to your next 5 summoned enemies",
                            "Protein Shake 💪 — Adds Bloated to your next 3 summoned enemies",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🗺️ New Map",
                        Points = {
                            "Hot Spot",
                            function(a1, a2) -- Line: 81 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 102321884490826,
                                    Text = "New 3 Lane Map",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
            },
        },
    },
}