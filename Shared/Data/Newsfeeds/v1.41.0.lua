-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v1.41.0
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "💸 Pls Donate 💸",
    ImageId = 71878057960700,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "💸 Pls Donate 💸",
                        HeaderSubject = "Hello, we need <font color=\"#24cc8c\">31,000 Robux</font> for Headless Horseman. Pls don8 to us! Sincerely, the Zombies\n\nThe <font color=\"#FFFFFF\"><u>Pls Donate x Tower Defense Simulator</u></font> event is finally here! Help defend Pls Donate’s economy from Corrupted Hazem and his army of NPCs! This event runs from <font color=\"#FFFF00\"><b>11/13/24</b></font> to <font color=\"#FFFF00\"><b>12/04/24</b></font>\n",
                        Points = {
                            "Pls Donate Nametag: Beat in hard mode.",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 101827282386079,
                                    Text = "Hazem Scout Skin + TDS Booth in Pls Donate: Beat Easy or Hard mode.",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 27 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 77032846142019,
                                    Text = "Booth Farm Skin: Complete the “Pls Defense Simulator” contract.",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 35 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 73794177247454,
                                    Text = "Earn this in Pls Donate!",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Skins 🔥", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "tower", Name = "Scout", Skin = "Haz3mn", Details = "Haz3mn"},
                            {Type = "tower", Name = "Farm", Skin = "Booth", Details = "Booth"},
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "New Nametags 🏷️", Points = {}}},
                {Type = "Items", Props = {Items = {{Type = "nametag", Name = "PlsDonate"}}}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {
                            "Molten Rework",
                            "Pursuit Rework",
                            "Commando Rework",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}