-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.world.init.story
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), Parent (upval)
        return createElement(Parent, {
            map = "Grass Isle",
            timer = 20,
            Size = UDim2.fromOffset(720, 480),
            onMap = print,
            settings = {
                Capacity = 4,
                Intermission = 20,
                Level = 0,
                Type = "Survival",
                Voting = true,
            },
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 32 -- upvalues: u7 (val)
        u7:unmount()
    end
end