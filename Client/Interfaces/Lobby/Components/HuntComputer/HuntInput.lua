-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.HuntComputer.HuntInput
-- Decompile time: 8.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextBox = require(ReplicatedStorage.Client.Interfaces.Components.TextBox)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useBinding = React.useBinding
local useEffect = React.useEffect
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local Components = ReplicatedStorage.Client.Interfaces.Components
local BattlepassButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassButton)
local IconButton = require(Components.IconButton)
local u59 = Random.new()

local function computerTextBox(a1) -- Line: 33 -- upvalues: createElement (val), TextBox (val) -- types: a1: table
    return createElement(TextBox, {
        Font = "RobotoMono",
        FontWeight = "Bold",
        PlaceholderText = "[ ENTER CODE ]",
        TextScaled = true,
        PlaceholderColor3 = a1.textColor,
        Text = a1.text,
        TextTransparency = a1.transparency,
        TextColor3 = a1.textColor,
        Position = a1.position,
        Size = UDim2.fromScale(0.25, 0.0375),
        StrokeColor = Color3.fromRGB(14, 40, 13),
        StrokeTransparency = a1.transparency,
        OnTextChanged = function(a1_2) -- Line: 47 -- upvalues: a1 (val) -- types: a1_2: userdata
            if a1.onTextChanged then
                a1.onTextChanged(a1_2.Text)
            end
        end,
    })
end

local function questCompletePrompt(a1) -- Line: 55 -- upvalues: createElement (val), TextLabel (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = a1.position,
    }, {
        text = createElement(TextLabel, {
            BackgroundTransparency = 1,
            TextScaled = true,
            Size = UDim2.fromScale(0.35, 0.09),
            Position = UDim2.fromScale(0.5, 0.4),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = ("[ %* ]"):format(a1.text),
            TextColor3 = Color3.fromRGB(35, 252, 31),
            TextTransparency = a1.transparency,
            StrokeColor = Color3.fromRGB(14, 40, 13),
            StrokeTransparency = a1.transparency,
        }),
        checkmark = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://12289762618",
            Size = UDim2.fromScale(0.1, 0.1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ImageTransparency = a1.transparency,
        }, {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}),
    })
end

return function(a1) -- Line: 96
    -- upvalues: useSpring (val), useSound (val), useBinding (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Tween (val), useEffect (val), createElement (val), IconButton (val), computerTextBox (val), u59 (val)
    -- upvalues: questCompletePrompt (val), BattlepassButton (val)
    local u16, u8, v1, v2
    v1, _, u8 = useSpring(0, 0.15, 100, true)
    v2, _, u16 = useSpring(0, 1, 12, true)
    local u19 = useSound("Correct Code")
    local u22 = useSound("Incorrect Code")
    local u25 = useSound("Boot Super Computer")
    local u26 = {}
    u26[1] = (useSound("Keystroke" .. 1))
    u26[2] = (useSound("Keystroke" .. 2))
    u26[3] = (useSound("Keystroke" .. 3))
    u26[4] = (useSound("Keystroke" .. 4))
    u26[5] = (useSound("Keystroke" .. 5))
    u26[6] = (useSound("Keystroke" .. 6))
    u26[7] = (useSound("Keystroke" .. 7))
    local u64, u65 = useBinding("")
    local v3, u112 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.1)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.2)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.1)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.8), info = TweenInfo.new(0.2)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.6)})
    local v4, u149 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.1)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.2)}),
        }),
        disable = useAnimation({transparency = Tween({target = 1, info = TweenInfo.new(0.1)})}),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.8)})
    local v5 = useEffect
    local v6 = {a1.uiVisible, a1.complete}
    v5(function() -- Line: 137 -- upvalues: a1 (val), u25 (val), u65 (val), u112 (val), u149 (val)
        if a1.uiVisible then
            u25()
        end
        u65("")
        u112(if not a1.uiVisible then "disable" else "enable")
        u149(if not a1.complete then "disable" else if not a1.uiVisible then "disable" else "enable")
    end, v6)
    v6 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v3.position,
    }
    local v7 = {
        closeButton = createElement(IconButton, {
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Position = UDim2.new(0.7, -35, 0.165, 35),
            Size = UDim2.fromOffset(30, 30),
            Color = Color3.fromRGB(255, 60, 60),
            Transparency = v3.transparency,
            Clicked = a1.closed,
        }),
        input = not a1.complete and createElement(computerTextBox, {
            text = u64,
            transparency = v3.transparency,
            position = v1:map(function(a1) -- Line: 164
                return UDim2.fromScale(0.5 + math.floor(a1 * 100) / 100 / 2000, 0.375)
            end),
            textColor = v2:map(function(a1) -- Line: 168
                return (Color3.fromRGB(35, 252, 31)):Lerp(Color3.fromRGB(255, 0, 0), (math.clamp(a1, 0, 1)))
            end),
            onTextChanged = function(a1) -- Line: 172 -- upvalues: u65 (val), u59 (upval), u26 (val) -- types: a1: string
                u65(a1)
                u26[(u59:NextInteger(1, 7))]()
            end,
        }),
    }
    local complete = a1.complete and createElement(questCompletePrompt, {position = v4.position, transparency = v4.transparency, text = a1.successText})
    v7.completeImage = complete
    v7.sendButton = not a1.complete and createElement(BattlepassButton, {
        text = "SEND",
        Size = UDim2.fromScale(0.25, 0.075),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.675),
        transparency = v3.transparency,
        clicked = function() -- Line: 189 -- upvalues: u64 (val), a1 (val), u19 (val), u8 (val), u16 (val), u22 (val), u65 (val)
            local v1 = u64:getValue()
            if (v1 == "" or not a1.entered(v1)) and true then
                u8(250)
                u16(10)
                u22()
            else
                u19()
            end
            u65("")
        end,
    })
    v7.background = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://139735184273975",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v3.transparency,
        Size = UDim2.fromScale(0.5, 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
    })
    v7.aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.5})
    v7.sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(1200, 1600)})
    return createElement("Frame", v6, v7)
end