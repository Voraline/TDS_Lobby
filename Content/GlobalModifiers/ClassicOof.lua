-- Script path: ReplicatedStorage.Content.GlobalModifiers.ClassicOof
-- Decompile time: 0.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Classic Oof",
    description = "Classic roblox styled oofs.",
    icon = 269363975,
    onEnableClient = function(a1, a2, a3) -- Line: 13 -- upvalues: LegacyMiddleware (val), Create (val), GameState (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 18 -- upvalues: Create (upval), GameState (upval)
            a2.OnDestroy:Connect(function() -- Line: 19 -- upvalues: Create (upval), a2 (val), GameState (upval)
                local u11 = Create("Attachment", {
                    WorldPosition = a2.Model:GetPivot().Position,
                    Parent = workspace.Terrain,
                })
                local v1 = Create("Sound", {
                    SoundId = "rbxassetid://17564423313",
                    Volume = 0.2,
                    PlaybackSpeed = 1 * GameState.TimeScale,
                    Parent = u11,
                })
                v1.Ended:Connect(function() -- Line: 32 -- upvalues: u11 (val)
                    u11:Destroy()
                end)
                v1:Play()
            end)
            return a2
        end))
    end,
}