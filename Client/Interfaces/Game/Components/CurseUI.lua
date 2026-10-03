-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.CurseUI
-- Decompile time: 3.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurseCard = require(script.Parent.CurseCard)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 28
    -- upvalues: createElement (val), CurseCard (val), React (val), ReactFlow (val)
    local v1, votedFor
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1.cards, v3, v4 do
        v1 = {
            modifiers = j.data.modifiers,
            title = j.data.title,
            icon = j.data.icon,
            index = i,
            selected = a1.selected,
            clickedOn = a1.clickedOn,
            enabled = a1.enabled,
        }
        votedFor = j.data.votedFor or {}
        v1.votedFor = votedFor

        function v1.onHover() -- Line: 41 -- upvalues: a1 (val), j (val)
            a1.onHover(j.data.title)
        end

        function v1.onUnhover() -- Line: 44 -- upvalues: a1 (val)
            a1.onUnhover()
        end

        function v1.selectCurse(a1_2) -- Line: 47 -- upvalues: a1 (val) -- types: a1_2: string
            a1.selectCurse(a1_2)
        end

        v2[i] = (createElement(CurseCard, v1))
    end
    local u15, u16 = React.useBinding(0)
    local u20, u21 = React.useBinding(0)
    React.useEffect(function() -- Line: 57 -- upvalues: u16 (val), u15 (val), u21 (val), u20 (val)
        local u9 = (game:GetService("RunService")).Heartbeat:Connect(function(a1) -- Line: 58 -- upvalues: u16 (upval), u15 (upval), u21 (upval), u20 (upval)
            u16((u15:getValue()) + a1 * 10)
            u21((u20:getValue()) - a1 * 15)
        end)
        return function() -- Line: 63 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, {})
    local v5, u31 = ReactFlow.useSpring({start = 1, target = 1, speed = 5, damper = 0.6})
    local v6, u36 = ReactFlow.useSpring({start = -1, target = 0, speed = 12, damper = 0.6})
    local useEffect_2 = React.useEffect
    local v7 = {a1.enabled}
    useEffect_2(function() -- Line: 82 -- upvalues: a1 (val), u36 (val), u31 (val)
        if a1.enabled then
            u36({target = 0})
            u31({target = 0.22})
            return
        end
        u36({target = -1})
        u31({target = 1})
    end, v7)
    return createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = v5,
        BorderColor3 = Color3.new(),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.6375, 0.923077),
        }, {
            VotingText = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Font = Enum.Font.GothamBlack,
                Position = v6:map(function(a1) -- Line: 118
                    return UDim2.fromScale(0.5, 0.95 - a1)
                end),
                Size = UDim2.fromScale(0.5, 0.05),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = a1.votingText,
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                uIStroke = createElement("UIStroke", {Thickness = 4, Transparency = 0.6, Color = Color3.fromRGB(0, 0, 0)}),
            }),
            titleContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                Position = v6:map(function(a1) -- Line: 136
                    return UDim2.fromScale(0.5, a1)
                end),
                Size = UDim2.fromScale(0.559641, 0.178715),
                AnchorPoint = Vector2.new(0.5, 0),
            }, {
                header = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    Text = "Select A Curse!",
                    TextScaled = true,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Position = UDim2.fromScale(0.124088, 0.011236),
                    Size = UDim2.fromScale(0.750365, 0.438202),
                    TextColor3 = Color3.new(1, 1, 1),
                }, {
                    uIGradient = createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(166, 255, 221)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 231, 186))),
                        }),
                    }),
                    uIStroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(3, 41, 15)}),
                }),
                underline = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://99580245617140",
                    Position = UDim2.fromScale(0.0248175, 0.449438),
                    Size = UDim2.fromScale(0.944526, 0.483146),
                }),
            }),
            cardContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.0343137, 0.220884),
                Size = UDim2.fromScale(0.910131, 0.587349),
            }, v2),
            placeholderForVFX = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://90410060406573",
                ZIndex = -1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageColor3 = Color3.fromRGB(237, 38, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(2, 2),
                ImageTransparency = v5,
                Rotation = u15,
            }),
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1.23}),
            placeholderForVFX2 = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://90410060406573",
                ZIndex = -1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageColor3 = Color3.fromRGB(0, 28, 152),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1.2, 1.2),
                Rotation = u20,
                ImageTransparency = v5,
            }),
        }),
    })
end)