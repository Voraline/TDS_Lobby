-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.AreaIndicatorFull
-- Decompile time: 2.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local useRef = React.useRef
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local useMemo = React.useMemo
local CurrentCamera = workspace.CurrentCamera

local function areaIndicator(a1) -- Line: 28 -- upvalues: useMemo (val), createElement (val) -- types: a1: table
    return createElement("CanvasGroup", {
        BackgroundTransparency = 1,
        Rotation = -90,
        GroupTransparency = a1.transparency,
        Size = UDim2.fromScale(1, 1),
    }, {
        background = createElement("Frame", {
            BackgroundTransparency = 0.8,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = a1.color,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            uIStroke = createElement("UIStroke", {
                Thickness = 6,
                BorderStrokePosition = Enum.BorderStrokePosition.Inner,
                Color = a1.color,
            }),
        }),
        fill = createElement("Frame", {
            BackgroundTransparency = 0.5,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = a1.color,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = useMemo(function() -- Line: 33 -- upvalues: a1 (val)
                return a1.progress:map(function(a1) -- Line: 34
                    return UDim2.fromScale(a1, a1)
                end)
            end),
        }, {uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
    })
end

return function(a1) -- Line: 77
    -- upvalues: useTween (val), useRef (val), React (val), TimescaleUtilities (val), createElement (val)
    -- upvalues: createPortal (val), CurrentCamera (val), areaIndicator (val)
    local v1, v2 = useTween(0, a1.tweenInfo, true, true, true)
    v2(1)
    local v3, u21 = useTween(0, TweenInfo.new(0.25), true, true, true)
    local v4 = Vector3.new(a1.radius * 2, 0.001, a1.radius * 2)
    local v5 = useRef()
    React.useEffect(function() -- Line: 86 -- upvalues: a1 (val), TimescaleUtilities (upval), u21 (val)
        if not a1.lifeTime then
            return
        end
        local u4 = task.spawn(function() -- Line: 90 -- upvalues: TimescaleUtilities (upval), a1 (upval), u21 (upval)
            TimescaleUtilities.Delay(a1.lifeTime, function() -- Line: 91 -- upvalues: u21 (upval)
                u21(1)
            end)
        end)
        return function() -- Line: 95 -- upvalues: u4 (val)
            task.cancel(u4)
        end
    end, {})
    return createElement("SurfaceGui", {
        AlwaysOnTop = true,
        Brightness = 2,
        ClipsDescendants = true,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        Face = Enum.NormalId.Top,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Adornee = v5,
    }, {
        portal = createPortal({
            part = createElement("Part", {
                Anchored = true,
                CanCollide = false,
                CanQuery = false,
                CanTouch = false,
                Transparency = 1,
                Size = v4,
                Position = a1.position,
                ref = v5,
            }),
        }, CurrentCamera),
        areaIndicator = createElement(areaIndicator, {transparency = v3, progress = v1, color = a1.color3}),
    })
end