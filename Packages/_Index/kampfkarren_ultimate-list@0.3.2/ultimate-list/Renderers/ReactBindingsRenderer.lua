-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Renderers.ReactBindingsRenderer
-- Decompile time: 7.12 ms

local v1 = script:FindFirstAncestor("ultimate-list")
require(v1.Dimensions)
local DimensionsMethods = require(v1.Dimensions.DimensionsMethods)
local React = require(v1.Parent.React)
local adjustPositionToScrollAxis = require(v1.Dimensions.adjustPositionToScrollAxis)
local createDebugLogger = require(v1.Util.createDebugLogger)
require(v1.createVirtualizedListController)
local joinAndMapBindings = require(v1.Util.joinAndMapBindings)
local createElement = React.createElement
local ReactBindingsRenderer = createDebugLogger("ReactBindingsRenderer")

local function getKeyDefault(a1, a2) -- Line: 15 -- types: a2: number
    return (tostring(a2))
end

return (React.memo(function(a1) -- Line: 35
    -- upvalues: React (val), DimensionsMethods (val), getKeyDefault (val), ReactBindingsRenderer (val)
    -- upvalues: createElement (val), joinAndMapBindings (val), adjustPositionToScrollAxis (val)
    local binding, v1, v2
    local u4, u5 = React.useState(function() -- Line: 48 -- upvalues: DimensionsMethods (upval), a1 (val), React (upval)
        local v1, v2
        local v3 = {}
        local v4 = DimensionsMethods.elementsDisplayedHint(a1.dimensions, a1.virtualizedListController.getWindowSize(), a1.direction)
        if v4 == nil then
            return v3
        end
        for i = 1, v4 do
            v1, v2 = React.createBinding({contents = {type = "vacant"}})
            table.insert(v3, {binding = v1, set = v2})
        end
        return v3
    end)
    local getKey = a1.getKey
    if not getKey then
        getKey = getKeyDefault
    end
    local useEffect = React.useEffect
    local v3 = {a1.virtualizedListController, getKey, u4}
    useEffect(function() -- Line: 79
        -- upvalues: a1 (val), getKey (val), u4 (val), ReactBindingsRenderer (upval), React (upval), u5 (val)
        return a1.virtualizedListController.bindToUpdate(function() -- Line: 80
            -- upvalues: a1 (upval), getKey (upval), u4 (upval), ReactBindingsRenderer (upval), React (upval)
            -- upvalues: u5 (upval)
            local key, v1, v2, v3, v4, v5, v6
            local v7 = a1.virtualizedListController.get()
            local v8 = a1.virtualizedListController.getRange()
            local v9 = {}
            for i, j in v7 do
                v9[getKey(j, i + (v8.X - 1))] = i
            end
            local v10 = {}
            local v11 = {}
            local u129 = {}
            for k, n in u4 do
                v1 = n.binding:getValue()
                if v1.contents.type ~= "vacant" then
                    key = v1.contents.key
                    v3 = v9[key]
                    if v3 ~= nil then
                        v9[key] = nil
                        v4 = v7[v3]
                        if v1.contents.value ~= v4 then
                            ReactBindingsRenderer("%s existed, but changed", key)
                            n.set({
                                contents = {
                                    type = "full",
                                    index = v3 + (v8.X - 1),
                                    key = key,
                                    value = v4,
                                },
                            })
                        end
                    else
                        ReactBindingsRenderer("%s is now dead", key)
                        table.insert(v10, n.set)
                    end
                else
                    table.insert(v11, n.set)
                end
            end
            ReactBindingsRenderer("%d total setters, %d dead setters, %d vacant setters", #u4, #v10, #v11)
            local v12 = nil
            local v13 = nil
            for m, i5 in v9, v12, v13 do
                assert(i5 ~= nil, "Luau")
                v1 = v7[i5]
                v2 = {
                    contents = {type = "full", index = i5 + (v8.X - 1), key = m, value = v1},
                }
                v3 = table.remove(v10)
                if v3 == nil then
                    v4 = table.remove(v11)
                    if v4 == nil then
                        v5, v6 = React.createBinding(v2)
                        table.insert(u129, {binding = v5, set = v6})
                    else
                        ReactBindingsRenderer("%s is filling vacant spot", m)
                        v4(v2)
                    end
                else
                    ReactBindingsRenderer("%s is filling dead spot", m)
                    v3(v2)
                end
            end
            if #u129 > 0 then
                ReactBindingsRenderer("Needed to create %d more bindings to fit, there will be %d setters", #u129, #u129 + #u4)
                u5(function(a1) -- Line: 177 -- upvalues: u129 (val)
                    local v1 = table.clone(a1)
                    table.move(u129, 1, #u129, #v1 + 1, v1)
                    return v1
                end)
            end
            for i6, i7 in v10 do
                i7({contents = {type = "vacant"}})
            end
        end)
    end, v3)
    local v4 = {}
    for i, j in u4 do
        binding = j.binding
        v1 = binding:map(function(a1_2) -- Line: 199 -- upvalues: DimensionsMethods (upval), a1 (val) -- types: a1_2: table
            if a1_2.contents.type == "vacant" then
                return {size = UDim2.new(), position = UDim2.new()}
            end
            return DimensionsMethods.getUDimRect(
                a1.dimensions,
                a1_2.contents.value,
                a1_2.contents.index,
                a1.virtualizedListController.getWindowSize(),
                a1.direction
            )
        end)
        v2 = ("Item%*"):format(i)
        v4[v2] = (createElement("Frame", {
            BackgroundTransparency = 1,
            Position = joinAndMapBindings(function(a1_2, a2) -- Line: 219 -- upvalues: adjustPositionToScrollAxis (upval), a1 (val) -- types: a2: number
                return adjustPositionToScrollAxis(a1_2.position, a2, a1.direction)
            end, v1, a1.scrollAxisBinding),
            Size = v1:map(function(a1) -- Line: 223
                return a1.size
            end),
            Visible = binding:map(function(a1) -- Line: 227 -- types: a1: table
                return a1.contents.type == "full"
            end),
        }, {
            Content = a1.callback(binding:map(function(a1) -- Line: 231 -- types: a1: table
                if a1.contents.type == "full" then
                    return a1.contents.value
                end
                return nil
            end)),
        }))
    end
    return createElement(React.Fragment, {}, v4)
end))