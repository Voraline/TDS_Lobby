-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.RangeRing
-- Decompile time: 7.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Interfaces = ReplicatedStorage.Client.Interfaces
local Hooks = Interfaces.Hooks
local RangeRing = require(Interfaces.Game.Components.NewTowerRange.Classes.RangeRing)
local React = require(Shared.UI.React)
local useOneShot = require(Hooks.useOneShot)
local useReactBindings = require(Hooks.useReactBindings)
local useRef = React.useRef
local joinBindings = React.joinBindings
local createElement = React.createElement

local function isBinding(a1) -- Line: 22
    local v1 = false
    if typeof(a1) == "table" then
        v1 = a1.getValue ~= nil
    end
    return v1
end

local function ControlledRangeRingParts(a1) -- Line: 38
    -- upvalues: RangeRing (val), useRef (val), React (val), useReactBindings (val)
    local Radius = a1.Radius
    local LineColor = a1.LineColor
    local LineSize = a1.LineSize
    if not LineSize then
        LineSize = RangeRing.DefaultLineSize
    end
    local LineOffset = a1.LineOffset
    if not LineOffset then
        LineOffset = RangeRing.DefaultLineOffset
    end
    local LineTransparency = a1.LineTransparency
    local ParentRef = a1.ParentRef
    local u14 = a1.Offset or Vector3.new(0, 0, 0)
    local u17 = a1.DisableFill == true
    local u20 = useRef(nil)
    local useBinding = React.useBinding
    local v1 = false
    if typeof(LineColor) == "table" then
        v1 = LineColor.getValue ~= nil
    end
    local v2, u45 = useBinding(if not v1 then LineColor else Color3.new(1, 1, 1))
    local v3 = false
    if typeof(LineColor) == "table" then
        v3 = LineColor.getValue ~= nil
    end
    local u58 = if not v3 then v2 else LineColor
    local v4 = {LineColor}
    React.useEffect(function() -- Line: 53 -- upvalues: LineColor (val), u45 (val)
        local v1 = LineColor
        local v2 = false
        if typeof(v1) == "table" then
            v2 = v1.getValue ~= nil
        end
        if not v2 then
            u45(LineColor)
        end
    end, v4)
    v4 = {Radius}
    useReactBindings(function(a1) -- Line: 59 -- upvalues: u20 (val)
        local current = u20.current
        if current then
            current:SetRadius(a1)
        end
    end, v4, {})
    v4 = {u58}
    useReactBindings(function(a1) -- Line: 66 -- upvalues: u20 (val)
        local current = u20.current
        if current then
            current:SetColor(a1)
        end
    end, v4, {})
    local useEffect_2 = React.useEffect
    v4 = {
        ParentRef,
        u14,
        LineSize,
        LineOffset,
        LineTransparency,
        a1.FillTransparency,
        u58,
        u17,
    }
    useEffect_2(function() -- Line: 73
        -- upvalues: RangeRing (upval), u58 (val), u17 (val), a1 (val), LineOffset (val), LineSize (val)
        -- upvalues: LineTransparency (val), u14 (val), ParentRef (val), Radius (val), u20 (val)
        local u19 = RangeRing.new({
            Color = u58:getValue(),
            DisableFill = u17,
            FillTransparency = a1.FillTransparency,
            LineOffset = LineOffset,
            LineSize = LineSize,
            LineTransparency = LineTransparency,
            Offset = u14,
            ParentRef = ParentRef,
            Radius = Radius:getValue(),
        })
        u20.current = u19
        return function() -- Line: 88 -- upvalues: u20 (upval), u19 (val)
            u20.current = nil
            u19:Destroy()
        end
    end, v4)
    return nil
end

return React.memo(function(a1) -- Line: 118
    -- upvalues: React (val), useReactBindings (val), useRef (val), useOneShot (val), createElement (val)
    -- upvalues: ControlledRangeRingParts (val), joinBindings (val)
    local Radius = a1.Radius
    local Color = a1.Color
    local Offset = a1.Offset
    local ParentRef = a1.ParentRef
    local v1, u9 = React.useState(function() -- Line: 124 -- upvalues: Radius (val)
        return 0 < (Radius:getValue())
    end)
    local v2 = {Radius}
    useReactBindings(function(a1) -- Line: 128 -- upvalues: u9 (val)
        u9(a1 > 0)
    end, v2, {})
    local u17 = useRef()
    local v3, u29 = useOneShot(0, 1, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 0, true)
    local v4 = {Radius}
    useReactBindings(function(a1) -- Line: 141 -- upvalues: u17 (val), u29 (val)
        if u17.current ~= a1 then
            u17.current = a1
            u29()
        end
    end, v4, {})
    if not v1 then
        return
    end
    return createElement(ControlledRangeRingParts, {
        Radius = joinBindings({Radius, v3}):map(function(a1) -- Line: 153
            return a1[1] * a1[2]
        end),
        LineColor = Color,
        DisableFill = a1.DisableFill,
        FillTransparency = a1.FillTransparency,
        LineOffset = a1.LineOffset,
        LineSize = a1.LineSize,
        LineTransparency = a1.LineTransparency,
        ParentRef = ParentRef,
        Offset = Offset,
    })
end)