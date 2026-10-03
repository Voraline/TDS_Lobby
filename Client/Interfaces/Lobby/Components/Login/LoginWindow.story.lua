-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Login.LoginWindow.story
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local LoginWindow = require(script.Parent.LoginWindow)
local createElement = React.createElement

local function Component() -- Line: 11 -- upvalues: React (val), createElement (val), LoginWindow (val), Icons (val)
    local v1, u4 = React.useState(false)
    React.useEffect(function() -- Line: 14 -- upvalues: u4 (val)
        local u2 = task.spawn(function() -- Line: 15 -- upvalues: u4 (upval)
            while true do
                u4(function(a1) -- Line: 17
                    return not a1
                end)
                task.wait(2)
            end
        end)
        return function() -- Line: 25 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, {})
    return createElement(LoginWindow, {
        day = 2,
        Visible = v1,
        rewards = {
            {title = "50 Coins", day = 0, claimed = true, icon = Icons.CoinsTiny},
            {title = "50 Coins", day = 1, claimed = true, icon = Icons.CoinsTiny},
            {title = "100 Gems", day = 2, amount = 1, icon = Icons.GemsChest},
            {title = "100 Gems", day = 3, amount = 1, icon = Icons.GemsChest},
            {title = "100 Gems", day = 4, amount = 1, icon = Icons.GemsChest},
            {title = "100 Gems", day = 5, amount = 1, icon = Icons.GemsChest},
            {title = "100 Gems", day = 6, amount = 1, icon = Icons.GemsChest},
            {title = "100 Gems", day = 7, amount = 1, icon = Icons.GemsChest},
        },
    })
end

return function(a1) -- Line: 86 -- upvalues: createElement (val), Component (val), ReactRoblox (val)
    local v1 = createElement(Component)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 91 -- upvalues: u7 (val)
        u7:unmount()
    end
end