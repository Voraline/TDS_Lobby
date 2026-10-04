-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.AreaIndicator
-- Decompile time: 5.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local memo = React.memo
local useMemo = React.useMemo
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local createPortal = ReactRoblox.createPortal
local CurrentCamera = workspace.CurrentCamera

local function gradient(a1) -- Line: 34 -- upvalues: createElement (val) -- types: a1: table
    local right = a1.right
    return createElement("UIGradient", {
        Rotation = a1.rotation,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, if not right then 1 else 0),
            NumberSequenceKeypoint.new(0.5, if not right then 1 else 0),
            NumberSequenceKeypoint.new(0.501, if not right then 0 else 1),
            (NumberSequenceKeypoint.new(1, if not right then 0 else 1)),
        }),
    })
end

local function areaIndicator(a1) -- Line: 51
    -- upvalues: useMemo (val), createElement (val), gradient (val)
    local v1 = useMemo
    local v2 = {a1.angle}
    v1 = v1(function() -- Line: 57 -- upvalues: a1 (val)
        return a1.angle:map(function(a1) -- Line: 58
            return a1 / 2
        end)
    end, v2)
    local v3 = useMemo
    local v4 = {a1.angle}
    v3 = v3(function() -- Line: 63 -- upvalues: a1 (val)
        return a1.angle:map(function(a1) -- Line: 64
            return -a1 / 2
        end)
    end, v4)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Rotation = a1.rotation,
    }, {
        right = createElement("CanvasGroup", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            GroupTransparency = a1.transparency,
            Position = UDim2.fromScale(0.75, 0.5),
            Size = UDim2.fromScale(0.5, 1),
        }, {
            fill = createElement("Frame", {
                BackgroundTransparency = 0.8,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = a1.color,
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromScale(2, 1),
            }, {
                uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                uIStroke = createElement("UIStroke", {
                    Thickness = 6,
                    BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                    Color = a1.color,
                    Transparency = a1.transparency,
                }, {gradient = createElement(gradient, {right = true, rotation = v1})}),
                gradient = createElement(gradient, {right = true, rotation = v1}),
            }),
            edge = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                Rotation = v1,
                Size = UDim2.new(0, 6, 1, 0),
            }, {
                frame = createElement("Frame", {
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = a1.color,
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromScale(1, 1),
                }, {gradient = createElement(gradient, {right = true, rotation = 90})}),
            }),
        }),
        left = createElement("CanvasGroup", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            GroupTransparency = a1.transparency,
            Position = UDim2.fromScale(0.25, 0.5),
            Size = UDim2.fromScale(0.5, 1),
        }, {
            fill = createElement("Frame", {
                BackgroundTransparency = 0.8,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = a1.color,
                Position = UDim2.fromScale(1, 0.5),
                Size = UDim2.fromScale(2, 1),
            }, {
                uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                uIStroke = createElement("UIStroke", {
                    Thickness = 6,
                    BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                    Color = a1.color,
                    Transparency = a1.transparency,
                }, {gradient = createElement(gradient, {right = false, rotation = v3})}),
                gradient = createElement(gradient, {right = false, rotation = v3}),
            }),
            edge = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(1, 0.5),
                Rotation = v3,
                Size = UDim2.new(0, 6, 1, 0),
            }, {
                frame = createElement("Frame", {
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = a1.color,
                    Position = UDim2.fromScale(1, 0.5),
                    Size = UDim2.fromScale(1, 1),
                }, {gradient = createElement(gradient, {right = true, rotation = 90})}),
            }),
        }),
    })
end

return memo(function(a1) -- Line: 196
    -- upvalues: useTween (val), useBinding (val), useRef (val), useEffect (val), TimescaleUtilities (val)
    -- upvalues: createElement (val), createPortal (val), CurrentCamera (val), areaIndicator (val)
    local v1, v2 = useTween(a1.initialAngle, a1.tweenInfo, true, true, true)
    v2(a1.desiredAngle)
    local v3, u21 = useTween(0, TweenInfo.new(0.25), true, true, true)
    local v4, u29 = useBinding(a1.basePart == nil)
    local v5 = Vector3.new(a1.radius * 2, 0.001, a1.radius * 2)
    local v6 = useRef()
    local u41 = useRef()
    local cframe = not a1.basePart and a1.cframe or CFrame.new()
    local v7 = cframe * CFrame.Angles(0, 1.5707963267948966, 0)
    useEffect(function() -- Line: 211 -- upvalues: a1 (val), u41 (val), TimescaleUtilities (upval), u21 (val), u29 (val)
        if not a1.lifeTime then
            return
        end
        u41.current = a1.basePart
        local u7 = task.spawn(function() -- Line: 217 -- upvalues: TimescaleUtilities (upval), a1 (upval), u21 (upval)
            TimescaleUtilities.Delay(a1.lifeTime, function() -- Line: 218 -- upvalues: u21 (upval)
                u21(1)
            end)
        end)
        local u18 = nil
        if a1.basePart then
            u18 = a1.basePart.Destroying:Connect(function() -- Line: 225 -- upvalues: u29 (upval)
                u29(true)
            end)
        end
        return function() -- Line: 230 -- upvalues: u7 (val), u18 (ref)
            task.cancel(u7)
            if u18 then
                u18:Disconnect()
            end
        end
    end, {})
    local v8 = {
        AlwaysOnTop = true,
        Brightness = 2,
        ClipsDescendants = true,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        Face = Enum.NormalId.Top,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Adornee = v6,
    }
    local v9 = {}
    local v10 = {}
    local v11 = {
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Transparency = 1,
        Anchored = v4,
        Size = v5,
    }
    local cframe_2 = not a1.basePart and a1.cframe or CFrame.new()
    v11.CFrame = cframe_2
    v11.ref = v6
    local v12 = {}
    local basePart = a1.basePart and createElement("Motor6D", {Part0 = v6, Part1 = u41, C0 = a1.cframe})
    v12.motor6D = basePart
    v10.part = createElement("Part", v11, v12)
    v9.portal = createPortal(v10, CurrentCamera)
    v9.indicator = createElement(areaIndicator, {rotation = 90, angle = v1, transparency = v3, color = a1.color3})
    return createElement("SurfaceGui", v8, v9)
end)