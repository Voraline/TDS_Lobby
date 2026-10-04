-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.2.0
-- Decompile time: 2.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 5 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 6 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local v1 = {UpdateName = "Summer Skin Drop", ImageId = 115240544384196}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "Summer Skin Drop",
    HeaderSubject = "Bask in the Summer glow, and celebrate America's 250th Birthday! Summer has arrived, and with it, three brand new crates for you to enjoy.",
}
local v7 = {}
local u21 = 115240544384196
local u22 = "New seasonal crates are rolling into the shop."

v7[1] = function(a1, a2) -- Line: 6 -- upvalues: ImageCaption (val), u21 (val), u22 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u21, Text = u22})
end

v6.Points = v7
v5.Props = v6
v6 = {Type = "Log"}
v7 = {
    HeaderName = "Beach Crate",
    HeaderSubject = "First up are two Summer themed crates, filled to the brim with skins. Available to you now is the Beach Crate, the perfect way to start off Summer.",
}
local v8 = {}
local u27 = 77989388746126
local u28 = nil

v8[1] = function(a1, a2) -- Line: 6 -- upvalues: ImageCaption (val), u27 (val), u28 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u27, Text = u28})
end

v7.Points = v8
v6.Props = v7
v8 = {Type = "Log"}
local v9 = {
    HeaderName = "Scuba Ops Crate",
    HeaderSubject = "The Beach Crate and Scuba Ops Crate are made by your very own Community Workshop, and we're really pleased with how they turned out.",
}
local v10 = {}
local u51 = 136976789609292
local u52 = nil
v10[1] = "Available to you now is the Scuba Ops Crate, the perfect way to start off Summer."

v10[2] = function(a1, a2) -- Line: 6 -- upvalues: ImageCaption (val), u51 (val), u52 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u51, Text = u52})
end

v9.Points = v10
v8.Props = v9
v10 = {Type = "Log"}
local v11 = {
    HeaderName = "Patriotic Crate",
    HeaderSubject = "Of course, no summer celebration would be complete without honoring America's 250th Birthday! We're also introducing the Patriotic Crate, filled with festive skins to celebrate the Semiquincentennial.",
}
local v12 = {}
local u66 = 72912918006623
local u67 = nil

v12[1] = function(a1, a2) -- Line: 6 -- upvalues: ImageCaption (val), u66 (val), u67 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u66, Text = u67})
end

v11.Points = v12
v10.Props = v11
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
            {Type = "skin", Name = "Ranger", Skin = "Aquatic", Details = "Aquatic"},
            {Type = "skin", Name = "Ranger", Skin = "Axolotl", Details = "Axolotl"},
            {Type = "skin", Name = "Slime Trooper", Skin = "Anemone", Details = "Anemone"},
            {Type = "skin", Name = "Accelerator", Skin = "Beach", Details = "Beach"},
            {Type = "skin", Name = "Electroshocker", Skin = "Beach", Details = "Beach"},
            {Type = "skin", Name = "Medic", Skin = "Beach", Details = "Beach"},
            {Type = "skin", Name = "Ranger", Skin = "Beach", Details = "Beach"},
            {Type = "skin", Name = "Trapper", Skin = "Coconut Lover", Details = "Coconut Lover"},
            {Type = "skin", Name = "Saboteur", Skin = "Coral Princess", Details = "Coral Princess"},
            {Type = "skin", Name = "Military Base", Skin = "Ice Cream", Details = "Ice Cream"},
            {Type = "skin", Name = "Hacker", Skin = "Pool Day", Details = "Pool Day"},
            {Type = "skin", Name = "Farm", Skin = "Popsicle Vendor", Details = "Popsicle Vendor"},
            {Type = "skin", Name = "Commander", Skin = "Seal", Details = "Seal"},
        },
    },
}
v4[4] = v8
v4[5] = {
    Type = "Items",
    Props = {
        Minimize = 0.6,
        Items = {
            {
                Type = "crate",
                Name = "Scuba Ops",
                Details = "<font color=\"rgb(80,255,130)\">4,500 Coins or Robux</font>",
            },
            {Type = "skin", Name = "Hunter", Skin = "Scuba Ops", Details = "Scuba Ops"},
            {Type = "skin", Name = "Brawler", Skin = "Scuba Ops", Details = "Scuba Ops"},
            {Type = "skin", Name = "Pyromancer", Skin = "Scuba Ops", Details = "Scuba Ops"},
            {Type = "skin", Name = "Engineer", Skin = "Scuba Ops", Details = "Scuba Ops"},
            {Type = "skin", Name = "Shotgunner", Skin = "Scuba Ops", Details = "Scuba Ops"},
        },
    },
}
v4[6] = v10
v4[7] = {
    Type = "Items",
    Props = {
        Minimize = 0.6,
        Items = {
            {
                Type = "crate",
                Name = "Patriotic",
                Details = "<font color=\"rgb(80,255,130)\">4,500 Coins or Robux</font>",
            },
            {Type = "skin", Name = "Warden", Skin = "Patriotic", Details = "Patriotic"},
            {Type = "skin", Name = "Cowboy", Skin = "Patriotic", Details = "Patriotic"},
            {Type = "skin", Name = "Soldier", Skin = "Patriotic", Details = "Patriotic"},
            {Type = "skin", Name = "Pursuit", Skin = "Patriotic", Details = "Patriotic"},
            {Type = "skin", Name = "Commander", Skin = "Patriotic", Details = "Patriotic"},
            {Type = "skin", Name = "Military Base", Skin = "Base 1776", Details = "Base 1776"},
        },
    },
}
v4[8] = {
    Type = "Log",
    Props = {
        HeaderName = "Hardcore and Survival Rewards",
        HeaderSubject = "All of these crates can be earned through Hardcore and Survival modes.",
        Points = {},
    },
}
v4[9] = {
    Type = "Log",
    Props = {
        HeaderName = "Firework Technician Returns",
        HeaderSubject = "Firework Technician is back for a limited time through the \"Rise For The Pledge!\" Mission Quest.",
        Points = {"Complete the mission quest before it leaves to unlock the tower."},
    },
}
v4[10] = {
    Type = "Items",
    Props = {
        Items = {
            {
                Type = "tower",
                Name = "Firework Technician",
                Skin = "Default",
                Details = "<font color=\"rgb(250,72,72)\">LIMITED TIME</font>",
            },
        },
    },
}
v4[11] = {
    Type = "Log",
    Props = {
        HeaderName = "Limited-Time Tower Returns",
        HeaderSubject = "Commando and Frost Blaster are also back for a limited time through their gamepasses.",
        Points = {},
    },
}
v4[12] = {
    Type = "Items",
    Props = {
        Items = {
            {
                Type = "tower",
                Name = "Commando",
                Skin = "Default",
                Details = "<font color=\"rgb(250,72,72)\">LIMITED TIME</font>",
            },
        },
    },
}
v4[13] = {Type = "GamepassButton", Props = {gamepassId = 977109244}}
v4[14] = {
    Type = "Items",
    Props = {
        Items = {
            {
                Type = "tower",
                Name = "Frost Blaster",
                Skin = "Default",
                Details = "<font color=\"rgb(250,72,72)\">LIMITED TIME</font>",
            },
        },
    },
}
v4[15] = {Type = "GamepassButton", Props = {gamepassId = 7846530}}
v4[16] = {
    Type = "Log",
    Props = {
        HeaderName = "Looking Ahead",
        HeaderSubject = "You can expect to see one more summer-themed update dropping next update: all new ocean-inspired skins in the Pirate Crate.",
        Points = {},
    },
}
v5 = {Type = "Log"}
v6 = {
    HeaderName = "Kingpin",
    HeaderSubject = "And, while we're not quite ready to pull the curtain back yet, Kingpin is getting closer. You'll hear more about him when the time comes.",
}
v7 = {}
local u111 = 85439697891186
local u112 = nil

v7[1] = function(a1, a2) -- Line: 6 -- upvalues: ImageCaption (val), u111 (val), u112 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u111, Text = u112})
end

v6.Points = v7
v5.Props = v6
v4[17] = v5
v4[18] = {Type = "EventButton", Props = {eventId = "1929561047681860258"}}
v3.Content = v4
v2[1] = v3
v1.Sections = v2
return v1