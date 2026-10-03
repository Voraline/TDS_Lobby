-- Script path: ReplicatedStorage.Client.Interfaces.Lobby
-- Decompile time: 1.75 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local v1 = {}
local u28 = {AdidasEvent = true}

local function warnViewError(a1, a2, a3) -- Line: 15 -- types: a1: string, a2: string
    warn((("Error occurred while %* lobby view \"%*\": %*"):format(a1, a2, a3)))
end

local function mountView(a1, a2) -- Line: 19
    -- upvalues: Create (val), ReactRoblox (val), createElement (val)
    local Name = a2.Name
    local success, result = pcall(require, a2)
    if not success then
        warn((("Error occurred while loading lobby view \"%*\": %*"):format(Name, result)))
        return
    end
    if typeof(result) ~= "function" and typeof(result) ~= "table" then
        local v1 = ("view returned %* instead of React component"):format((typeof(result)))
        warn((("Error occurred while loading lobby view \"%*\": %*"):format(Name, v1)))
        return
    end
    local v2 = {
        ResetOnSpawn = false,
        Name = ("ReactLobby%*"):format(Name),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = a1,
    }
    v2.DisplayOrder = if Name == "Winter2024Event" then 9999999 else if Name ~= "CutsceneSkipButton" then 0 else 9999999
    local u57 = Create("ScreenGui", v2)
    local u61 = ReactRoblox.createRoot(u57)
    local u72 = createElement(result, {
        setZIndexBehavior = function(a1) -- Line: 44 -- upvalues: u57 (val)
            u57.ZIndexBehavior = a1
        end,
        setDisplayOrder = function(a1) -- Line: 47 -- upvalues: u57 (val)
            u57.DisplayOrder = a1
        end,
        setIgnoreGuiInset = function(a1) -- Line: 50 -- upvalues: u57 (val)
            u57.IgnoreGuiInset = a1
        end,
        setScreenInsets = function(a1) -- Line: 53 -- upvalues: u57 (val)
            u57.ScreenInsets = a1
        end,
        screen = u57,
    })
    local success_2, result_2 = pcall(function() -- Line: 59 -- upvalues: u61 (val), u72 (val)
        u61:render(u72)
    end)
    if not success_2 then
        warn((("Error occurred while rendering lobby view \"%*\": %*"):format(Name, result_2)))
        u57:Destroy()
    end
end

function v1.Init() -- Line: 68 -- upvalues: Players (val), u28 (val), mountView (val)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    for i, v in ipairs(script.Views:GetChildren()) do
        if v:IsA("ModuleScript") and not u28[v.Name] then
            task.spawn(mountView, PlayerGui, v)
        end
    end
end

return v1