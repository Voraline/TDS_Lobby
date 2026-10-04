-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCrateQueue
-- Decompile time: 4.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Promise = require(ReplicatedStorage.Packages.Promise)
local React = require(ReplicatedStorage.Shared.UI.React)
local Crate = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Inventory.Components.Crate)
local MedalLobbyMomentsController = require(ReplicatedStorage.Client.Controllers.Lobby.MedalLobbyMomentsController)
local UnboxingController = require(ReplicatedStorage.Client.Controllers.Shared.UnboxingController)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local u42 = {}
local u43 = false

local function processQueue() -- Line: 19
    -- upvalues: ViewController (val), u42 (val), Crate (val), Promise (val), ReplicatedStorage (val)
    -- upvalues: UnboxingController (val), u43 (ref)
    local Items, data, type, v1, v2, v3
    local v4 = 0
    local v5 = ViewController:getCurrentView()
    ViewController:setView("Crate")
    repeat
        v4 = v4 + 1
        v1 = u42[v4]
        if not v1 then
            break
        end
        type = v1.type
        data = v1.data
        if type == "skins" then
            Crate:Start(data):await()
        elseif type == "consumables" then
            local Name = data.Name
            Items = data.Items
            v2 = nil
            v3 = nil
            for i, j in Items, v2, v3 do
                if i == 1 then
                    u37 = true
                else
                    local u37 = false
                end
                if i == #Items then
                    u43_2 = true
                else
                    local u43_2 = false
                end
                Promise.new(function(a1, a2) -- Line: 45
                    -- upvalues: u37 (val), ReplicatedStorage (upval), Name (val), UnboxingController (upval), j (val)
                    -- upvalues: u43_2 (val)
                    local Model = u37 and ReplicatedStorage.Assets.Crates[Name].Model
                    local v1, v2 = UnboxingController.GetMetadataForReward("Consumable", j.name)
                    local finished = v2.finished
                    v2.crateScale = 0.25
                    v2.cratePosition = CFrame.new(0, 0, -2.2)
                    v2.claimText = if not u43_2 then "Next" else "Claim"
                    v2.fadeIn = u37
                    v2.fadeOut = u43_2

                    function v2.finished() -- Line: 60 -- upvalues: finished (val), a1 (val)
                        if finished then
                            finished()
                        end
                        a1()
                    end

                    UnboxingController.Unbox(Model, v1, v2)
                end):await()
            end
        end
    until not u42[v4]
    ViewController:setView(v5)
    table.clear(u42)
    u43 = false
end

local function queueCrate(a1, a2) -- Line: 80
    -- upvalues: MedalLobbyMomentsController (val), u42 (val), u43 (ref), processQueue (val)
    MedalLobbyMomentsController.TrackCrateResults(a1, a2)
    table.insert(u42, {type = a1, data = a2})
    if not u43 then
        u43 = true
        processQueue()
    end
end

return function() -- Line: 95 -- upvalues: React (val), queueCrate (ref)
    return React.useCallback(function(a1, a2) -- Line: 96 -- upvalues: queueCrate (upval) -- types: a1: string
        queueCrate(a1, a2)
    end, {})
end