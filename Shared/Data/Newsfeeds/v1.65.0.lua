-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.65.0
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Skill Tree",
    ImageId = 122739022317466,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🌳 New Skill Tree System!",
                        Points = {
                            "Customize your playstyle with our brand new Skill Tree system!",
                            "Unlock skills as you level up to enhance towers, economy, defense, and strategy.",
                            "Each category features unique upgrades with branching progression paths.",
                            "<b>New HUD:</b> Refactored the in-game HUD to improve readability and clarity.",
                            "<b>Skill Icons:</b> View your currently active skills in-game via new HUD icons.",
                            "<b>Index Changes:</b> Rewards are now integrated with the Index to reduce menu clutter.",
                            "<b>Hidden Wave Changes:</b> Having skills enabled now disables Hidden Wave!",
                            function(a1, a2) -- Line: 24 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 85420511659263,
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
                        HeaderName = "🔫 Offensive Skills",
                        Points = {
                            "<b>Enhanced Optics:</b> Increases tower range.",
                            "<b>Improved Gunpowder:</b> Boosts AOE explosion radius.",
                            "<b>Fight Dirty:</b> Extends enemy debuff duration.",
                            "<b>Precision:</b> Every X shots deal a 1.5x critical hit (non-stacking).",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "💵 Economy Skills",
                        Points = {
                            "<b>Resourcefulness:</b> More cash from selling towers.",
                            "<b>Bigger Budget:</b> Start with increased cash.",
                            "<b>Stonks:</b> Increases wave rewards.",
                            "<b>Scavenger:</b> Double kill rewards every X kills.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🎯 Strategy Skills",
                        Points = {
                            "<b>Accelerator:</b> Reduces cooldowns for active skills.",
                            "<b>Scholar:</b> Increases Logbook drop rate.",
                            "<b>Expanded Barracks:</b> Shorter cooldown for spawning units.",
                            "<b>Re-enforcements:</b> Raises the tower placement limit.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🛡️ Defense Skills",
                        Points = {
                            "<b>Fortify:</b> Boosts the player’s health pool (uses highest HP in groups).",
                            "<b>Extreme Conditioning:</b> Shortens duration of enemy debuffs/stuns.",
                            "<b>Beefed Up Minions:</b> Increases summoned unit health.",
                            "<b>Over-Heal:</b> Retain more HP from overhealing.",
                            "<b>Bandages:</b> Automatically regenerate HP at the start of each wave.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {"Hacker Tower", "...keep an eye on our socials for more info! 📢"},
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
                        SubjectName = "Bug Fixes",
                        Points = {
                            "Fixed Elementalist towers not despawning when tower is removed",
                            "Fixed Accelerator's upgrade info text incorrectly stating overcharge\nfor max level",
                            "Fixed VFX for Bloxy Commander skin",
                            "Fixed DJ Ghost skin particle emitter blocks not being transparent",
                            "Fixed max Stranded Medic not using correct animations",
                            "Fixed max Stranded Medic having no sounds",
                            "Fixed Holiday Minigunner having no sounds",
                            "Fixed Field Medic incorrectly healing missile APC unit",
                            "Fixed collisions on Fallen missile APC",
                        },
                    },
                },
            },
        },
    },
}