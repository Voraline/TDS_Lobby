-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Environment
-- Decompile time: 1.04 ms

local UserInputService = game:GetService("UserInputService")
local u5 = {EnvGlobalInjectionKey = "__hotreload_env_global_injection__"}

function SearchInEnv(a1, a2) -- Line: 6 -- upvalues: u5 (val) -- types: a1: string
    local v1 = u5.GetEnvGlobalInjection()
    return v1 and v1[a1] or a2
end

function u5.GetEnvGlobalInjection() -- Line: 12 -- upvalues: u5 (val)
    return getfenv()[u5.EnvGlobalInjectionKey]
end

function u5.IsStory() -- Line: 17 -- upvalues: u5 (val)
    return u5.GetEnvGlobalInjection() ~= nil
end

function UserInputFallback(a1) -- Line: 22 -- upvalues: UserInputService (val)
    if not a1 or a1 == UserInputService then
        return UserInputService
    end
    return (setmetatable(table.clone(a1), {
        __index = function(a1, a2) -- Line: 32 -- upvalues: UserInputService (upval)
            local u3 = UserInputService[a2]
            if typeof(u3) == "function" then
                return function(a1, ...) -- Line: 36 -- upvalues: u3 (val), UserInputService (upval)
                    return u3(UserInputService, ...)
                end
            end
            return u3
        end,
    }))
end

u5.Unmount = SearchInEnv("Unmount", function() end)
u5.Reload = SearchInEnv("Reload", function() end)
u5.CreateSnapshot = SearchInEnv("CreateSnapshot", function() end)
u5.SetStoryHolder = SearchInEnv("SetStoryHolder", function() end)

function u5.GetJanitor() -- Line: 50
    return (SearchInEnv("StoryJanitor"))
end

u5.InputListener = SearchInEnv("InputListener", nil)
u5.UserInput = UserInputFallback(SearchInEnv("InputListener", UserInputService))
u5.EnvironmentUID = SearchInEnv("EnvironmentUID", "")
u5.PreviewUID = SearchInEnv("PreviewUID", "")
u5.OriginalG = SearchInEnv("OriginalG", _G)
u5.PluginWidget = SearchInEnv("PluginWidget", nil)
u5.Plugin = SearchInEnv("Plugin", plugin)
return u5