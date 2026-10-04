-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel
-- Decompile time: 19.04 ms

local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useDebounce = require(ReplicatedStorage.Client.Interfaces.Hooks.useDebounce)
local useLastInputType = require(ReplicatedStorage.Client.Interfaces.Hooks.useLastInputType)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local EmoteWheelPagination = require(script.EmoteWheelPagination)
local EmoteWheelSegment = require(script.EmoteWheelSegment)
local EmoteWheelSlots = require(script.EmoteWheelSlots)
local EmoteWheelSlotEmpty = EmoteWheelSlots.EmoteWheelSlotEmpty
local EmoteWheelSlot = EmoteWheelSlots.EmoteWheelSlot
local createElement = React.createElement
local useBinding = React.useBinding
local useState = React.useState
local useRef = React.useRef
local u102 = Vector2.new(0.5, 0.5)
local u106 = UDim2.fromScale(0.5, 0.5)
local u110 = UDim2.fromScale(1, 1)
local Mouse = Players.LocalPlayer:GetMouse()

local function getMousePosition() -- Line: 61 -- upvalues: Mouse (val)
    return Vector2.new(Mouse.X, Mouse.Y)
end

local function offsetPosition(a1, a2) -- Line: 65 -- types: a1: Vector2, a2: number
    return UDim2.new(a1.X.Scale, a1.X.Offset, a1.Y.Scale, a1.Y.Offset + a2)
end

return React.memo(function(a1) -- Line: 74
    -- upvalues: UserInputService (val), useMediaQuery (val), useState (val), useRef (val), useLastInputType (val)
    -- upvalues: useBinding (val), useSpring (val), useTween (val), Sift (val), u102 (val), u106 (val), u110 (val)
    -- upvalues: React (val), offsetPosition (val), useSound (val), createElement (val), EmoteWheelSegment (val)
    -- upvalues: EmoteWheelSlotEmpty (val), EmoteWheelSlot (val), useReactBindings (val), ContextActionService (val)
    -- upvalues: Mouse (val), GuiService (val), useDebounce (val), EmoteWheelPagination (val)
    local displayName, u41, v1, v2, v3, v4, v5, v6, v7
    local v8 = if not UserInputService.TouchEnabled then "Activated" else "TouchTap"
    local u473 = if not useMediaQuery("large") then 1.2 else 1
    local v9 = {}
    local u277, u369 = useState(nil)
    local u383 = useRef(nil)
    local u362 = useRef(nil)
    local u355 = useLastInputType()
    local v10, u26 = useBinding(Vector2.zero)
    local Visible = a1.Visible
    if not Visible then
        Visible = useBinding(true)
    end
    v1, _, _, u41 = useSpring(0, 0.5, 30, true)
    local u461, u326 = useSpring(0, 1, 30, true)
    local v11, u336 = useTween(0, TweenInfo.new(0.2, Enum.EasingStyle.Sine), true, true)
    local items = a1.items
    if not items then
        items = {}
    end
    local u532 = a1.page or 1
    local u539 = a1.maxPages or 1
    local v12 = a1.showEmptySlots ~= false
    local u414 = u461:map(function(a1) -- Line: 98
        return a1 > 0.01
    end)
    local v13 = Sift.Dictionary.merge({BackgroundTransparency = 1, AnchorPoint = u102, Position = u106, Size = u110}, a1.native or {})
    local Position = v13.Position
    local u94 = v13[React.Change.AbsoluteSize]
    v13.Position = v1:map(function(a1) -- Line: 109 -- upvalues: offsetPosition (upval), Position (val)
        return offsetPosition(Position, a1)
    end)
    v13.ref = u362

    v13[React.Change.AbsoluteSize] = function(a1) -- Line: 113 -- upvalues: u26 (val), u94 (val) -- types: a1: userdata
        u26(a1.AbsoluteSize)
        if u94 then
            u94(a1)
        end
    end

    local v14 = {u277}
    React.useEffect(function() -- Line: 121 -- upvalues: u383 (val), u277 (val)
        u383.current = u277
    end, v14)
    local u131 = useSound("Click", true)
    local useCallback = React.useCallback
    local v15 = {u532, a1.updatePage}
    local u490 = useCallback(function(a1_2) -- Line: 126 -- upvalues: u41 (val), u131 (val), u532 (val), u539 (val), a1 (val) -- types: a1_2: boolean
        local v1
        u41(-1000)
        u131()
        if not a1_2 then
            v1 = u532 - 1
            if v1 < 1 then
                v1 = u539
            end
        else
            v1 = u532 + 1
            if u539 < v1 then
                v1 = 1
            end
        end
        if a1.updatePage then
            a1.updatePage(v1)
        end
    end, v15)
    local u376 = React.useCallback(function(a1, a2) -- Line: 148 -- upvalues: u369 (val) -- types: a2: userdata
        local v1 = a2 - (a1.AbsolutePosition + a1.AbsoluteSize / 2)
        local v2 = math.atan2(v1.Y, v1.X) + 1.5707963267948966
        if v2 < 0 then
            v2 = v2 + 6.283185307179586
        end
        local v3 = math.ceil(((math.deg(v2)) + 30) / 60) - 1
        if v3 > 6 or v3 < 1 then
            v3 = 6
        end
        u369(v3)
        return v3
    end, {})
    for i = 1, 6 do
        v2 = items[i]
        v3 = ("%*"):format(i)
        v4 = {Visible = Visible, Size = v10, Rotation = i * 60 - 180}
        v4.selected = i == u277
        v4.transparency = v11
        v4.index = i
        v5 = {
            empty = not v2 and v12 and createElement(EmoteWheelSlotEmpty, {transparency = v11}),
        }
        v6 = v2
        if v6 then
            v7 = {}
            displayName = v2.displayName or v2.name
            v7.name = displayName
            v7.icon = v2.icon
            v7.subIcon = v2.subIcon
            v7.animation = v2.animation
            v7.disabled = v2.disabled
            v7.transparency = v11
            v7.active = i == u277
            v6 = createElement(EmoteWheelSlot, v7)
        end
        v5.item = v6
        v9[v3] = (createElement(EmoteWheelSegment, v4, v5))
    end
    local v16 = {Visible}
    useReactBindings(function(a1) -- Line: 194 -- upvalues: u326 (val), u336 (val)
        u326(if not a1 then 0 else 1)
        u336(if not a1 then 0 else 1)
    end, v16, {})
    v16 = {u362, u376, u355, a1}
    React.useEffect(function() -- Line: 199
        -- upvalues: u355 (val), ContextActionService (upval), Visible (val), u362 (val), u369 (val), u376 (val)
        -- upvalues: u383 (val), a1 (val), items (val)
        if u355 ~= Enum.UserInputType.Gamepad1 then
            return
        end
        local v1 = ContextActionService
        local v2 = Enum.ContextActionPriority.High.Value + 1
        local Thumbstick2 = Enum.KeyCode.Thumbstick2
        v1:BindActionAtPriority("UpdateEmoteWheelSelection", function(a1, a2, a3) -- Line: 206 -- upvalues: Visible (upval), u362 (upval), u369 (upval), u376 (upval)
            if Visible:getValue() and u362.current then
                if a3.Position.Magnitude < 0.05 then
                    u369(nil)
                    return Enum.ContextActionResult.Sink
                end
                local current = u362.current
                local v1 = current.AbsolutePosition + current.AbsoluteSize / 2
                local v2 = current.AbsoluteSize.X * 0.25
                local Position = a3.Position
                local v3 = v1 + Vector2.new(Position.X * v2, -Position.Y * v2)
                u376(current, v3)
                return Enum.ContextActionResult.Sink
            end
            return Enum.ContextActionResult.Pass
        end, false, v2, Thumbstick2)
        v1 = ContextActionService
        v2 = Enum.ContextActionPriority.High.Value + 1
        local ButtonA = Enum.KeyCode.ButtonA
        v1:BindActionAtPriority("EmoteWheelSelectSegment", function(a1_2, a2, a3) -- Line: 233 -- upvalues: Visible (upval), u383 (upval), a1 (upval), items (upval)
            if Visible:getValue() and u383.current then
                if a2 == Enum.UserInputState.Begin and a1.useItem then
                    a1.useItem(u383.current, items[u383.current])
                end
                return Enum.ContextActionResult.Sink
            end
            return Enum.ContextActionResult.Pass
        end, false, v2, ButtonA)
        return function() -- Line: 252 -- upvalues: ContextActionService (upval)
            ContextActionService:UnbindAction("UpdateEmoteWheelSelection")
            ContextActionService:UnbindAction("EmoteWheelSelectSegment")
        end
    end, v16)
    v16 = {u355}
    React.useEffect(function() -- Line: 258 -- upvalues: u355 (val), UserInputService (upval)
        if u355 ~= Enum.UserInputType.Gamepad1 then
            return nil
        end
        UserInputService.MouseIconEnabled = false
        return function() -- Line: 261 -- upvalues: UserInputService (upval)
            UserInputService.MouseIconEnabled = true
        end
    end, v16)
    v15 = createElement
    v16 = {
        Visible = u414,
        Active = u414,
        AnchorPoint = Vector2.zero,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
        Text = "",
    }
    v2 = React.Event[v8]

    v16[v2] = function(a1_2) -- Line: 281
        -- upvalues: u414 (val), u362 (val), u461 (val), u473 (val), Mouse (upval), u376 (val), a1 (val), items (val)
        if not u414:getValue() then
            return
        end
        local current = u362.current
        if not current then
            return
        end
        local v1 = current.AbsolutePosition + current.AbsoluteSize / 2
        local v2 = current.AbsoluteSize.Y * 0.5 * 1.1 * ((u461:getValue()) * u473)
        local v3 = u376(current, (Vector2.new(Mouse.X, Mouse.Y)))
        if not ((Vector2.new(Mouse.X, Mouse.Y) - v1).Magnitude < v2 / 2) then
            if a1.onClose then
                a1.onClose()
            end
            return
        end
        if not a1.useItem then
            return
        end
        a1.useItem(v3, items[v3])
    end

    v16[React.Event.MouseMoved] = function(a1, a2, a3) -- Line: 311 -- upvalues: u362 (val), GuiService (upval), u376 (val)
        local current = u362.current
        if not current then
            return
        end
        u376(current, Vector2.new(a2, a3 - GuiService.TopbarInset.Height))
    end

    v16[React.Event.MouseWheelForward] = (useDebounce(0.1, function() -- Line: 322 -- upvalues: u414 (val), u490 (val)
        if not u414:getValue() then
            return
        end
        u490(false)
    end))
    v16[React.Event.MouseWheelBackward] = (useDebounce(0.1, function() -- Line: 330 -- upvalues: u414 (val), u490 (val)
        if not u414:getValue() then
            return
        end
        u490(true)
    end))

    v16[React.Event.TouchSwipe] = function(a1, a2) -- Line: 338 -- upvalues: u414 (val), u490 (val)
        if not u414:getValue() then
            return
        end
        if a2 == Enum.SwipeDirection.Left then
            u490(false)
            return
        end
        if a2 == Enum.SwipeDirection.Right then
            u490(true)
        end
    end

    return v15("TextButton", v16, {
        container = createElement("Frame", v13, {
            scale = createElement("UIScale", {
                Scale = u461:map(function(a1) -- Line: 352 -- upvalues: u473 (val)
                    return a1 * u473
                end),
            }),
            center = createElement(EmoteWheelPagination, {page = u532, maxPages = u539, onNextPage = u490, transparency = v11}),
            segments = createElement(React.Fragment, {}, v9),
        }),
    })
end)