-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.FakeWaveText
-- Decompile time: 2.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 11 -- upvalues: React (val), RunService (val), createElement (val) -- types: a1: table
    local v1, v2, v3, v4, v5
    local v6 = {}
    local v7 = #a1.text
    local v8 = a1
    for i = 1, v7 do
        local u9 = Random.new()
        local u11 = tick()
        v4, u17 = React.useBinding(Vector2.new())
        v5, u22 = React.useBinding(0)
        v1, u31 = React.useBinding(Color3.fromRGB(255, 255, 255))
        React.useEffect(function() -- Line: 22 -- upvalues: RunService (upval), u11 (ref), u22 (val), u9 (val), u17 (val), u31 (val)
            local u7 = RunService.Heartbeat:Connect(function() -- Line: 25 -- upvalues: u11 (upval), u22 (upval), u9 (upval), u17 (upval), u31 (upval)
                if 0.03 < tick() - u11 then
                    u22(u9:NextNumber(-20, 20))
                    u17(Vector2.new(u9:NextNumber(-3, 3), u9:NextNumber(-3, 3)))
                    if math.random(1, 10) ~= 1 then
                        u31(Color3.fromRGB(255, 255, 255))
                    else
                        u31(Color3.fromRGB(u9:NextNumber(0, 255), u9:NextNumber(0, 255), u9:NextNumber(0, 255)))
                    end
                    u11 = tick()
                end
            end)
            return function() -- Line: 46 -- upvalues: u7 (ref)
                u7:Disconnect()
            end
        end, {})
        v2 = string.sub(v8.text, i, i)
        if v2 == " " then
            v3 = v2 .. i
            v6[v3] = (createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromOffset(5, 5),
                LayoutOrder = i,
            }, {uIScale = createElement("UIScale", {Scale = v8.scale or 1})}))
        end
        v3 = v2 .. i
        v6[v3] = (createElement("TextLabel", {
            TextSize = 25,
            TextTransparency = 1,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = string.upper(v2),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.new(0, 5, 1, 5),
            Size = UDim2.fromOffset(0, 25),
            LayoutOrder = i,
        }, {
            uIScale = createElement("UIScale", {Scale = v8.scale or 1}),
            waveLabel = createElement("TextLabel", {
                TextSize = 25,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = string.upper(v2),
                TextColor3 = v1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Rotation = v5,
                Position = v4:map(function(a1) -- Line: 110
                    return UDim2.new(0.5, a1.X, 0.5, a1.Y)
                end),
                Size = UDim2.fromScale(1, 1),
            }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
        }))
    end
    return React.createElement(React.Fragment, nil, v6)
end