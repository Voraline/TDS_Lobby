-- Script path: ReplicatedStorage.Client.Controllers.Shared.SettingsController.Modules.User
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local GameSettings = UserSettings().GameSettings
local u13 = {}
u13.Updated = Signal.new()

function u13.Get(a1, a2) -- Line: 11 -- upvalues: GameSettings (val)
    local success, result = pcall(function() -- Line: 12 -- upvalues: GameSettings (upval), a2 (val)
        return GameSettings[a2]
    end)
    if success then
        return not (typeof(result) ~= "EnumItem") and result.Value or result
    end
end

function u13.GetAll(a1) -- Line: 22 -- upvalues: GameSettings (val)
    return {
        SavedQualityLevel = GameSettings.SavedQualityLevel,
        ControlMode = GameSettings.ControlMode,
        MouseSensitivity = GameSettings.MouseSensitivity,
    }
end

function u13.On(a1, a2, a3) -- Line: 30
    return a1.Updated:Connect(function(a1, a2_2) -- Line: 31 -- upvalues: a2 (val), a3 (val)
        local v1 = false
        if a2 == a1 then
            v1 = a3(a2_2)
        end
        return v1
    end)
end

GameSettings.Changed:Connect(function(a1) -- Line: 38 -- upvalues: u13 (val)
    u13.Updated:Fire(a1, (u13:Get(a1)))
end)
return u13