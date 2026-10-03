-- Script path: ReplicatedStorage.Client.Interfaces.Components.DraggerResizer
-- Decompile time: 5.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local MouseCursorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.MouseCursorStore)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useMouse = require(ReplicatedStorage.Client.Interfaces.Hooks.useMouse)
require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding
local useEffect = React.useEffect
local Event = React.Event

local function withDraggerLogic(a1) -- Line: 40 -- upvalues: createElement (val) -- types: a1: function
    return function(a1_2) -- Line: 41 -- upvalues: createElement (upval), a1 (val)
        if not a1_2.visible then
            return nil
        end
        return createElement(a1, a1_2, a1_2.children)
    end
end

local function u67(a1) -- Line: 50
    -- upvalues: useBinding (val), React (val), useSpring (val), useMouse (val), useEffect (val), MouseCursorStore (val)
    -- upvalues: useEvent (val), UserInputService (val), createElement (val), Container (val), Event (val)
    local u46, u47
    local u3, u4 = useBinding(a1.Position)
    local u7, u8 = useBinding(1)
    local u13 = React.useCallback(function(a1) -- Line: 54 -- upvalues: u8 (val)
        u8((math.clamp(a1, 0.2, 1.2)))
    end, {})
    local u23, u24 = useSpring(if not a1.visible then 0 else 1, 1, 30, true)
    local u27, u28 = useBinding(false)
    local u31, u32 = useBinding(false)
    local u42 = React.joinBindings({u7}):map(function(a1) -- Line: 63
        return (math.clamp(a1[1], 0.5, 1.2))
    end)
    _, _, u46, u47 = useMouse()
    local v1 = useEffect
    local v2 = {a1.Position}
    v1(function() -- Line: 69 -- upvalues: u4 (val), a1 (val)
        u4(a1.Position)
    end, v2)
    v1 = useEffect
    v2 = {a1.visible}
    v1(function() -- Line: 73 -- upvalues: u24 (val), a1 (val)
        u24(if not a1.visible then 0 else 1)
    end, v2)
    local u64 = React.useCallback(function() -- Line: 77 -- upvalues: u27 (val), u28 (val), MouseCursorStore (upval), u31 (val), u32 (val)
        if u27:getValue() then
            u28(false)
            MouseCursorStore.remove("Dragging")
        end
        if u31:getValue() then
            u32(false)
            MouseCursorStore.remove("Resizing")
        end
    end, {})
    useEvent(UserInputService.InputEnded, function(a1, a2) -- Line: 89 -- upvalues: u64 (val) -- types: a1: userdata, a2: boolean
        if a2 then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton1 then
            u64()
        end
    end)
    useEvent(UserInputService.InputChanged, function(a1, a2) -- Line: 99
        -- upvalues: u27 (val), u4 (val), u3 (val), u46 (val), u47 (val), u31 (val), u13 (val), u7 (val)
        if a1.UserInputType == Enum.UserInputType.MouseMovement then
            if u27:getValue() then
                u4((u3:getValue()) + UDim2.fromOffset(u46:getValue(), u47:getValue()))
            end
            if u31:getValue() then
                local v1 = Vector2.new(u46:getValue(), u47:getValue())
                u13((u7:getValue()) + v1.Magnitude * 0.0045 * math.sign(v1.X))
            end
        end
    end, {})
    local useMemo = React.useMemo
    local v3 = {a1.children}
    local v4 = useMemo(function() -- Line: 113
        -- upvalues: createElement (upval), u42 (val), a1 (val), Container (upval), Event (upval), u28 (val)
        -- upvalues: MouseCursorStore (upval), u23 (val), u32 (val)
        local v1 = {uiScale = createElement("UIScale", {Scale = u42})}
        v1.ratio = createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio or 1.5})
        local v2 = createElement
        local v3 = {
            Size = UDim2.new(1, 0, 0, 60),
            Position = UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 1),
            ZIndex = 10,
        }

        v3[Event.InputBegan] = function(a1, a2) -- Line: 130 -- upvalues: u28 (upval), MouseCursorStore (upval) -- types: a2: userdata
            if a2.UserInputType == Enum.UserInputType.MouseButton1 then
                u28(true)
                MouseCursorStore.push("Dragging", "Move")
            end
        end

        v3[Event.MouseEnter] = function() -- Line: 137 -- upvalues: MouseCursorStore (upval)
            MouseCursorStore.push("DragMouseEnter", "Move")
        end

        v3[Event.MouseLeave] = function() -- Line: 141 -- upvalues: MouseCursorStore (upval)
            MouseCursorStore.remove("DragMouseEnter")
        end

        local v4 = {
            scale = createElement("UIScale", {Scale = u23}),
            dropShadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = -1,
                Image = "rbxassetid://9239716855",
                ImageTransparency = 0.2,
                Rotation = 180,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 12, 1, 12),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(14, 14, 64, 24),
            }, {
                gradient = createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.77, 0),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
            background = createElement("ImageLabel", {
                ZIndex = 0,
                BackgroundTransparency = 1,
                Image = "rbxassetid://76824295248156",
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0),
                ImageColor3 = Color3.fromRGB(35, 73, 90),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(50, 50, 50, 50),
            }, {
                gradient = createElement("UIGradient", {
                    Rotation = 90,
                    Transparency = NumberSequence.new(0),
                    Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(171, 171, 171)),
                }),
            }),
        }
        local title = a1.title and createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 24,
            Size = UDim2.fromScale(1, 1),
            FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            Text = a1.title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            stroke = createElement("UIStroke", {Thickness = 3, Transparency = 0, Color = Color3.new(0, 0, 0)}),
        })
        v4.title = title
        v1.draggableTopBar = v2(Container, v3, v4)
        if not a1.allowResizing then
            v2 = nil
        else
            v2 = createElement
            v3 = {Size = UDim2.fromOffset(70, 70)}
            local ResizePosition = a1.ResizePosition or UDim2.fromScale(1, 1)
            v3.Position = ResizePosition
            v3.AnchorPoint = Vector2.new(1, 1)
            v3.BackgroundTransparency = 1
            v3.ZIndex = 10
            v3.Image = "rbxassetid://83210709118610"
            v3.ImageTransparency = u23:map(function(a1) -- Line: 236
                return 1 - a1
            end)

            v3[Event.InputBegan] = function(a1, a2) -- Line: 240 -- upvalues: u32 (upval), MouseCursorStore (upval) -- types: a2: userdata
                if a2.UserInputType == Enum.UserInputType.MouseButton1 then
                    u32(true)
                    MouseCursorStore.push("Resizing", "Resize")
                end
            end

            v3[Event.MouseEnter] = function() -- Line: 247 -- upvalues: MouseCursorStore (upval)
                MouseCursorStore.push("ResizeMouseEnter", "Resize")
            end

            v3[Event.MouseLeave] = function() -- Line: 251 -- upvalues: MouseCursorStore (upval)
                MouseCursorStore.remove("ResizeMouseEnter")
            end

            v2 = v2("ImageLabel", v3, {scale = createElement("UIScale", {Scale = u23})})
        end
        v1.resizableCorner = v2
        for i, j in a1.children do
            v1[i] = j
        end
        return v1
    end, v3)
    v2 = createElement
    local v5 = {BackgroundTransparency = 1, Position = u3, Size = a1.Size}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v5.AnchorPoint = AnchorPoint
    return v2("Frame", v5, v4)
end

return function(a1) -- Line: 41 -- upvalues: createElement (val), u67 (val)
    if not a1.visible then
        return nil
    end
    return createElement(u67, a1, a1.children)
end