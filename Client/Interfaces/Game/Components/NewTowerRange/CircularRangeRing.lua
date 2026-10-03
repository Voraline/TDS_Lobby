-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.CircularRangeRing
-- Decompile time: 7.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useRef = React.useRef
local joinBindings = React.joinBindings
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local u30 = {}
local u31 = nil

local function map(a1, a2) -- Line: 28 -- types: a2: function
    if typeof(a1) == "table" and a1.map then
        return a1:map(a2)
    end
    return a2(a1)
end

local function ensureUpdater() -- Line: 36 -- upvalues: u31 (ref), RunService (val), u30 (val)
    if u31 then
        return
    end
    local u6 = RunService.Heartbeat:Connect(function(a1) -- Line: 41 -- upvalues: u30 (upval)
        local WorldPosition, current, v1
        local v2 = false
        local v3 = {}
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in u30, v5, v6 do
            current = i.current
            if current then
                v1 = CFrame.new()
                if not j:IsA("Attachment") then
                    WorldPosition = j.Position + Vector3.new(0, 0.20000000298023224, 0)
                    if current:IsA("BasePart") and current.Shape == Enum.PartType.Cylinder then
                        v1 = CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
                    end
                else
                    WorldPosition = j.WorldPosition
                end
                table.insert(v4, (CFrame.new(WorldPosition)) * v1)
                table.insert(v3, current)
                v2 = true
            end
        end
        if v2 then
            workspace:BulkMoveTo(v3, v4, Enum.BulkMoveMode.FireCFrameChanged)
        end
    end)

    function u31() -- Line: 78 -- upvalues: u6 (val), u31 (upval)
        if u6.Connected then
            u6:Disconnect()
        end
        u31 = nil
    end
end

local function stopUpdaterIfIdle() -- Line: 87 -- upvalues: u31 (ref), u30 (val)
    if u31 and next(u30) == nil then
        u31()
        return
    end
end

local u38 = React.memo(function(a1) -- Line: 95 -- upvalues: joinBindings (val), createElement (val) -- types: a1: table
    local color = a1.color
    local radius = a1.radius
    local v1 = radius:map(function(a1) -- Line: 107
        return UDim2.fromOffset(a1 * 32 * 2, a1 * 32 * 2)
    end)
    local v2 = a1.towerCircleRange and a1.towerCircleRange:map(function(a1) -- Line: 112
        local v1 = a1 or 0
        return UDim2.fromOffset(v1 * 32 * 2, v1 * 32 * 2)
    end) or v1
    local v3 = radius:map(function(a1) -- Line: 118
        return a1 > 0
    end)
    if a1.towerCircle and a1.towerCircleRange then
        if typeof(a1.towerCircleRange) ~= "table" then
            if typeof(a1.towerCircleRange) == "number" and 0 < a1.towerCircleRange then
                v3 = radius:map(function() -- Line: 128
                    return true
                end)
            end
        elseif a1.towerCircleRange.map then
            v3 = joinBindings({radius, a1.towerCircleRange}):map(function(a1) -- Line: 124
                local v1 = true
                if not (0 < a1[1]) then
                    v1 = 0 < (a1[2] or 0)
                end
                return v1
            end)
        elseif typeof(a1.towerCircleRange) == "number" and 0 < a1.towerCircleRange then
            v3 = radius:map(function() -- Line: 128
                return true
            end)
        end
    end
    local v4 = {
        Brightness = 2,
        PixelsPerStud = 32,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        Face = Enum.NormalId.Top,
        AlwaysOnTop = a1.alwaysOnTop,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Enabled = v3,
    }
    local v5 = {}
    local towerCircle = a1.towerCircle and createElement("CanvasGroup", {
        GroupTransparency = 0.1,
        BackgroundTransparency = 1,
        ZIndex = 10,
        BackgroundColor3 = color,
        Size = UDim2.fromScale(1, 1),
    }, {
        bounding = createElement("ImageLabel", {
            Image = "rbxassetid://300134974",
            ImageTransparency = 0.3,
            BackgroundTransparency = 1,
            ZIndex = 5,
            ImageColor3 = color,
            ScaleType = Enum.ScaleType.Tile,
            SliceCenter = Rect.new(0, 256, 0, 256),
            TileSize = UDim2.fromOffset(30, 30),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = color,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v2,
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            uiStroke = createElement("UIStroke", {Thickness = 3, Enabled = true, Color = color}),
        }),
    })
    v5.towerBoundary = towerCircle
    v5.bounding = createElement("Frame", {
        BackgroundTransparency = 0.8,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = color,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v1,
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 5, Color = color}),
        uICorner3 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
    })
    return createElement("SurfaceGui", v4, v5)
end, function(a1, a2) -- Line: 194
    local v1 = false
    if a1.radius == a2.radius then
        v1 = false
        if a1.color == a2.color then
            v1 = false
            if a2.towerCircle == a1.towerCircle then
                v1 = a2.alwaysOnTop == a1.alwaysOnTop
            end
        end
    end
    return v1
end)
return (memo(function(a1) -- Line: 201
    -- upvalues: useRef (val), ReactFlow (val), joinBindings (val), useEffect (val), u30 (val), u31 (ref)
    -- upvalues: RunService (val), useReactBindings (val), createElement (val), u38 (val)
    local target = a1.target
    local color = a1.color
    local radius = a1.radius
    local v1 = a1.alwaysOnTop or false
    local v2 = a1.towerCircle or false
    local towerCircleRange = a1.towerCircleRange
    local u11 = useRef(nil)
    local v3, u19 = ReactFlow.useTween({start = 0, target = 1, info = TweenInfo.new(0.2)})
    local v4 = joinBindings({radius, v3}):map(function(a1) -- Line: 213
        return a1[1] * a1[2]
    end)
    local v5 = v4
    if v2 and towerCircleRange then
        if typeof(towerCircleRange) ~= "table" then
            if typeof(towerCircleRange) == "number" then
                v5 = v4:map(function(a1) -- Line: 224 -- upvalues: towerCircleRange (val)
                    return (math.max(a1, towerCircleRange))
                end)
            end
        elseif towerCircleRange.map then
            v5 = joinBindings({v4, towerCircleRange}):map(function(a1) -- Line: 220
                return (math.max(a1[1], a1[2] or 0))
            end)
        elseif typeof(towerCircleRange) == "number" then
            v5 = v4:map(function(a1) -- Line: 224 -- upvalues: towerCircleRange (val)
                return (math.max(a1, towerCircleRange))
            end)
        end
    end
    local v6 = {target}
    useEffect(function() -- Line: 230 -- upvalues: target (val), u30 (upval), u11 (val), u31 (upval), RunService (upval), u19 (val)
        if not target then
            u30[u11] = nil
            if u31 then
                if next(u30) ~= nil then
                    return
                end
                u31()
            end
            return
        end
        if not u31 then
            local u16 = RunService.Heartbeat:Connect(function(a1) -- Line: 41 -- upvalues: u30 (upval)
                local WorldPosition, current, v1
                local v2 = false
                local v3 = {}
                local v4 = {}
                local v5 = nil
                local v6 = nil
                for i, j in u30, v5, v6 do
                    current = i.current
                    if current then
                        v1 = CFrame.new()
                        if not j:IsA("Attachment") then
                            WorldPosition = j.Position + Vector3.new(0, 0.20000000298023224, 0)
                            if current:IsA("BasePart") and current.Shape == Enum.PartType.Cylinder then
                                v1 = CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
                            end
                        else
                            WorldPosition = j.WorldPosition
                        end
                        table.insert(v4, (CFrame.new(WorldPosition)) * v1)
                        table.insert(v3, current)
                        v2 = true
                    end
                end
                if v2 then
                    workspace:BulkMoveTo(v3, v4, Enum.BulkMoveMode.FireCFrameChanged)
                end
            end)

            function u31() -- Line: 78 -- upvalues: u16 (val), u31 (upval)
                if u16.Connected then
                    u16:Disconnect()
                end
                u31 = nil
            end
        end
        local v1 = u11
        u30[v1] = target and target:FindFirstChild("HeightOffset") or target
        u19({start = 0, target = 1})
        return function() -- Line: 242 -- upvalues: u30 (upval), u11 (upval), u31 (upval)
            u30[u11] = nil
            if u31 then
                if next(u30) ~= nil then
                    return
                end
                u31()
            end
        end
    end, v6)
    v6 = {radius}
    useReactBindings(function() -- Line: 248 -- upvalues: u19 (val)
        u19({start = 0, target = 1})
    end, v6)
    if not target then
        return
    end
    local v7 = false
    if typeof(target) == "Instance" then
        v7 = target:IsA("BasePart") or target:IsA("Attachment")
    end
    assert(v7, "Target part must be a BasePart")
    return createElement("Part", {
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        CastShadow = false,
        Transparency = 1,
        Size = if typeof(v5) ~= "table" or not v5.map then Vector3.new(v5 * 2, 0, v5 * 2) else v5:map(function(a1) -- Line: 264
            return (Vector3.new(a1 * 2, 0, a1 * 2))
        end),
        ref = u11,
    }, {
        boundary = createElement(u38, {
            radius = v4,
            color = color,
            alwaysOnTop = v1,
            towerCircle = v2,
            towerCircleRange = towerCircleRange,
        }),
    })
end))