-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTeamPlayers
-- Decompile time: 13.86 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local Player = require(ReplicatedStorage.Client.Interfaces.Components.Player)
local Change = React.Change
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useRef = React.useRef
local useBinding = React.useBinding
local memo = React.memo
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local Tween = ReactFlow.Tween
local u43 = memo(function(a1) -- Line: 21
    -- upvalues: useRef (val), useState (val), useBinding (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Tween (val), useEffect (val), Players (val), createElement (val), Loader (val), Player (val)
    -- upvalues: Change (val)
    local userId = a1.userId
    local team = a1.team
    local bansPerPlayer = a1.bansPerPlayer
    local v1 = useRef()
    local v2, u8 = useState()
    local u11, u12 = useState(true)
    local v3, u16 = useState(true)
    local v4, u20 = useState(true)
    local v5, u24 = useBinding(12)
    local v6 = if team ~= "Red" then "rbxassetid://133744961973438" else "rbxassetid://91688211474848"
    local v7, u30 = useState(true)
    local u33 = v7
    if not u33 then
        u33 = not v2
    end
    local v8, u108 = useGroupAnimation({
        enabled = useAnimation({
            scale = Tween({
                target = 1.1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            glow = Tween({
                target = 0,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 0,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            position = Tween({
                target = 0,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
        disabled = useAnimation({
            scale = Tween({
                target = 1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            glow = Tween({
                target = 1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            position = Tween({
                target = 10,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
    }, {glow = 1, scale = 1, transparency = 1, position = 10})
    local v9 = {u33, u11}
    useEffect(function() -- Line: 83 -- upvalues: u108 (val), u33 (val), u11 (val)
        u108(if u33 then "disabled" else if not u11 then "disabled" else "enabled")
    end, v9)
    v9 = {userId}
    useEffect(function() -- Line: 87 -- upvalues: u8 (val), Players (upval), userId (val)
        u8()
        local u2 = nil
        u2 = task.spawn(function() -- Line: 91 -- upvalues: Players (upval), userId (upval), u2 (ref), u8 (upval)
            local NameFromUserIdAsync = Players:GetNameFromUserIdAsync((math.max(1, userId)))
            u2 = nil
            u8(NameFromUserIdAsync)
        end)
        return function() -- Line: 97 -- upvalues: u2 (ref)
            if u2 then
                task.cancel(u2)
            end
        end
    end, v9)
    v9 = {bansPerPlayer}
    useEffect(function() -- Line: 104 -- upvalues: bansPerPlayer (val), userId (val), u16 (val), u20 (val), u12 (val)
        local v1 = bansPerPlayer[tostring(userId)]
        if v1 ~= nil then
            u16(v1 >= 1)
            u20(v1 >= 2)
            u12(v1 > 0)
            return
        end
        u16(false)
        u20(false)
        u12(false)
    end, v9)
    v9 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = v8.scale:map(function(a1) -- Line: 122
            return UDim2.fromScale(a1, a1)
        end),
    }
    local v10 = {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
        flex = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.Grow}),
    }
    local v11 = u33 and createElement(Loader, {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://13602640868",
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.9),
        Size = UDim2.fromScale(0.8, 0.8),
        Visible = u33,
    })
    v10.loader = v11
    v10.viewport = createElement("ViewportFrame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1.25, 1.25),
        CurrentCamera = v1,
        Visible = not u33,
    }, {
        camera = createElement("Camera", {FieldOfView = 10, CFrame = CFrame.new(0, 0.5, 30), ref = v1}),
        player = createElement(Player, {
            origin = (CFrame.new(0, 0, 2)) * CFrame.Angles(0, -2.792526803190927, 0),
            userId = a1.userId,
            onPlayerCharacter = function() -- Line: 168 -- upvalues: u30 (val)
                u30(false)
            end,
        }),
    })
    v10.glow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://6288018083",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v8.glow,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(2, 2),
    })
    v10.banAmountFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v8.position:map(function(a1) -- Line: 194
            return UDim2.new(0.5, 0, 1, a1)
        end),
        Size = UDim2.fromScale(2, 0.4),
    }, {
        createElement("UIListLayout", {
            Padding = UDim.new(-0.025, 0),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Image = v6,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            Visible = v3,
        }, {(createElement("UIAspectRatioConstraint", {AspectRatio = 1}))}),
        (createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Image = v6,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            Visible = v4,
        }, {(createElement("UIAspectRatioConstraint", {AspectRatio = 1}))})),
    })
    v11 = createElement
    local v12 = {
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1.5, 1),
        Text = v2 or "...",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = false,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        TextSize = v5,
        Visible = not u33,
        ZIndex = 2,
    }

    v12[Change.AbsoluteSize] = function(a1) -- Line: 284 -- upvalues: u24 (val)
        u24((math.clamp(math.round(a1.AbsoluteSize.Y * 0.2), 14, 100)))
    end

    v10.textLabel = v11("TextLabel", v12, {
        uIStroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(30, 30, 30)}),
    })
    return createElement("Frame", v9, v10)
end)
return (memo(function(a1) -- Line: 313 -- upvalues: createElement (val), u43 (val)
    local player1 = a1.player1
    local player2 = a1.player2
    local team = a1.team
    local bansPerPlayer = a1.bansPerPlayer
    local v1 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local Size = a1.Size or UDim2.fromScale(0.3, 1)
    v1.Size = Size
    v1.Position = a1.Position
    v1.AnchorPoint = a1.AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    return createElement("Frame", v1, {
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0.2, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
        }),
        player1 = player1 and createElement(u43, {LayoutOrder = 1, userId = player1, team = team, bansPerPlayer = bansPerPlayer}),
        player2 = player2 and createElement(u43, {LayoutOrder = 2, userId = player2, team = team, bansPerPlayer = bansPerPlayer}),
    })
end))