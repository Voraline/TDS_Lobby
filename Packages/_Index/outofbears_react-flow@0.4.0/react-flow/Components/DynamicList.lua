-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Components.DynamicList
-- Decompile time: 1.33 ms

local React = require(script.Parent.Parent.React)
local ReactUtil = require(script.Parent.Parent.Utility.ReactUtil)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local memo = React.memo
local cloneElement = React.cloneElement
return memo(function(a1) -- Line: 13
    -- upvalues: useState (val), useEffect (val), ReactUtil (val), cloneElement (val), createElement (val), React (val)
    local children = a1.children
    local v1, u5 = useState({})
    local v2 = {children}
    useEffect(function() -- Line: 17 -- upvalues: u5 (val), children (val), ReactUtil (upval), cloneElement (upval)
        u5(function(a1) -- Line: 18 -- upvalues: children (upval), ReactUtil (upval), cloneElement (upval), u5 (upval)
            local v1, v2
            local v3 = table.clone(a1)
            local v4 = false
            for i, j in children do
                v2 = ReactUtil.updateReactChild(j)
                if v3[i] ~= v2 then
                    v3[i] = v2
                    v4 = true
                end
            end
            local v5 = nil
            local v6 = nil
            for k, n in v3, v5, v6 do
                if children[k] == nil and n ~= nil then
                    if not n.props or not n.props.remove then
                        v2 = cloneElement
                        v1 = {
                            remove = true,
                            destroy = function() -- Line: 37 -- upvalues: u5 (upval), k (val)
                                u5(function(a1) -- Line: 38 -- upvalues: k (upval)
                                    local v1 = table.clone(a1)
                                    v1[k] = nil
                                    return v1
                                end)
                            end,
                        }
                        v2 = v2(n, v1)
                        v3[k] = (ReactUtil.updateReactChild(v2))
                        v4 = true
                    end
                end
            end
            if v4 then
                return v3
            end
            return a1
        end)
    end, v2)
    return createElement(React.Fragment, {}, v1)
end)