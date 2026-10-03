-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.12.0
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 7 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 8 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local v1 = {UpdateName = "Executioner Rework", ImageId = 84049518526175}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {HeaderName = "Executioner Rework", HeaderSubject = "Executioner Rework is here!"}
local v7 = {}
local u22 = 84638451109524
local u23 = nil
v7[1] = "Executioner’s rework is out now for you all to play! Executioner is a crowd control tower that excels in ramp-up damage output, with a unique “bouncing” functionality to cut through hordes of enemies."

v7[2] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u22 (val), u23 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u22, Text = u23})
end

v7[3] = "Enjoy!"
v6.Points = v7
v5.Props = v6
local v8 = {Type = "Log"}
local v9 = {
    HeaderName = "Banned Skins",
    HeaderSubject = "Alongside our Admin Abuse, we’re introducing two new skins into the Banned Crate: Banned Ranger and Banned Pyromancer.  ",
}
local v10 = {}
local u35 = 120897423762872
local u36 = nil

v10[1] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u35 (val), u36 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u35, Text = u36})
end

v9.Points = v10
v8.Props = v9
v10 = {Type = "Log"}
local v11 = {
    HeaderName = "Looking Ahead",
    HeaderSubject = "Our next Admin Abuse will be at our usual update time on October 2nd.",
}
local v12 = {}
local u48 = 79487753561262
local u49 = nil
v12[1] = "Sign up so you don’t miss it!"

v12[2] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u48 (val), u49 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u48, Text = u49})
end

v11.Points = v12
v10.Props = v11
v4[1] = v5
v4[2] = {Type = "Items", Props = {Items = {{Type = "tower", Name = "Executioner", Skin = "Default"}}}}
v4[3] = {Type = "GamepassButton", Props = {gamepassId = 25711202}}
v4[4] = v8
v4[5] = {
    Type = "Items",
    Props = {
        Items = {
            {Type = "tower", Name = "Ranger", Skin = "Banned", Details = "Banned"},
            {Type = "tower", Name = "Pyromancer", Skin = "Banned", Details = "Banned"},
            {Type = "crate", Name = "Banned"},
        },
    },
}
v4[6] = v10
v4[7] = {Type = "EventButton", Props = {eventId = "8943095606650471065"}}
v3.Content = v4
v2[1] = v3
v2[2] = {
    Name = "Bug Fixes and Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                Points = {
                    "Fixed Hacker breaking after using revive tickets",
                    "Fixed Pulse Trooper having no DPS counter",
                    "Fixed Pulse Trooper having no lead detection at Lvl 2",
                },
            },
        },
    },
}
v1.Sections = v2
return v1