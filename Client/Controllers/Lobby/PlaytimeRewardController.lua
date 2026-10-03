-- Script path: ReplicatedStorage.Client.Controllers.Lobby.PlaytimeRewardController
-- Decompile time: 3.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local UnboxingController = require(ReplicatedStorage.Client.Controllers.Shared.UnboxingController)
local v1 = {}
local PlaytimeRewards = NewNetwork.Channel("PlaytimeRewards")

local function presentReward(a1) -- Line: 12 -- upvalues: UnboxingController (val), Promise (val) -- types: a1: table
    local u89, u90, v1, v2
    local type = a1.type
    if type == "stat" then
        v1, v2 = UnboxingController.GetMetadataForReward("Stat", a1.stat, a1.amount)
        u89 = v1
        u90 = v2
        u90.rewardSound = ""
        u90.exclusivity = "Currency"
        u90.exclusivityColor = Color3.fromRGB(255, 215, 0)
        return (Promise.new(function(a1) -- Line: 60 -- upvalues: u90 (ref), UnboxingController (upval), u89 (ref)
            local finished = u90.finished

            function u90.finished() -- Line: 62 -- upvalues: finished (val), a1 (val)
                if finished then
                    finished()
                end
                a1()
            end

            UnboxingController.Present(u89, u90)
        end))
    end
    if type == "crate" then
        v1, v2 = UnboxingController.GetMetadataForReward("Crate", a1.name)
        u89 = v1
        u90 = v2
        u90.rewardSound = ""
        u90.rewardScale = 0.25
        if a1.amount and 1 < a1.amount then
            u90.name = ("x%* %* Crates"):format(a1.amount, u90.name)
        end
        u90.exclusivity = "Crate"
        u90.exclusivityColor = Color3.fromRGB(100, 149, 237)
        return (Promise.new(function(a1) -- Line: 60 -- upvalues: u90 (ref), UnboxingController (upval), u89 (ref)
            local finished = u90.finished

            function u90.finished() -- Line: 62 -- upvalues: finished (val), a1 (val)
                if finished then
                    finished()
                end
                a1()
            end

            UnboxingController.Present(u89, u90)
        end))
    end
    if type == "consumable" then
        v1, v2 = UnboxingController.GetMetadataForReward("Consumable", a1.name)
        u89 = v1
        u90 = v2
        u90.rewardSound = ""
        if a1.amount and 1 < a1.amount then
            u90.name = ("x%* %*"):format(a1.amount, u90.name)
        end
        return (Promise.new(function(a1) -- Line: 60 -- upvalues: u90 (ref), UnboxingController (upval), u89 (ref)
            local finished = u90.finished

            function u90.finished() -- Line: 62 -- upvalues: finished (val), a1 (val)
                if finished then
                    finished()
                end
                a1()
            end

            UnboxingController.Present(u89, u90)
        end))
    end
    if type == "nametag" then
        v1, v2 = UnboxingController.GetMetadataForReward("Tag", a1.name)
        u89 = v1
        u90 = v2
        u90.rewardSound = ""
        return (Promise.new(function(a1) -- Line: 60 -- upvalues: u90 (ref), UnboxingController (upval), u89 (ref)
            local finished = u90.finished

            function u90.finished() -- Line: 62 -- upvalues: finished (val), a1 (val)
                if finished then
                    finished()
                end
                a1()
            end

            UnboxingController.Present(u89, u90)
        end))
    end
    if type == "emote" then
        v1, v2 = UnboxingController.GetMetadataForReward("Emote", a1.name)
        u89 = v1
        u90 = v2
        u90.rewardSound = ""
        return (Promise.new(function(a1) -- Line: 60 -- upvalues: u90 (ref), UnboxingController (upval), u89 (ref)
            local finished = u90.finished

            function u90.finished() -- Line: 62 -- upvalues: finished (val), a1 (val)
                if finished then
                    finished()
                end
                a1()
            end

            UnboxingController.Present(u89, u90)
        end))
    end
    if type ~= "skin" then
        warn((("Unknown reward type: %*"):format(type)))
        return (Promise.resolve())
    end
    v1, v2 = UnboxingController.GetMetadataForReward("Skin", a1.tower, a1.skin)
    u89 = v1
    u90 = v2
    u90.rewardSound = ""
    return (Promise.new(function(a1) -- Line: 60 -- upvalues: u90 (ref), UnboxingController (upval), u89 (ref)
        local finished = u90.finished

        function u90.finished() -- Line: 62 -- upvalues: finished (val), a1 (val)
            if finished then
                finished()
            end
            a1()
        end

        UnboxingController.Present(u89, u90)
    end))
end

function v1.init() -- Line: 73 -- upvalues: PlaytimeRewards (val), presentReward (val), Promise (val)
    PlaytimeRewards:onEvent("OnRewardClaimed", function(a1) -- Line: 74 -- upvalues: presentReward (upval), Promise (upval) -- types: a1: table
        local v1 = {}
        for i, j in a1 do
            table.insert(v1, (presentReward(j)))
        end
        Promise.all(v1):catch(function(a1) -- Line: 83
            warn((("Error presenting playtime rewards: %*"):format(a1)))
        end)
    end)
end

task.spawn(v1.init)
return v1