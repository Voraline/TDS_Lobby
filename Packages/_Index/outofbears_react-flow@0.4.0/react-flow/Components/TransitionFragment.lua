-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Components.TransitionFragment
-- Decompile time: 1.90 ms

local React = require(script.Parent.Parent.React)
local ReactUtil = require(script.Parent.Parent.Utility.ReactUtil)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local memo = React.memo
local cloneElement = React.cloneElement
return memo(function(a1) -- Line: 10
    -- upvalues: useState (val), useEffect (val), ReactUtil (val), cloneElement (val), createElement (val), React (val)
    local children = a1.children
    if not children then
        children = {}
    end
    local v1, u6 = useState({})
    local v2 = {children}
    useEffect(function() -- Line: 14 -- upvalues: u6 (val), children (val), ReactUtil (upval), cloneElement (upval)
        u6(function(a1) -- Line: 15 -- upvalues: children (upval), ReactUtil (upval), cloneElement (upval), u6 (upval)
            local v1, v2, v3
            local v4 = table.clone(a1)
            local v5 = false
            for i, j in children do
                v2 = ReactUtil.updateReactChild(j)
                if v4[i] == nil then
                    v3 = cloneElement(v2, {
                        entering = true,
                        exiting = false,
                        onEnterComplete = function() -- Line: 27 -- upvalues: u6 (upval), i (val), cloneElement (upval)
                            u6(function(a1) -- Line: 28 -- upvalues: i (upval), cloneElement (upval)
                                local v1 = table.clone(a1)
                                local v2 = v1[i]
                                if v2 then
                                    v1[i] = (cloneElement(v2, {entering = false}))
                                end
                                return v1
                            end)
                        end,
                        onExitComplete = function() end,
                    })
                    v4[i] = (ReactUtil.updateReactChild(v3))
                    v5 = true
                elseif v4[i] ~= v2 then
                    v4[i] = v2
                    v5 = true
                end
            end
            local v6 = nil
            local v7 = nil
            for k, n in v4, v6, v7 do
                if children[k] == nil and n ~= nil then
                    if not n.props or not n.props.exiting then
                        v2 = cloneElement
                        v1 = {
                            entering = false,
                            exiting = true,
                            onEnterComplete = function() end,
                            onExitComplete = function() -- Line: 57 -- upvalues: u6 (upval), k (val)
                                u6(function(a1) -- Line: 58 -- upvalues: k (upval)
                                    local v1 = table.clone(a1)
                                    v1[k] = nil
                                    return v1
                                end)
                            end,
                        }
                        v2 = v2(n, v1)
                        v4[k] = (ReactUtil.updateReactChild(v2))
                        v5 = true
                    end
                end
            end
            if v5 then
                return v4
            end
            return a1
        end)
    end, v2)
    return createElement(React.Fragment, {}, v1)
end)