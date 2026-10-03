-- Script path: ReplicatedStorage.Client.Controllers.Shared.CmdrController
-- Decompile time: 0.51 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local cmdr = require(ReplicatedStorage.Shared.Modules.Network).Channel("cmdr")
task.spawn(function() -- Line: 8 -- upvalues: ReplicatedStorage (val), cmdr (val), Players (val)
    local CmdrClient = ReplicatedStorage:WaitForChild("CmdrClient")
    if not cmdr:InvokeServer("get_authorized") then
        CmdrClient:Destroy()
        return
    end
    local u15 = require(CmdrClient)
    u15:SetActivationKeys({Enum.KeyCode.Backquote, Enum.KeyCode.F2})
    Players.LocalPlayer.Chatted:Connect(function(a1) -- Line: 20 -- upvalues: u15 (val)
        if a1:lower() == "cmdr" then
            u15:Toggle()
        end
    end)
end)
return nil