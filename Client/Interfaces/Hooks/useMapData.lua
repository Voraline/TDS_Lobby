-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useMapData
-- Decompile time: 1.37 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local Content = ReplicatedStorage:WaitForChild("Content")
local u56 = {}
for i, j in Content.Maps:GetChildren() do
    if j:IsA("Folder") then
        j = j:FindFirstChild("Data")
    end
    v1 = require(j)
    if v1.Gamemodes[Enum.Gamemode.PVP] then
        u56[j.Name] = v1
    end
end
return function(a1) -- Line: 22 -- upvalues: React (val), u56 (val) -- types: a1: string
    local v1, u6 = React.useState(u56.Crossroads)
    local v2 = {a1}
    React.useEffect(function() -- Line: 25 -- upvalues: u6 (val), u56 (upval), a1 (val)
        u6(u56[a1])
    end, v2)
    return v1
end