-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.4.0
-- Decompile time: 2.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 12 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 13 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function changeLine(a1, a2, a3, a4) -- Line: 23
    return (("<b>%*:</b> <font color=\"%*\">%* -> %*</font>"):format(a1, a4, a2, a3))
end

local function statLine(a1, a2) -- Line: 27
    return (("<b>%*:</b> %*"):format(a1, a2))
end

local function itemChange(a1, a2, a3, a4, a5, a6, a7) -- Line: 31
    return {
        Type = "ItemChange",
        Props = {
            Minimize = a7,
            Item = {
                Type = a5 or "tower",
                Name = a1,
                Skin = a4,
                DisplayName = a2,
                Icon = a6,
            },
            Changes = a3,
        },
    }
end

local v1 = {UpdateName = "Story Mode", ImageId = 106097512978206}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Story Mode Introduced",
    HeaderSubject = "Introducing Story Mode! We’re really excited to debut this to you all. Follow Commander and his crew as they navigate through the Tower Defense Simulator story. This is our first installment and its intention is to be a vehicle to introduce new players, and satisfy veteran fan’s desire for more story.",
}
local v7 = {}
local u25 = 102449024933785
local u26 = nil
v7[1] = "In this first installment of Chapter 1, you’ll navigate 4 missions, one of which is a brand new map — which you can see below."

v7[2] = function(a1, a2) -- Line: 13 -- upvalues: ImageCaption (val), u25 (val), u26 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u25, Text = u26})
end

v7[3] = "Next Friday, we’ll drop the next installment: Missions 5 - 8 for you and your friends to venture through. We’re eager to see the loadouts and memories you all create in this mode, and you can expect news on Chapter 2 when that time comes."
v6.Points = v7
v5.Props = v6
v6 = {Type = "Log"}
v7 = {
    HeaderName = "New Matchmaking UI",
    HeaderSubject = "We’ve introduced new Matchmaking UI to improve navigation and make queueing into your favorite game modes better. You can expect to see all modes displayed here, including the brand new Story Mode!",
}
local v8 = {}
local u32 = 86051591831171
local u33 = nil

v8[1] = function(a1, a2) -- Line: 13 -- upvalues: ImageCaption (val), u32 (val), u33 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u32, Text = u33})
end

v7.Points = v8
v6.Props = v7
v7 = {Type = "Log"}
v8 = {
    HeaderName = "New Lobby",
    HeaderSubject = "With Story Mode, and the updated Matchmaking UI, we felt it was time to give the lobby a much-deserved overhaul. You’ll still see the things you know and love: Leaderboards, event countdown timers, but if you venture around enough… you’ll find some hidden gems.",
}
local v9 = {}
local u38 = 117515796310909
local u39 = nil

v9[1] = function(a1, a2) -- Line: 13 -- upvalues: ImageCaption (val), u38 (val), u39 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u38, Text = u39})
end

v8.Points = v9
v7.Props = v8
v4[1] = v5
v4[2] = v6
v4[3] = v7
v4[4] = {
    Type = "Log",
    Props = {
        HeaderName = "New weekly cadence",
        HeaderSubject = "We’re excited to share that we’ll be moving to a weekly update schedule.",
        Points = {
            "This means you can expect new content, balance changes, bug fixes, and quality-of-life improvements on a much more consistent basis. While some weeks will naturally be larger than others, our goal is to keep delivering regular updates that continue to improve and expand the game.",
            "We’re looking forward to sharing what’s next and can’t wait for you to see what we have in the weeks ahead.",
        },
    },
}
v3.Content = v4
v5 = {
    Name = "Balance Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                HeaderSubject = "Operator has received changes to his early to mid-game performance, including a shorter burst cooldown and better cost to DPS ratio across the board. The Shared Optics passive has been moved to level 5 and level 4 has been buffed significantly to compensate.",
                Points = {},
            },
        },
        (itemChange("EvolvedOperator", "Operator", {
            {
                Title = "Early Game Changes",
                Lines = {
                    "<b>Tower Limit:</b> <font color=\"rgb(255,100,100)\">20 -> 16</font>",
                    "<b>Level 0-1 Burst Cooldown:</b> <font color=\"rgb(80,255,130)\">1.5s -> 1.4s</font>",
                    "<b>Level 2 Coordination Radius:</b> <font color=\"rgb(80,255,130)\">3.75 -> 4</font>",
                    "<b>Level 3 Coordination Radius:</b> <font color=\"rgb(80,255,130)\">3.75 -> 4</font>",
                },
            },
            {
                Title = "Level 4-6 Changes",
                Lines = {
                    "<b>Level 4 Cost:</b> <font color=\"rgb(80,255,130)\">$2,575 -> $1,950</font>",
                    "<b>Level 4 Damage:</b> <font color=\"rgb(80,255,130)\">5 -> 6</font>",
                    "<b>Shared Optics:</b> Moved from Level 4 to Level 5",
                    "<b>Level 5 Cooldown:</b> <font color=\"rgb(80,255,130)\">0.17 -> 0.16</font>",
                    "<b>Level 6 Cost:</b> <font color=\"rgb(255,100,100)\">$4,250 -> $7,000</font>",
                    "<b>Level 6 Damage:</b> <font color=\"rgb(80,255,130)\">6 -> 10</font>",
                    "<b>Level 6 Cooldown:</b> <font color=\"rgb(255,100,100)\">0.13 -> 0.16</font>",
                },
            },
        })),
    },
}
v2[1] = v3
v2[2] = {
    Name = "Game Changes:",
    Minimize = 0.765,
    Content = {
        {
            Type = "Log",
            Props = {
                Points = {
                    "Story Mode includes new dialogue, cutscenes, mission progression, star objectives, suggested towers, first-clear rewards, and party-aware mission access.",
                    "The tutorial has been folded into Story Mode as an onboarding chapter with updated prompts, progression, and full tower refunds.",
                    "Story Mode triumphs are excluded from standard leaderboard win tracking.",
                    "Cutscene and dialogue systems received updates for story sequences, speaker presentation, subtitles, timing, and debugging tools.",
                    "Tower information, reward stats, hotbar behavior, objectives, and several lobby HUD elements received UI polish and fixes.",
                    "Elementalist, enemy stats, story mission balance, and mission wave cash have received supporting adjustments.",
                },
            },
        },
    },
}
v2[3] = v5
v1.Sections = v2
return v1