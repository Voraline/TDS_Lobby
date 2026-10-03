-- Script path: ReplicatedStorage.Client.Interfaces.NPCViews
-- Decompile time: 1.57 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local v1 = {}

local function warnViewError(a1, a2, a3) -- Line: 12 -- types: a1: string, a2: string
    warn((("Error occurred while %* NPC view \"%*\": %*"):format(a1, a2, a3)))
end

local function mountView(a1, a2) -- Line: 16
    -- upvalues: Create (val), ReactRoblox (val), createElement (val)
    local v1
    local Name = a2.Name
    local success, result = pcall(require, a2)
    if not success then
        warn((("Error occurred while loading NPC view \"%*\": %*"):format(Name, result)))
        return
    end
    if typeof(result) ~= "function" and typeof(result) ~= "table" then
        v1 = ("view returned %* instead of React component"):format((typeof(result)))
        warn((("Error occurred while loading NPC view \"%*\": %*"):format(Name, v1)))
        return
    end
    v1 = Create("ScreenGui", {
        ResetOnSpawn = false,
        Name = ("NPC VIEWS %*"):format(Name),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = a1,
    })
    local u52 = ReactRoblox.createRoot(v1)
    local u57 = createElement(result, {screenGUI = v1})
    local success_2, result_2 = pcall(function() -- Line: 41 -- upvalues: u52 (val), u57 (val)
        u52:render(u57)
    end)
    if not success_2 then
        warn((("Error occurred while rendering NPC view \"%*\": %*"):format(Name, result_2)))
        v1:Destroy()
    end
end

function v1.Init() -- Line: 50 -- upvalues: Players (val), mountView (val)
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    for i, j in script.Views:GetChildren() do
        if j:IsA("ModuleScript") then
            task.spawn(mountView, PlayerGui, j)
        end
    end
end

return v1