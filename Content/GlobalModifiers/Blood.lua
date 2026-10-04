-- Script path: ReplicatedStorage.Content.GlobalModifiers.Blood
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u15 = {
    [Enum.SavedQualitySetting.QualityLevel2] = 1,
    [Enum.SavedQualitySetting.QualityLevel3] = 1,
    [Enum.SavedQualitySetting.QualityLevel4] = 1,
    [Enum.SavedQualitySetting.QualityLevel5] = 2,
    [Enum.SavedQualitySetting.QualityLevel6] = 2,
    [Enum.SavedQualitySetting.QualityLevel7] = 2,
    [Enum.SavedQualitySetting.QualityLevel8] = 2,
    [Enum.SavedQualitySetting.QualityLevel9] = 2,
    [Enum.SavedQualitySetting.QualityLevel10] = 4,
    [Enum.SavedQualitySetting.Automatic] = 2,
    [Enum.SavedQualitySetting.QualityLevel1] = 0,
}
return {
    displayName = "Blood",
    description = "It's actually pizza sauce!",
    icon = 11416875395,
    onEnableClient = function(a1, a2, a3) -- Line: 25 -- upvalues: ReplicatedStorage (val), LegacyMiddleware (val), u15 (val)
        local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 32 -- upvalues: u15 (upval), EffectsController (val)
            if not a2 then
                return nil
            end
            a2.OnDestroy:Connect(function() -- Line: 37 -- upvalues: u15 (upval), EffectsController (upval), a2 (val)
                local UserGameSettings = UserSettings():GetService("UserGameSettings")
                local v1 = u15[UserGameSettings.SavedQualityLevel]
                if v1 == 0 then
                    return
                end
                EffectsController.BloodDrop({
                    range = 10,
                    dtMultiplier = 5,
                    gravity = -4,
                    direction = Vector3.new(4, 0, 4),
                    npc = a2,
                    amount = v1,
                    velocity = NumberRange.new(1, 4),
                })
            end)
            return a2
        end, nil, 99))
    end,
}