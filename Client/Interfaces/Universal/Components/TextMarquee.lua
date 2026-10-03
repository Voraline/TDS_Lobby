-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee
-- Decompile time: 7.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local useUnscaledGuiProperty = require(ReplicatedStorage.Client.Interfaces.Hooks.useUnscaledGuiProperty)
local useState = React.useState
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useMemo = React.useMemo
return (React.memo(function(a1) -- Line: 29
    -- upvalues: React (val), useBinding (val), useState (val), useUnscaledGuiProperty (val), useMemo (val)
    -- upvalues: useEffect (val), TweenService (val), Sift (val), useTransparencyModifier (val), createElement (val)
    local u71
    local padding = a1.padding
    local u3 = a1.speed or 50
    local u5 = a1.restartDelay or 1
    local u7 = a1.transparencyDelay or 0.25
    local u9 = a1.startDelay or 1
    local v1 = a1.alwaysMarquee or false
    local Size = a1.Size
    local AnchorPoint = a1.AnchorPoint
    local Position = a1.Position
    local LayoutOrder = a1.LayoutOrder
    local ZIndex = a1.ZIndex
    local hoverRef = a1.hoverRef
    local v2 = React.useRef(nil)
    local v3 = React.useRef(nil)
    local v4, u29 = useBinding(0)
    local v5, u33 = useBinding(0)
    local v6, u37 = useState(false)
    local v7, u41 = useState(false)
    local u44 = v1
    if not u44 then
        u44 = v6
        if not u44 then
            u44 = v7
        end
    end
    local zero = useUnscaledGuiProperty(v2, "AbsoluteSize", {})
    if not zero then
        zero = Vector2.zero
    end
    local zero_2 = useUnscaledGuiProperty(v3, "TextBounds", {})
    if not zero_2 then
        zero_2 = Vector2.zero
    end
    if not padding then
        u71 = 0
    else
        u71 = (padding.Scale * zero.X + padding.Offset) * 2
        if not u71 then
            u71 = 0
        end
    end
    local u86 = false
    if zero ~= Vector2.zero then
        u86 = false
        if zero_2 ~= Vector2.zero then
            local X = zero_2.X
            u86 = zero.X - u71 < X
        end
    end
    local u90 = useMemo(function() -- Line: 62
        return Instance.new("NumberValue")
    end, {})
    local u94 = useMemo(function() -- Line: 66
        return (Instance.new("NumberValue"))
    end, {})
    useEffect(function() -- Line: 71 -- upvalues: u90 (val), u29 (val), u94 (val), u33 (val)
        u90.Changed:Connect(function(a1) -- Line: 72 -- upvalues: u29 (upval)
            u29(a1)
        end)
        u94.Changed:Connect(function(a1) -- Line: 75 -- upvalues: u33 (upval)
            u33(a1)
        end)
        u90.Value = 0
        u94.Value = 0
        return function() -- Line: 82 -- upvalues: u90 (upval), u94 (upval)
            u90:Destroy()
            u94:Destroy()
        end
    end, {})
    local v8 = {hoverRef}
    useEffect(function() -- Line: 88 -- upvalues: hoverRef (val), u37 (val)
        if hoverRef and hoverRef.current then
            local u9 = hoverRef.current.MouseEnter:Connect(function() -- Line: 94 -- upvalues: u37 (upval)
                u37(true)
            end)
            local u16 = hoverRef.current.MouseLeave:Connect(function() -- Line: 97 -- upvalues: u37 (upval)
                u37(false)
            end)
            return function() -- Line: 101 -- upvalues: u9 (val), u16 (val)
                u9:Disconnect()
                u16:Disconnect()
            end
        end
        u37(false)
    end, v8)
    v8 = {u86, zero_2, zero, u44, u5, u9, u3}
    useEffect(function() -- Line: 107
        -- upvalues: u44 (val), u86 (val), u90 (val), zero_2 (val), u71 (val), zero (val), u3 (val)
        -- upvalues: TweenService (upval), u5 (val), u94 (val), u7 (val), u9 (val)
        if u44 and u86 then
            local u3_2 = true
            local u4 = nil
            local u5_2 = nil
            local u6 = nil
            local u10 = zero_2.X + u71
            local u14 = task.spawn(function() -- Line: 121
                -- upvalues: u10 (val), zero (upval), u3 (upval), u3_2 (ref), u90 (upval), TweenService (upval)
                -- upvalues: u4 (ref), u5 (upval), u94 (upval), u7 (upval), u5_2 (ref), u6 (ref), u9 (upval)
                local v1, v2, v3
                local v4 = (u10 - zero.X + 4) / u3
                local v5 = TweenInfo.new(v4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                while u3_2 do
                    u90.Value = 0
                    v1 = TweenService:Create(u90, v5, {Value = zero.X - u10})
                    v1:Play()
                    u4 = v1
                    task.wait(v4)
                    u4 = nil
                    task.wait(u5)
                    v2 = TweenService:Create(u94, TweenInfo.new(u7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 1})
                    v2:Play()
                    u5_2 = v2
                    task.wait(u7)
                    v3 = TweenService:Create(u94, TweenInfo.new(u7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 0})
                    v3:Play()
                    u6 = v3
                    u90.Value = 0
                    task.wait(u9)
                end
                if u4 then
                    u4:Cancel()
                end
                if u5_2 then
                    u5_2:Cancel()
                end
                if u6 then
                    u6:Cancel()
                end
            end)
            return function() -- Line: 185 -- upvalues: u4 (ref), u5_2 (ref), u6 (ref), u94 (upval), u3_2 (ref), u14 (ref)
                if u4 then
                    u4:Cancel()
                end
                if u5_2 then
                    u5_2:Cancel()
                end
                if u6 then
                    u6:Cancel()
                end
                u94.Value = 0
                u3_2 = false
                pcall(task.cancel, u14)
            end
        end
        u90.Value = 0
    end, v8)
    local v9 = Sift.Dictionary.copy(a1)
    v9.speed = nil
    v9.padding = nil
    v9.hoverRef = nil
    v9.startDelay = nil
    v9.restartDelay = nil
    v9.hoverRef = nil
    v9.alwaysMarquee = nil
    v9.Visible = nil
    v9.clips = nil
    v9.ZIndex = a1.ZIndex
    v9.LayoutOrder = 0
    v9.Size = UDim2.fromScale(1, 1)
    v9.AnchorPoint = Vector2.zero
    v9.Position = UDim2.new()
    v9.TextWrapped = if a1.TextScaled then nil else false
    v9.TextXAlignment = u86 and Enum.TextXAlignment.Left or v9.TextXAlignment
    v9.TextTruncate = Enum.TextTruncate.SplitWord
    v9.Visible = not u86 or not u44
    v9.Active = false
    v9.TextTransparency = v5
    local v10 = useTransparencyModifier(v5)
    if v9.children then
        for i, j in v9.children do
            if j.type == "UIStroke" and tonumber(j.props.Transparency) then
                j.props.Transparency = v10(j.props.Transparency)
            end
        end
    end
    v8 = Sift.Dictionary.copy(v9)
    v8.Visible = u44 and u86
    v8.TextTruncate = Enum.TextTruncate.None
    v8.Size = UDim2.new(0, zero_2.X * 100, 1, 0)
    v8.AnchorPoint = Vector2.new(0, 0.5)
    v8.Position = v4:map(function(a1) -- Line: 245
        return UDim2.new(0, a1, 0.5, 0)
    end)
    v8.ref = v3
    local v11 = {Size = Size, Position = Position, AnchorPoint = AnchorPoint}
    local clips = u86 and (if a1.clips ~= nil then a1.clips else true)
    v11.ClipsDescendants = clips
    v11.BackgroundTransparency = 1
    v11.LayoutOrder = LayoutOrder
    v11.ZIndex = ZIndex
    v11.Visible = a1.Visible
    v11.Active = false

    v11[React.Event.MouseEnter] = function() -- Line: 261 -- upvalues: u41 (val)
        u41(true)
    end

    v11[React.Event.MouseLeave] = function() -- Line: 264 -- upvalues: u41 (val)
        u41(false)
    end

    v11.ref = v2
    local v12 = {}
    local v13 = padding
    if v13 then
        local v14 = {}
        local padding_2 = a1.padding or UDim.new()
        v14.PaddingLeft = padding_2
        local padding_3 = a1.padding or UDim.new()
        v14.PaddingRight = padding_3
        v13 = createElement("UIPadding", v14)
    end
    v12.padding = v13
    v12.refLabel = createElement("TextLabel", v9)
    v12.marqueeLabel = createElement("TextLabel", v8)
    return createElement("Frame", v11, v12)
end))