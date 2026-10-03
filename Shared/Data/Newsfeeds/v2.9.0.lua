-- Script path: ReplicatedStorage.Shared.Data.Newsfeeds.v2.9.0
-- Decompile time: 2.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)

local function imageLabel(a1, a2) -- Line: 7 -- upvalues: ImageCaption (val)
    return function(a1_2, a2_2) -- Line: 8 -- upvalues: ImageCaption (upval), a2 (val), a1 (val)
        return ImageCaption({Transparency = a2_2.Transparency, LayoutOrder = a1_2, Image = a2, Text = a1})
    end
end

local function saleDetails(a1) -- Line: 18
    return (("<font color=\"rgb(250,72,72)\">%*</font>"):format(a1))
end

local function gamepassItems(a1, a2) -- Line: 22
    return {Type = "GamepassItems", Props = {maxItemsPerRow = a1, Offers = a2}}
end

local v1 = {UpdateName = "SUMMER, EXIT STAGE LEFT", ImageId = 89093542711696}
local v2 = {}
local v3 = {Name = "Update Log:"}
local v4 = {}
local v5 = {Type = "Log"}
local v6 = {
    HeaderName = "End of Summer Skin Drop",
    HeaderSubject = "Summer may be coming to an end, but we're not letting it go without one last celebration!",
}
local v7 = {}
local u23 = 116507746540860
local u24 = nil
local u27 = 124314768113050
local u28 = nil

v7[1] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u23 (val), u24 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u23, Text = u24})
end

v7[2] = "We've added five new summer-themed skins to close out Summer. Check out Beach Mortar, Beach Demoman, Pool Day Crook Boss, Surfs Up Warlock, and Abyssal Enforcer in the Beach crate."

v7[3] = function(a1, a2) -- Line: 8 -- upvalues: ImageCaption (val), u27 (val), u28 (val)
    return ImageCaption({Transparency = a2.Transparency, LayoutOrder = a1, Image = u27, Text = u28})
end

v6.Points = v7
v5.Props = v6
v4[1] = v5
v4[2] = {
    Type = "Items",
    Props = {
        Minimize = 0.6,
        Items = {
            {Type = "tower", Name = "Mortar", Skin = "Beach", Details = "Beach"},
            {Type = "tower", Name = "Demoman", Skin = "Beach", Details = "Beach"},
            {Type = "tower", Name = "Crook Boss", Skin = "Pool Day", Details = "Pool Day"},
            {Type = "tower", Name = "Warlock", Skin = "Surfs Up", Details = "Surfs Up"},
            {
                Type = "tower",
                Name = "EvolvedEnforcer",
                DisplayName = "Enforcer",
                Skin = "Abyssal",
                Details = "Abyssal",
            },
            {
                Type = "crate",
                Name = "Beach26",
                Details = "<font color=\"rgb(80,255,130)\">4,500 Coins or Robux</font>",
            },
        },
    },
}
v4[3] = {
    Type = "Log",
    Props = {
        HeaderName = "Labor Day Sale",
        HeaderSubject = "In addition to the skin drop, we’ve introduced the following sales through September 8th:",
        Points = {},
    },
}
v4[4] = {Type = "Log", Props = {Points = {"Mercenary Base, Gatling Gun, and Hacker will be 30% off."}}}
v4[5] = {
    Type = "GamepassItems",
    Props = {
        maxItemsPerRow = 3,
        Offers = {
            {
                name = "Mercenary Base",
                gamepassId = 786591818,
                details = "<font color=\"rgb(250,72,72)\">30% OFF</font>",
            },
            {
                name = "Gatling Gun",
                gamepassId = 924927232,
                details = "<font color=\"rgb(250,72,72)\">30% OFF</font>",
            },
            {
                name = "Hacker",
                gamepassId = 1252103819,
                details = "<font color=\"rgb(250,72,72)\">30% OFF</font>",
            },
        },
    },
}
v4[6] = {Type = "Log", Props = {Points = {"Crook Boss, Warden, and Engineer will be 25% off."}}}
v4[7] = {
    Type = "GamepassItems",
    Props = {
        maxItemsPerRow = 3,
        Offers = {
            {
                name = "Crook Boss",
                gamepassId = 6757455,
                details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
            },
            {
                name = "Warden",
                gamepassId = 99570026,
                details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
            },
            {
                name = "Engineer",
                gamepassId = 40385775,
                details = "<font color=\"rgb(250,72,72)\">25% OFF</font>",
            },
        },
    },
}
v4[8] = {
    Type = "Log",
    Props = {Points = {"We'll have Warlock and Sledger also on sale for you to purchase, as well."}},
}
v4[9] = {
    Type = "GamepassItems",
    Props = {
        maxItemsPerRow = 2,
        Offers = {
            {
                name = "Warlock",
                gamepassId = 1558344290,
                details = "<font color=\"rgb(250,72,72)\">ON SALE</font>",
            },
            {
                name = "Sledger",
                gamepassId = 13534631,
                details = "<font color=\"rgb(250,72,72)\">ON SALE</font>",
            },
        },
    },
}
v4[10] = {
    Type = "Log",
    Props = {
        Points = {
            "Following up the tower sales, VIP will be put on a 20% discount — alongside a 15% discount across all Currency Packs.",
        },
    },
}
v4[11] = {
    Type = "Log",
    Props = {
        HeaderSubject = "<font color=\"rgb(255,255,255)\">Please note: After this Labor Day celebration, Gladiator and Commando will be taken off sale. Now is your last chance to snag these!</font>",
        Points = {},
    },
}
v3.Content = v4
v2[1] = v3
v2[2] = {
    Name = "Bug Fixes and Changes:",
    Content = {
        {
            Type = "Log",
            Props = {
                Points = {
                    "Hid enemy targeting UI for towers that cannot change targeting modes.",
                    "Updated Shop and Inventory icons.",
                },
            },
        },
    },
}
v1.Sections = v2
return v1