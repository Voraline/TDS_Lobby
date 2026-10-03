-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.8.0
-- Decompile time: 1.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 9 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function changeLine(a1, a2, a3, a4) -- Line: 19
    return (("<b>%*:</b> <font color=\"%*\">%* -> %*</font>"):format(a1, a4, a2, a3))
end

local function addedLine(a1, a2) -- Line: 23
    return (("<b>%*:</b> <font color=\"rgb(80,255,130)\">Added %*</font>"):format(a1, a2))
end

local function itemChange(a1, a2, a3) -- Line: 27
    return {
        Type = "ItemChange",
        Props = {Item = {Type = "tower", Name = a1, DisplayName = a2}, Changes = a3},
    }
end

local v1 = {UpdateName = "Frost Champion Arrival", ImageId = 97240495943805}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Frost Champion Arrival",
    HeaderSubject = "Feeling frosty? Good news — Frost Champion has arrived. You'll find Frost Champion in Frost Mode for you all to conquer, spawning at wave 33.",
}
local v7 = {}
local u24 = 125233079373984
local u25 = nil

v7[1] = function(a1, a2) -- Line: 9 -- upvalues: ImageCaption (val), u24 (val), u25 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u24, Text = u25})
end

v7[2] = "In addition, Frost Mode itself received some changes to make it stand out from other Survival modes. Here's what changed:"
v7[3] = "While Frost Mode remains 40 waves, early waves are now shorter while mid/late checkpoints are longer. Regular enemies within Frost Mode have received an update, as well, to provide more of a challenge and dynamic gameplay experience."
v7[4] = "You'll also find that the multiplayer difficulty for this mode has increased, as well, to prove a true challenge."
v6.Points = v7
v5.Props = v6
v4[1] = v5
v3.Content = v4
v5 = {
    Name = "Balance Changes:",
    Content = {
        {
            Type = "Log",
            Props = {HeaderSubject = "Balance changes have been made to Assassin and Sledger.", Points = {}},
        },
        itemChange("Assassin", nil, {
            {
                Title = "Level 2 Changes",
                Lines = {
                    "<b>Cost:</b> <font color=\"rgb(80,255,130)\">$750 -> $625</font>",
                    "<b>Damage:</b> <font color=\"rgb(80,255,130)\">6 -> 9</font>",
                    "<b>Whirlwind Damage:</b> <font color=\"rgb(255,100,100)\">12 -> 9</font>",
                    "<b>Detection:</b> <font color=\"rgb(80,255,130)\">Added Lead</font>",
                },
            },
            {
                Title = "Level 3-4 Changes",
                Lines = {
                    "<b>Level 3 Cost:</b> <font color=\"rgb(80,255,130)\">$2,400 -> $2,000</font>",
                    "<b>Level 3 Damage:</b> <font color=\"rgb(80,255,130)\">14 -> 16</font>",
                    "<b>Level 3 Whirlwind Damage:</b> <font color=\"rgb(255,100,100)\">21 -> 16</font>",
                    "<b>Level 4 Cost:</b> <font color=\"rgb(255,100,100)\">$6,350 -> $6,800</font>",
                },
            },
        }),
        (itemChange("Sledger", nil, {
            {
                Title = "Level 0-2 Changes",
                Lines = {
                    "<b>Level 0 Range:</b> <font color=\"rgb(80,255,130)\">6.5 -> 7</font>",
                    "<b>Level 0 Slow:</b> <font color=\"rgb(80,255,130)\">10% -> 15%</font>",
                    "<b>Level 2 Freeze Duration:</b> <font color=\"rgb(80,255,130)\">0.75s -> 1.5s</font>",
                },
            },
            {
                Title = "Level 3-4 Changes",
                Lines = {
                    "<b>Level 3 Damage:</b> <font color=\"rgb(80,255,130)\">50 -> 55</font>",
                    "<b>Level 3 Slow:</b> <font color=\"rgb(80,255,130)\">17.5% -> 35%</font>",
                    "<b>Level 3 Freeze Duration:</b> <font color=\"rgb(80,255,130)\">0.75s -> 0.85s</font>",
                    "<b>Level 4 Damage:</b> <font color=\"rgb(80,255,130)\">100 -> 105</font>",
                    "<b>Level 4 Slow:</b> <font color=\"rgb(80,255,130)\">17.5% -> 35%</font>",
                    "<b>Level 4 Freeze Duration:</b> <font color=\"rgb(80,255,130)\">0.75s -> 0.85s</font>",
                },
            },
            {
                Title = "Level 5 Changes",
                Lines = {
                    "<b>Freeze Duration:</b> <font color=\"rgb(80,255,130)\">1s -> 1.2s</font>",
                    "<b>Aftershock Damage:</b> <font color=\"rgb(80,255,130)\">30% -> 40%</font>",
                },
            },
        })),
    },
}
v2[1] = v3
v2[2] = {
    Name = "Game Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                Points = {
                    "Added 'Preview' button to inventory items.",
                    "Refactored item preview camera for better control.",
                },
            },
        },
    },
}
v2[3] = v5
v1.Sections = v2
return v1