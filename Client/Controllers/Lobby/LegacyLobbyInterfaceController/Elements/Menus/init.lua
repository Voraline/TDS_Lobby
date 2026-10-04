-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus
-- Decompile time: 4.49 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local u11 = {Containers = {}, Exceptions = {}}

function u11.init() -- Line: 10 -- upvalues: ReplicatedStorage (val), LocalPlayer (val), u11 (val)
    local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
    local Container = require(script:WaitForChild("Container"))
    local Containers = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("LobbyGui"):WaitForChild("Menu"):WaitForChild("Containers")
    u11.Containers.Achievements = Container.new(Containers:WaitForChild("Achievements"))
    u11.Containers.Codes = Container.new(Containers:WaitForChild("Codes"))
    local u48 = nil
    for k, v in pairs(u11.Containers) do
        v.Opened:Connect(function() -- Line: 29 -- upvalues: u48 (ref), v (val)
            u48 = v
        end)
        v.Closed:Connect(function() -- Line: 33 -- upvalues: u48 (ref), v (val), ViewController (val)
            local v1 = u48 == v
            u48 = nil
            if v1 then
                ViewController:setView("Hotbar")
            end
        end)
    end
    ViewController:onViewChange(function(a1) -- Line: 43 -- upvalues: u11 (upval), u48 (ref)
        if a1 == "Achievements" then
            return
        end
        if u11.Containers[a1] then
            u11:Open(a1)
            return
        end
        local v1 = u48
        if v1 then
            u48 = nil
            v1:Close()
        end
    end)
end

function u11:Open(a2, ...) -- Line: 60
    local v1 = self.Containers[a2]
    if v1 then
        if v1.Visible then
            self:CloseAll()
            return
        end
        if not v1.Loaded then
            v1.Loaded = true
            v1:Initialize()
        end
        v1:Open(...)
        self:CloseOthers(a2)
    end
end

function u11.CloseOthers(a1, a2) -- Line: 79 -- upvalues: u11 (val) -- types: a1: table, a2: string
    local v1
    for k, v in pairs(u11.Containers) do
        v1 = u11.Exceptions[v.Name] or v.Name == a2
        if not v1 and v.Visible and v.Close then
            v:Close()
        end
    end
end

function u11:CloseAll() -- Line: 93
    self:CloseOthers("")
end

task.spawn(u11.init)
return u11