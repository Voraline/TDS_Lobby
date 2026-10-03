-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Flash
-- Decompile time: 0.77 ms

game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Value = workspace.Type.Value
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local SharedGui = false
if Value == "Lobby" then
    SharedGui = PlayerGui:WaitForChild("SharedGui")
end
local Flash = SharedGui
if Flash then
    Flash = SharedGui:WaitForChild("Flash")
end
local v1 = {
    __call = function(a1, a2) -- Line: 14 -- upvalues: Flash (val)
        return a2(Flash)
    end,
}
local v2 = setmetatable({}, v1)

function v2.Enable(a1, a2) -- Line: 19 -- upvalues: Flash (val), TweenService (val)
    Flash.Active = true
    local v1 = TweenService:Create(Flash, a2, {BackgroundTransparency = 0})
    v1:Play()
    return v1
end

function v2.Disable(a1, a2) -- Line: 31 -- upvalues: Flash (val), TweenService (val)
    Flash.Active = false
    local v1 = TweenService:Create(Flash, a2, {BackgroundTransparency = 1})
    v1:Play()
    return v1
end

return v2