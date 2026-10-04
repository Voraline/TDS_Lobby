-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionButtons.init.story
-- Decompile time: 1.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(Parent, {
        Size = UDim2.fromOffset(600, 100),
        Position = UDim2.new(0.5, 0, 0, 693),
        AnchorPoint = Vector2.new(0.5, 1),
    })
    local u22 = ReactRoblox.createRoot(a1)
    u22:render(v1)
    return function() -- Line: 19 -- upvalues: u22 (val)
        u22:unmount()
    end
end