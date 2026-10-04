-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Achievements.init.story
-- Decompile time: 1.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
return function(a1) -- Line: 8 -- upvalues: React (val), Parent (val), ReactRoblox (val)
    local v1 = React.createElement(function() -- Line: 9 -- upvalues: React (upval), Parent (upval)
        local v1
        local v2 = {}
        for i = 1, 20 do
            v1 = React.useBinding(Random.new():NextInteger(1, 10000))
            table.insert(v2, {
                title = "First Contact",
                description = "Deal 10,000 Damage",
                maxProgress = 10000,
                progress = v1,
                completed = 10000 <= (v1:getValue()),
                rewards = {{type = "stat", stat = "Coins", amount = 200}},
            })
        end
        print(v2)
        return React.createElement(Parent, {achievements = v2})
    end)
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 41 -- upvalues: u8 (val)
        u8:unmount()
    end
end