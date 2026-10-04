-- Script path: ReplicatedStorage.Content.GlobalModifiers.LostSouls
-- Decompile time: 2.69 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Workspace = game:GetService("Workspace")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u46 = Random.new()
return {
    displayName = "Lost Souls",
    description = "The game just got harder.",
    icon = 11417699882,
    onEnableServer = function(a1, a2, a3) -- Line: 19
        -- upvalues: ServerStorage (val), LegacyMiddleware (val), Enum (val), Lighting (val), Workspace (val), u46 (val)
        -- upvalues: GameState (val), Players (val)
        local SessionsService = require(ServerStorage.Server.Services.Shared.SessionsService)
        a1.task(task.spawn(function() -- Line: 22
            -- upvalues: a1 (val), LegacyMiddleware (upval), Enum (upval), Lighting (upval), Workspace (upval)
            -- upvalues: u46 (upval), SessionsService (val), GameState (upval), a3 (val), Players (upval)
            local modifyInstance, v1, v2

            local function u138(a1, a2, a3) -- Line: 41
                return "Lost Souls", a3
            end

            a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 31
                a2.Defense = a2.Defense + 20
                a2.MaxDefense = a2.MaxDefense + 20
                a2.Replicator:Set("Defense", a2.Defense)
                a2.Replicator:Set("MaxDefense", a2.MaxDefense)
                return a2
            end))
            a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.EnemyRequestSpawn, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 23
                local v1 = table.clone(a2)
                v1.Amount = math.clamp(math.floor(a2.Amount * 1.5), 1, (1 / 0))
                return v1
            end))
            a1.middleware(LegacyMiddleware:Hook(Enum.HookType.OnGameRewarded, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 45
                if not a2.Badges then
                    a2.Badges = {}
                end
                table.insert(a2.Badges, 2129234540)
                return a2
            end))
            a1.makeInstance("ColorCorrectionEffect", {Saturation = -1, Tags = {"DONT_TOUCH"}, Parent = Lighting})
            a1.modifyInstance(Workspace.Music, {Value = "Lost Souls"})
            for i, j in workspace:WaitForChild("Map"):GetDescendants() do
                if j:IsA("BasePart") then
                    modifyInstance = a1.modifyInstance
                    v1 = {}
                    v2 = if u46:NextInteger(0, 1) ~= 1 then Color3.fromRGB(0, 0, 0) else Color3.fromRGB(255, 255, 255)
                    v1.Color = v2
                    modifyInstance(j, v1)
                end
            end
            local u77 = {"Scout", "Minigunner", "Shotgunner", "Commander"}

            local function checkPlayer(a1_2) -- Line: 107
                -- upvalues: a1 (upval), SessionsService (upval), u77 (val), GameState (upval), a3 (upval)
                -- upvalues: LegacyMiddleware (upval), Enum (upval), u138 (val)
                a1.promise(((SessionsService.WaitPromise(a1_2)):andThen(function(a1_2) -- Line: 109
                    -- upvalues: u77 (upval), GameState (upval), a3 (upval), a1 (upval), LegacyMiddleware (upval)
                    -- upvalues: Enum (upval), u138 (upval)
                    local Troops = a1_2.Data.Equipped.Troops
                    for k, v in pairs(u77) do
                        if not table.find(Troops, v) and GameState.GameMode ~= "Sandbox" then
                            return a3()
                        end
                    end
                    a1.middleware(LegacyMiddleware:Hook(
                        Enum.HookType.OnWaveMusicCreated,
                        LegacyMiddleware.Boundedness.Outbound,
                        u138,
                        nil,
                        1,
                        LegacyMiddleware.MiddlewarePriority.Replace
                    ))
                end)):catch(warn))
            end

            a1.connect(Players.PlayerAdded, checkPlayer)
            for i2, v in ipairs(Players:GetPlayers()) do
                checkPlayer(v)
            end
        end))
    end,
}