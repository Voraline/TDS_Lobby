-- Script path: ReplicatedStorage.Client.Interfaces
-- Decompile time: 1.72 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Value = workspace:WaitForChild("Type").Value
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local LegacyInterface = require(script:WaitForChild("LegacyInterface"))
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local SettingsStore = require(script.Stores.Shared.SettingsStore)
local ViewController = require(script.LegacyInterface.Controllers.ViewController)
local v1 = {}
local LocalPlayer = Players.LocalPlayer
local u48 = false

local function startLegacyInterface() -- Line: 23 -- upvalues: u48 (ref), LegacyInterface (val)
    if u48 then
        return
    end
    u48 = true
    task.spawn(function() -- Line: 29 -- upvalues: LegacyInterface (upval)
        LegacyInterface:init()
    end)
end

local function getMissingGameUIReadiness() -- Line: 34
    -- upvalues: GameState (val), PlayerReplicator (val), SettingsStore (val)
    local v1 = {}
    if not GameState.Replicator then
        table.insert(v1, "gameState")
    end
    local v2 = PlayerReplicator.GetLocalPlayerRaw()
    if not v2 or v2.SessionLoaded ~= true then
        table.insert(v1, "playerSession")
    end
    if SettingsStore.getGameSetting("Tower 1") == nil then
        table.insert(v1, "settings")
    end
    return v1
end

local function waitForGameUIReadiness() -- Line: 53 -- upvalues: getMissingGameUIReadiness (val)
    local v1 = os.clock()
    local v2 = getMissingGameUIReadiness()
    while v2[1] do
        if 15 <= os.clock() - v1 then
            warn((("[UI] Timed out waiting for game UI readiness: %*"):format((table.concat(v2, ", ")))))
            return
        end
        task.wait()
        v2 = getMissingGameUIReadiness()
    end
end

function v1.Init() -- Line: 68
    -- upvalues: ViewController (val), Value (val), waitForGameUIReadiness (val), u48 (ref), LegacyInterface (val)
    ViewController:init()
    if Value == "Lobby" then
        if not u48 then
            u48 = true
            task.spawn(function() -- Line: 29 -- upvalues: LegacyInterface (upval)
                LegacyInterface:init()
            end)
        end
        require(script:WaitForChild("Lobby")).Init()
    else
        waitForGameUIReadiness()
        if not u48 then
            u48 = true
            task.spawn(function() -- Line: 29 -- upvalues: LegacyInterface (upval)
                LegacyInterface:init()
            end)
        end
        require(script:WaitForChild("Game")).Init()
        require(script:WaitForChild("NPCViews")).Init()
    end
    require(script:WaitForChild("Universal")).Init()
end

return v1