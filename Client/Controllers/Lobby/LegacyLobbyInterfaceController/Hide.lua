-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Hide
-- Decompile time: 0.46 ms

local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("SharedGui")
local LobbyGui = false
if workspace.Type.Value == "Lobby" then
    LobbyGui = PlayerGui:WaitForChild("LobbyGui")
end
local v1 = {}
local u23 = {}
u23[1] = LobbyGui and LobbyGui:WaitForChild("Menu")

function v1.Enable(a1) -- Line: 13 -- upvalues: u23 (val)
    for k, v in pairs(u23) do
        v.Visible = false
    end
end

function v1.Disable(a1) -- Line: 19 -- upvalues: u23 (val)
    for k, v in pairs(u23) do
        v.Visible = true
    end
end

return v1