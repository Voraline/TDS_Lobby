-- Script path: ReplicatedStorage.Client.Interfaces.Game
-- Decompile time: 1.53 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local v1 = {}

local function warnViewError(a1, a2, a3) -- Line: 12 -- types: a1: string, a2: string
    warn((("Error occurred while %* game view \"%*\": %*"):format(a1, a2, a3)))
end

local function mountView(a1, a2) -- Line: 16
    -- upvalues: Create (val), ReactRoblox (val), createElement (val)
    local Name = a2.Name
    local success, result = pcall(require, a2)
    if not success then
        warn((("Error occurred while loading game view \"%*\": %*"):format(Name, result)))
        return
    end
    if typeof(result) ~= "function" and typeof(result) ~= "table" then
        local v1 = ("view returned %* instead of React component"):format((typeof(result)))
        warn((("Error occurred while loading game view \"%*\": %*"):format(Name, v1)))
        return
    end
    local u48 = Create("ScreenGui", {
        ResetOnSpawn = false,
        Name = ("ReactGame%*"):format(Name),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = a1,
    })
    local u52 = ReactRoblox.createRoot(u48)
    local u60 = createElement(result, {
        setZIndexBehavior = function(a1) -- Line: 38 -- upvalues: u48 (val)
            u48.ZIndexBehavior = a1
        end,
        setDisplayOrder = function(a1) -- Line: 41 -- upvalues: u48 (val)
            u48.DisplayOrder = a1
        end,
        setIgnoreGuiInset = function(a1) -- Line: 44 -- upvalues: u48 (val)
            u48.IgnoreGuiInset = a1
        end,
        screen = u48,
    })
    local success_2, result_2 = pcall(function() -- Line: 50 -- upvalues: u52 (val), u60 (val)
        u52:render(u60)
    end)
    if not success_2 then
        warn((("Error occurred while rendering game view \"%*\": %*"):format(Name, result_2)))
        u48:Destroy()
    end
end

function v1.Init() -- Line: 59 -- upvalues: Players (val), mountView (val)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    for i, v in ipairs(script.Views:GetChildren()) do
        if v:IsA("ModuleScript") then
            task.spawn(mountView, PlayerGui, v)
        end
    end
end

return v1