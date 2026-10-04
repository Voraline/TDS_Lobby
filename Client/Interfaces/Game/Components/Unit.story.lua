-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Unit.story
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Unit = require(script.Parent.Unit)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), Unit (val), ReactRoblox (val)
    local v1 = createElement(Unit, {Position = UDim2.fromOffset(20, 20)})
    local u12 = ReactRoblox.createRoot(a1)
    u12:render(v1)
    return function() -- Line: 17 -- upvalues: u12 (val)
        u12:unmount()
    end
end