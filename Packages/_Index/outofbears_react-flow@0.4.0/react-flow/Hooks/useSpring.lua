-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Hooks.useSpring
-- Decompile time: 1.53 ms

local SpringValue = require(script.Parent.Parent.Utility.SpringValue)
require(script.Parent.Parent.Animations.Types.Spring)
local React = require(script.Parent.Parent.React)
local useBinding = React.useBinding
local useMemo = React.useMemo
local useEffect = React.useEffect
return function(a1) -- Line: 9 -- upvalues: useBinding (val), useMemo (val), SpringValue (val), useEffect (val)
    local v1, v2 = useBinding(a1.start)
    local u8 = useMemo(function() -- Line: 11 -- upvalues: SpringValue (upval), a1 (val)
        local u8 = SpringValue.new(a1.start, a1.speed, a1.damper)
        return {
            spring = u8,
            start = function(a1, a2) -- Line: 17 -- upvalues: u8 (val) -- types: a2: boolean?
                assert(typeof(a1) == "table", "useSpring expects a table of properties")
                u8:SetImmediate(a2)
                if a1.delay then
                    u8:SetDelay(a1.delay)
                end
                if a1.target then
                    u8:SetGoal(a1.target)
                end
                if a1.start then
                    u8:SetValue(a1.start)
                end
                if a1.force then
                    u8:Impulse(a1.force)
                end
                if a1.damper then
                    u8:SetDamper(a1.damper)
                end
                if a1.speed then
                    u8:SetSpeed(a1.speed)
                end
                if a1.target or a1.start then
                    if not u8:Playing() then
                        u8:Run()
                    end
                elseif a1.force and not u8:Playing() then
                    u8:Run()
                end
            end,
            stop = function() -- Line: 53 -- upvalues: u8 (val)
                if u8:Playing() then
                    u8:Stop()
                end
            end,
        }
    end, {})
    useEffect(function() -- Line: 61 -- upvalues: u8 (val)
        local spring = u8.spring
        return function() -- Line: 64 -- upvalues: spring (val)
            spring:Stop()
        end
    end, {})
    u8.spring:SetUpdater(v2)
    return v1, u8.start, u8.stop
end