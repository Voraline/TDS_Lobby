-- Script path: ReplicatedStorage.Packages.Fusion.Animation.unpackType
-- Decompile time: 1.29 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local Oklab = require(Parent.Colour.Oklab)
return function(a1, a2) -- Line: 19 -- upvalues: Oklab (val) -- types: a2: string
    local v1
    if a2 == "number" then
        return {a1}
    end
    if a2 == "CFrame" then
        local v2
        v1, v2 = a1:ToAxisAngle()
        return {a1.X, a1.Y, a1.Z, v1.X, v1.Y, v1.Z, v2}
    end
    if a2 == "Color3" then
        v1 = Oklab.to(a1)
        return {v1.X, v1.Y, v1.Z}
    end
    if a2 == "ColorSequenceKeypoint" then
        v1 = Oklab.to(a1.Value)
        return {v1.X, v1.Y, v1.Z, a1.Time}
    end
    if a2 == "DateTime" then
        return {a1.UnixTimestampMillis}
    end
    if a2 == "NumberRange" then
        return {a1.Min, a1.Max}
    end
    if a2 == "NumberSequenceKeypoint" then
        return {a1.Value, a1.Time, a1.Envelope}
    end
    if a2 == "PhysicalProperties" then
        return {
            a1.Density,
            a1.Friction,
            a1.Elasticity,
            a1.FrictionWeight,
            a1.ElasticityWeight,
        }
    end
    if a2 == "Ray" then
        return {
            a1.Origin.X,
            a1.Origin.Y,
            a1.Origin.Z,
            a1.Direction.X,
            a1.Direction.Y,
            a1.Direction.Z,
        }
    end
    if a2 == "Rect" then
        return {a1.Min.X, a1.Min.Y, a1.Max.X, a1.Max.Y}
    end
    if a2 == "Region3" then
        return {
            a1.CFrame.X,
            a1.CFrame.Y,
            a1.CFrame.Z,
            a1.Size.X,
            a1.Size.Y,
            a1.Size.Z,
        }
    end
    if a2 == "Region3int16" then
        return {
            a1.Min.X,
            a1.Min.Y,
            a1.Min.Z,
            a1.Max.X,
            a1.Max.Y,
            a1.Max.Z,
        }
    end
    if a2 == "UDim" then
        return {a1.Scale, a1.Offset}
    end
    if a2 == "UDim2" then
        return {
            a1.X.Scale,
            a1.X.Offset,
            a1.Y.Scale,
            a1.Y.Offset,
        }
    end
    if a2 == "Vector2" or a2 == "Vector2int16" then
        return {a1.X, a1.Y}
    end
    if a2 == "Vector3" or a2 == "Vector3int16" then
        return {a1.X, a1.Y, a1.Z}
    end
    return {}
end