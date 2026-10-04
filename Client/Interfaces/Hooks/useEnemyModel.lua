-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useEnemyModel
-- Decompile time: 4.04 ms

local InsertService = game:GetService("InsertService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EnemiesModel = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.EnemiesModel)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local u39 = RunService:IsRunning()
local ENEMIES_PACKAGE_ID = SharedGameConstants.ENEMIES_PACKAGE_ID
local LEGACY_ENEMIES_PACKAGE_ID = SharedGameConstants.LEGACY_ENEMIES_PACKAGE_ID
local Streaming = Network.Channel("Streaming")
local useEffect = React.useEffect
local useState = React.useState

local function requestEnemyModel(a1, a2) -- Line: 20
    -- upvalues: u39 (val), ReplicatedStorage (val), InsertService (val), ENEMIES_PACKAGE_ID (val)
    -- upvalues: LEGACY_ENEMIES_PACKAGE_ID (val), EnemiesModel (val)
    local v1
    if u39 then
        return EnemiesModel(a1, a2)
    end
    local ENEMY_PACKAGE = ReplicatedStorage:FindFirstChild("ENEMY_PACKAGE")
    local LEGACY_ENEMY_PACKAGE = ReplicatedStorage:FindFirstChild("LEGACY_ENEMY_PACKAGE")
    if not ENEMY_PACKAGE and not a2 then
        ENEMY_PACKAGE = InsertService:LoadAsset(ENEMIES_PACKAGE_ID):GetChildren()[1]
        ENEMY_PACKAGE.Name = "ENEMY_PACKAGE"
        ENEMY_PACKAGE.Parent = ReplicatedStorage
    end
    if not LEGACY_ENEMY_PACKAGE and a2 then
        LEGACY_ENEMY_PACKAGE = InsertService:LoadAsset(LEGACY_ENEMIES_PACKAGE_ID):GetChildren()[1]
        LEGACY_ENEMY_PACKAGE.Name = "LEGACY_ENEMY_PACKAGE"
        LEGACY_ENEMY_PACKAGE.Parent = ReplicatedStorage
    end
    if not (if not a2 then ENEMY_PACKAGE:FindFirstChild(a1) else LEGACY_ENEMY_PACKAGE:FindFirstChild(a1)) then
        return nil
    end
    return v1:FindFirstChild("Model")
end

return function(a1, a2) -- Line: 55
    -- upvalues: useState (val), useEffect (val), u39 (val), Streaming (val), requestEnemyModel (val)
    local v1, u5 = useState(nil)
    local v2 = {a1, a2}
    useEffect(function() -- Line: 58
        -- upvalues: a1 (val), u5 (val), a2 (val), u39 (upval), Streaming (upval), requestEnemyModel (upval)
        if not a1 then
            u5(nil)
            return
        end
        local u4 = false
        local u7 = a2 == true
        u5(nil)
        if u39 then
            Streaming:FireServer("SelectEnemy", a1, u7)
        end
        task.spawn(function() -- Line: 72 -- upvalues: requestEnemyModel (upval), a1 (upval), u7 (val), u4 (ref), u5 (upval)
            local success, result = pcall(requestEnemyModel, a1, u7)
            if u4 then
                return
            end
            if success then
                u5(result)
                return
            end
            local v1 = a1
            warn((("Failed to load enemy model for %*: %*"):format(v1, result)))
            u5(nil)
        end)
        return function() -- Line: 88 -- upvalues: u4 (ref), u39 (upval), Streaming (upval), u7 (val), a1 (upval)
            u4 = true
            if u39 then
                Streaming:FireServer("RemoveEnemies", u7, {a1})
            end
        end
    end, v2)
    return v1
end