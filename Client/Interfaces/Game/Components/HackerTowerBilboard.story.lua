-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.HackerTowerBilboard.story
-- Decompile time: 0.86 ms

local UI = game:GetService("ReplicatedStorage").Shared.UI
local HackerTowerBilboard = require(script.Parent.HackerTowerBilboard)
local React = require(UI.React)
local ReactRoblox = require(UI.ReactRoblox)
local createElement = React.createElement

local function story() -- Line: 16 -- upvalues: createElement (val), React (val), HackerTowerBilboard (val)
    return createElement(React.Fragment, nil, {
        tower1 = createElement(HackerTowerBilboard, {DisplayName = "Swarmer", Model = workspace.Model}),
    })
end

return function(a1) -- Line: 25 -- upvalues: ReactRoblox (val), createElement (val), story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(story)))
    return function() -- Line: 29 -- upvalues: u4 (val)
        u4:unmount()
    end
end