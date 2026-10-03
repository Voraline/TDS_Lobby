-- Script path: ReplicatedStorage.Content.GlobalModifiers.AprilFoolsSkirbi
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Brain Rot",
    description = "Dop dop yes yes",
    icon = 16972125270,
    onEnableServer = function(a1, a2, a3) -- Line: 12 -- upvalues: ServerStorage (val), Enum (val)
        require(ServerStorage.Server.Modules.ServerGameMiddleware).MemeMode()
        a1.task(task.spawn(function() -- Line: 16 -- upvalues: ServerStorage (upval), Enum (upval)
            task.wait(6)
            local GameService = require(ServerStorage.Server.Services.Game.GameService)
            GameService.InitializePaths(
                GameService.LoadMap("Headache Headquarters", "Survival"):WaitForChild("Paths"),
                Enum.Team.Player,
                true
            )
            local EnemyService = require(ServerStorage.Server.Services.Game.EnemyService)
            local TowerService = require(ServerStorage.Server.Services.Game.TowerService)
            require(ServerStorage.Server.Services.Game.UnitService).Clear()
            EnemyService.Clear(false)
            TowerService.RefundTowers(0)
        end))
    end,
}