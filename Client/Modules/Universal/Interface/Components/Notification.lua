-- Script path: ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification
-- Decompile time: 1.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local Notification = require(ReplicatedStorage.Shared.Modules.Network).Channel("Notification")
local ViewController = Client.Interfaces.LegacyInterface.Controllers.ViewController
local u21 = {Default = 6171724661, Income = 5547581690, Health = 6562597552}
local v1 = {}

local function resolveIcon(a1) -- Line: 18 -- upvalues: u21 (val)
    if typeof(a1) == "string" then
        return u21[a1] or a1
    end
    return a1
end

function v1.Create(a1) -- Line: 26 -- upvalues: ViewController (val), u21 (val)
    local v1 = a1 or {}
    local v2 = require(ViewController)
    local Text = v1.Text or v1.text
    local Timeout = v1.Timeout or v1.timeout or v1.Duration or v1.duration
    local Color = v1.Color or v1.color
    local Icon = v1.Icon or v1.icon
    v2:notify(Text, Timeout, Color, not (typeof(Icon) ~= "string") and u21[Icon] or Icon, v1.Sound or v1.sound)
end

function v1.Error(a1, a2) -- Line: 39 -- upvalues: ViewController (val) -- types: a1: string, a2: number?
    require(ViewController):notifyError(a1, a2)
end

Notification:On("Create", v1.Create)
Notification:On("Error", v1.Error)
return v1