-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange
-- Decompile time: 8.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Modules = Shared.Modules
local Interfaces = ReplicatedStorage.Client.Interfaces
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local SharedGameConstants = require(Modules.SharedGameConstants)
local RangeRingPositioner = require(Interfaces.Game.Components.NewTowerRange.Classes.RangeRingPositioner)
local DefaultRangeRing = require(Interfaces.Game.Components.NewTowerRange.DefaultRangeRing)
local TowerBoundary = require(Interfaces.Game.Components.NewTowerRange.TowerBoundary)
local useReactBinding = require(Hooks.useReactBinding)
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local u43 = {}
local u45 = RangeRingPositioner.new()
for i, j in script.Custom:GetChildren() do
    u43[j.Name] = (require(j))
end

local function createDefaultRangeRing(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) -- Line: 94
    -- upvalues: createElement (val), DefaultRangeRing (val)
    return createElement(DefaultRangeRing, {
        Radius = a1,
        BaseRadius = a2,
        Color = a3,
        ParentRef = a4,
        DisableFill = a5,
        FillTransparency = a8,
        isLowQuality = a6,
        LineOffset = a11,
        LineSize = a10,
        LineTransparency = a9,
        ZIndex = a7,
    })
end

local function getAnchorPartProps(a1, a2) -- Line: 122
    return {
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        CastShadow = false,
        Massless = true,
        Transparency = 1,
        Size = a1,
        ref = a2,
    }
end

local u69 = React.memo(function(a1) -- Line: 136 -- upvalues: useReactBinding (val), useEffect (val), createDefaultRangeRing (val)
    local v1, u5 = useReactBinding(a1.Radius or 0)
    local v2 = useEffect
    local v3 = {a1.Radius}
    v2(function() -- Line: 139 -- upvalues: u5 (val), a1 (val)
        u5(a1.Radius or 0)
    end, v3)
    return createDefaultRangeRing(
        v1,
        a1.BaseRadius,
        a1.Color,
        a1.ParentRef,
        a1.DisableFill,
        a1.isLowQuality,
        a1.ZIndex,
        a1.FillTransparency,
        a1.LineTransparency,
        a1.LineSize,
        a1.LineOffset
    )
end)

local function getMaxExtraRadius(a1) -- Line: 158 -- types: a1: table
    local Radius
    local v1 = 0
    for i, j in a1 do
        Radius = j.Radius
        if typeof(Radius) == "number" then
            v1 = math.max(v1, Radius)
        end
    end
    return v1
end

return function(a1) -- Line: 171
    -- upvalues: ReplicatedStorage (val), useReactBinding (val), u43 (val), SharedGameConstants (val), useMemo (val)
    -- upvalues: useRef (val), useEffect (val), createElement (val), u45 (val), DefaultRangeRing (val), u69 (val)
    -- upvalues: React (val), TowerBoundary (val)
    local BorderColor, Color_2, Radius, ShowWhenInvalid, ZIndex, v1, v2, v3, v4
    local v5 = a1.Tower or ""
    local Target = a1.Target
    local v6 = a1.ShowOnlyBoundary or false
    local v7 = a1.DisableFill or false
    local v8 = a1.isLowQuality or false
    local Model = a1.Model
    local ExtraRings = a1.ExtraRings or {}
    u670 = 0
    for i, j in ExtraRings do
        Radius = j.Radius
        if typeof(Radius) == "number" then
            local u670 = math.max(u670, Radius)
        end
    end
    local v9 = false
    if typeof(Target) == "Instance" then
        v9 = Target:IsA("BasePart") or Target:IsA("Attachment")
    end
    assert(v9, "Target part must be a BasePart or Attachment")
    local v10 = ReplicatedStorage.Content.Tower:FindFirstChild(v5)
    v9 = nil
    if v10 then
        v9 = require(v10.Stats)
    end
    local Valid = if a1.Valid == nil then true else a1.Valid

    local function getColor() -- Line: 195 -- upvalues: Valid (val), a1 (val)
        return if not Valid then Color3.new(1, 0, 0) else a1.BorderColor or Color3.new(1, 1, 1) or Color3.new(1, 0, 0)
    end

    if not Valid then
        BorderColor = Color3.new(1, 0, 0)
    else
        BorderColor = a1.BorderColor
        if not BorderColor then
            BorderColor = Color3.new(1, 1, 1)
            if not BorderColor then
                BorderColor = Color3.new(1, 0, 0)
            end
        end
    end
    local v11, u80 = useReactBinding(BorderColor)
    local Color = BorderColor
    local v12 = BorderColor
    local v13 = false
    local v14 = u43[v5]
    local v15 = nil
    if v14 and v14.RequiresTowerReplicator == true then
        if not Model or not Model:FindFirstChild("TowerReplicator") then
            v14 = nil
        end
    end
    local v16 = Valid ~= false and a1.Deadzone or 0
    local v17 = Valid ~= false and a1.Buildzone or 0
    local u123, u124 = useReactBinding(a1.Range or 16)
    local v18, u130 = useReactBinding(v16)
    local v19, u135 = useReactBinding(v17)
    local v20, u143 = useReactBinding(a1.Boundary or SharedGameConstants.DEFAULT_BOUNDARY_SIZE)
    local v21, u149 = useReactBinding(a1.FlightRange or 0)
    local v22 = {u123, u670}
    local u636 = useMemo(function() -- Line: 224 -- upvalues: u123 (val), u670 (val)
        return u123:map(function(a1) -- Line: 225 -- upvalues: u670 (upval)
            return (math.max(a1, u670))
        end)
    end, v22)
    local u639 = useRef()
    local u645 = useRef(nil)
    local v23 = {BorderColor}
    useEffect(function() -- Line: 233 -- upvalues: u80 (val), BorderColor (val)
        u80(BorderColor)
    end, v23)
    local v24 = useEffect
    v23 = {
        a1.Range,
        a1.Boundary,
        a1.FlightRange,
        a1.Deadzone,
        a1.Buildzone,
        Valid,
    }
    v24(function() -- Line: 238
        -- upvalues: u124 (val), a1 (val), u143 (val), SharedGameConstants (upval), u149 (val), Valid (val), u130 (val)
        -- upvalues: u135 (val)
        u124(a1.Range or 16)
        u143(a1.Boundary or SharedGameConstants.DEFAULT_BOUNDARY_SIZE)
        u149(a1.FlightRange or 0)
        if Valid == false then
            u130(0)
            u135(0)
            return
        end
        u130(a1.Deadzone or 0)
        u135(a1.Buildzone or 0)
    end, v23)
    if v14 then
        Color = v11
        v12 = v11
        if v14.Color and Valid then
            Color = v14.Color
            v12 = Color
            v11 = Color
        end
        v24 = v8 and v14.ShowDefaultRingWhenLowQuality == true
        v1 = false
        if v14.HideDefaultRing == true then
            v1 = not v24
        end
        v13 = v1
        v15 = createElement(v14.Render, {
            Range = u123,
            RangeRef = u639,
            RangeColor = v11,
            SetRangeColor = u80,
            BorderColor = Color,
            Deadzone = v18,
            Buildzone = v19,
            Boundary = v20,
            FlightRange = v21,
            Target = Target,
            Tower = v5,
            Model = Model,
            IsValid = Valid,
            Stats = v9 and v9.Stats.Default.Defaults,
            isLowQuality = v8,
            QualityMode = a1.QualityMode,
        })
    end
    v23 = {Target}
    useEffect(function() -- Line: 286 -- upvalues: u45 (upval), u639 (val), u645 (val), Target (val)
        u45:Register(u639, u645, Target)
        return function() -- Line: 289 -- upvalues: u45 (upval), u639 (upval), u645 (upval)
            u45:Unregister(u639, u645)
        end
    end, v23)
    v24 = {childRing = v15}
    if not v13 then
        v24.range = createElement(DefaultRangeRing, {
            ZIndex = 1,
            Radius = u123,
            BaseRadius = u636,
            Color = v12,
            ParentRef = u639,
            DisableFill = v7,
            FillTransparency = a1.FillTransparency,
            isLowQuality = v8,
            LineOffset = a1.LineOffset,
            LineSize = a1.LineSize,
            LineTransparency = a1.LineTransparency,
        })
        v24.buildzone = createElement(DefaultRangeRing, {
            ZIndex = 2,
            Radius = v19,
            BaseRadius = u636,
            Color = Color3.fromRGB(255, 170, 0),
            ParentRef = u639,
            DisableFill = v7,
            FillTransparency = a1.FillTransparency,
            isLowQuality = v8,
            LineOffset = a1.LineOffset,
            LineSize = a1.LineSize,
            LineTransparency = a1.LineTransparency,
        })
        v24.deadzone = createElement(DefaultRangeRing, {
            ZIndex = 3,
            Radius = v18,
            BaseRadius = u636,
            Color = Color3.fromRGB(255, 0, 0),
            ParentRef = u639,
            DisableFill = v7,
            FillTransparency = a1.FillTransparency,
            isLowQuality = v8,
            LineOffset = a1.LineOffset,
            LineSize = a1.LineSize,
            LineTransparency = a1.LineTransparency,
        })
    end
    v23 = nil
    local v25 = nil
    for k, n in ExtraRings, v23, v25 do
        v2 = n.Radius or 0
        ShowWhenInvalid = if n.ShowWhenInvalid ~= nil then n.ShowWhenInvalid else true
        if not (v2 <= 0) then
            if Valid or ShowWhenInvalid then
                v3 = ("extra_%*"):format(n.Key or k)
                v4 = {Radius = v2, BaseRadius = u636}
                Color_2 = n.Color or Color3.new(1, 1, 1)
                v4.Color = Color_2
                v4.ParentRef = u639
                v4.DisableFill = if n.DisableFill ~= nil then n.DisableFill else true
                v4.FillTransparency = n.FillTransparency
                v4.isLowQuality = v8
                v4.LineOffset = n.LineOffset
                v4.LineSize = n.LineSize
                v4.LineTransparency = n.LineTransparency
                ZIndex = n.ZIndex or 3 + k
                v4.ZIndex = ZIndex
                v24[v3] = (createElement(u69, v4))
            end
        end
    end
    v25 = {u636}
    v1 = useMemo(function() -- Line: 363 -- upvalues: u636 (val)
        return u636:map(function(a1) -- Line: 364
            return (Vector3.new(a1 * 2, 0, a1 * 2))
        end)
    end, v25)
    return createElement(React.Fragment, {}, {
        Boundary = createElement("Part", {
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            CastShadow = false,
            Massless = true,
            Transparency = 1,
            Size = v1,
            ref = u645,
        }, {
            boundary = createElement(TowerBoundary, {Radius = v20, Color = Color, ShowOnlyBoundary = v6}),
        }),
        Main = not v6 and createElement("Part", {
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            CastShadow = false,
            Massless = true,
            Transparency = 1,
            Size = v1,
            ref = u639,
        }, v24),
    })
end