-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useFontScale
-- Decompile time: 5.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useViewportSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize)
local useMemo = React.useMemo
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 24
    -- upvalues: useMemo (val), useState (val), useEffect (val), useViewportSize (val)
    local u31
    local v1 = {a1}
    local u5 = useMemo(function() -- Line: 25 -- upvalues: a1 (val)
        return {
            scale = a1.scale or 1,
            size = a1.size or 16,
            axis = a1.axis or "Y",
            max = math.min(a1.max or 100, 100),
            min = a1.min or 0,
            ref = a1.ref,
        }
    end, v1)
    local size = u5.size
    local scale = u5.scale
    local axis = u5.axis
    local min = u5.min
    local max = u5.max
    local ref = u5.ref
    if ref == nil then
        local u24 = useViewportSize()
        local v2 = {u24, axis}
        u31 = useMemo(function() -- Line: 84 -- upvalues: u24 (val), axis (val)
            local v1 = u24.X / 1920
            local v2 = u24.Y / 1080
            if axis == "X" then
                return v1
            end
            if axis == "Y" then
                return v2
            end
            return (math.min(v1, v2))
        end, v2)
    else
        local v3, u16 = useState(1)
        u31 = v3
        local v4 = {ref}
        useEffect(function() -- Line: 50 -- upvalues: ref (val), axis (val), u16 (val)
            local current = ref
            if current then
                current = ref.current
            end
            if not current then
                return
            end
            local u12 = (current:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 56 -- upvalues: current (val), axis (upval), u16 (upval)
                if not current then
                    return
                end
                local AbsoluteSize = current.AbsoluteSize
                local v1 = AbsoluteSize.X / 1920
                local v2 = AbsoluteSize.Y / 1080
                local v3 = if axis ~= "X" then if axis ~= "Y" then math.min(v1, v2) else v2 else v1
                u16(v3 * 4)
            end)
            if current then
                local AbsoluteSize = current.AbsoluteSize
                local v1 = AbsoluteSize.X / 1920
                local v2 = AbsoluteSize.Y / 1080
                local v3 = if axis ~= "X" then if axis ~= "Y" then math.min(v1, v2) else v2 else v1
                u16(v3 * 4)
            end
            return function() -- Line: 77 -- upvalues: u12 (val)
                u12:Disconnect()
            end
        end, v4)
    end
    return (useMemo(function() -- Line: 94 -- upvalues: size (val), u31 (ref), scale (val), u5 (val)
        return (math.round((math.clamp(size * u31 * scale, u5.min, u5.max))))
    end, {size, scale, u31, min, max}))
end