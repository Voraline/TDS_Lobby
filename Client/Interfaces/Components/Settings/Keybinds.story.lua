-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Keybinds.story
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Keybind = require(script.Parent.Keybind)
local Keybinds = require(script.Parent.Keybinds)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Component() -- Line: 9 -- upvalues: createElement (val), Keybinds (val), Keybind (val)
    return createElement(Keybinds, {Title = "AYYO"}, {
        test = createElement(Keybind, {Name = "Test", Key = "W"}),
        test2 = createElement(Keybind, {Name = "Test2", Key = "X"}),
        test3 = createElement(Keybind, {Name = "Test3", Key = "Y"}),
        test4 = createElement(Keybind, {Name = "Test", Key = "Z"}),
    })
end

return function(a1) -- Line: 35 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 39 -- upvalues: u4 (val)
        u4:unmount()
    end
end