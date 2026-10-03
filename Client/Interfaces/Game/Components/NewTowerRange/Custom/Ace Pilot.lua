-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Custom.Ace Pilot
-- Decompile time: 5.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local createElement = React.createElement
local useRef = React.useRef
local useState = React.useState
local v1 = {HideDefaultRing = true}

local function getFigure8Points() -- Line: 21
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = {}

    local function calculatePoint(a1) -- Line: 30
        return math.cos(a1) * 10 / (math.sin(a1) ^ 2 + 1), math.sin(a1) * 15 * math.cos(a1) / (math.sin(a1) ^ 2 + 1)
    end

    local function calculateTangent(a1) -- Line: 36
        local v1 = math.cos(a1) * 10 / (math.sin(a1) ^ 2 + 1)
        local v2 = math.sin(a1) * 15 * math.cos(a1) / (math.sin(a1) ^ 2 + 1)
        local v3 = a1 + 0.0001
        local v4 = math.cos(v3) * 10 / (math.sin(v3) ^ 2 + 1)
        local v5 = math.sin(v3) * 15 * math.cos(v3) / ((math.sin(v3)) ^ 2 + 1)
        v3 = v4 - v1
        v4 = v5 - v2
        v5 = math.sqrt(v3 * v3 + v4 * v4)
        return v3 / v5, v4 / v5
    end

    for i = 0, 46 do
        v7 = i * 0.13368479376977843
        v9 = math.cos(v7) * 10 / (math.sin(v7) ^ 2 + 1)
        v1 = math.sin(v7) * 15 * math.cos(v7)
        v8 = v9
        v3 = math.cos(v7) * 10 / (math.sin(v7) ^ 2 + 1)
        v2 = math.sin(v7) * 15 * math.cos(v7) / (math.sin(v7) ^ 2 + 1)
        v4 = v7 + 0.0001
        v5 = math.cos(v4) * 10 / (math.sin(v4) ^ 2 + 1)
        v6 = math.sin(v4) * 15 * math.cos(v4) / ((math.sin(v4)) ^ 2 + 1)
        v4 = v5 - v3
        v5 = v6 - v2
        v6 = math.sqrt(v4 * v4 + v5 * v5)
        v9 = v4 / v6
        table.insert(v10, {v8, v1 / (math.sin(v7) ^ 2 + 1), (math.atan2(v5 / v6, v9))})
    end
    return v10
end

local function getCirclePoints(a1) -- Line: 59 -- types: a1: number
    local v1, v2, v3
    local v4 = {}
    local v5 = math.floor(6.283185307179586 * a1 * 0.5)
    local v6 = 6.283185307179586 / v5
    local v7 = v5 - 1
    for i = 0, v7 do
        v1 = i * v6
        v2 = a1 * math.cos(v1)
        v3 = a1 * math.sin(v1)
        table.insert(v4, {v2, v3, math.atan2(v2, v3) + 1.5707963267948966})
    end
    return v4
end

local function RadiusPoint(a1) -- Line: 79 -- upvalues: useRef (val), createElement (val), React (val)
    local Offset = a1.Offset
    local Rotation = a1.Rotation or CFrame.new()
    local v1 = useRef()
    return createElement("Part", {
        Anchored = false,
        Transparency = 0,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        CastShadow = false,
        Massless = true,
        Size = Vector3.new(0.800000011920929, 0, 0.20000000298023224),
        BrickColor = BrickColor.new("Institutional white"),
        Material = Enum.Material.SmoothPlastic,
        Color = Color3.new(1, 1, 1),
        ref = v1,
    }, {
        mesh = createElement("SpecialMesh", {
            MeshId = "rbxassetid://17118103950",
            Scale = Vector3.new(0.800000011920929, 0, 0.20000000298023224),
            MeshType = Enum.MeshType.FileMesh,
        }),
        weld = createElement("Weld", {
            Part0 = a1.Ref,
            Part1 = v1,
            C0 = CFrame.Angles(1.5707963267948966, 0, 0) * Offset * CFrame.Angles(-1.5707963267948966, 0, 0),
            C1 = Rotation,
        }),
        children = React.createElement(React.Fragment, {}, a1.children or {}),
    })
end

local function FigureEightPath(a1) -- Line: 119
    -- upvalues: getFigure8Points (val), createElement (val), RadiusPoint (val), React (val)
    local v1, v2, v3, v4
    local v5 = {}
    for i, j in (getFigure8Points()) do
        v4 = j[1]
        v1 = j[2]
        v2 = j[3]
        v3 = ("point%*"):format(i)
        v5[v3] = (createElement(RadiusPoint, {
            Offset = CFrame.new(v4, v1, 0),
            Rotation = CFrame.Angles(0, v2, 0),
            Ref = a1.Ref,
        }, {}))
    end
    return React.createElement(React.Fragment, {}, v5)
end

local function CirclePath(a1) -- Line: 138
    -- upvalues: getCirclePoints (val), createElement (val), RadiusPoint (val), React (val)
    local v1, v2, v3, v4
    local v5 = {}
    local Ref = a1.Ref
    for i, j in getCirclePoints(a1.Radius) do
        v4 = j[1]
        v1 = j[2]
        v2 = j[3]
        v3 = ("point%*"):format(i)
        v5[v3] = (createElement(RadiusPoint, {
            Offset = CFrame.new(v1, v4, 0),
            Rotation = CFrame.Angles(0, v2, 0),
            Ref = Ref,
        }))
    end
    return React.createElement(React.Fragment, {}, v5)
end

function v1.Render(a1) -- Line: 157
    -- upvalues: useTagReplicatorInstance (val), useState (val), useReplicatedState (val), useReactBindings (val)
    -- upvalues: createElement (val), FigureEightPath (val), CirclePath (val)
    local u5 = a1.FlightRange:map(function(a1) -- Line: 158
        if a1 < 0.01 then
            return 20
        end
        return a1
    end)
    local Target = a1.Target
    local v1 = useTagReplicatorInstance(Target and Target.Parent, "TowerReplicator", "Tower")
    local RangeRef = a1.RangeRef
    local v2, u23 = useState(u5:getValue())
    local v3 = useReplicatedState(v1, "CurrentMode") == "Figure8"
    local v4 = {u5}
    local v5 = {v2}
    useReactBindings(function(a1) -- Line: 175 -- upvalues: u5 (val), u23 (val)
        if u5 ~= a1 then
            u23(a1)
        end
    end, v4, v5)
    return createElement("Model", {}, {
        highlight = createElement("Highlight", {
            FillTransparency = 0,
            OutlineTransparency = 0,
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
            FillColor = Color3.fromRGB(114, 179, 223),
            OutlineColor = Color3.new(1, 1, 1),
        }),
        figureEight = v3 and createElement(FigureEightPath, {Ref = RangeRef}),
        circle = not v3 and createElement(CirclePath, {Radius = v2 / 2, Ref = RangeRef}),
    })
end

return v1