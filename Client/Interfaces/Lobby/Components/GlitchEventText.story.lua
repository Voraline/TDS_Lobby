-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.GlitchEventText.story
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlitchEventText = require(script.Parent.GlitchEventText)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), GlitchEventText (val)
    return React.createElement(GlitchEventText, {text = "'What happens when someone learns the true scope of their existence?'"})
end

return function(a1) -- Line: 13 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 18 -- upvalues: u4 (val)
        u4:unmount()
    end
end