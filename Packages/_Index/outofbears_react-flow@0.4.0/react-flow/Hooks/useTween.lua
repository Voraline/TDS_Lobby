-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Hooks.useTween
-- Decompile time: 1.08 ms

local Tween = require(script.Parent.Parent.Animations.Types.Tween)
local React = require(script.Parent.Parent.React)
local useMemo = React.useMemo
local useEffect = React.useEffect
local useBinding = React.useBinding
return function(a1) -- Line: 8 -- upvalues: useBinding (val), useMemo (val), Tween (val), useEffect (val)
    local u3, v1 = useBinding(a1.start)
    local u8 = useMemo(function() -- Line: 11 -- upvalues: Tween (upval), a1 (val), u3 (val)
        local u3_2 = Tween.new(a1)
        return {
            tween = u3_2,
            start = function(a1, a2) -- Line: 17 -- upvalues: u3_2 (val), u3 (upval) -- types: a2: boolean?
                assert(typeof(a1) == "table", "useTween expects a table of properties")
                local props = u3_2.props
                local info = a1.info or u3_2.props.info
                props.info = info
                local props_2 = u3_2.props
                local start = a1.start or u3:getValue()
                props_2.start = start
                local props_3 = u3_2.props
                local target = a1.target or u3_2.props.target
                props_3.target = target
                local props_4 = u3_2.props
                local startImmediate = a1.startImmediate or u3_2.props.startImmediate
                props_4.startImmediate = startImmediate
                local props_5 = u3_2.props
                local delay = a1.delay or u3_2.props.delay
                props_5.delay = delay
                u3_2:Play(a1.start or u3:getValue(), a2)
            end,
            stop = function() -- Line: 28 -- upvalues: u3_2 (val)
                u3_2:Stop()
            end,
        }
    end, {})
    useEffect(function() -- Line: 34 -- upvalues: u8 (val)
        return function() -- Line: 35 -- upvalues: u8 (upval)
            u8.stop()
        end
    end, {})
    u8.tween:SetListener(v1)
    return u3, u8.start, u8.stop
end