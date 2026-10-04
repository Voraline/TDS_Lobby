-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassTrackValue
-- Decompile time: 9.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local BattlepassPreview = require(script.Parent.BattlepassPreview)
local BattlepassValueDisplay = require(script.Parent.BattlepassValueDisplay)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useConfetti = require(Hooks.useConfetti)
local useSound = require(Hooks.useSound)
local createElement = React.createElement
local useEffect = React.useEffect
local useTween = ReactFlow.useTween
local useRef = React.useRef
local memo = React.memo
local u47 = Color3.fromRGB(58, 58, 58)
local u48 = {}
u48[1] = {
    Amount = 40,
    Lifetime = 1,
    Force = 20,
    Radius = 5,
    Direction = Vector2.new(-0.9, 0),
}
local u56 = memo(function(a1) -- Line: 31 -- upvalues: useSound (val), useConfetti (val), u48 (val), useEffect (val)
    local rootRef = a1.rootRef
    local Obtain = useSound("Obtain")
    local u7, u8 = useConfetti(u48)
    local v1 = {u7, rootRef}
    useEffect(function() -- Line: 36 -- upvalues: u7 (val), rootRef (val)
        if u7.current and rootRef.current then
            u7.current.Parent = rootRef.current
            return
        end
    end, v1)
    useEffect(function() -- Line: 44 -- upvalues: u8 (val), Obtain (val)
        u8()
        Obtain()
    end, {})
    return nil
end)
return (memo(function(a1) -- Line: 52
    -- upvalues: useRef (val), useTween (val), useEffect (val), TweenService (val), createElement (val), u56 (val)
    -- upvalues: BattlepassPreview (val), u47 (val), BattlepassValueDisplay (val)
    local u2 = useRef()
    local v1, u10 = useTween({start = 0, target = 1, info = TweenInfo.new(0.1, Enum.EasingStyle.Sine)})
    local scrollRef = a1.scrollRef
    local v2 = a1.level or 1
    local u15 = a1.LayoutOrder or 1
    local u17 = a1.maxLevel or 1
    local v3 = Color3.fromRGB(254, 163, 3)
    local v4 = Color3.fromRGB(255, 255, 255)
    local locked = a1.locked
    local completed = a1.completed
    local selected = a1.selected
    local u33 = a1.Visible ~= false
    local regular = a1.regular
    local premium = a1.premium
    local premiumLocked = a1.premiumLocked
    local u41 = useRef(completed)
    local u45 = useRef(selected)
    if completed then
        v3 = Color3.fromRGB(42, 255, 97)
        v4 = Color3.fromRGB(11, 33, 0)
    elseif locked then
        v3 = Color3.fromRGB(58, 58, 58)
        v4 = Color3.fromRGB(161, 161, 161)
    end
    local v5 = {u33}
    useEffect(function() -- Line: 89 -- upvalues: u10 (val), u33 (val), u15 (val)
        u10({
            start = if not u33 then 0 else 1,
            target = if not u33 then 1 else 0,
            info = TweenInfo.new(0.1 + 0.05 * u15, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
        })
    end, v5)
    v5 = {selected, completed}
    useEffect(function() -- Line: 101
        -- upvalues: completed (val), u41 (val), selected (val), u45 (val), scrollRef (val), u2 (val), u17 (val)
        -- upvalues: u15 (val), TweenService (upval)
        local v1 = completed ~= u41.current
        local v2 = selected ~= u45.current
        u41.current = completed
        u45.current = selected
        if not v1 and not v2 then
            return
        end
        if scrollRef and u2 and scrollRef.current and u2.current then
            local current = scrollRef.current
            local X = current.AbsoluteCanvasSize.X
            local X_2 = current.CanvasPosition.X
            local X_3 = current.AbsoluteSize.X
            local v3 = X / math.max(u17, 1)
            local v4 = (u15 - 1) * v3
            local v5 = X_2 + X_3
            local v6 = v4 + v3
            if v4 < X_2 or v5 < v6 then
                TweenService:Create(current, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {CanvasPosition = Vector2.new(v4, 0)}):Play()
            end
            return
        end
    end, v5)
    v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.585),
        Size = UDim2.fromScale(0.169, 0.916),
        LayoutOrder = a1.LayoutOrder or 1,
        ref = u2,
    }
    local v6 = {}
    local v7 = if a1.regularJustClaimed then createElement(u56, {rootRef = u2}) or nil else a1.premiumJustClaimed and createElement(u56, {rootRef = u2}) or nil
    v6.confetti = v7
    v6.aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.42})
    local v8 = {
        Position = v1:map(function(a1) -- Line: 160
            return UDim2.fromScale(0, a1)
        end),
        Transparency = a1.Transparency,
        selected = a1.selected,
    }
    v8.iconVisible = regular ~= nil
    v8.locked = regular and regular.locked or locked
    local completed_2 = regular and regular.completed or completed
    v8.completed = completed_2
    v8.color = regular and Color3.fromRGB(61, 194, 255) or u47
    v8.clicked = regular and regular.clicked
    v8.item = regular and regular.data
    v6.regular = createElement(BattlepassPreview, v8)
    v8 = {
        premium = true,
        Position = v1:map(function(a1) -- Line: 174
            return UDim2.fromScale(0, 0.432 + a1)
        end),
        Transparency = a1.Transparency,
        selected = a1.selected,
    }
    v8.iconVisible = premium ~= nil
    v8.locked = premium and premium.locked or premiumLocked or locked
    local completed_3 = premium and premium.completed or completed
    v8.completed = completed_3
    v8.color = premium and Color3.fromRGB(255, 183, 42) or u47
    v8.clicked = premium and premium.clicked
    v8.item = premium and premium.data
    v6.premium = createElement(BattlepassPreview, v8)
    v6.level = createElement(BattlepassValueDisplay, {level = v2, color = v3, textColor = v4, Transparency = a1.Transparency})
    return createElement("Frame", v5, v6)
end))