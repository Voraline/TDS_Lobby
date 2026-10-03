-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.Utility.LinearValue
-- Decompile time: 1.86 ms

local u0 = {}

local function UDim2Rounded(a1, a2, a3, a4) -- Line: 23
    return UDim2.new(a1, math.round(a2), a3, (math.round(a4)))
end

local function UDimRounded(a1, a2) -- Line: 26
    return UDim.new(a1, (math.round(a2)))
end

function u0.fromValue(a1) -- Line: 30 -- upvalues: u0 (val), UDim2Rounded (val), UDimRounded (val)
    local v1 = typeof(a1)
    if v1 == "number" then
        return u0.new(nil, a1)
    end
    if v1 == "UDim2" then
        return u0.new(UDim2Rounded, a1.X.Scale, a1.X.Offset, a1.Y.Scale, a1.Y.Offset)
    end
    if v1 == "UDim" then
        return u0.new(UDimRounded, a1.Scale, a1.Offset)
    end
    if v1 == "Vector2" then
        return u0.new(Vector2.new, a1.X, a1.Y)
    end
    if v1 == "Vector3" then
        return u0.new(Vector3.new, a1.X, a1.Y, a1.Z)
    end
    if v1 == "Color3" then
        return u0.new(Color3.new, a1.R, a1.G, a1.B)
    end
    if v1 == "ColorSequenceKeypoint" then
        return u0.new(ColorSequenceKeypoint.new, a1.Time, a1.Value)
    end
    if v1 == "NumberSequenceKeypoint" then
        return u0.new(NumberSequenceKeypoint.new, a1.Time, a1.Value, a1.Envelope)
    end
    if v1 == "NumberRange" then
        return u0.new(NumberRange.new, a1.Min, a1.Max)
    end
    if v1 == "PhysicalProperties" then
        return u0.new(PhysicalProperties.new, a1.Density, a1.Friction, a1.Elasticity)
    end
    if v1 == "BrickColor" then
        return u0.new(Color3.new, a1.Color.R, a1.Color.G, a1.Color.B)
    end
    if v1 == "CFrame" then
        local v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13 = a1:components()
        return u0.new(CFrame.new, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
    end
    assert(false, "Unsupported type: " .. v1)
end

function u0.new(a1, ...) -- Line: 74 -- upvalues: u0 (val)
    return table.freeze({_ccstr = a1, _value = {...}, ToValue = u0.ToValue, Lerp = u0.Lerp})
end

function u0.ToValue(a1) -- Line: 84
    if a1._ccstr then
        return a1._ccstr(unpack(a1._value))
    end
    return unpack(a1._value)
end

function u0.Lerp(a1, a2, a3) -- Line: 92 -- upvalues: u0 (val)
    local v1, v2
    local v3 = {}
    local v4 = #a1._value
    for i = 1, v4 do
        v2 = a1._value[i]
        v1 = a2._value[i]
        v3[i] = v2 + (v1 - a1._value[i]) * a3
    end
    return u0.new(a1._ccstr, unpack(v3))
end

return u0