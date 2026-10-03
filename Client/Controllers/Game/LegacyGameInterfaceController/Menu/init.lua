-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Menu
-- Decompile time: 1.30 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
require(script:WaitForChild("Button"))
local Container = require(script:WaitForChild("Container"))
require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Hover)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local u43 = {Containers = {}, Buttons = {}}

function u43.init() -- Line: 16 -- upvalues: ViewController (val), Players (val), u43 (val), Container (val)
    ViewController:init()
    local Containers = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GameGui"):WaitForChild("Menu"):WaitForChild("Containers")
    u43.Containers = {Music = Container.new(Containers:WaitForChild("Music"))}
    local u31 = nil
    for k, v in pairs(u43.Containers) do
        v.Opened:Connect(function() -- Line: 33 -- upvalues: u31 (ref), v (val)
            u31 = v
        end)
        v.Closed:Connect(function() -- Line: 37 -- upvalues: u31 (ref), v (val), ViewController (upval)
            local v1 = u31 == v
            u31 = nil
            print("closed!")
            if v1 then
                ViewController:setView("")
            end
        end)
    end
    ViewController:onViewChange(function(a1) -- Line: 49 -- upvalues: u43 (upval), u31 (ref)
        if u43.Containers[a1] then
            u43:Open(a1)
            return
        end
        local v1 = u31
        if v1 then
            u31 = nil
            v1:Close()
            print("close container")
        end
    end)
end

function u43:Open(a2, ...) -- Line: 63
    local v1 = self.Containers[a2]
    if v1 then
        v1:Open(...)
        if not v1.Loaded then
            v1.Loaded = true
            v1:Initialize()
        end
    end
end

task.spawn(u43.init)
return u43