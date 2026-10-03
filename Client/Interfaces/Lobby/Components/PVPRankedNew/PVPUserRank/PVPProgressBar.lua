-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.PVPUserRank.PVPProgressBar
-- Decompile time: 3.05 ms

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
    -- upvalues: React (val), RunService (val), ParticleEmitter (val)
    local u25, u29
    local v1 = a1.level or 0
    local v2 = a1.emitter == true
    local progress = a1.progress or useBinding(0)
    local u13 = a1.maxProgress or 0
    local Transparency = a1.Transparency or useBinding(0)
    local v3 = useTransparencyModifier(Transparency)
    _, u25 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    _, u29 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    local v4 = {progress}
    useEffect(function() -- Line: 48 -- upvalues: u25 (val)
        u25({force = -800})
    end, v4)
    v4 = {v1}
    useEffect(function() -- Line: 54 -- upvalues: u29 (val)
        u29({force = -800})
    end, v4)
    v4 = {
        BorderSizePixel = 0,
        BackgroundTransparency = v3(0),
        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
        AnchorPoint = a1.AnchorPoint,
    }
    local Position = a1.Position or UDim2.fromScale(0.0157, 0.317)
    v4.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.793, 0.0929)
    v4.Size = Size
    v4.ZIndex = a1.ZIndex or 2
    v4.LayoutOrder = a1.LayoutOrder or 1
    local v5 = {
        UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.4, 0)}),
        UIStroke = React.createElement("UIStroke", {Transparency = 0, Thickness = 2, Color = Color3.fromRGB(30, 30, 30)}),
    }
    local v6 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v3(0.9),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v7 = {UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.4, 0)})}
    local v8 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = Transparency,
        Position = UDim2.fromScale(0, 0.5),
        Size = progress:map(function(a1) -- Line: 98 -- upvalues: u13 (val)
            return UDim2.fromScale(math.clamp(if u13 ~= 0 then if u13 ~= (1 / 0) then a1 / u13 else 1 else 0, 0, 1), 1)
        end),
    }
    local v9 = {
        UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.4, 0)}),
        UIGradient = React.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 0)),
                ColorSequenceKeypoint.new(0.92, Color3.fromRGB(254, 220, 106)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
            }),
        }),
    }
    local v10 = RunService:IsRunning() and createElement("Frame", {
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
    v9.emitterFrame = v10
    v7.bar = createElement("Frame", v8, v9)
    v5.progressBar = createElement("Frame", v6, v7)
    return createElement("Frame", v4, v5)
end))