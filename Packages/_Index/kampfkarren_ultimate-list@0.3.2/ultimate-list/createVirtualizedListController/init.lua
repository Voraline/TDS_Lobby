-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.createVirtualizedListController
-- Decompile time: 4.64 ms

local v1 = script:FindFirstAncestor("ultimate-list")
local DataSourceMethods = require(v1.DataSources.DataSourceMethods)
require(v1.DataSources)
require(v1.Dimensions)
local DimensionsMethods = require(v1.Dimensions.DimensionsMethods)
local binarySearchIndexRangeInView = require(script.binarySearchIndexRangeInView)
local createDebugLogger = require(v1.Util.createDebugLogger)
local exhaustiveMatch = require(v1.Util.exhaustiveMatch)
local createVirtualizedListController = createDebugLogger("createVirtualizedListController")
return function(a1, a2, a3) -- Line: 42
    -- upvalues: DimensionsMethods (val), exhaustiveMatch (val), createVirtualizedListController (val)
    -- upvalues: binarySearchIndexRangeInView (val), DataSourceMethods (val)
    local u3 = {scrollSizeAxis = 0}
    u3.range = Vector3.new()
    u3.canvasSize = UDim2.new()
    u3.windowSize = Vector2.new()
    u3.lastDimensions = a2
    u3.cachedLastResult = {}
    u3.dataSource = a1
    local u11 = 0
    local u12 = 0
    local u14 = Vector2.new()

    local function getIndexRangeInViewForSize(a1) -- Line: 62 -- upvalues: u11 (ref), u12 (ref) -- types: a1: number
        return (Vector3.new(u11 // a1 + 1, (u11 + u12) // a1 + 1))
    end

    local function getIndexRangeInViewForUDim2(a1) -- Line: 69
        -- upvalues: DimensionsMethods (upval), u14 (ref), a3 (val), exhaustiveMatch (upval), u11 (ref), u12 (ref)
        -- upvalues: createVirtualizedListController (upval)
        local v1 = DimensionsMethods.getAmountPerNonDominantInGrid(a1, u14, a3)
        local Offset = if a3 ~= "x" then if a3 ~= "y" then exhaustiveMatch(a3) else a1.Y.Offset else a1.X.Offset
        local v2 = 1 + u11 // Offset * v1
        local v3 = (1 + (u11 + u12) // Offset) * v1
        createVirtualizedListController(
            "getIndexRangeInView: amountPerNonDominant = %d, scrollAxis = %d, dominantSize = %d. Going from %d to %d",
            v1,
            u11,
            Offset,
            v2,
            v3
        )
        return (Vector3.new(v2, v3))
    end

    local function getIndexRangeInView() -- Line: 97
        -- upvalues: a2 (ref), getIndexRangeInViewForUDim2 (val), u11 (ref), u12 (ref)
        -- upvalues: binarySearchIndexRangeInView (upval), a1 (ref), a3 (val), exhaustiveMatch (upval)
        if a2.type == "consistentUDim2" then
            return (getIndexRangeInViewForUDim2(a2.udim2))
        end
        if a2.type == "consistentSize" then
            local size = a2.size
            return (Vector3.new(u11 // size + 1, (u11 + u12) // size + 1))
        end
        if a2.type == "getter" then
            return binarySearchIndexRangeInView(a1, a2.callback, u11, u12, a3)
        end
        if a2.type ~= "spaced" then
            return exhaustiveMatch(a2.type)
        end
        if a2.inner.type == "consistentSize" then
            local v1 = a2.inner.size + a2.spacing
            return (Vector3.new(u11 // v1 + 1, (u11 + u12) // v1 + 1))
        end
        if a2.inner.type == "consistentUDim2" then
            return (getIndexRangeInViewForUDim2(a2.inner.udim2 + UDim2.fromOffset(if a3 ~= "x" then 0 else a2.spacing, if a3 ~= "y" then 0 else a2.spacing)))
        end
        if a2.inner.type ~= "spaced" and a2.inner.type ~= "getter" then
            return exhaustiveMatch(a2.inner.type)
        end
        error("Unsupported spaced dimensions")
    end

    local u18 = {}

    local function callUpdateCallbacks() -- Line: 127 -- upvalues: u18 (val)
        for i in u18 do
            i()
        end
    end

    local function update() -- Line: 133
        -- upvalues: u3 (ref), u11 (ref), u12 (ref), u14 (ref), a1 (ref), a2 (ref), getIndexRangeInView (val)
        -- upvalues: DataSourceMethods (upval), createVirtualizedListController (upval), u18 (val)
        -- upvalues: DimensionsMethods (upval), a3 (val), exhaustiveMatch (upval)
        if u3.offsetBoundaries ~= nil and u3.offsetBoundaries.X <= u11 then
            local Y = u3.offsetBoundaries.Y
            if u12 + u11 <= Y and u3.windowSize == u14 and u3.dataSource == a1 and u3.lastDimensions == a2 then
                return
            end
        end
        local v1 = getIndexRangeInView()
        local v2 = DataSourceMethods.getByRange(a1, v1)
        if #v2 == 0 then
            createVirtualizedListController("View changed, but no items in list")
            u3 = {
                range = v1,
                canvasSize = UDim2.new(),
                windowSize = u14,
                lastDimensions = a2,
                cachedLastResult = {},
                offsetBoundaries = Vector3.new(u11, u12 + u11),
                dataSource = a1,
            }
            for j in u18 do
                j()
            end
            return
        end
        local v3 = DimensionsMethods.getUDimRect(a2, v2[1], v1.X, u14, a3)
        local v4 = DimensionsMethods.getUDimRect(a2, v2[#v2], v1.Y, u14, a3)
        local v5 = createVirtualizedListController
        local X = v1.X
        local Y_2 = v1.Y
        local offsetBoundaries_2 = u3.offsetBoundaries and u3.offsetBoundaries.X
        local offsetBoundaries_3 = u3.offsetBoundaries and u3.offsetBoundaries.Y
        v5(
            "View changed: %d..%d (scroll axis: %d, window axis: %d, offset boundaries: %* - %*)",
            X,
            Y_2,
            u11,
            u12,
            offsetBoundaries_2,
            offsetBoundaries_3
        )
        u3 = {
            range = v1,
            canvasSize = DimensionsMethods.getCanvasSize(a2, a1, u14, a3),
            windowSize = u14,
            lastDimensions = a2,
            cachedLastResult = v2,
            offsetBoundaries = Vector3.new(
                if a3 ~= "x" then if a3 ~= "y" then exhaustiveMatch(a3) else v3.position.Y.Offset else v3.position.X.Offset,
                if a3 ~= "x" then if a3 ~= "y" then exhaustiveMatch(a3) else v4.position.Y.Offset + v4.size.Y.Offset else v4.position.X.Offset + v4.size.X.Offset
            ),
            dataSource = a1,
        }
        for i in u18 do
            i()
        end
    end

    local u35 = if a1.type ~= "mutableSource" then nil else a1.methods.bindToChanged(update)
    return {
        setScrollAxis = function(a1) -- Line: 208 -- upvalues: u11 (ref), update (val) -- types: a1: number
            u11 = a1
            update()
        end,
        setDataSource = function(a1_2) -- Line: 213 -- upvalues: a1 (ref), DataSourceMethods (upval), update (val)
            assert(a1.type == a1_2.type, "Data source type changed, you must keep it the same")
            if DataSourceMethods.equals(a1, a1_2) then
                return
            end
            a1 = a1_2
            update()
        end,
        setDimensions = function(a1) -- Line: 224 -- upvalues: DimensionsMethods (upval), a2 (ref), update (val)
            if DimensionsMethods.equals(a2, a1) then
                return
            end
            a2 = a1
            update()
        end,
        setWindowSize = function(a1) -- Line: 233
            -- upvalues: u14 (ref), u12 (ref), DimensionsMethods (upval), a3 (val), update (val)
            if u14 == a1 then
                return
            end
            u14 = a1
            u12 = DimensionsMethods.getDominantAxis(a1, a3)
            update()
        end,
        getWindowSize = function() -- Line: 244 -- upvalues: u14 (ref)
            return u14
        end,
        get = function() -- Line: 248 -- upvalues: u3 (ref)
            return u3.cachedLastResult
        end,
        getCanvasSize = function() -- Line: 252 -- upvalues: u3 (ref)
            return u3.canvasSize
        end,
        getRange = function() -- Line: 256 -- upvalues: u3 (ref)
            return u3.range
        end,
        bindToUpdate = function(a1) -- Line: 260 -- upvalues: u18 (val) -- types: a1: function
            u18[a1] = true
            return function() -- Line: 262 -- upvalues: u18 (upval), a1 (val)
                u18[a1] = nil
            end
        end,
        destroy = function() -- Line: 271 -- upvalues: u35 (val)
            if u35 ~= nil then
                u35()
            end
        end,
    }
end