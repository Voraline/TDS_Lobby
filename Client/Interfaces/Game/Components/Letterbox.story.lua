-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Letterbox.story
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Letterbox = require(ReplicatedStorage.Client.Interfaces.Game.Components.Letterbox)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), Letterbox (val)
    return React.createElement(Letterbox, {
        visible = true,
        aspectRatio = 2.3333333333333335,
        zIndex = 999,
        barColor = Color3.fromRGB(0, 0, 0),
    })
end

return function(a1) -- Line: 16 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 21 -- upvalues: u4 (val)
        u4:unmount()
    end
end