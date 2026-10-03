-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.5.0
-- Decompile time: 1.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 9 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 10 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local v1 = {UpdateName = "Story Mode Missions 5-8", ImageId = 117972040657204}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Story Mode Missions 5-8 Debut",
    HeaderSubject = "Continue your journey through Story Mode with the second installment of Chapter 1.",
}
local v7 = {}
local u22 = 139996713941189
local u23 = nil
v7[1] = "Missions 5 - 8 are now available for you and your friends to enjoy, including a brand new map on Mission 7."

v7[2] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u22 (val), u23 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u22, Text = u23})
end

v7[3] = "We hope you’ve enjoyed the story so far, and are excited to let you all know that Chapter 2 will come after Halloween. You can expect more news about that in the future."
v6.Points = v7
v5.Props = v6
v6 = {Type = "Log"}
v7 = {
    HeaderName = "New Summer Skins",
    HeaderSubject = "As summer comes to a close, we’re rounding it out with three new summer-themed skins.",
}
local v8 = {}
local u30 = 114575671044573
local u31 = nil
v8[1] = "Enjoy the Beach Soldier, Beach Rocketeer and Beach Brawler skins. You’ll find these in the Beach Crate."

v8[2] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u30 (val), u31 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u30, Text = u31})
end

v7.Points = v8
v6.Props = v7
v8 = {Type = "Log"}
local v9 = {
    HeaderName = "Looking ahead to Enforcer",
    HeaderSubject = "Here’s a sneak peak of our next Evolved Tower, Enforcer, for you all. We’re really eager to see how player’s approach Enforcer’s unique skillset. Enforcer is an all-arounder: He has a shotgun with spread, is capable of bringing vehicles onto the battlefield, and is able to flashbang enemies to efficiently stun enemies.",
}
local v10 = {}
local u43 = 102027570233297
local u44 = nil

v10[1] = function(a1, a2) -- Line: 10 -- upvalues: ImageCaption (val), u43 (val), u44 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u43, Text = u44})
end

v10[2] = "You’ll get your hands on him this time exactly 1 week from today."
v9.Points = v10
v8.Props = v9
v4[1] = v5
v4[2] = v6
v4[3] = {
    Type = "Items",
    Props = {
        Minimize = 0.6,
        Items = {
            {
                Type = "crate",
                Name = "Beach26",
                Details = "<font color=\"rgb(80,255,130)\">4,500 Coins or Robux</font>",
            },
            {Type = "skin", Name = "Soldier", Skin = "Beach", Details = "Beach"},
            {Type = "skin", Name = "Rocketeer", Skin = "Beach", Details = "Beach"},
            {Type = "skin", Name = "Brawler", Skin = "Beach", Details = "Beach"},
        },
    },
}
v4[4] = v8
v3.Content = v4
v2[1] = v3
v2[2] = {
    Name = "Bug Fixes:",
    Content = {
        {
            Type = "Log",
            Props = {
                Points = {
                    "Polished up Story Mode dialog characters.",
                    "Fixed avatars glitching during cutscenes.",
                    "Fixed Sentry audio bugs.",
                    "Added Vote Skip to cutscenes.",
                    "Added health scaling to story mode waves.",
                    "Revive ticket hotfix.",
                },
            },
        },
    },
}
v1.Sections = v2
return v1