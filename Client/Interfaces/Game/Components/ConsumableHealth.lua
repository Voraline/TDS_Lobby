-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.ConsumableHealth
-- Decompile time: 1.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
return function(a1) -- Line: 18
    -- upvalues: useBinding (val), useTween (val), useEffect (val), createElement (val)
    local v1, u4 = useBinding(a1.health)
    local v2, u17 = useTween((v1:getValue()) / a1.maxHealth, TweenInfo.new(0.25), true, true)
    local replicator = a1.replicator
    local v3 = {v1}
    useEffect(function() -- Line: 24 -- upvalues: replicator (val), u4 (val), u17 (val), a1 (val)
        local u8 = (replicator:GetStateChangedSignal("Health")):Connect(function(a1_2) -- Line: 25 -- upvalues: u4 (upval), u17 (upval), a1 (upval)
            u4((math.floor(a1_2)))
            u17(a1_2 / a1.maxHealth)
        end)
        return function() -- Line: 30 -- upvalues: u8 (val)
            u8:Disconnect()
        end
    end, v3)
    return createElement("BillboardGui", {
        Active = true,
        Brightness = 2,
        Size = UDim2.fromScale(1, 0.5),
        StudsOffsetWorldSpace = a1.StudsOffsetWorldSpace or Vector3.new(0, 1.5, 0),
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Adornee = a1.adornee,
    }, {
        progress = createElement("Frame", {
            BackgroundTransparency = 0.5,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 0.2),
        }, {
            bar = createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(87, 211, 34),
                Size = v2:map(function(a1) -- Line: 54 -- types: a1: number
                    return UDim2.fromScale(a1, 1)
                end),
            }),
            uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255)}),
        }),
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Text = v1:map(function(a1_2) -- Line: 71 -- upvalues: a1 (val)
                return (("%* / %*"):format(a1_2, a1.maxHealth))
            end),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.25),
            Size = UDim2.fromScale(2.5, 0.5),
        }, {uIStroke1 = createElement("UIStroke", {Thickness = 4, Transparency = 0.5})}),
    })
end