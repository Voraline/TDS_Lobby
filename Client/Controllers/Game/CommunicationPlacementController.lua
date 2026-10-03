-- Script path: ReplicatedStorage.Client.Controllers.Game.CommunicationPlacementController
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u5 = {}
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Communication = require(ReplicatedStorage.Shared.Data.Communication)
local CommunicationController = require(ReplicatedStorage.Client.Controllers.Game.CommunicationController)
local CommunicationTowerModel = require(ReplicatedStorage.Client.Modules.CommunicationTowerModel)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local NewPlacementController = require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
local u39 = Maid.new()

local function isGame() -- Line: 16
    return workspace:WaitForChild("Type").Value == "Game"
end

local function getYawDegrees(a1) -- Line: 20 -- types: a1: userdata
    local v1
    _, v1 = a1:ToOrientation()
    return (math.deg(v1))
end

function u5.stop() -- Line: 25 -- upvalues: u39 (val), NewPlacementController (val)
    if not (workspace:WaitForChild("Type").Value == "Game") then
        return
    end
    u39:Sweep()
    NewPlacementController:Stop()
end

function u5.start(a1, a2) -- Line: 34
    -- upvalues: u5 (val), u39 (val), Asset (val), CommunicationTowerModel (val), NewPlacementController (val)
    -- upvalues: CommunicationController (val), Communication (val)
    if not (workspace:WaitForChild("Type").Value == "Game") then
        return
    end
    u5.stop()
    local u14 = true
    u39:Mark(function() -- Line: 43 -- upvalues: u14 (ref)
        u14 = false
    end)
    u39:Mark((task.spawn(function() -- Line: 47
        -- upvalues: Asset (upval), a2 (val), CommunicationTowerModel (upval), u14 (ref), NewPlacementController (upval)
        -- upvalues: CommunicationController (upval), Communication (upval), a1 (val)
        local v1 = Asset("Troops", a2)
        local v2 = CommunicationTowerModel.get(a2, "Default")
        if u14 and v1 and v2 then
            local Defaults = v1.Stats.Default.Defaults
            NewPlacementController:Start({
                QuickPlaceEnabled = false,
                Name = a2,
                Class = v1.Properties.Class,
                Asset = v1,
                Model = v2,
                Range = Defaults.Range,
                Deadzone = Defaults.Attributes and Defaults.Attributes.Deadzone or 0,
                Buildzone = Defaults.Attributes and Defaults.Attributes.Buildzone or 0,
                OnPlace = function(a1_2, a2_2) -- Line: 65
                    -- upvalues: CommunicationController (upval), Communication (upval), a1 (upval), a2 (upval)
                    local v1
                    local requestSuggestion = CommunicationController.requestSuggestion
                    local v2 = {
                        type = Communication.Type.PlaceTower,
                        targetUserId = a1,
                        towerName = a2,
                        position = a1_2,
                    }
                    _, v1 = a2_2:ToOrientation()
                    v2.rotation = math.deg(v1)
                    requestSuggestion(v2)
                end,
            })
            return
        end
    end)))
end

return u5