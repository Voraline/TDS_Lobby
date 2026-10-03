-- Script path: ReplicatedStorage.Client.Controllers.Shared.SettingsController.Modules.Game
-- Decompile time: 2.04 ms

local Lighting = game:GetService("Lighting")
game:GetService("MarketplaceService")
game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local u38 = RunService:IsRunning()
local Client = ReplicatedStorage:WaitForChild("Client")
local Cache = require(Client.Modules.Cache)
require(script.Properties)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Settings = require(ReplicatedStorage.Shared.Modules.Network).Channel("Settings")
local v1 = {}
local Settings_2 = Cache("Settings")
local u74 = Signal.new()
v1.Close = Signal.new()
local u77 = {}
u74:Connect(function(a1, a2) -- Line: 47 -- upvalues: Lighting (val)
    if a1 == "Show Shadows" then
        Lighting.GlobalShadows = a2 == true
    end
end)

function v1.Set(a1, a2, a3) -- Line: 53 -- upvalues: u38 (val), LocalPlayer (val), Settings (val), u74 (val), u77 (val)
    if not u38 then
        return
    end
    if a2 == "Character Scale" and LocalPlayer.Character and LocalPlayer.Character:GetAttribute("Emoting") then
        (nil).Create({
            Text = "Error: You cannot change character scale while emoting!",
            Color = Color3.fromRGB(255, 0, 0),
        })
        return
    end
    if Settings:InvokeServer("Update", a2, a3) then
        u74:Fire(a2, a3)
        u77[a2] = a3
    end
end

function v1.Get(a1, a2) -- Line: 78 -- upvalues: u77 (val)
    return u77[a2]
end

function v1.GetAll(a1) -- Line: 82 -- upvalues: u77 (val)
    return u77
end

function v1.On(a1, a2, a3) -- Line: 86 -- upvalues: u74 (val)
    return u74:Connect(function(a1, a2_2) -- Line: 87 -- upvalues: a2 (val), a3 (val)
        local v1 = false
        if a2 == a1 then
            v1 = a3(a2_2)
        end
        return v1
    end)
end

v1.Updated = u74

local function _updateSettings(a1) -- Line: 97 -- upvalues: u77 (val), u74 (val)
    local v1
    if not a1 then
        return
    end
    for k, v in pairs(a1) do
        v1 = u77[k]
        if not v1 then
            if not v1 then
                u77[k] = v
                u74:Fire(k, v)
            end
        elseif v ~= v1 or not v1 then
            u77[k] = v
            u74:Fire(k, v)
        end
    end
end

Settings_2.Updated:Connect(_updateSettings)
Settings_2:Get():andThen(_updateSettings)
return v1