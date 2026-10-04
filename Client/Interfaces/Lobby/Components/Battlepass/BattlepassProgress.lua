-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassProgress
-- Decompile time: 9.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ParticleEmitter = require(Components.ParticleEmitter)
require(Hooks.useReactBindings)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local useTween = ReactFlow.useTween
local useSpring = ReactFlow.useSpring
local useEffect = React.useEffect
local useBinding = React.useBinding
local createElement = React.createElement
local joinBindings = React.joinBindings
return (React.memo(function(a1) -- Line: 24
    -- upvalues: useBinding (val), useTransparencyModifier (val), useSpring (val), useEffect (val), createElement (val)
    -- upvalues: RunService (val), ParticleEmitter (val)
    local v1 = a1.level or 0
    local v2 = a1.emitter == true
    local progress = a1.progress or useBinding(0)
    local u13 = a1.maxProgress or 0
    local Transparency = a1.Transparency or useBinding(0)
    local v3 = useTransparencyModifier(Transparency)
    local v4, u25 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    local v5, u29 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    local v6 = {progress}
    useEffect(function() -- Line: 48 -- upvalues: u25 (val)
        u25({force = -800})
    end, v6)
    v6 = {v1}
    useEffect(function() -- Line: 54 -- upvalues: u29 (val)
        u29({force = -800})
    end, v6)
    v6 = {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(73, 33, 0),
        BackgroundTransparency = v3(0.6),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = a1.AnchorPoint,
    }
    local Position = a1.Position or UDim2.fromScale(0.0157, 0.317)
    v6.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.793, 0.0929)
    v6.Size = Size
    v6.ZIndex = a1.ZIndex or 2
    v6.LayoutOrder = a1.LayoutOrder or 1
    local v7 = {}
    local v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = v5:map(function(a1) -- Line: 82
            return UDim2.fromScale(0.0739, 0.523 + a1 * 0.01)
        end),
        Size = UDim2.fromScale(0.168, 0.512),
    }
    local v9 = typeof(v1) == "number" and ("Level : %*"):format((math.max(0, v1))) or v1
    v8.Text = v9
    v8.TextColor3 = Color3.fromRGB(255, 255, 255)
    v8.TextTransparency = Transparency
    v8.TextXAlignment = Enum.TextXAlignment.Left
    v7.level = createElement("TextLabel", v8)
    v7.xP = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = v4:map(function(a1) -- Line: 106
            return UDim2.fromScale(0.827, 0.523 + a1 * 0.01)
        end),
        Size = UDim2.fromScale(0.153, 0.512),
        Text = progress:map(function(a1) -- Line: 110 -- upvalues: u13 (val)
            local v1 = math.floor(a1)
            return (("%*/%*"):format(v1, (math.max(v1, (math.floor(u13))))))
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = Transparency,
        TextXAlignment = Enum.TextXAlignment.Right,
    })
    v8 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v3(0.9),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local progressBarPosition = a1.progressBarPosition or UDim2.fromScale(0.534, 0.523)
    v8.Position = progressBarPosition
    local progressBarSize = a1.progressBarSize or UDim2.fromScale(0.584, 0.14)
    v8.Size = progressBarSize
    v9 = {uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v10 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = Transparency,
        Position = UDim2.fromScale(0, 0.5),
        Size = progress:map(function(a1) -- Line: 142 -- upvalues: u13 (val)
            return UDim2.fromScale(math.clamp(if u13 ~= 0 then a1 / u13 else 0, 0, 1), 1)
        end),
    }
    local v11 = {
        uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        uIGradient = createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 122, 0)),
                ColorSequenceKeypoint.new(0.827, Color3.fromRGB(255, 208, 22)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
            }),
        }),
    }
    local v12 = RunService:IsRunning() and createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.new(0, 1, 1, 0),
    }, {
        emitter = createElement(ParticleEmitter, {
            drag = 5,
            rate = 40,
            texture = "rbxassetid://9808478554",
            unitMultiplier = 1,
            enabled = v2,
            lifeTime = NumberRange.new(0.5, 0.8),
            acceleration = Vector2.new(0, -50),
            speed = NumberRange.new(10, 20),
            spreadAngle = NumberRange.new(-45, 45),
            rotation = NumberRange.new(-180, 180),
            transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
    })
    v11.emitterFrame = v12
    v9.bar = createElement("Frame", v10, v11)
    v7.progressBar = createElement("Frame", v8, v9)
    v7.uICorner2 = createElement("UICorner", {CornerRadius = UDim.new(0.163, 0)})
    v7.icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://88640728317774",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = Transparency,
        Position = UDim2.fromScale(0.0116, 0.5),
        Size = UDim2.fromScale(0.048, 0.656),
        ScaleType = Enum.ScaleType.Fit,
    })
    return createElement("Frame", v6, v7)
end))