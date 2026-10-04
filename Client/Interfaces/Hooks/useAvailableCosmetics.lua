-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAvailableCosmetics
-- Decompile time: 3.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useStickers = require(ReplicatedStorage.Client.Interfaces.Hooks.useStickers)
local useCache = require(Hooks.useCache)
local useEmotes = require(Hooks.useEmotes)
local useFlairs = require(Hooks.useFlairs)
local useTags = require(Hooks.useTags)
local useTotems = require(Hooks.useTotems)
local useMemo = React.useMemo
return function(a1) -- Line: 45
    -- upvalues: useStickers (val), useEmotes (val), useTotems (val), useTags (val), useFlairs (val), useCache (val)
    -- upvalues: useMemo (val), Sift (val)
    local u2 = useStickers()
    local u4 = useEmotes()
    local u6 = useTotems()
    local u8 = useTags()
    local u10 = useFlairs()
    local u17 = useCache("Inventory.Nametags", {"Default", "Birds"}, a1)
    local u23 = useCache("Inventory.Flairs", {"Developer"}, a1)
    local u31 = useCache("Inventory.Stickers", {Clown = true, Flex = true, ["Sad Scout"] = true}, a1)
    local u39 = useCache("Inventory.Totems", {"Rift Walker", "Null Scout", "Default"}, a1)
    local u44 = useCache("Inventory.Emotes", u4, a1)
    local u49 = useCache("Equipped.Nametag", "Default", a1)
    local u54 = useCache("Equipped.Totem", "Default", a1)
    local u59 = useCache("Equipped.Flair", "", a1)
    local u64 = useCache("Equipped.Stickers", {}, a1)
    local u69 = useCache("Equipped.Emotes", {}, a1)
    return (useMemo(function() -- Line: 69
        -- upvalues: Sift (upval), u31 (val), u2 (val), u44 (val), u4 (val), u39 (val), u6 (val), u17 (val), u8 (val)
        -- upvalues: u23 (val), u10 (val), u64 (val), u69 (val), u54 (val), u49 (val), u59 (val)
        return {
            equipped = {
                stickers = u64,
                emotes = u69,
                totems = u54,
                tags = u49,
                flairs = u59,
            },
            inventory = {
                stickers = Sift.Dictionary.map(u31, function(a1, a2) -- Line: 70 -- upvalues: u2 (upval)
                    return u2[a2]
                end),
                emotes = Sift.Dictionary.map(u44, function(a1, a2) -- Line: 74 -- upvalues: u4 (upval)
                    return u4[a2]
                end),
                totems = Sift.Dictionary.map(u39, function(a1) -- Line: 78 -- upvalues: u6 (upval)
                    return u6[a1], a1
                end),
                tags = Sift.Dictionary.map(u17, function(a1) -- Line: 82 -- upvalues: u8 (upval)
                    return u8[a1], a1
                end),
                flairs = Sift.Dictionary.map(u23, function(a1) -- Line: 86 -- upvalues: u10 (upval)
                    return u10[a1], a1
                end),
            },
        }
    end, {
        u2,
        u4,
        u6,
        u8,
        u10,
        u31,
        u44,
        u39,
        u17,
        u23,
        u64,
        u69,
        u54,
        u49,
        u59,
    }))
end