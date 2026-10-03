-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Tutorial.Tutorial.story
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TutorialWindow = require(script.Parent).TutorialWindow
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), TutorialWindow (val), React (val)
    React.mount(createElement(TutorialWindow, {
        Size = UDim2.fromOffset(900, 550),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }), a1)
    return function() -- Line: 17
        root:unmount()
    end
end