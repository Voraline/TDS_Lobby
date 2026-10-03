-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MapOverride.init.story
-- Decompile time: 1.04 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = (game:GetService("ServerStorage")).Content
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local IntermissionData = require(ReplicatedStorage.Shared.Modules.IntermissionData)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
local u93 = {
    [Enum.Difficulty.Easy] = "Easy",
    [Enum.Difficulty.Normal] = "Normal",
    [Enum.Difficulty.Hard] = "Hard",
    [Enum.Difficulty.Insane] = "Insane",
}
local u87 = {}
for i, j in Content.Maps:GetChildren() do
    v1 = require(j)
    if v1.MapType == Enum.MapType.Community
        or v1.Gamemodes[Enum.Gamemode.Survival] and IntermissionData.MAPS[j.Name] then
        u87[j.Name] = v1
    end
end
return function(a1) -- Line: 35 -- upvalues: createElement (val), Parent (val), u93 (val), u87 (val), ReactRoblox (val)
    local v1 = createElement(Parent, {Categories = u93, Maps = u87})
    local u10 = ReactRoblox.createRoot(a1)
    u10:render(v1)
    return function() -- Line: 44 -- upvalues: u10 (val)
        u10:unmount()
    end
end