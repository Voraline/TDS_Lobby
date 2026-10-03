-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen.SplashObjectives
-- Decompile time: 3.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ParticleEmitter = require(ReplicatedStorage.Client.Interfaces.Components.ParticleEmitter)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local useSpring = ReactFlow.useSpring
local createElement = React.createElement

local function BouncyIcon(a1) -- Line: 19
    -- upvalues: useSpring (val), React (val), createElement (val), Sound (val), ParticleEmitter (val)
    local v1, u4 = useSpring({start = 1, damper = 0.4, speed = 28})
    local v2, u8 = useSpring({start = 1, damper = 0.5, speed = 28})
    local v3, u13 = React.useState(false)
    local u17, u18 = React.useState(nil)
    local v4 = createElement
    local v5 = {
        BackgroundTransparency = 1,
        AnchorPoint = a1.AnchorPoint,
        Position = a1.Position,
        Size = a1.Size,
    }
    local v6 = {}
    local v7 = createElement
    local v8 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ZIndex = 2,
        Size = v2:map(function(a1) -- Line: 36
            return UDim2.fromScale(a1, a1)
        end),
        BackgroundTransparency = 1,
        Image = a1.Image,
        Rotation = v1,
    }

    v8[React.Event.MouseEnter] = function() -- Line: 43 -- upvalues: u8 (val)
        u8({target = 1.1, force = 1})
    end

    v8[React.Event.MouseLeave] = function() -- Line: 46 -- upvalues: u4 (val), u8 (val)
        u4({target = 0})
        u8({target = 1, force = -1})
    end

    v8[React.Event.InputBegan] = function(a1, a2) -- Line: 50 -- upvalues: u4 (val), u8 (val), u17 (val), Sound (upval), u18 (val), u13 (val)
        if a2.UserInputType == Enum.UserInputType.MouseButton1 then
            u4({target = 10, force = 800})
            u8({target = 1.15, force = 10})
            if u17 then
                u17:Stop()
            end
            local v1 = {
                Properties = {
                    SoundId = 5054289267,
                    Volume = 1,
                    PlaybackSpeed = math.random() * 0.2 + 0.9,
                },
            }
            u18((Sound(if not (0.5 < math.random()) then "Crystal Click 2" else "Crystal Click 1", v1)))
            u13(true)
            task.delay(0.07, function() -- Line: 72 -- upvalues: u13 (upval)
                u13(false)
            end)
        end
    end

    v8[React.Event.InputEnded] = function(a1, a2) -- Line: 77 -- upvalues: u4 (val), u8 (val)
        if a2.UserInputType == Enum.UserInputType.MouseButton1 then
            u4({target = 0})
            u8({target = 1.1})
        end
    end

    v6.image = v7("ImageLabel", v8)
    v6.emitterFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.3),
        Size = UDim2.new(0, 40, 0, 40),
    }, {
        emitter = createElement(ParticleEmitter, {
            drag = 2,
            rate = 25,
            texture = "rbxassetid://9808478554",
            unitMultiplier = 0.25,
            point = false,
            enabled = v3,
            lifeTime = NumberRange.new(0.5, 0.8),
            acceleration = Vector2.new(0, -50),
            speed = NumberRange.new(10, 20),
            spreadAngle = NumberRange.new(-45, 45),
            rotation = NumberRange.new(-180, 180),
            transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
            }),
            size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1, 0.5),
                (NumberSequenceKeypoint.new(1, 0.5, 0.5)),
            }),
        }),
    })
    v6.uiaspectratioconstraint = createElement("UIAspectRatioConstraint")
    v6.uicorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)})
    return v4("Frame", v5, v6)
end

local function ObjectiveItem(a1) -- Line: 135 -- upvalues: createElement (val), BouncyIcon (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 0.8,
        AnchorPoint = a1.AnchorPoint,
        Size = a1.Size,
        Position = a1.Position,
        BackgroundColor3 = Color3.fromRGB(124, 124, 124),
        LayoutOrder = a1.LayoutOrder,
    }, {
        uicorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        uistroke = createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.5,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(0, 0, 0),
        }),
        uilistlayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
        }),
        imageLabel = createElement(BouncyIcon, {
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 0, 12),
            Size = UDim2.fromScale(0.8, 0.8),
            Image = a1.Icon,
        }),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            TextScaled = true,
            RichText = true,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 1, -14),
            Size = UDim2.new(0.85, 0, 0.5, 0),
            Text = a1.RewardText,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromEnum(Enum.Font.GothamBlack),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            uistroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = Color3.fromRGB(0, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Round,
            }),
        }),
    })
end

return function(a1) -- Line: 202 -- upvalues: createElement (val), ObjectiveItem (val), React (val) -- types: a1: table
    local v1 = {}
    for i, j in a1.Objectives do
        table.insert(v1, (createElement(ObjectiveItem, {Size = UDim2.new(1, 0, 0, 120), Icon = j.Icon, RewardText = j.Text})))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = a1.LayoutOrder or 1,
        AnchorPoint = a1.AnchorPoint,
        Size = a1.Size,
        Position = a1.Position,
    }, {
        listLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 16),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Vertical,
        }),
        createElement(React.Fragment, {}, v1),
    })
end