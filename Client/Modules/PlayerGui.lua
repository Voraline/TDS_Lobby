-- Script path: ReplicatedStorage.Client.Modules.PlayerGui
-- Decompile time: 0.87 ms

local v1
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local Type = workspace:WaitForChild("Type")
local v2 = {}
if Type.Value ~= "Lobby" then
    v1 = false
    if Type.Value == "Game" then
        v1 = "GameGui"
    end
else
    v1 = "LobbyGui"
end
v2.Primary = PlayerGui:WaitForChild(v1)
v2.Shared = if Type.Value ~= "Lobby" then nil else PlayerGui:WaitForChild("SharedGui")
v2.Service = game:GetService("StarterGui")
return v2