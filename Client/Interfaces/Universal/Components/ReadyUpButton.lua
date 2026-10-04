-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.ReadyUpButton
-- Decompile time: 12.81 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("TweenService")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local Event = React.Event
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
local memo = React.memo
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
local u59 = Color3.fromRGB(16, 85, 0)
local u64 = Color3.fromRGB(43, 235, 0)
local u67 = memo(function(a1) -- Line: 34
    -- upvalues: useRef (val), useMemo (val), Players (val), useSpring (val), useTween (val), useEffect (val)
    -- upvalues: createElement (val), ImageLabel (val)
    local userId = a1.userId
    local u4 = a1.voted == true
    local u15 = if not u4 then Color3.new(0.4, 0.4, 0.4) else Color3.new(1, 1, 1)
    local u19 = useRef(u4)
    local v1 = {userId}
    local v2 = useMemo(function() -- Line: 41 -- upvalues: Players (upval), userId (val)
        return Players:GetUserThumbnailAsync(
            if not userId then 16983447 else if not (userId < 1) then userId else 16983447,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size48x48
        )
    end, v1)
    local v3, u30 = useSpring({start = 1, target = 1, speed = 10, damper = 0.5})
    local v4, u36 = useSpring({speed = 20, damper = 0.2, start = Vector2.zero, target = Vector2.zero})
    local v5, u46 = useTween({
        info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        start = u15,
        target = u15,
    })
    local v6 = {u15}
    useEffect(function() -- Line: 67 -- upvalues: u46 (val), u15 (val), u19 (val), u4 (val), u30 (val), u36 (val)
        u46({
            info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            target = u15,
        })
        if u19.current ~= u4 then
            if not u4 then
                u36({damper = 0.2, speed = 20, force = Vector2.new(200, 0)})
            else
                u30({force = 5})
                u36({damper = 0.7, speed = 10, force = Vector2.new(0, 200)})
            end
            u19.current = u4
        end
    end, v6)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.01, -0.03),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = v2,
            ImageColor3 = v5,
            ImageTransparency = a1.transparency or 0,
            Position = v4:map(function(a1) -- Line: 106
                return UDim2.new(0.5, a1.X, 0.5, -a1.Y)
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            uIScale = createElement("UIScale", {Scale = v3}),
        }),
    })
end)
return memo(function(a1) -- Line: 122
    -- upvalues: u59 (val), u64 (val), useTransparencyModifier (val), useState (val), useBinding (val), useSpring (val)
    -- upvalues: useTween (val), Sift (val), createElement (val), u67 (val), useEffect (val), RunService (val)
    -- upvalues: Event (val)
    local players = a1.players or {}
    local votedPlayers = a1.votedPlayers
    if not votedPlayers then
        votedPlayers = {}
    end
    local v1 = a1.hasVoted == true
    local clicked = a1.clicked
    local v2 = a1.text or "READY!"
    local u16 = if not v1 then u64 else u59
    local u20 = a1.visible ~= false
    local v3 = useTransparencyModifier(a1.transparency or 0)
    local u29, u30 = useState(false)
    local u33, u34 = useState(false)
    local v4, u38 = useBinding(2)
    local v5, u42 = useSpring({speed = 40, damper = 0.7, start = 1, target = 1})
    local v6, u53 = useTween({
        info = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        start = u16,
        target = u16,
    })
    local u56 = v3(0)
    local v7 = Sift.Array.map(players, function(a1) -- Line: 151 -- upvalues: createElement (upval), u67 (upval), u56 (val), votedPlayers (val)
        return createElement(u67, {
            userId = a1,
            transparency = u56,
            voted = table.find(votedPlayers, a1) ~= nil,
        })
    end)
    local v8 = {u20}
    useEffect(function() -- Line: 159 -- upvalues: u20 (val), RunService (upval), u38 (val)
        if not u20 then
            return
        end
        local u1 = 0
        local u7 = RunService.RenderStepped:Connect(function(a1) -- Line: 165 -- upvalues: u1 (ref), u38 (upval)
            u1 = u1 + a1
            u38(math.abs((math.sin(u1 * 2.5)) * 2.5) + 2)
        end)
        return function() -- Line: 170 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, v8)
    v8 = {u16}
    useEffect(function() -- Line: 175 -- upvalues: u53 (val), u16 (val)
        u53({
            info = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            target = u16,
        })
    end, v8)
    v8 = {u33, u29}
    useEffect(function() -- Line: 182 -- upvalues: u42 (val), u33 (val), u29 (val)
        u42({target = if not u33 then if not u29 then 1 else 1.1 else 0.95})
    end, v8)
    local v9 = createElement
    v8 = {BackgroundTransparency = 1}
    local anchorPoint = a1.anchorPoint or Vector2.new(1, 0.5)
    v8.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.964758, 0.380983)
    v8.Position = position
    local size = a1.size or UDim2.fromScale(0.475771, 0.497488)
    v8.Size = size
    local v10 = {}
    local v11 = createElement
    local v12 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = v3(0),
        BackgroundColor3 = a1.color or v6,
    }
    local v13 = {
        uiScale = createElement("UIScale", {Scale = v5}),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        uIStroke = createElement("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = v4, Transparency = v3(0)}),
        text = createElement("TextLabel", {
            BackgroundTransparency = 0.65,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.new(),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.95),
            Size = UDim2.fromScale(0.960591, 0.4),
            Text = v2,
            TextTransparency = v3(0),
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = v3(0)}),
        }),
    }
    local v14 = createElement
    local v15 = {
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextColor3 = Color3.new(),
        TextScaled = true,
        ZIndex = 4,
    }

    v15[Event.MouseEnter] = function() -- Line: 249 -- upvalues: u30 (val)
        u30(true)
    end

    v15[Event.MouseLeave] = function() -- Line: 252 -- upvalues: u30 (val)
        u30(false)
    end

    v15[Event.MouseButton1Down] = function() -- Line: 255 -- upvalues: u34 (val)
        u34(true)
    end

    v15[Event.MouseButton1Up] = function() -- Line: 258 -- upvalues: u34 (val), u29 (val), clicked (val)
        u34(false)
        if u29 and clicked then
            clicked()
        end
    end

    v13.button = v14("TextButton", v15, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 14})})
    v13.players = createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.02),
        Size = UDim2.fromScale(0.96, 0.5),
    }, {
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.025, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }, v7)
    v10.container = v11("Frame", v12, v13)
    return v9("Frame", v8, v10)
end)