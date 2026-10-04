-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.HackerTowerBilboard
-- Decompile time: 8.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Shared = ReplicatedStorage.Shared
local React = require(Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
local useSpring = ReactFlow.useSpring
local u24 = Random.new()
return React.memo(function(a1) -- Line: 21
    -- upvalues: useBinding (val), useSpring (val), useEffect (val), u24 (val), RunService (val), createElement (val)
    -- upvalues: React (val)
    local Model = a1.Model
    local v1, u8 = useBinding(UDim2.fromScale(0.5, 0.5))
    local v2, u15 = useBinding(UDim2.fromScale(0.5, 0.5))
    local v3, u19 = useBinding(1)
    local u22, u23 = useBinding(1)
    local v4, u38 = useSpring({
        damper = 0.53,
        speed = 11.25,
        target = 0,
        start = (if not (0 < (math.random(-1, 1))) then -1 else 1) * 85,
    })
    local v5, u53 = useSpring({
        damper = 0.6,
        speed = 12,
        target = 0,
        start = (if not (0 < (math.random(-1, 1))) then -1 else 1) * 340,
    })
    local v6 = useEffect
    local v7 = {a1.Model}
    v6(function() -- Line: 45
        -- upvalues: Model (val), u38 (val), u53 (val), u24 (upval), RunService (upval), u8 (val), u15 (val), u19 (val)
        -- upvalues: u22 (val), u23 (val)
        if Model and Model.Parent then
            u38({target = 0})
            u53({target = 0})
            local u9 = nil
            local u10 = 0
            local u18 = 0 + u24:NextNumber(0, 100)
            local u24_2 = u24:NextNumber(0.4, 0.9)
            local u25 = false
            u9 = RunService.Heartbeat:Connect(function(a1) -- Line: 65
                -- upvalues: Model (upval), u9 (ref), u18 (ref), u10 (ref), u25 (ref), u53 (upval), u38 (upval)
                -- upvalues: u8 (upval), u15 (upval), u19 (upval), u24_2 (ref), u24 (upval), u22 (upval), u23 (upval)
                if Model and Model.Parent then
                    u18 = u18 + a1
                    u10 = u10 + a1
                    local v1 = math.noise(u18 * 0.9, u18 * 0.9)
                    local v2 = math.noise(u18 * 0.9, u18 * 0.9 + 100)
                    local v3, v4 = workspace.CurrentCamera:WorldToScreenPoint(Model.PrimaryPart.Position)
                    if v4 then
                        if u25 then
                            u25 = false
                            u53({target = 0})
                            u38({target = 0})
                        end
                    elseif not u25 then
                        u25 = true
                        u53({target = 340})
                        u38({target = (if not (0 < (math.random(-1, 1))) then -1 else 1) * 85})
                    end
                    u8(UDim2.fromOffset(v3.X, v3.Y))
                    u15(UDim2.fromOffset(v1 * 10, v2 * 10))
                    local v5 = math.clamp(1 / ((workspace.CurrentCamera.CFrame.Position - Model.PrimaryPart.Position).Magnitude / 20), 0.5, 1)
                    u19(v5)
                    if u24_2 < u10 then
                        u24_2 = u24:NextNumber(0.4, 0.9)
                        u10 = 0
                        if u22:getValue() == 1 then
                            u23(1.2)
                            return
                        end
                        u23(1)
                    end
                    return
                end
                u9:Disconnect()
                u9 = nil
            end)
            return function() -- Line: 122 -- upvalues: u9 (ref)
                if u9 then
                    u9:Disconnect()
                    u9 = nil
                end
            end
        end
    end, v7)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1:map(function(a1) -- Line: 136
            return a1
        end),
        Size = UDim2.fromOffset(100, 100),
    }, {
        upper = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v2:map(function(a1) -- Line: 147
                return UDim2.fromScale(0.5, 0.5) + a1
            end),
            Size = UDim2.fromScale(1, 1),
            Rotation = v4,
        }, {
            UIScale = createElement("UIScale", {
                Scale = v4:map(function(a1) -- Line: 155
                    return (85 - math.abs(a1)) / 85 + 0
                end),
            }),
            arrowDown = createElement("ImageLabel", {
                Image = "rbxassetid://91086281872591",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 4,
                ImageColor3 = Color3.fromRGB(0, 0, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, -0.2),
                Size = UDim2.fromOffset(41, 40),
            }),
            square = createElement("ImageLabel", {
                Image = "rbxassetid://120303840322133",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ImageColor3 = Color3.fromRGB(0, 0, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, -0.5),
                Size = UDim2.fromOffset(50, 50),
            }, {
                uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 1)}),
                imageLabel = createElement("ImageLabel", {
                    Image = "rbxassetid://116776275698123",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 999,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.5, 0.5),
                }),
                glitch = createElement("ImageLabel", {
                    Image = "rbxassetid://78911818841108",
                    ImageTransparency = 1,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ImageColor3 = Color3.fromRGB(0, 0, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                }),
            }),
            nameSquare = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.49, -0.63),
                Size = UDim2.fromOffset(30, 25),
            }, {
                uIGradient = createElement("UIGradient", {
                    Rotation = -45,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.498, 1),
                        NumberSequenceKeypoint.new(0.502, 0),
                        (NumberSequenceKeypoint.new(1, 0)),
                    }),
                }),
                frameHolder = createElement("Frame", {
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0, 0.5),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(1, 0.5),
                    Size = UDim2.fromOffset(25, 25),
                }, {
                    towerName = createElement("TextLabel", {
                        TextSize = 19,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        FontFace = Font.new("rbxassetid://12187362578", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
                        Text = a1.DisplayName:lower(),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Size = UDim2.fromOffset(0, 50),
                    }),
                    uIListLayout = createElement("UIListLayout", {
                        Padding = UDim.new(0, 5),
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                    }),
                    uIPadding = createElement("UIPadding", {PaddingRight = UDim.new(0, 7)}),
                }),
            }),
        }),
        dashedSquare = createElement("ImageLabel", {
            Image = "rbxassetid://134545603939658",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(68, 68, 68),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(102, 102),
            Rotation = v5,
        }, {
            UIScale = createElement("UIScale", {
                Scale = React.joinBindings({u22, v5}):map(function(a1) -- Line: 285
                    return a1[1] * (1 - math.abs(a1[2]) / 340)
                end),
            }),
            frame = createElement("Frame", {
                BackgroundTransparency = 0.75,
                BorderSizePixel = 0,
                Rotation = 45,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(65, 236, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(65, 65),
            }),
        }),
        uIScale = createElement("UIScale", {Scale = v3}),
    })
end)