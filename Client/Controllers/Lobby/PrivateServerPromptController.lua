-- Script path: ReplicatedStorage.Client.Controllers.Lobby.PrivateServerPromptController
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage:WaitForChild("Client")
local Cache = require(Client.Modules.Cache)
local Flags = require(ReplicatedStorage.Shared.Modules.Network).Channel("Flags")
local v1 = {
    init = function() -- Line: 12 -- upvalues: Client (val), Cache (val), Flags (val)
        if not workspace:GetAttribute("IsPrivateServer") then
            return
        end
        local ViewController = require(Client.Interfaces.LegacyInterface.Controllers.ViewController)
        local Flags_2 = Cache("Flags")
        task.delay(5, function() -- Line: 20 -- upvalues: Flags_2 (val), ViewController (val), Flags (upval)
            (Flags_2:Get()):andThen(function(a1) -- Line: 21 -- upvalues: ViewController (upval), Flags (upval)
                if a1.DoNotShowElevatorChanges then
                    return
                end
                ViewController:prompt({
                    Override = true,
                    Subject = "Elevator Change",
                    Description = "The survival elevator has been changed for private servers. You may now queue up with friends and teleport directly to the intermission lobby!",
                    Icon = "rbxassetid://13691899952",
                    Buttons = {
                        {
                            Text = "Okay",
                            Color = Color3.fromRGB(10, 220, 80),
                            Clicked = function() -- Line: 35 -- upvalues: ViewController (upval)
                                ViewController:closePrompt()
                            end,
                        },
                        {
                            Text = "Do not show again",
                            Color3 = Color3.fromRGB(39, 39, 39),
                            Clicked = function() -- Line: 42 -- upvalues: ViewController (upval), Flags (upval)
                                ViewController:closePrompt()
                                Flags:InvokeServer("Update", "DoNotShowElevatorChanges", true)
                            end,
                        },
                    },
                })
            end)
        end)
    end,
}
task.spawn(v1.init)
return v1