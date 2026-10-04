-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Dialog.story
-- Decompile time: 1.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Dialog = require(script.Parent.Dialog)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect

local function Story() -- Line: 12 -- upvalues: useState (val), React (val), createElement (val), Dialog (val)
    return React.createElement(React.Fragment, {}, {
        icon = createElement(Dialog, {
            Speaker = "Trapper",
            Emotion = "Cheerful",
            Text = "quack",
            RichText = true,
            Glitch = false,
            Blip = "Blip2",
            Flipped = false,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Visible = useState(true),
        }),
    })
end

return function(a1) -- Line: 75 -- upvalues: ReactRoblox (val), createElement (val), Story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Story)))
    return function() -- Line: 79 -- upvalues: u4 (val)
        u4:unmount()
    end
end