-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.13.0
-- Decompile time: 0.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1) -- Line: 7 -- upvalues: ImageCaption (val)
    return function(a1_2, a2) -- Line: 8 -- upvalues: ImageCaption (upval), a1 (val)
        return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1_2, Image = a1})
    end
end

local v1 = {UpdateName = "Admin Abuse Pt. II", ImageId = 117378536095594}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Admin Abuse Pt. II",
    HeaderSubject = "Our second (and final) day of Admin Abuse is here! Devs will be running commands and sending live messages for 1 hour after our usual update time. ",
}
local v7 = {}
local u21 = 133658048898611

v7[1] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u21 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u21})
end

v6.Points = v7
v5.Props = v6
local v8 = {Type = "Log"}
local v9 = {
    HeaderName = "Looking ahead…",
    HeaderSubject = "Night I of our Halloween event will be releasing on October 9th. We'll be taking you through the story of Umbra and Penumbras, and everything in-between. ",
}
local v10 = {}
local u35 = 82168624621357
v10[1] = "In addition, we'll be launching our Halloween battlepass and two Crates full of spooky surprises for you to enjoy."

v10[2] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u35 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u35})
end

v10[3] = "Sign up for the event below, so you don't miss any of it: "
v9.Points = v10
v8.Props = v9
v4[1] = v5
v4[2] = {
    Type = "Log",
    Props = {
        HeaderName = "",
        HeaderSubject = "",
        Points = {
            "Similar to last week, we'll let the event roll over the weekend, so everyone has plenty of time to claim their Banned Crate.",
        },
    },
}
v4[3] = {Type = "Items", Props = {Items = {{Type = "crate", Name = "Banned"}}}}
v4[4] = v8
v4[5] = {Type = "EventButton", Props = {eventId = "2108311377549591147"}}
v3.Content = v4
v2[1] = v3
v1.Sections = v2
return v1