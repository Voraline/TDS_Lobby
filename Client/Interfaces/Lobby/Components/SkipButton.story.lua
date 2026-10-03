-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SkipButton.story
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SkipButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.SkipButton)

local function render() -- Line: 7 -- upvalues: React (val), SkipButton (val)
    return React.createElement(SkipButton, {
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