-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Renderers.ReactStateRenderer
-- Decompile time: 1.74 ms

local v1 = script:FindFirstAncestor("ultimate-list")
require(v1.Dimensions)
local DimensionsMethods = require(v1.Dimensions.DimensionsMethods)
local React = require(v1.Parent.React)
require(v1.Renderers)
local adjustPositionToScrollAxis = require(v1.Dimensions.adjustPositionToScrollAxis)
require(v1.createVirtualizedListController)
local joinAndMapBindings = require(v1.Util.joinAndMapBindings)
local createElement = React.createElement

local function getKeyDefault(a1, a2) -- Line: 13 -- types: a2: number
    return (tostring(a2))
end

return function(a1) -- Line: 23
    -- upvalues: React (val), getKeyDefault (val), DimensionsMethods (val), createElement (val)
    -- upvalues: joinAndMapBindings (val), adjustPositionToScrollAxis (val)
    local v1, v2
    local u5, u6 = React.useState(a1.virtualizedListController.get)
    local v3, u11 = React.useBinding(nil)
    local useEffect = React.useEffect
    local v4 = {a1.virtualizedListController, a1.scrollAxisBinding}
    useEffect(function() -- Line: 39 -- upvalues: a1 (val), u6 (val), u11 (val)
        local u3 = a1.virtualizedListController.get()
        u6(u3)
        return (a1.virtualizedListController.bindToUpdate(function() -- Line: 43 -- upvalues: u11 (upval), u3 (ref), a1 (upval), u6 (upval)
            u11({lockedTo = u3, scrollAxis = a1.scrollAxisBinding:getValue()})
            u3 = a1.virtualizedListController.get()
            u6(u3)
        end))
    end, v4)
    local v5 = {}
    local getKey = a1.getKey or getKeyDefault
    v4 = a1.virtualizedListController.getRange()
    for i, j in u5 do
        v1 = v4.X + (i - 1)
        local u58 = DimensionsMethods.getUDimRect(a1.dimensions, j, v1, a1.virtualizedListController.getWindowSize(), a1.direction)
        v2 = getKey(j, v1)
        v5[v2] = (createElement("Frame", {
            BackgroundTransparency = 1,
            Position = joinAndMapBindings(function(a1_2, a2) -- Line: 71
                -- upvalues: a1 (val), u5 (val), adjustPositionToScrollAxis (upval), u58 (val)
                if a1.config.freezeViewWhileScrolling ~= false and a2 ~= nil and a2.lockedTo == u5 then
                    return adjustPositionToScrollAxis(u58.position, a2.scrollAxis, a1.direction)
                end
                return adjustPositionToScrollAxis(u58.position, a1_2, a1.direction)
            end, a1.scrollAxisBinding, v3),
            Size = u58.size,
        }, a1.callback(j)))
    end
    return createElement(React.Fragment, nil, v5)
end