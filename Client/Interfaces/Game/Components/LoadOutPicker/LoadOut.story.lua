-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LoadOutPicker.LoadOut.story
-- Decompile time: 0.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LoadOut = require(script.Parent.LoadOut)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), LoadOut (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), LoadOut (upval)
        return createElement(LoadOut, {
            Position = UDim2.fromOffset(50, 50),
            AnchorPoint = Vector2.new(0, 0),
            towers = {
                {tower = "Scout", skin = "Golden"},
                {tower = "Cowboy", skin = "Golden"},
                {tower = "Soldier", skin = "Golden"},
                {tower = "Accelerator", skin = "Vigilante"},
                {tower = "Farm", skin = "Arcade"},
            },
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 28 -- upvalues: u7 (val)
        u7:unmount()
    end
end