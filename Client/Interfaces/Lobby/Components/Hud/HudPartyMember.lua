-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudPartyMember
-- Decompile time: 4.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(Components.ImageLabel)
local Tooltip = require(Components.Tooltip)
local useSound = require(Hooks.useSound)
local Spring = ReactFlow.Spring
local Tween = ReactFlow.Tween
local Event = React.Event
local useTween = ReactFlow.useTween
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useEffect = React.useEffect
local joinBindings = React.joinBindings
local createElement = React.createElement
return React.memo(function(a1) -- Line: 48
    -- upvalues: useSound (val), useState (val), useGroupAnimation (val), useAnimation (val), Spring (val), Tween (val)
    -- upvalues: useTween (val), useEffect (val), createElement (val), Event (val), Tooltip (val), joinBindings (val)
    -- upvalues: ImageLabel (val)
    local u3 = a1.Visible ~= false
    local v1 = a1.interactive ~= false
    local u11 = a1.glow == true
    local icon = a1.icon
    local clicked = a1.clicked
    local name = a1.name
    local glowColor = a1.glowColor
    if not glowColor then
        glowColor = Color3.fromRGB(62, 255, 85)
    end
    local strokeColor = a1.strokeColor or Color3.fromRGB(85, 255, 127)
    local Click = useSound("Click")
    local u34, u35 = useState(false)
    local v2, u109 = useGroupAnimation({
        hover = useAnimation({scale = Spring({target = 1.2, speed = 20, damper = 0.5})}),
        press = useAnimation({scale = Spring({target = 0.9, speed = 20, damper = 0.5})}),
        default = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.15)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.15)}),
            scale = Tween({target = 1, info = TweenInfo.new(0.15)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.15)}),
            glow = Tween({target = 1, info = TweenInfo.new(0.15)}),
            position = Tween({target = UDim2.fromScale(0.5, 1), info = TweenInfo.new(0.15)}),
            scale = Spring({target = 1, speed = 20, damper = 0.5}),
        }),
    }, {transparency = 1, glow = 1, scale = 1, position = UDim2.fromScale(0.5, 1)})
    local v3, u116 = useTween({start = 1, target = 1, info = TweenInfo.new(0.15)})
    local v4, u125 = useTween({start = glowColor, target = glowColor, info = TweenInfo.new(0.15)})
    local v5 = {u11, glowColor}
    useEffect(function() -- Line: 102 -- upvalues: u116 (val), u11 (val), u125 (val), glowColor (val)
        u116({target = if not u11 then 1 else 0})
        u125({target = glowColor})
    end, v5)
    v5 = {u3}
    useEffect(function() -- Line: 107 -- upvalues: u109 (val), u3 (val)
        u109(if not u3 then "disable" else "default")
    end, v5)
    v5 = {BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v5.Size = Size
    v5.Position = a1.Position
    v5.AnchorPoint = a1.AnchorPoint
    v5.LayoutOrder = a1.LayoutOrder or 0
    v5.ZIndex = a1.ZIndex
    v5.BackgroundTransparency = 1
    v5.AutoButtonColor = false
    v5.Active = u3 and v1
    v5.Selectable = u3 and v1
    v5.Text = ""
    v5.Visible = v2.transparency:map(function(a1) -- Line: 124
        return a1 < 0.99
    end)
    local MouseEnter = Event.MouseEnter
    v5[MouseEnter] = if v1 then function() -- Line: 130 -- upvalues: u3 (val), u35 (val), u109 (val)
        if not u3 then
            return
        end
        u35(true)
        u109("hover")
    end else nil
    local MouseLeave = Event.MouseLeave
    v5[MouseLeave] = if v1 then function() -- Line: 141 -- upvalues: u3 (val), u35 (val), u109 (val)
        if not u3 then
            return
        end
        u35(false)
        u109("default")
    end else nil
    local MouseButton1Down = Event.MouseButton1Down
    v5[MouseButton1Down] = if v1 then function() -- Line: 152 -- upvalues: u3 (val), u109 (val)
        if not u3 then
            return
        end
        u109("press")
    end else nil
    local MouseButton1Up = Event.MouseButton1Up
    v5[MouseButton1Up] = if v1 then function() -- Line: 162 -- upvalues: u3 (val), u34 (val), u109 (val), clicked (val), Click (val)
        if not u3 then
            return
        end
        if not u34 then
            u109("default")
            return
        end
        u109("hover")
        if not clicked then
            return
        end
        Click()
        clicked()
    end else nil
    local v6 = {
        tooltip = name and createElement(Tooltip, {
            Name = ("%*PartyTooltip"):format(name),
            Header = name,
            Subject = if not a1.glow then "Party Member" else "Party Leader",
        }),
    }
    local v7 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v2.position,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v2.transparency:map(function(a1) -- Line: 190
            return 1 - (1 - a1) * 0.5
        end),
        Size = v2.scale:map(function(a1) -- Line: 193
            return UDim2.fromScale(a1, a1)
        end),
        ZIndex = a1.ZIndex,
    }
    local v8 = {
        glow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://79222767571461",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = v4,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.57, 1.57),
            ZIndex = a1.ZIndex,
            ImageTransparency = joinBindings({v3, v2.transparency}):map(function(a1) -- Line: 210
                return a1[1] + a1[2]
            end),
        }),
    }
    local v9 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v9.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
    v9.ImageTransparency = v2.transparency
    v9.Position = UDim2.fromScale(0.5, 0.5)
    local iconSize = a1.iconSize or UDim2.fromScale(1, 1)
    v9.Size = iconSize
    v9.ZIndex = if not a1.ZIndex then 2 else a1.ZIndex + 1
    v8.imageLabel = createElement(ImageLabel, v9, {uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})})
    v8.uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})
    v8.uIStroke = createElement("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = strokeColor,
        Transparency = v2.transparency,
        Thickness = v2.scale:map(function(a1) -- Line: 241
            return a1 * 2
        end),
    })
    v8.uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")
    v6.content = createElement("Frame", v7, v8)
    return createElement("TextButton", v5, v6)
end)