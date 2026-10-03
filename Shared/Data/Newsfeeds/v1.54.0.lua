-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.54.0
-- Decompile time: 0.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "☢️ PW2 Mini-Rework ☢️",
    ImageId = 81704262479508,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        Minimize = 0.65,
                        HeaderName = "☢️ Polluted Wasteland II ☢️",
                        Points = {
                            "Increased coin reward from 1105 coins to 1250 coins",
                            "Increased exp reward from 205 Exp to 240 Exp (255 → <font color=\"rgb(100,255,100)\">300 for</font> VIP)",
                            "Chance to earn tickets and consumables on win",
                            "Minimum level requirement increased from 25 to 50",
                            "Earn 125 Gems on Win",
                            "Updated Eco system, enemy kill rewards are now evenly split to all players.",
                            "Old Event enemies have been added",
                            "Adjusted wave structure (40 waves → <font color=\"rgb(255,100,100)\">25 waves</font>)",
                            "RECOMMENDED FOR GROUPS",
                            function(a1, a2) -- Line: 27 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 83042071027605,
                                    Text = "Nuclear Monster returns more dangerous then ever. He and his minions have grown in strength and are seeking revenge. ENTER AT YOUR OWN RISK!",
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
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {"Mini-easy mode rework", "...keep an eye on our socials for more info! 📢"},
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
                        SubjectName = "Bug Fixes",
                        Points = {
                            "Fixed enemy rotations not scaling with time-scale",
                            "Updated enemies' rotations to look more polished",
                            "Reduced Fallen Honor Guard's screen shake",
                            "Fixed Eclipse Ranger's upgrade 2 backpack weld",
                            "Fixed Galactic Commander's upgrade 2 pedestal model",
                            "Fixed Pirate Warden's max upgrade hat",
                        },
                    },
                },
            },
        },
    },
}