-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Rewards.story
-- Decompile time: 2.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(script.Parent.Parent.Parent.Components.Button)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Rewards = require(script.Parent.Rewards)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local createElement = React.createElement

local function Component() -- Line: 11
    -- upvalues: useState (val), React (val), createElement (val), Rewards (val), Button (val)
    local u2, u3 = useState(true)
    local createElement_2 = React.createElement
    local Fragment = React.Fragment
    local v1 = {
        rewards = createElement(Rewards, {
            GameMode = "Survival",
            Map = "Badlands",
            Win = true,
            Duration = 5400,
            Visible = u2,
            Rewards = {
                {Type = "Gems", Value = 800},
                {Type = "Tower", Tower = "Scout", Skin = "Golden"},
                {Type = "Coins", Value = 800},
                {Type = "Experience", Value = 800},
            },
        }),
    }
    local v2 = {Text = if not u2 then "Show" else "Hide"}
    local v3 = u2 and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
    v2.Color = v3

    function v2.Clicked() -- Line: 48 -- upvalues: u3 (val), u2 (val)
        u3(not u2)
    end

    v1.button = createElement(Button, v2)
    return createElement_2(Fragment, {}, v1)
end

return function(a1) -- Line: 55 -- upvalues: createElement (val), Component (val), ReactRoblox (val)
    local v1 = createElement(Component)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 60 -- upvalues: u7 (val)
        u7:unmount()
    end
end