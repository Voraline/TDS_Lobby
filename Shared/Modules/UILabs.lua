-- Script path: ReplicatedStorage.Shared.Modules.UILabs
-- Decompile time: 0.57 ms

local RunService = game:GetService("RunService")
local u7 = RunService:IsRunning()
local u10 = RunService:IsStudio()

local function getEnv() -- Line: 14 -- upvalues: u7 (val), u10 (val)
    if not u7 and u10 then
        return getfenv().__hotreload_env_global_injection__
    end
    return nil
end

return {
    isStory = function() -- Line: 40 -- upvalues: getEnv (val)
        return getEnv() ~= nil
    end,
    getEnv = getEnv,
    getPlugin = function() -- Line: 25 -- upvalues: getEnv (val)
        local v1 = getEnv()
        return v1 and v1.Plugin
    end,
    getPluginWidget = function() -- Line: 30 -- upvalues: getEnv (val)
        local v1 = getEnv()
        return v1 and v1.Widget
    end,
    getStoryJanitor = function() -- Line: 35 -- upvalues: getEnv (val)
        local v1 = getEnv()
        return v1 and v1.StoryJanitor
    end,
}