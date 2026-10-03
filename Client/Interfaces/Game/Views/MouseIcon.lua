-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.MouseIcon
-- Decompile time: 1.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local MouseCursorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.MouseCursorStore)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local useAtomBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomBinding)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useMouse = require(ReplicatedStorage.Client.Interfaces.Hooks.useMouse)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 16
    -- upvalues: useMouse (val), useAtomBinding (val), MouseCursorStore (val), useSpring (val), useReactBindings (val)
    -- upvalues: UserInputService (val), React (val), useEvent (val), createElement (val), math (val)
    a1.setDisplayOrder(9999999)
    local v1, v2 = useMouse()
    local v3 = useAtomBinding(MouseCursorStore.getCurrent)
    local v4, u17 = useSpring(0, 0.6, 30, true)
    local v5 = {v3}
    useReactBindings(function(a1) -- Line: 23 -- upvalues: UserInputService (upval)
        UserInputService.MouseIconEnabled = a1 == ""
    end, v5)
    local v6 = React.joinBindings({v1, v2}):map(function(a1) -- Line: 27
        return UDim2.fromOffset(a1[1], a1[2])
    end)
    useEvent(UserInputService.InputBegan, function(a1, a2) -- Line: 31 -- upvalues: u17 (val) -- types: a1: userdata, a2: boolean
        if a1.UserInputType == Enum.UserInputType.MouseButton1 then
            u17(1)
        end
    end)
    useEvent(UserInputService.InputEnded, function(a1, a2) -- Line: 37 -- upvalues: u17 (val) -- types: a1: userdata, a2: boolean
        if a1.UserInputType == Enum.UserInputType.MouseButton1 then
            u17(0)
        end
    end)
    return createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Active = false,
        Position = v6,
        Size = UDim2.fromOffset(32, 32),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = v3,
    }, {
        ratio = createElement("UIAspectRatioConstraint", {}),
        scale = createElement("UIScale", {
            Scale = v4:map(function(a1) -- Line: 53 -- upvalues: math (upval)
                return math.map(a1, 0, 1, 1, 0.75)
            end),
        }),
    })
end