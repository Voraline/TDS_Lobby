-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Dimensions.DimensionsMethods
-- Decompile time: 5.05 ms

local v1 = script:FindFirstAncestor("ultimate-list")
local DataSourceMethods = require(v1.DataSources.DataSourceMethods)
require(v1.DataSources)
require(script.Parent)
local exhaustiveMatch = require(v1.Util.exhaustiveMatch)
local u20 = {}

function u20.getCanvasSize(a1, a2, a3, a4) -- Line: 11
    -- upvalues: DataSourceMethods (val), u20 (val), exhaustiveMatch (val)
    local v1 = DataSourceMethods.back(a2)
    if v1 == nil then
        return UDim2.new()
    end
    local v2 = u20.getUDimRect(a1, v1, DataSourceMethods.length(a2), a3, a4)
    if a4 == "x" then
        return (UDim2.fromOffset(v2.position.X.Offset + v2.size.X.Offset, 0))
    end
    if a4 == "y" then
        return (UDim2.fromOffset(0, v2.position.Y.Offset + v2.size.Y.Offset))
    end
    return (exhaustiveMatch(a4))
end

local function getUDimSizeForConsistentSize(a1, a2) -- Line: 30
    -- upvalues: exhaustiveMatch (val)
    if a2 == "x" then
        return UDim2.new(0, a1, 1, 0)
    end
    if a2 == "y" then
        return UDim2.new(1, 0, 0, a1)
    end
    return exhaustiveMatch(a2)
end

local function getPositionForConsistentSize(a1, a2, a3) -- Line: 40
    -- upvalues: exhaustiveMatch (val)
    if a3 == "x" then
        return UDim2.fromOffset(a1 * (a2 - 1), 0)
    end
    if a3 == "y" then
        return UDim2.fromOffset(0, a1 * (a2 - 1))
    end
    return exhaustiveMatch(a3)
end

local function getPositionForConsistentUDim2(a1, a2, a3, a4) -- Line: 50
    -- upvalues: u20 (val), exhaustiveMatch (val)
    local v1 = u20.getAmountPerNonDominantInGrid(a1, a3, a4)
    if a4 == "x" then
        return UDim2.new(0, (math.ceil(a2 / v1) - 1) * a1.X.Offset, a1.Y.Scale * ((a2 - 1) % v1), a1.Y.Offset * ((a2 - 1) % v1))
    end
    if a4 == "y" then
        return UDim2.new(a1.X.Scale * ((a2 - 1) % v1), a1.X.Offset * ((a2 - 1) % v1), 0, (math.ceil(a2 / v1) - 1) * a1.Y.Offset)
    end
    return exhaustiveMatch(a4)
end

function u20.getAmountPerNonDominantInGrid(a1, a2, a3) -- Line: 79
    -- upvalues: exhaustiveMatch (val)
    if a3 == "x" then
        return a2.Y // (a1.Y.Offset + a1.Y.Scale * a2.Y)
    end
    if a3 == "y" then
        return a2.X // (a1.X.Offset + a1.X.Scale * a2.X)
    end
    return exhaustiveMatch(a3)
end

function u20.getDominantAxis(a1, a2) -- Line: 93 -- upvalues: exhaustiveMatch (val) -- types: a1: userdata, a2: string
    if a2 == "x" then
        return a1.X
    end
    if a2 == "y" then
        return a1.Y
    end
    return exhaustiveMatch(a2)
end

function u20.getUDimRect(a1, a2, a3, a4, a5) -- Line: 103
    -- upvalues: exhaustiveMatch (val), getPositionForConsistentUDim2 (val)
    local v1
    if a1.type == "consistentSize" then
        v1 = {}
        local size = a1.size
        v1.size = if a5 ~= "x" then if a5 ~= "y" then exhaustiveMatch(a5) else UDim2.new(1, 0, 0, size) else UDim2.new(0, size, 1, 0)
        local size_2 = a1.size
        v1.position = if a5 ~= "x" then if a5 ~= "y" then exhaustiveMatch(a5) else UDim2.fromOffset(0, size_2 * (a3 - 1)) else UDim2.fromOffset(size_2 * (a3 - 1), 0)
        return v1
    end
    if a1.type == "consistentUDim2" then
        return {
            size = a1.udim2,
            position = getPositionForConsistentUDim2(a1.udim2, a3, a4, a5),
        }
    end
    if a1.type == "getter" then
        return a1.callback(a2, a3)
    end
    if a1.type ~= "spaced" then
        return exhaustiveMatch(a1.type)
    end
    if a1.inner.type ~= "consistentSize" then
        if a1.inner.type == "consistentUDim2" then
            return {
                size = a1.inner.udim2,
                position = getPositionForConsistentUDim2(
                    a1.inner.udim2 + UDim2.fromOffset(if a5 ~= "x" then 0 else a1.spacing, if a5 ~= "y" then 0 else a1.spacing),
                    a3,
                    a4,
                    a5
                ),
            }
        end
        if a1.inner.type ~= "getter" and a1.inner.type ~= "spaced" then
            return exhaustiveMatch(a1.inner.type)
        end
        error("Unsupported spaced dimensions")
        return
    end
    v1 = {}
    local size_3 = a1.inner.size
    v1.size = if a5 ~= "x" then if a5 ~= "y" then exhaustiveMatch(a5) else UDim2.new(1, 0, 0, size_3) else UDim2.new(0, size_3, 1, 0)
    local v2 = a1.inner.size + a1.spacing
    v1.position = if a5 ~= "x" then if a5 ~= "y" then exhaustiveMatch(a5) else UDim2.fromOffset(0, v2 * (a3 - 1)) else UDim2.fromOffset(v2 * (a3 - 1), 0)
    return v1
end

local function getElementsDisplayedForUDim2(a1, a2, a3) -- Line: 152
    -- upvalues: u20 (val), exhaustiveMatch (val)
    local v1 = u20.getAmountPerNonDominantInGrid(a1, a2, a3)
    if a3 == "x" then
        return v1 * (a2.X // a1.Y.Offset + 2)
    end
    if a3 == "y" then
        return v1 * (a2.Y // a1.X.Offset + 2)
    end
    return exhaustiveMatch(a3)
end

function u20.elementsDisplayedHint(a1, a2, a3) -- Line: 165
    -- upvalues: u20 (val), getElementsDisplayedForUDim2 (val), exhaustiveMatch (val)
    if a1.type == "consistentSize" then
        return (u20.getDominantAxis(a2, a3)) // a1.size + 2
    end
    if a1.type == "consistentUDim2" then
        return getElementsDisplayedForUDim2(a1.udim2, a2, a3)
    end
    if a1.type == "getter" then
        return nil
    end
    if a1.type ~= "spaced" then
        return exhaustiveMatch(a1.type)
    end
    if a1.inner.type == "consistentSize" then
        return (u20.getDominantAxis(a2, a3)) // (a1.inner.size + a1.spacing) + 2
    end
    if a1.inner.type == "consistentUDim2" then
        return getElementsDisplayedForUDim2(
            a1.inner.udim2 + UDim2.fromOffset(if a3 ~= "x" then 0 else a1.spacing, if a3 ~= "y" then 0 else a1.spacing),
            a2,
            a3
        )
    end
    if a1.inner.type ~= "spaced" and a1.inner.type ~= "getter" then
        return exhaustiveMatch(a1.inner.type)
    end
    error("Unsupported spaced dimensions")
end

function u20.equals(a1, a2) -- Line: 203 -- upvalues: exhaustiveMatch (val)
    if a1.type ~= a2.type then
        return false
    end
    if a1.type == "getter" then
        assert(a2.type == "getter", "Luau")
        return a1.callback == a2.callback
    end
    if a1.type == "consistentSize" then
        assert(a2.type == "consistentSize", "Luau")
        return a1.size == a2.size
    end
    if a1.type == "consistentUDim2" then
        assert(a2.type == "consistentUDim2", "Luau")
        return a1.udim2 == a2.udim2
    end
    if a1.type ~= "spaced" then
        return exhaustiveMatch(a1.type)
    end
    assert(a2.type == "spaced", "Luau")
    return a1.spacing == a2.spacing
end

return u20