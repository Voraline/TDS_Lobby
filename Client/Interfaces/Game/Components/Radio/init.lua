-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Radio
-- Decompile time: 6.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RadioButton = require(script.RadioButton)
local RadioCloseButton = require(script.RadioCloseButton)
local RadioTextBox = require(script.RadioTextBox)
local React = require(ReplicatedStorage.Shared.UI.React)
local useSpring = (require(ReplicatedStorage.Packages.ReactFlow)).useSpring
return function(a1) -- Line: 20
    -- upvalues: React (val), useSpring (val), RadioButton (val), RadioCloseButton (val), RadioTextBox (val)
    local u45
    local u4, u5 = React.useState("")
    local v1 = {damper = 0.7, speed = 24, start = UDim2.fromScale(0.5, 1)}
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v1.goal = Position
    local v2, u21 = useSpring(v1)
    local idle_2, idle = React.useState("idle")
    local useEffect = React.useEffect
    local v3 = {a1.Position}
    useEffect(function() -- Line: 30 -- upvalues: u21 (val), a1 (val)
        local v1 = {}
        local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
        v1.target = Position
        u21(v1)
    end, v3)
    local v4, u37 = useSpring({start = -10, damper = 0.5, speed = 20})
    v3, u45 = useSpring({damper = 0.4, speed = 15, start = UDim2.fromOffset(0, 0)})

    local function impulseRadio(a1) -- Line: 40 -- upvalues: u37 (val), u45 (val) -- types: a1: string
        local v1 = {target = if a1 == "hover" then 2 else if a1 ~= "pressed" then 0 else 2}
        v1.force = if a1 ~= "pressed" then 0 else 120
        u37(v1)
        if a1 == "pressed" or a1 == "hover" then
            v1 = {}
            local v2 = if a1 ~= "pressed" then if a1 ~= "hover" then UDim2.fromOffset(0, 0) else UDim2.fromOffset(-3, 3) else UDim2.fromOffset(-50, 200)
            v1.force = v2
            u45(v1)
        end
    end

    local function rejectInput() -- Line: 55 -- upvalues: u5 (val), idle (val), u37 (val)
        u5("")
        idle("sending")
        u37({force = -50})
        task.delay(0.33, function() -- Line: 62 -- upvalues: idle (upval)
            idle("incorrect")
        end)
        task.delay(1.93, function() -- Line: 66 -- upvalues: u37 (upval), idle (upval)
            u37({force = -60})
            idle("idle")
        end)
    end

    local function acceptInput() -- Line: 74 -- upvalues: u5 (val), idle (val), u37 (val)
        u5("")
        idle("sending")
        u37({force = -50})
        task.delay(0.43, function() -- Line: 81 -- upvalues: idle (upval)
            idle("correct")
        end)
        task.delay(2.45, function() -- Line: 85 -- upvalues: u37 (upval)
            u37({force = -120})
        end)
    end

    local createElement = React.createElement
    local v5 = {BackgroundTransparency = 1, BorderSizePixel = 0, Image = "rbxassetid://76211042266600"}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v5.AnchorPoint = AnchorPoint
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v5.Position = React.joinBindings({v2, v3}):map(function(a1) -- Line: 99
        local v1, v2 = unpack(a1)
        return UDim2.new(v1.X.Scale, v1.X.Offset + v2.X.Offset, v1.Y.Scale, v1.Y.Offset + v2.Y.Offset)
    end)
    local Size = a1.Size or UDim2.fromScale(0.213, 0.594)
    v5.Size = Size
    v5.Rotation = v4
    local v6 = {
        antenna = React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://124549926903977",
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.165, 0.00784),
            Size = UDim2.fromScale(0.521, 0.565),
        }),
        uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.761}),
    }
    local createElement_3 = React.createElement
    local v7 = {}
    local v8 = true
    if u4 ~= "" then
        v8 = idle_2 == "sending"
    end
    v7.disabled = v8

    function v7.onActivated() -- Line: 128 -- upvalues: a1 (val), u4 (val), rejectInput (val), acceptInput (val)
        if a1.onSend and u4 ~= "" then
            a1.onSend(u4, rejectInput, acceptInput)
        end
    end

    function v7.onStateChanged(a1) -- Line: 134 -- upvalues: impulseRadio (val)
        impulseRadio(a1)
    end

    v6.button = createElement_3(RadioButton, v7)
    v6.CloseButton = React.createElement(RadioCloseButton, {onActivated = a1.onClose})
    v6.Entry = React.createElement(RadioTextBox, {Text = u4, radioState = idle_2, onTextChanged = u5})
    return createElement("ImageLabel", v5, v6)
end