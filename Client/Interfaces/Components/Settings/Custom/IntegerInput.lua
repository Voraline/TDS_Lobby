-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.IntegerInput
-- Decompile time: 1.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useRef = React.useRef
return function(a1) -- Line: 7 -- upvalues: useRef (val), createElement (val), React (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked() end
    end
    local u4 = useRef()
    local v1 = createElement
    local v2 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://12338367942",
        ZIndex = 2,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.new(0, 80, 1, 2),
        ImageColor3 = Color3.fromRGB(63, 63, 63),
    }
    local v3 = {}
    local v4 = createElement
    local v5 = {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Font = "GothamBold",
        TextSize = 24,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Text = a1.Current,
        TextTruncate = Enum.TextTruncate.AtEnd,
    }

    v5[React.Event.FocusLost] = function() -- Line: 27 -- upvalues: u4 (val), a1 (val), Clicked (val)
        if not tonumber(u4.current.Text) then
            u4.current.Text = a1.Current
            return
        end
        u4.current.Text = string.gsub(u4.current.Text, "%a", "")
        local v1 = tonumber(u4.current.Text) or tonumber(a1.Current)
        u4.current.Text = v1
        Clicked(v1)
    end

    v5.ref = u4
    v3.inputBox = v4("TextBox", v5)
    return v1("ImageLabel", v2, v3)
end