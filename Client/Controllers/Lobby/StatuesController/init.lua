-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController
-- Decompile time: 2.58 ms

local CollectionService = game:GetService("CollectionService")
local Animated = require(script.Types.Animated)
local Challenge = require(script.Types.Challenge)
local Christmas = require(script.Types.Christmas)
local Event = require(script.Types.Event)
local Night = require(script.Types.Night)
local Purchase = require(script.Types.Purchase)
local UGCAnimated = require(script.Types.UGCAnimated)
local u40 = {
    Animated = {},
    Purchase = {},
    Night = {},
    UGCAnimated = {},
    Christmas = {},
    Event = {},
    Challenge = {},
}

local function connectTagToStatue(a1, a2, a3) -- Line: 26 -- upvalues: u40 (val), CollectionService (val)
    local u4 = u40[a1]
    if not u4 then
        warn("Invalid statue type: " .. a1)
        return
    end

    local function addStatue(a1) -- Line: 33 -- upvalues: u4 (val), a3 (val) -- types: a1: userdata
        if u4[a1] then
            return
        end
        u4[a1] = (a3.new(a1))
    end

    ;(CollectionService:GetInstanceAddedSignal(a2)):Connect(addStatue)
    ;(CollectionService:GetInstanceRemovedSignal(a2)):Connect(function(a1) -- Line: 41 -- upvalues: u4 (val) -- types: a1: userdata
        local v1 = u4[a1]
        if v1 then
            if v1.Destroy then
                v1:Destroy()
            end
            u4[a1] = nil
        end
    end)
    for i, v in ipairs(CollectionService:GetTagged(a2)) do
        task.spawn(addStatue, v)
    end
end

local v1 = {
    init = function() -- Line: 62
        -- upvalues: connectTagToStatue (val), Animated (val), Purchase (val), Night (val), UGCAnimated (val)
        -- upvalues: Christmas (val), Event (val), Challenge (val)
        connectTagToStatue("Animated", "STATUE", Animated)
        connectTagToStatue("Purchase", "PURCHASE_STATUE", Purchase)
        connectTagToStatue("Night", "NIGHT_STATUE", Night)
        connectTagToStatue("UGCAnimated", "UGC_STATUE", UGCAnimated)
        connectTagToStatue("Christmas", "CHRISTMAS_STATUE", Christmas)
        connectTagToStatue("Event", "EVENT_STATUE", Event)
        connectTagToStatue("Challenge", "CHALLENGE_STATUE", Challenge)
    end,
}
task.spawn(v1.init)
return u40