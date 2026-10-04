-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel.init.story
-- Decompile time: 1.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Story() -- Line: 9 -- upvalues: React (val), Parent (val)
    return React.createElement(Parent, {
        page = 1,
        maxPages = 8,
        items = {
            {name = "Mind Blown", icon = 18609742225},
            {name = "Mind Blown", icon = 18609742225},
            {name = "Mind Blown", icon = 18609742225},
            {name = "Mind Blown", icon = 18609742225},
            {name = "Mind Blown", icon = 18609742225},
            {name = "Mind Blown", icon = 18609742225},
        },
    }, {})
end

return function(a1) -- Line: 43 -- upvalues: ReactRoblox (val), createElement (val), Story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Story)))
    return function() -- Line: 47 -- upvalues: u4 (val)
        u4:unmount()
    end
end