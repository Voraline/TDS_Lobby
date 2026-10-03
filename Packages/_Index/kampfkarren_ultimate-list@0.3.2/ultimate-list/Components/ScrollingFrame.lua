-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Components.ScrollingFrame
-- Decompile time: 2.97 ms

local RunService = game:GetService("RunService")
local v1 = script:FindFirstAncestor("ultimate-list")
require(v1.DataSources)
require(v1.Dimensions)
local React = require(v1.Parent.React)
local ReactBindingsRenderer = require(v1.Renderers.ReactBindingsRenderer)
local ReactStateRenderer = require(v1.Renderers.ReactStateRenderer)
require(v1.Renderers)
local createVirtualizedListController = require(v1.createVirtualizedListController)
local exhaustiveMatch = require(v1.Util.exhaustiveMatch)
local createElement = React.createElement
return function(a1) -- Line: 15
    -- upvalues: React (val), createVirtualizedListController (val), exhaustiveMatch (val), RunService (val)
    -- upvalues: createElement (val), ReactStateRenderer (val), ReactBindingsRenderer (val)
    local v1
    local u132 = React.useState(function() -- Line: 34 -- upvalues: createVirtualizedListController (upval), a1 (val)
        return createVirtualizedListController(a1.dataSource, a1.dimensions, a1.direction)
    end)
    React.useEffect(function() -- Line: 38 -- upvalues: u132 (val)
        return function() -- Line: 39 -- upvalues: u132 (upval)
            return u132.destroy()
        end
    end, {})
    local v2, u15 = React.useBinding(u132.getCanvasSize())
    local v3, u20 = React.useBinding(Vector2.zero)
    local v4, u25 = React.useBinding(0)
    React.useEffect(function() -- Line: 48 -- upvalues: u132 (val), u15 (val)
        return u132.bindToUpdate(function() -- Line: 49 -- upvalues: u15 (upval), u132 (upval)
            u15(u132.getCanvasSize())
        end)
    end, {})
    local useCallback = React.useCallback
    local v5 = {a1.direction, a1.onAbsoluteWindowSizeChanged}
    local v6 = useCallback(function(a1_2) -- Line: 54 -- upvalues: u20 (val), u132 (val), a1 (val) -- types: a1_2: userdata
        u20(a1_2.AbsoluteWindowSize)
        u132.setWindowSize(a1_2.AbsoluteWindowSize)
        if a1.onAbsoluteWindowSizeChanged ~= nil then
            a1.onAbsoluteWindowSizeChanged(a1_2.AbsoluteWindowSize)
        end
    end, v5)
    local useCallback_2 = React.useCallback
    local v7 = {a1.direction, a1.onScrollAxisChanged}
    local v8 = useCallback_2(function(a1_2) -- Line: 63
        -- upvalues: a1 (val), exhaustiveMatch (upval), RunService (upval), u132 (val), u25 (val)
        local X = if a1.direction ~= "x" then if a1.direction ~= "y" then exhaustiveMatch(a1.direction) else a1_2.CanvasPosition.Y else a1_2.CanvasPosition.X
        RunService.Heartbeat:Once(function() -- Line: 71 -- upvalues: u132 (upval), X (val), u25 (upval), a1 (upval)
            u132.setScrollAxis(X)
            u25(X)
            if a1.onScrollAxisChanged ~= nil then
                a1.onScrollAxisChanged(X)
            end
        end)
    end, v7)
    local useEffect_3 = React.useEffect
    local v9 = {a1.dataSource}
    useEffect_3(function() -- Line: 81 -- upvalues: u132 (val), a1 (val)
        u132.setDataSource(a1.dataSource)
    end, v9)
    local useEffect_4 = React.useEffect
    v9 = {a1.dimensions}
    useEffect_4(function() -- Line: 85 -- upvalues: u132 (val), a1 (val)
        u132.setDimensions(a1.dimensions)
    end, v9)
    v5 = {
        Size = UDim2.fromScale(1, 1),
        CanvasSize = v2,
        [React.Change.AbsoluteWindowSize] = v6,
        [React.Change.CanvasPosition] = v8,
    }
    v5[React.Tag] = a1.tag
    v5.ref = a1.scrollingFrameRef
    if a1.native ~= nil then
        v9 = nil
        v1 = nil
        for i, j in a1.native, v9, v1 do
            if v5[i] ~= nil then
                error((("%* is already used by UltimateList"):format(i)))
            end
            v5[i] = j
        end
    end
    v1 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v10 = {ScrollingFrame = createElement("ScrollingFrame", v5)}
    local v11 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 2,
        Size = v3:map(function(a1) -- Line: 124 -- types: a1: userdata
            return UDim2.fromOffset(a1.X, a1.Y)
        end),
    }
    local v12 = {}
    local v13 = if a1.renderer.type == "byState" then createElement(ReactStateRenderer, {
        virtualizedListController = u132,
        config = a1.renderer.config,
        dimensions = a1.dimensions,
        direction = a1.direction,
        callback = a1.renderer.callback,
        getKey = a1.getKey,
        scrollAxisBinding = v4,
    }) else if a1.renderer.type ~= "byBinding" then exhaustiveMatch(a1.renderer.type) else createElement(ReactBindingsRenderer, {
        virtualizedListController = u132,
        scrollAxisBinding = v4,
        dimensions = a1.dimensions,
        direction = a1.direction,
        callback = a1.renderer.callback,
        getKey = a1.getKey,
    })
    v12.Renderer = v13
    v10.RendererOverlay = createElement("Frame", v11, v12)
    return createElement("Frame", v1, v10)
end