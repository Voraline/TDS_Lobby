-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerToggleSelectator.story
-- Decompile time: 1.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TowerToggleSelectator = require(script.Parent.TowerToggleSelectator)
local createElement = React.createElement

local function render() -- Line: 8 -- upvalues: React (val), createElement (val), TowerToggleSelectator (val)
    local v1, u4 = React.useState(false)
    return createElement(TowerToggleSelectator, {
        enabled = true,
        model = workspace.Model,
        selected = v1,
        onSelected = function() -- Line: 15 -- upvalues: u4 (val)
            u4(function(a1) -- Line: 16
                return not a1
            end)
        end,
    })
end

return function(a1) -- Line: 23 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 27 -- upvalues: u4 (val)
        u4:unmount()
    end
end